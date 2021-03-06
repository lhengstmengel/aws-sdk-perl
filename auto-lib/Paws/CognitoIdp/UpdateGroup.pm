
package Paws::CognitoIdp::UpdateGroup;
  use Moose;
  has Description => (is => 'ro', isa => 'Str');
  has GroupName => (is => 'ro', isa => 'Str', required => 1);
  has Precedence => (is => 'ro', isa => 'Int');
  has RoleArn => (is => 'ro', isa => 'Str');
  has UserPoolId => (is => 'ro', isa => 'Str', required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateGroup');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::CognitoIdp::UpdateGroupResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::CognitoIdp::UpdateGroup - Arguments for method UpdateGroup on Paws::CognitoIdp

=head1 DESCRIPTION

This class represents the parameters used for calling the method UpdateGroup on the 
Amazon Cognito Identity Provider service. Use the attributes of this class
as arguments to method UpdateGroup.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to UpdateGroup.

As an example:

  $service_obj->UpdateGroup(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 Description => Str

A string containing the new description of the group.



=head2 B<REQUIRED> GroupName => Str

The name of the group.



=head2 Precedence => Int

The new precedence value for the group. For more information about this
parameter, see CreateGroupRequest.



=head2 RoleArn => Str

The new role ARN for the group. This is used for setting the
C<cognito:roles> and C<cognito:preferred_role> claims in the token.



=head2 B<REQUIRED> UserPoolId => Str

The user pool ID for the user pool.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method UpdateGroup in L<Paws::CognitoIdp>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

