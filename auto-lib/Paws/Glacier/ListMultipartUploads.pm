
package Paws::Glacier::ListMultipartUploads {
  use Moose;
  has accountId => (is => 'ro', isa => 'Str', required => 1);
  has limit => (is => 'ro', isa => 'Str');
  has marker => (is => 'ro', isa => 'Str');
  has vaultName => (is => 'ro', isa => 'Str', required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ListMultipartUploads');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::Glacier::ListMultipartUploadsOutput');
  class_has _result_key => (isa => 'Str', is => 'ro', default => 'ListMultipartUploadsResult');
}
1;

### main pod documentation begin ###

=head1 NAME

Paws::Glacier::ListMultipartUploads - Arguments for method ListMultipartUploads on Paws::Glacier

=head1 DESCRIPTION

This class represents the parameters used for calling the method ListMultipartUploads on the 
Amazon Glacier service. Use the attributes of this class
as arguments to method ListMultipartUploads.

You shouln't make instances of this class. Each attribute should be used as a named argument in the call to ListMultipartUploads.

As an example:

  $service_obj->ListMultipartUploads(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES

=head2 B<REQUIRED> accountId => Str

  

The C<AccountId> is the AWS Account ID. You can specify either the AWS
Account ID or optionally a '-', in which case Amazon Glacier uses the
AWS Account ID associated with the credentials used to sign the
request. If you specify your Account ID, do not include hyphens in it.










=head2 limit => Str

  

Specifies the maximum number of uploads returned in the response body.
If this value is not specified, the List Uploads operation returns up
to 1,000 uploads.










=head2 marker => Str

  

An opaque string used for pagination. This value specifies the upload
at which the listing of uploads should begin. Get the marker value from
a previous List Uploads response. You need only include the marker if
you are continuing the pagination of results started in a previous List
Uploads request.










=head2 B<REQUIRED> vaultName => Str

  

The name of the vault.












=head1 SEE ALSO

This class forms part of L<Paws>, and documents parameters for ListMultipartUploads in Paws::Glacier

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut
