
package Paws::IAM::ListUsers;
  use Moose;
  has Marker => (is => 'ro', isa => 'Str');
  has MaxItems => (is => 'ro', isa => 'Int');
  has PathPrefix => (is => 'ro', isa => 'Str');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListUsers');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::IAM::ListUsersResponse');
  class_has _result_key => (isa => 'Str', is => 'ro', default => 'ListUsersResult');
1;

### main pod documentation begin ###

=head1 NAME

Paws::IAM::ListUsers - Arguments for method ListUsers on Paws::IAM

=head1 DESCRIPTION

This class represents the parameters used for calling the method ListUsers on the 
AWS Identity and Access Management service. Use the attributes of this class
as arguments to method ListUsers.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to ListUsers.

As an example:

  $service_obj->ListUsers(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 Marker => Str

Use this parameter only when paginating results and only after you
receive a response indicating that the results are truncated. Set it to
the value of the C<Marker> element in the response that you received to
indicate where the next call should start.



=head2 MaxItems => Int

(Optional) Use this only when paginating results to indicate the
maximum number of items you want in the response. If additional items
exist beyond the maximum you specify, the C<IsTruncated> response
element is C<true>.

If you do not include this parameter, it defaults to 100. Note that IAM
might return fewer results, even when there are more results available.
In that case, the C<IsTruncated> response element returns C<true> and
C<Marker> contains a value to include in the subsequent call that tells
the service where to continue from.



=head2 PathPrefix => Str

The path prefix for filtering the results. For example:
C</division_abc/subdivision_xyz/>, which would get all user names whose
path starts with C</division_abc/subdivision_xyz/>.

This parameter is optional. If it is not included, it defaults to a
slash (/), listing all user names. This paramater allows (per its regex
pattern) a string of characters consisting of either a forward slash
(/) by itself or a string that must begin and end with forward slashes,
containing any ASCII character from the ! (\u0021) thru the DEL
character (\u007F), including most punctuation characters, digits, and
upper and lowercased letters.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ListUsers in L<Paws::IAM>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

