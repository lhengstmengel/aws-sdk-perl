
package Paws::ServiceCatalog::UpdateConstraintOutput;
  use Moose;
  has ConstraintDetail => (is => 'ro', isa => 'Paws::ServiceCatalog::ConstraintDetail');
  has ConstraintParameters => (is => 'ro', isa => 'Str');
  has Status => (is => 'ro', isa => 'Str');

  has _request_id => (is => 'ro', isa => 'Str');

### main pod documentation begin ###

=head1 NAME

Paws::ServiceCatalog::UpdateConstraintOutput

=head1 ATTRIBUTES


=head2 ConstraintDetail => L<Paws::ServiceCatalog::ConstraintDetail>

The resulting detailed constraint information.


=head2 ConstraintParameters => Str

The resulting updated constraint parameters.


=head2 Status => Str

The status of the current request.

Valid values are: C<"AVAILABLE">, C<"CREATING">, C<"FAILED">
=head2 _request_id => Str


=cut

1;