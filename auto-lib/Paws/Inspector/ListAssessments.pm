
package Paws::Inspector::ListAssessments;
  use Moose;
  has applicationArns => (is => 'ro', isa => 'ArrayRef[Str]');
  has filter => (is => 'ro', isa => 'Paws::Inspector::AssessmentsFilter');
  has maxResults => (is => 'ro', isa => 'Int');
  has nextToken => (is => 'ro', isa => 'Str');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListAssessments');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::Inspector::ListAssessmentsResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Inspector::ListAssessments - Arguments for method ListAssessments on Paws::Inspector

=head1 DESCRIPTION

This class represents the parameters used for calling the method ListAssessments on the 
Amazon Inspector service. Use the attributes of this class
as arguments to method ListAssessments.

You shouln't make instances of this class. Each attribute should be used as a named argument in the call to ListAssessments.

As an example:

  $service_obj->ListAssessments(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES

=head2 applicationArns => ArrayRef[Str]

  

A list of ARNs specifying the applications the assessments of which you
want to list.










=head2 filter => Paws::Inspector::AssessmentsFilter

  

You can use this parameter to specify a subset of data to be included
in the action's response.

For a record to match a filter, all specified filter attributes must
match. When multiple values are specified for a filter attribute, any
of the values can match.










=head2 maxResults => Int

  

You can use this parameter to indicate the maximum number of items you
want in the response. The default value is 10. The maximum value is
500.










=head2 nextToken => Str

  

You can use this parameter when paginating results. Set the value of
this parameter to 'null' on your first call to the B<ListAssessments>
action. Subsequent calls to the action fill B<nextToken> in the request
with the value of B<NextToken> from previous response to continue
listing data.












=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ListAssessments in L<Paws::Inspector>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut
