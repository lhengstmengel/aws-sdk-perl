
package Paws::MTurk::ListQualificationRequests;
  use Moose;
  has MaxResults => (is => 'ro', isa => 'Int');
  has NextToken => (is => 'ro', isa => 'Str');
  has QualificationTypeId => (is => 'ro', isa => 'Str');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListQualificationRequests');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::MTurk::ListQualificationRequestsResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::MTurk::ListQualificationRequests - Arguments for method ListQualificationRequests on Paws::MTurk

=head1 DESCRIPTION

This class represents the parameters used for calling the method ListQualificationRequests on the 
Amazon Mechanical Turk service. Use the attributes of this class
as arguments to method ListQualificationRequests.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to ListQualificationRequests.

As an example:

  $service_obj->ListQualificationRequests(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 MaxResults => Int

The maximum number of results to return in a single call.



=head2 NextToken => Str





=head2 QualificationTypeId => Str

The ID of the QualificationType.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ListQualificationRequests in L<Paws::MTurk>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

