
use MooseX::Declare;
use AWS::API;


class Aws::CloudTrail::Trail with (AWS::API::ResultParser, AWS::API::ToParams) {
  has IncludeGlobalServiceEvents => (is => 'ro', isa => 'Str');
  has Name => (is => 'ro', isa => 'Str');
  has S3BucketName => (is => 'ro', isa => 'Str');
  has S3KeyPrefix => (is => 'ro', isa => 'Str');
  has SnsTopicName => (is => 'ro', isa => 'Str');
}



class Aws::CloudTrail::CreateTrail {
  has IncludeGlobalServiceEvents => (is => 'ro', isa => 'Str');
  has Name => (is => 'ro', isa => 'Str');
  has S3BucketName => (is => 'ro', isa => 'Str');
  has S3KeyPrefix => (is => 'ro', isa => 'Str');
  has SnsTopicName => (is => 'ro', isa => 'Str');
  has trail => (is => 'ro', isa => 'Aws::CloudTrail::Trail');

  has _api_call => (isa => 'Str', is => 'ro', default => 'CreateTrail');
  has _returns => (isa => 'Aws::CloudTrail::CreateTrailResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'CreateTrailResult');  
}
class Aws::CloudTrail::DeleteTrail {
  has Name => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'DeleteTrail');
  has _returns => (isa => 'Aws::CloudTrail::DeleteTrailResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DeleteTrailResult');  
}
class Aws::CloudTrail::DescribeTrails {
  has trailNameList => (is => 'ro', isa => 'ArrayRef[Str]');

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeTrails');
  has _returns => (isa => 'Aws::CloudTrail::DescribeTrailsResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeTrailsResult');  
}
class Aws::CloudTrail::GetTrailStatus {
  has Name => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'GetTrailStatus');
  has _returns => (isa => 'Aws::CloudTrail::GetTrailStatusResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'GetTrailStatusResult');  
}
class Aws::CloudTrail::StartLogging {
  has Name => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'StartLogging');
  has _returns => (isa => 'Aws::CloudTrail::StartLoggingResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'StartLoggingResult');  
}
class Aws::CloudTrail::StopLogging {
  has Name => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'StopLogging');
  has _returns => (isa => 'Aws::CloudTrail::StopLoggingResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'StopLoggingResult');  
}
class Aws::CloudTrail::UpdateTrail {
  has IncludeGlobalServiceEvents => (is => 'ro', isa => 'Str');
  has Name => (is => 'ro', isa => 'Str');
  has S3BucketName => (is => 'ro', isa => 'Str');
  has S3KeyPrefix => (is => 'ro', isa => 'Str');
  has SnsTopicName => (is => 'ro', isa => 'Str');
  has trail => (is => 'ro', isa => 'Aws::CloudTrail::Trail');

  has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateTrail');
  has _returns => (isa => 'Aws::CloudTrail::UpdateTrailResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'UpdateTrailResult');  
}

class Aws::CloudTrail::CreateTrailResult with AWS::API::ResultParser {
  has IncludeGlobalServiceEvents => (is => 'ro', isa => 'Str');
  has Name => (is => 'ro', isa => 'Str');
  has S3BucketName => (is => 'ro', isa => 'Str');
  has S3KeyPrefix => (is => 'ro', isa => 'Str');
  has SnsTopicName => (is => 'ro', isa => 'Str');
  has trail => (is => 'ro', isa => 'Aws::CloudTrail::Trail');

}
class Aws::CloudTrail::DeleteTrailResult with AWS::API::ResultParser {

}
class Aws::CloudTrail::DescribeTrailsResult with AWS::API::ResultParser {
  has trailList => (is => 'ro', isa => 'ArrayRef[Aws::CloudTrail::Trail]');

}
class Aws::CloudTrail::GetTrailStatusResult with AWS::API::ResultParser {
  has IsLogging => (is => 'ro', isa => 'Str');
  has LatestDeliveryAttemptSucceeded => (is => 'ro', isa => 'Str');
  has LatestDeliveryAttemptTime => (is => 'ro', isa => 'Str');
  has LatestDeliveryError => (is => 'ro', isa => 'Str');
  has LatestDeliveryTime => (is => 'ro', isa => 'Str');
  has LatestNotificationAttemptSucceeded => (is => 'ro', isa => 'Str');
  has LatestNotificationAttemptTime => (is => 'ro', isa => 'Str');
  has LatestNotificationError => (is => 'ro', isa => 'Str');
  has LatestNotificationTime => (is => 'ro', isa => 'Str');
  has StartLoggingTime => (is => 'ro', isa => 'Str');
  has StopLoggingTime => (is => 'ro', isa => 'Str');
  has TimeLoggingStarted => (is => 'ro', isa => 'Str');
  has TimeLoggingStopped => (is => 'ro', isa => 'Str');

}
class Aws::CloudTrail::StartLoggingResult with AWS::API::ResultParser {

}
class Aws::CloudTrail::StopLoggingResult with AWS::API::ResultParser {

}
class Aws::CloudTrail::UpdateTrailResult with AWS::API::ResultParser {
  has IncludeGlobalServiceEvents => (is => 'ro', isa => 'Str');
  has Name => (is => 'ro', isa => 'Str');
  has S3BucketName => (is => 'ro', isa => 'Str');
  has S3KeyPrefix => (is => 'ro', isa => 'Str');
  has SnsTopicName => (is => 'ro', isa => 'Str');
  has trail => (is => 'ro', isa => 'Aws::CloudTrail::Trail');

}

class Aws::CloudTrail with (Net::AWS::Caller, AWS::API::RegionalEndpointCaller, Net::AWS::V4Signature, Net::AWS::JsonCaller, Net::AWS::XMLResponse) {
  has service => (is => 'ro', isa => 'Str', default => 'cloudtrail');
  has version => (is => 'ro', isa => 'Str', default => '2013-11-01');
  
  method CreateTrail (%args) {
    my $call = Aws::CloudTrail::CreateTrail->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::CloudTrail::CreateTrailResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DeleteTrail (%args) {
    my $call = Aws::CloudTrail::DeleteTrail->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::CloudTrail::DeleteTrailResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeTrails (%args) {
    my $call = Aws::CloudTrail::DescribeTrails->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::CloudTrail::DescribeTrailsResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method GetTrailStatus (%args) {
    my $call = Aws::CloudTrail::GetTrailStatus->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::CloudTrail::GetTrailStatusResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method StartLogging (%args) {
    my $call = Aws::CloudTrail::StartLogging->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::CloudTrail::StartLoggingResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method StopLogging (%args) {
    my $call = Aws::CloudTrail::StopLogging->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::CloudTrail::StopLoggingResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method UpdateTrail (%args) {
    my $call = Aws::CloudTrail::UpdateTrail->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::CloudTrail::UpdateTrailResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
}