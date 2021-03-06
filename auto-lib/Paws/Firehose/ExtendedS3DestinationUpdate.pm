package Paws::Firehose::ExtendedS3DestinationUpdate;
  use Moose;
  has BucketARN => (is => 'ro', isa => 'Str');
  has BufferingHints => (is => 'ro', isa => 'Paws::Firehose::BufferingHints');
  has CloudWatchLoggingOptions => (is => 'ro', isa => 'Paws::Firehose::CloudWatchLoggingOptions');
  has CompressionFormat => (is => 'ro', isa => 'Str');
  has EncryptionConfiguration => (is => 'ro', isa => 'Paws::Firehose::EncryptionConfiguration');
  has Prefix => (is => 'ro', isa => 'Str');
  has ProcessingConfiguration => (is => 'ro', isa => 'Paws::Firehose::ProcessingConfiguration');
  has RoleARN => (is => 'ro', isa => 'Str');
  has S3BackupMode => (is => 'ro', isa => 'Str');
  has S3BackupUpdate => (is => 'ro', isa => 'Paws::Firehose::S3DestinationUpdate');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Firehose::ExtendedS3DestinationUpdate

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Firehose::ExtendedS3DestinationUpdate object:

  $service_obj->Method(Att1 => { BucketARN => $value, ..., S3BackupUpdate => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Firehose::ExtendedS3DestinationUpdate object:

  $result = $service_obj->Method(...);
  $result->Att1->BucketARN

=head1 DESCRIPTION

Describes an update for a destination in Amazon S3.

=head1 ATTRIBUTES


=head2 BucketARN => Str

  The ARN of the S3 bucket.


=head2 BufferingHints => L<Paws::Firehose::BufferingHints>

  The buffering option.


=head2 CloudWatchLoggingOptions => L<Paws::Firehose::CloudWatchLoggingOptions>

  The CloudWatch logging options for your delivery stream.


=head2 CompressionFormat => Str

  The compression format. If no value is specified, the default is
C<UNCOMPRESSED>.


=head2 EncryptionConfiguration => L<Paws::Firehose::EncryptionConfiguration>

  The encryption configuration. If no value is specified, the default is
no encryption.


=head2 Prefix => Str

  The "YYYY/MM/DD/HH" time format prefix is automatically used for
delivered S3 files. You can specify an extra prefix to be added in
front of the time format prefix. Note that if the prefix ends with a
slash, it appears as a folder in the S3 bucket. For more information,
see Amazon S3 Object Name Format in the I<Amazon Kinesis Firehose
Developer Guide>.


=head2 ProcessingConfiguration => L<Paws::Firehose::ProcessingConfiguration>

  The data processing configuration.


=head2 RoleARN => Str

  The ARN of the AWS credentials.


=head2 S3BackupMode => Str

  Enables or disables Amazon S3 backup mode.


=head2 S3BackupUpdate => L<Paws::Firehose::S3DestinationUpdate>

  The Amazon S3 destination for backup.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Firehose>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

