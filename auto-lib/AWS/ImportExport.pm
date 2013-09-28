use MooseX::Declare;
use AWS::API;
class AWS::ImportExport::Job with AWS::API::ResultParser {
  has JobType => (is => 'ro', isa => 'Str');
  has IsCanceled => (is => 'ro', isa => 'Str');
  has CreationDate => (is => 'ro', isa => 'Str');
  has JobId => (is => 'ro', isa => 'Str');
}

class AWS::ImportExport::UpdateJob {
  has JobType => (is => 'ro', isa => 'Str', required => 1);
  has Manifest => (is => 'ro', isa => 'Str', required => 1);
  has ValidateOnly => (is => 'ro', isa => 'Str', required => 1);
  has JobId => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateJob');
  has _returns => (isa => 'AWS::ImportExport::UpdateJobResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'UpdateJobResult');
}
class AWS::ImportExport::CancelJob {
  has JobId => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'CancelJob');
  has _returns => (isa => 'AWS::ImportExport::CancelJobResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'CancelJobResult');
}
class AWS::ImportExport::ListJobs {
  has MaxJobs => (is => 'ro', isa => 'Int');
  has Marker => (is => 'ro', isa => 'Str');

  has _api_call => (isa => 'Str', is => 'ro', default => 'ListJobs');
  has _returns => (isa => 'AWS::ImportExport::ListJobsResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'ListJobsResult');
}
class AWS::ImportExport::CreateJob {
  has ManifestAddendum => (is => 'ro', isa => 'Str');
  has JobType => (is => 'ro', isa => 'Str', required => 1);
  has Manifest => (is => 'ro', isa => 'Str', required => 1);
  has ValidateOnly => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'CreateJob');
  has _returns => (isa => 'AWS::ImportExport::CreateJobResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'CreateJobResult');
}
class AWS::ImportExport::GetStatus {
  has JobId => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'GetStatus');
  has _returns => (isa => 'AWS::ImportExport::GetStatusResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'GetStatusResult');
}
class AWS::ImportExport::UpdateJobResult with AWS::API::ResultParser {
  has WarningMessage => (is => 'ro', isa => 'Str');
  has Success => (is => 'ro', isa => 'Str');
}
class AWS::ImportExport::CancelJobResult with AWS::API::ResultParser {
  has Success => (is => 'ro', isa => 'Str');
}
class AWS::ImportExport::ListJobsResult with AWS::API::ResultParser {
  has IsTruncated => (is => 'ro', isa => 'Str');
  has Jobs => (is => 'ro', isa => 'ArrayRef[AWS::ImportExport::Job]');
}
class AWS::ImportExport::CreateJobResult with AWS::API::ResultParser {
  has Signature => (is => 'ro', isa => 'Str');
  has JobType => (is => 'ro', isa => 'Str');
  has WarningMessage => (is => 'ro', isa => 'Str');
  has SignatureFileContents => (is => 'ro', isa => 'Str');
  has AwsShippingAddress => (is => 'ro', isa => 'Str');
  has JobId => (is => 'ro', isa => 'Str');
}
class AWS::ImportExport::GetStatusResult with AWS::API::ResultParser {
  has Carrier => (is => 'ro', isa => 'Str');
  has Signature => (is => 'ro', isa => 'Str');
  has TrackingNumber => (is => 'ro', isa => 'Str');
  has CreationDate => (is => 'ro', isa => 'Str');
  has LocationCode => (is => 'ro', isa => 'Str');
  has ProgressMessage => (is => 'ro', isa => 'Str');
  has JobId => (is => 'ro', isa => 'Str');
  has AwsShippingAddress => (is => 'ro', isa => 'Str');
  has LogBucket => (is => 'ro', isa => 'Str');
  has ErrorCount => (is => 'ro', isa => 'Int');
  has LocationMessage => (is => 'ro', isa => 'Str');
  has ProgressCode => (is => 'ro', isa => 'Str');
  has SignatureFileContents => (is => 'ro', isa => 'Str');
  has CurrentManifest => (is => 'ro', isa => 'Str');
  has JobType => (is => 'ro', isa => 'Str');
  has LogKey => (is => 'ro', isa => 'Str');
}
class AWS::ImportExport with AWS::API::Caller with AWS::API::SingleEndpointCaller {
  has service => (is => 'ro', isa => 'Str', default => 'importexport');
  has version => (is => 'ro', isa => 'Str', default => '2010-06-01');

  method UpdateJob (%args) {
    my $call = AWS::ImportExport::UpdateJob->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = AWS::ImportExport::UpdateJobResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }

  method CancelJob (%args) {
    my $call = AWS::ImportExport::CancelJob->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = AWS::ImportExport::CancelJobResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }

  method ListJobs (%args) {
    my $call = AWS::ImportExport::ListJobs->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = AWS::ImportExport::ListJobsResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }

  method CreateJob (%args) {
    my $call = AWS::ImportExport::CreateJob->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = AWS::ImportExport::CreateJobResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }

  method GetStatus (%args) {
    my $call = AWS::ImportExport::GetStatus->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = AWS::ImportExport::GetStatusResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }

}
