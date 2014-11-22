
package Paws::EC2::UnmonitorInstances {
  use Moose;
  has DryRun => (is => 'ro', isa => 'Bool', traits => ['NameInRequest'], request_name => 'dryRun' );
  has InstanceIds => (is => 'ro', isa => 'ArrayRef[Str]', traits => ['NameInRequest'], request_name => 'InstanceId' , required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UnmonitorInstances');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::EC2::UnmonitorInstancesResult');
  class_has _result_key => (isa => 'Str', is => 'ro');
}
1;