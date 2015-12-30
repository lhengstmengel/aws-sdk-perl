
package Paws::ECS::UpdateService;
  use Moose;
  has Cluster => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'cluster' );
  has DeploymentConfiguration => (is => 'ro', isa => 'Paws::ECS::DeploymentConfiguration', traits => ['NameInRequest'], request_name => 'deploymentConfiguration' );
  has DesiredCount => (is => 'ro', isa => 'Int', traits => ['NameInRequest'], request_name => 'desiredCount' );
  has Service => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'service' , required => 1);
  has TaskDefinition => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'taskDefinition' );

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateService');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::ECS::UpdateServiceResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::ECS::UpdateService - Arguments for method UpdateService on Paws::ECS

=head1 DESCRIPTION

This class represents the parameters used for calling the method UpdateService on the 
Amazon EC2 Container Service service. Use the attributes of this class
as arguments to method UpdateService.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to UpdateService.

As an example:

  $service_obj->UpdateService(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 Cluster => Str

The short name or full Amazon Resource Name (ARN) of the cluster that
your service is running on. If you do not specify a cluster, the
default cluster is assumed.



=head2 DeploymentConfiguration => L<Paws::ECS::DeploymentConfiguration>

Optional deployment parameters that control how many tasks run during
the deployment and the ordering of stopping and starting tasks.



=head2 DesiredCount => Int

The number of instantiations of the task to place and keep running in
your service.



=head2 B<REQUIRED> Service => Str

The name of the service to update.



=head2 TaskDefinition => Str

The C<family> and C<revision> (C<family:revision>) or full Amazon
Resource Name (ARN) of the task definition to run in your service. If a
C<revision> is not specified, the latest C<ACTIVE> revision is used. If
you modify the task definition with C<UpdateService>, Amazon ECS spawns
a task with the new version of the task definition and then stops an
old task after the new version is running.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method UpdateService in L<Paws::ECS>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

