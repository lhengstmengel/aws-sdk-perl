
package Paws::WorkDocs::RemoveResourcePermission;
  use Moose;
  has PrincipalId => (is => 'ro', isa => 'Str', traits => ['ParamInURI'], uri_name => 'PrincipalId' , required => 1);
  has PrincipalType => (is => 'ro', isa => 'Str', traits => ['ParamInQuery'], query_name => 'type' );
  has ResourceId => (is => 'ro', isa => 'Str', traits => ['ParamInURI'], uri_name => 'ResourceId' , required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'RemoveResourcePermission');
  class_has _api_uri  => (isa => 'Str', is => 'ro', default => '/api/v1/resources/{ResourceId}/permissions/{PrincipalId}');
  class_has _api_method  => (isa => 'Str', is => 'ro', default => 'DELETE');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::API::Response');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::WorkDocs::RemoveResourcePermission - Arguments for method RemoveResourcePermission on Paws::WorkDocs

=head1 DESCRIPTION

This class represents the parameters used for calling the method RemoveResourcePermission on the 
Amazon WorkDocs service. Use the attributes of this class
as arguments to method RemoveResourcePermission.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to RemoveResourcePermission.

As an example:

  $service_obj->RemoveResourcePermission(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 B<REQUIRED> PrincipalId => Str

The principal ID of the resource.



=head2 PrincipalType => Str

The principal type of the resource.

Valid values are: C<"USER">, C<"GROUP">, C<"INVITE">, C<"ANONYMOUS">, C<"ORGANIZATION">

=head2 B<REQUIRED> ResourceId => Str

The ID of the resource.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method RemoveResourcePermission in L<Paws::WorkDocs>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

