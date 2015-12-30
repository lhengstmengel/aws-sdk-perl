
package Paws::ApiGateway::GetApiKeys;
  use Moose;
  has Limit => (is => 'ro', isa => 'Int', traits => ['ParamInQuery'], query_name => 'limit' );
  has Position => (is => 'ro', isa => 'Str', traits => ['ParamInQuery'], query_name => 'position' );

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'GetApiKeys');
  class_has _api_uri  => (isa => 'Str', is => 'ro', default => '/apikeys');
  class_has _api_method  => (isa => 'Str', is => 'ro', default => 'GET');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::ApiGateway::ApiKeys');
  class_has _result_key => (isa => 'Str', is => 'ro', default => 'GetApiKeysResult');
1;

### main pod documentation begin ###

=head1 NAME

Paws::ApiGateway::GetApiKeys - Arguments for method GetApiKeys on Paws::ApiGateway

=head1 DESCRIPTION

This class represents the parameters used for calling the method GetApiKeys on the 
Amazon API Gateway service. Use the attributes of this class
as arguments to method GetApiKeys.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to GetApiKeys.

As an example:

  $service_obj->GetApiKeys(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 Limit => Int

The maximum number of ApiKeys to get information about.



=head2 Position => Str

The position of the current ApiKeys resource to get information about.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method GetApiKeys in L<Paws::ApiGateway>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

