
package Paws::IAM::ResetServiceSpecificCredential;
  use Moose;
  has ServiceSpecificCredentialId => (is => 'ro', isa => 'Str', required => 1);
  has UserName => (is => 'ro', isa => 'Str');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ResetServiceSpecificCredential');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::IAM::ResetServiceSpecificCredentialResponse');
  class_has _result_key => (isa => 'Str', is => 'ro', default => 'ResetServiceSpecificCredentialResult');
1;

### main pod documentation begin ###

=head1 NAME

Paws::IAM::ResetServiceSpecificCredential - Arguments for method ResetServiceSpecificCredential on Paws::IAM

=head1 DESCRIPTION

This class represents the parameters used for calling the method ResetServiceSpecificCredential on the 
AWS Identity and Access Management service. Use the attributes of this class
as arguments to method ResetServiceSpecificCredential.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to ResetServiceSpecificCredential.

As an example:

  $service_obj->ResetServiceSpecificCredential(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 B<REQUIRED> ServiceSpecificCredentialId => Str

The unique identifier of the service-specific credential.

This parameter allows (per its regex pattern) a string of characters
that can consist of any upper or lowercased letter or digit.



=head2 UserName => Str

The name of the IAM user associated with the service-specific
credential. If this value is not specified, then the operation assumes
the user whose credentials are used to call the operation.

This parameter allows (per its regex pattern) a string of characters
consisting of upper and lowercase alphanumeric characters with no
spaces. You can also include any of the following characters: =,.@-




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ResetServiceSpecificCredential in L<Paws::IAM>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

