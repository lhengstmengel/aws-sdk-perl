use MooseX::Declare;
use Moose::Util::TypeConstraints;

role AWS::API::Attribute::Trait::Unwrapped {
  use Moose::Util;
  Moose::Util::meta_attribute_alias('Unwrapped');
  has xmlname => (is => 'ro', isa => 'Str');
}

class AWS::Common::Tag with AWS::API::ResultParser {
  has Key => (is => 'ro', isa => 'Str', required => 1);
  has Value => (is => 'ro', isa => 'Str', required => 1);
}

role AWS::API::RegionalEndpointCaller {
  has region => (is => 'rw', isa => 'Str');
  requires 'service';

  method endpoint_host {
    return sprintf '%s.%s.amazonaws.com', $self->service, $self->region;
  }

  method _api_endpoint {
    return sprintf '%s://%s/', 'https', $self->endpoint_host;
  }
}

role AWS::API::SingleEndpointCaller {
  requires 'service';

  method region {
    # http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html
    # For services that use a globally unique endpoint, such as IAM, use us-east-1
    return 'us-east-1';
  }

  method endpoint_host {
    return sprintf '%s.amazonaws.com', $self->service;
  }

  method _api_endpoint {
    return sprintf '%s://%s/', 'https', $self->endpoint_host;
  }
}

role AWS::API::MapParser {
  sub from_result {
    my ($class, $result) = @_;
    $class->new(map { ($_->{ key } => $_->{ value }) } @$result);
  }

  sub result_to_args {
    die "Should this be deprecated??\n";
    my ($class, $result) = @_;
    $class->new(map { ($_->{ key } => $_->{ value }) } @$result);
  }
}

role AWS::API::StrToStrMapParser {
  sub from_result {
    my ($class, $result) = @_;
    $class->new(Map => { %$result });  
  }

  sub result_to_args {
    die "Should this be deprecated??\n";
    my ($class, $result) = @_;
    $class->new(Map => { %$result });
  }
}

role AWS::API::ToParams {
  sub _to_params {
    my ($self) = @_;
    my $params = {};
    foreach my $att ($self->meta->get_attribute_list) {
      $params->{$att} = $self->$att();
    }
    return $params;
  }
}

role AWS::API::UnwrappedParser {
  sub result_to_args {
    my ($class, $result) = @_;
    my %args;

    foreach my $att ($class->meta->get_attribute_list) {
      next if (not my $meta = $class->meta->get_attribute($att));
      my $key = $meta->xmlname;

      #use Data::Dumper;
      #print STDERR "ATTRIBUTE: $att RESULTKEY: $key: ", $meta->type_constraint, " result: ", Dumper($result->{$key});
      my $att_type = $meta->type_constraint;

      my $value = $result->{ $key };
      my $value_ref = ref($value);
      if ($value_ref eq 'HASH') {
        if (exists $value->{ item }) {
          $value = $value->{ item };
        } elsif (exists $value->{ entry }) {
          $value = $value->{ entry  };
        }
      }
      $value_ref = ref($value);

      #print STDERR "GOING TO DO AN $att_type\n";
      #print STDERR "VALUE: " . Dumper($value);
      #print STDERR "REF de \$value" . ref($value) . "\n";

      # We'll consider that an attribute without brackets [] isn't an array type
      if ($att_type !~ m/\[.*\]$/) {
        if ($att_type =~ m/\:\:/) {
          if (defined $value) {
            if (not $value_ref) {
              $args{ $att } = $value;
            } else {
              #my $class = ("$att_type" eq 'Moose::Meta::TypeConstraint::Class') ? $att_type->class : $att_type;
              my $class = $att_type->class;
              $args{ $att } = $class->from_result( $value );
            }
          }
        } else {
          $args{ $att } = $value if (defined $value);
        }
      } elsif (my ($type) = ($att_type =~ m/^ArrayRef\[(.*)\]$/)) {
        if ($type =~ m/\:\:/) {
          if (not defined $value) {
            $args{ $att } = [ ];
          } elsif ($value_ref eq 'ARRAY') {
            $args{ $att } = [ map { $type->from_result( $_ ) } @$value ] ;
          } elsif ($value_ref eq 'HASH') {
            $args{ $att } = [ $type->from_result( $value ) ];
          }
        } else {
          if (defined $value){
            if ($value_ref eq 'ARRAY') {
              $args{ $att } = $value; 
            } else {
              $args{ $att } = [ $value ];
            }
          }
        }
      }
    }

    return %args;
  }

  sub from_result {
    my ($class, $result) = @_;
    my %args = $class->result_to_args($result, $class);
    return $class->new(%args);
  }
}

role AWS::API::ResultParser {
  sub result_to_args {
    my ($class, $result) = @_;
    my %args;

    foreach my $att ($class->meta->get_attribute_list) {
      next if (not my $meta = $class->meta->get_attribute($att));

      my $key = $meta->does('AWS::API::Attribute::Trait::Unwrapped') ? $meta->xmlname : $att;

      #use Data::Dumper;
      #print STDERR "ATTRIBUTE: $att RESULTKEY: $key: ", $meta->type_constraint, " result: ", Dumper($result->{$key});
      my $att_type = $meta->type_constraint;

      my $value = $result->{ $key };
      my $value_ref = ref($value);
      if ($value_ref eq 'HASH') {
        if (exists $value->{ member }) {
          $value = $value->{ member };
        } elsif (exists $value->{ entry }) {
          $value = $value->{ entry  };
        }
      }
      $value_ref = ref($value);

      #print STDERR "GOING TO DO AN $att_type\n";
      #print STDERR "VALUE: " . Dumper($value);
      #print STDERR "REF de \$value" . ref($value) . "\n";

      # We'll consider that an attribute without brackets [] isn't an array type
      if ($att_type !~ m/\[.*\]$/) {
        if ($att_type =~ m/\:\:/) {
          if (defined $value) {
            if (not $value_ref) {
              $args{ $att } = $value;
            } else {
              #my $class = ("$att_type" eq 'Moose::Meta::TypeConstraint::Class') ? $att_type->class : $att_type;
              my $class = $att_type->class;
              $args{ $att } = $class->from_result( $value );
            }
          }
        } else {
          $args{ $att } = $result->{ $att } if (defined $result->{ $att });
        }
      } elsif (my ($type) = ($att_type =~ m/^ArrayRef\[(.*)\]$/)) {
        if ($type =~ m/\:\:/) {
          if (not defined $value) {
            $args{ $att } = [ ];
          } elsif ($value_ref eq 'ARRAY') {
            $args{ $att } = [ map { $type->from_result( $_ ) } @$value ] ;
          } elsif ($value_ref eq 'HASH') {
            $args{ $att } = [ $type->from_result( $value ) ];
          }
        } else {
          if (defined $value){
            if ($value_ref eq 'ARRAY') {
              $args{ $att } = $value; 
            } else {
              $args{ $att } = [ $value ];
            }
          }
        }
      }
    }
    return %args;
  }

  sub from_result {
    my ($class, $result) = @_;
    my %args = $class->result_to_args($result, $class);
    return $class->new(%args);
  }
}


