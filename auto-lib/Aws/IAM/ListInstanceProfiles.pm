
package Aws::IAM::ListInstanceProfiles {
  use Moose;
  has Marker => (is => 'ro', isa => 'Str');
  has MaxItems => (is => 'ro', isa => 'Int');
  has PathPrefix => (is => 'ro', isa => 'Str');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListInstanceProfiles');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Aws::IAM::ListInstanceProfilesResult');
  class_has _result_key => (isa => 'Str', is => 'ro', default => 'ListInstanceProfilesResult');
}
1;
  