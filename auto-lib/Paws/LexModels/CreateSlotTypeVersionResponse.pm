
package Paws::LexModels::CreateSlotTypeVersionResponse;
  use Moose;
  has Checksum => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'checksum');
  has CreatedDate => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'createdDate');
  has Description => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'description');
  has EnumerationValues => (is => 'ro', isa => 'ArrayRef[Paws::LexModels::EnumerationValue]', traits => ['NameInRequest'], request_name => 'enumerationValues');
  has LastUpdatedDate => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'lastUpdatedDate');
  has Name => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'name');
  has Version => (is => 'ro', isa => 'Str', traits => ['NameInRequest'], request_name => 'version');

  has _request_id => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::LexModels::CreateSlotTypeVersionResponse

=head1 ATTRIBUTES


=head2 Checksum => Str

Checksum of the C<$LATEST> version of the slot type.


=head2 CreatedDate => Str

The date that the slot type was created.


=head2 Description => Str

A description of the slot type.


=head2 EnumerationValues => ArrayRef[L<Paws::LexModels::EnumerationValue>]

A list of C<EnumerationValue> objects that defines the values that the
slot type can take.


=head2 LastUpdatedDate => Str

The date that the slot type was updated. When you create a resource,
the creation date and last update date are the same.


=head2 Name => Str

The name of the slot type.


=head2 Version => Str

The version assigned to the new slot type version.


=head2 _request_id => Str


=cut

