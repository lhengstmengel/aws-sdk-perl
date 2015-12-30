
package Paws::Inspector::PreviewAgentsForResourceGroup;
  use Moose;
  has MaxResults => (is => 'ro', isa => 'Int', traits => ['NameInRequest'], request_name => 'maxResults' );
  has NextToken => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'nextToken' );
  has ResourceGroupArn => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'resourceGroupArn' , required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'PreviewAgentsForResourceGroup');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::Inspector::PreviewAgentsForResourceGroupResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Inspector::PreviewAgentsForResourceGroup - Arguments for method PreviewAgentsForResourceGroup on Paws::Inspector

=head1 DESCRIPTION

This class represents the parameters used for calling the method PreviewAgentsForResourceGroup on the 
Amazon Inspector service. Use the attributes of this class
as arguments to method PreviewAgentsForResourceGroup.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to PreviewAgentsForResourceGroup.

As an example:

  $service_obj->PreviewAgentsForResourceGroup(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 MaxResults => Int

You can use this parameter to indicate the maximum number of items you
want in the response. The default value is 10. The maximum value is
500.



=head2 NextToken => Str

You can use this parameter when paginating results. Set the value of
this parameter to 'null' on your first call to the
B<PreviewAgentsForResourceGroup> action. Subsequent calls to the action
fill B<nextToken> in the request with the value of B<NextToken> from
previous response to continue listing data.



=head2 B<REQUIRED> ResourceGroupArn => Str

The ARN of the resource group that is used to create an application.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method PreviewAgentsForResourceGroup in L<Paws::Inspector>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

