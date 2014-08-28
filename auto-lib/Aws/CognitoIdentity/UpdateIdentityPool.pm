
package Aws::CognitoIdentity::UpdateIdentityPool {
  use Moose;
  has AllowUnauthenticatedIdentities => (is => 'ro', isa => 'Bool', required => 1);
  has IdentityPoolId => (is => 'ro', isa => 'Str', required => 1);
  has IdentityPoolName => (is => 'ro', isa => 'Str', required => 1);
  has SupportedLoginProviders => (is => 'ro', isa => 'Aws::CognitoIdentity::IdentityProviders');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateIdentityPool');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Aws::CognitoIdentity::UpdateIdentityPoolResult');
  class_has _result_key => (isa => 'Str', is => 'ro');
}

1;