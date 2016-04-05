
package Paws::WAF::CreateXssMatchSetResponse;
  use Moose;
  has ChangeToken => (is => 'ro', isa => 'Str');
  has XssMatchSet => (is => 'ro', isa => 'Paws::WAF::XssMatchSet');


### main pod documentation begin ###

=head1 NAME

Paws::WAF::CreateXssMatchSetResponse

=head1 ATTRIBUTES


=head2 ChangeToken => Str

The C<ChangeToken> that you used to submit the C<CreateXssMatchSet>
request. You can also use this value to query the status of the
request. For more information, see GetChangeTokenStatus.



=head2 XssMatchSet => L<Paws::WAF::XssMatchSet>

An XssMatchSet.




=cut

1;