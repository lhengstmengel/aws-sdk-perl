
package Paws::CodeDeploy::GetDeployment;
  use Moose;
  has DeploymentId => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'deploymentId' , required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'GetDeployment');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::CodeDeploy::GetDeploymentOutput');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::CodeDeploy::GetDeployment - Arguments for method GetDeployment on Paws::CodeDeploy

=head1 DESCRIPTION

This class represents the parameters used for calling the method GetDeployment on the 
AWS CodeDeploy service. Use the attributes of this class
as arguments to method GetDeployment.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to GetDeployment.

As an example:

  $service_obj->GetDeployment(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 B<REQUIRED> DeploymentId => Str

An existing deployment ID associated with the applicable IAM user or
AWS account.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method GetDeployment in L<Paws::CodeDeploy>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

