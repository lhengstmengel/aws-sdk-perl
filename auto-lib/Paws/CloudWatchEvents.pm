package Paws::CloudWatchEvents;
  use Moose;
  sub service { 'events' }
  sub version { '2015-10-07' }
  sub target_prefix { 'AWSEvents' }
  sub json_version { "1.1" }
  has max_attempts => (is => 'ro', isa => 'Int', default => 5);
  has retry => (is => 'ro', isa => 'HashRef', default => sub {
    { base => 'rand', type => 'exponential', growth_factor => 2 }
  });
  has retriables => (is => 'ro', isa => 'ArrayRef', default => sub { [
  ] });

  with 'Paws::API::Caller', 'Paws::API::EndpointResolver', 'Paws::Net::V4Signature', 'Paws::Net::JsonCaller', 'Paws::Net::JsonResponse';

  
  sub DeleteRule {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::DeleteRule', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeRule {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::DescribeRule', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DisableRule {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::DisableRule', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub EnableRule {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::EnableRule', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ListRuleNamesByTarget {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::ListRuleNamesByTarget', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ListRules {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::ListRules', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ListTargetsByRule {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::ListTargetsByRule', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub PutEvents {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::PutEvents', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub PutRule {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::PutRule', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub PutTargets {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::PutTargets', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub RemoveTargets {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::RemoveTargets', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub TestEventPattern {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::CloudWatchEvents::TestEventPattern', @_);
    return $self->caller->do_call($self, $call_object);
  }
  


  sub operations { qw/DeleteRule DescribeRule DisableRule EnableRule ListRuleNamesByTarget ListRules ListTargetsByRule PutEvents PutRule PutTargets RemoveTargets TestEventPattern / }

1;

### main pod documentation begin ###

=head1 NAME

Paws::CloudWatchEvents - Perl Interface to AWS Amazon CloudWatch Events

=head1 SYNOPSIS

  use Paws;

  my $obj = Paws->service('CloudWatchEvents');
  my $res = $obj->Method(
    Arg1 => $val1,
    Arg2 => [ 'V1', 'V2' ],
    # if Arg3 is an object, the HashRef will be used as arguments to the constructor
    # of the arguments type
    Arg3 => { Att1 => 'Val1' },
    # if Arg4 is an array of objects, the HashRefs will be passed as arguments to
    # the constructor of the arguments type
    Arg4 => [ { Att1 => 'Val1'  }, { Att1 => 'Val2' } ],
  );

=head1 DESCRIPTION

Amazon CloudWatch Events helps you to respond to state changes in your
AWS resources. When your resources change state, they automatically
send events into an event stream. You can create rules that match
selected events in the stream and route them to targets to take action.
You can also use rules to take action on a pre-determined schedule. For
example, you can configure rules to:

=over

=item *

Automatically invoke an AWS Lambda function to update DNS entries when
an event notifies you that Amazon EC2 instance enters the running
state.

=item *

Direct specific API records from CloudTrail to an Amazon Kinesis stream
for detailed analysis of potential security or availability risks.

=item *

Periodically invoke a built-in target to create a snapshot of an Amazon
EBS volume.

=back

For more information about the features of Amazon CloudWatch Events,
see the Amazon CloudWatch Events User Guide.

=head1 METHODS

=head2 DeleteRule(Name => Str)

Each argument is described in detail in: L<Paws::CloudWatchEvents::DeleteRule>

Returns: nothing

  Deletes the specified rule.

You must remove all targets from a rule using RemoveTargets before you
can delete the rule.

When you delete a rule, incoming events might continue to match to the
deleted rule. Please allow a short period of time for changes to take
effect.


=head2 DescribeRule(Name => Str)

Each argument is described in detail in: L<Paws::CloudWatchEvents::DescribeRule>

Returns: a L<Paws::CloudWatchEvents::DescribeRuleResponse> instance

  Describes the specified rule.


=head2 DisableRule(Name => Str)

Each argument is described in detail in: L<Paws::CloudWatchEvents::DisableRule>

Returns: nothing

  Disables the specified rule. A disabled rule won't match any events,
and won't self-trigger if it has a schedule expression.

When you disable a rule, incoming events might continue to match to the
disabled rule. Please allow a short period of time for changes to take
effect.


=head2 EnableRule(Name => Str)

Each argument is described in detail in: L<Paws::CloudWatchEvents::EnableRule>

Returns: nothing

  Enables the specified rule. If the rule does not exist, the operation
fails.

When you enable a rule, incoming events might not immediately start
matching to a newly enabled rule. Please allow a short period of time
for changes to take effect.


=head2 ListRuleNamesByTarget(TargetArn => Str, [Limit => Int, NextToken => Str])

Each argument is described in detail in: L<Paws::CloudWatchEvents::ListRuleNamesByTarget>

Returns: a L<Paws::CloudWatchEvents::ListRuleNamesByTargetResponse> instance

  Lists the rules for the specified target. You can see which of the
rules in Amazon CloudWatch Events can invoke a specific target in your
account.


=head2 ListRules([Limit => Int, NamePrefix => Str, NextToken => Str])

Each argument is described in detail in: L<Paws::CloudWatchEvents::ListRules>

Returns: a L<Paws::CloudWatchEvents::ListRulesResponse> instance

  Lists your Amazon CloudWatch Events rules. You can either list all the
rules or you can provide a prefix to match to the rule names.


=head2 ListTargetsByRule(Rule => Str, [Limit => Int, NextToken => Str])

Each argument is described in detail in: L<Paws::CloudWatchEvents::ListTargetsByRule>

Returns: a L<Paws::CloudWatchEvents::ListTargetsByRuleResponse> instance

  Lists the targets assigned to the specified rule.


=head2 PutEvents(Entries => ArrayRef[L<Paws::CloudWatchEvents::PutEventsRequestEntry>])

Each argument is described in detail in: L<Paws::CloudWatchEvents::PutEvents>

Returns: a L<Paws::CloudWatchEvents::PutEventsResponse> instance

  Sends custom events to Amazon CloudWatch Events so that they can be
matched to rules.


=head2 PutRule(Name => Str, [Description => Str, EventPattern => Str, RoleArn => Str, ScheduleExpression => Str, State => Str])

Each argument is described in detail in: L<Paws::CloudWatchEvents::PutRule>

Returns: a L<Paws::CloudWatchEvents::PutRuleResponse> instance

  Creates or updates the specified rule. Rules are enabled by default, or
based on value of the state. You can disable a rule using DisableRule.

When you create or update a rule, incoming events might not immediately
start matching to new or updated rules. Please allow a short period of
time for changes to take effect.

A rule must contain at least an EventPattern or ScheduleExpression.
Rules with EventPatterns are triggered when a matching event is
observed. Rules with ScheduleExpressions self-trigger based on the
given schedule. A rule can have both an EventPattern and a
ScheduleExpression, in which case the rule triggers on matching events
as well as on a schedule.

Most services in AWS treat : or / as the same character in Amazon
Resource Names (ARNs). However, CloudWatch Events uses an exact match
in event patterns and rules. Be sure to use the correct ARN characters
when creating event patterns so that they match the ARN syntax in the
event you want to match.


=head2 PutTargets(Rule => Str, Targets => ArrayRef[L<Paws::CloudWatchEvents::Target>])

Each argument is described in detail in: L<Paws::CloudWatchEvents::PutTargets>

Returns: a L<Paws::CloudWatchEvents::PutTargetsResponse> instance

  Adds the specified targets to the specified rule, or updates the
targets if they are already associated with the rule.

Targets are the resources that are invoked when a rule is triggered.
Example targets include EC2 instances, AWS Lambda functions, Amazon
Kinesis streams, Amazon ECS tasks, AWS Step Functions state machines,
and built-in targets. Note that creating rules with built-in targets is
supported only in the AWS Management Console.

For some target types, C<PutTargets> provides target-specific
parameters. If the target is an Amazon Kinesis stream, you can
optionally specify which shard the event goes to by using the
C<KinesisParameters> argument. To invoke a command on multiple EC2
instances with one rule, you can use the C<RunCommandParameters> field.

To be able to make API calls against the resources that you own, Amazon
CloudWatch Events needs the appropriate permissions. For AWS Lambda and
Amazon SNS resources, CloudWatch Events relies on resource-based
policies. For EC2 instances, Amazon Kinesis streams, and AWS Step
Functions state machines, CloudWatch Events relies on IAM roles that
you specify in the C<RoleARN> argument in C<PutTarget>. For more
information, see Authentication and Access Control in the I<Amazon
CloudWatch Events User Guide>.

B<Input>, B<InputPath> and B<InputTransformer> are mutually exclusive
and optional parameters of a target. When a rule is triggered due to a
matched event:

=over

=item *

If none of the following arguments are specified for a target, then the
entire event is passed to the target in JSON form (unless the target is
Amazon EC2 Run Command or Amazon ECS task, in which case nothing from
the event is passed to the target).

=item *

If B<Input> is specified in the form of valid JSON, then the matched
event is overridden with this constant.

=item *

If B<InputPath> is specified in the form of JSONPath (for example,
C<$.detail>), then only the part of the event specified in the path is
passed to the target (for example, only the detail part of the event is
passed).

=item *

If B<InputTransformer> is specified, then one or more specified
JSONPaths are extracted from the event and used as values in a template
that you specify as the input to the target.

=back

When you add targets to a rule and the associated rule triggers soon
after, new or updated targets might not be immediately invoked. Please
allow a short period of time for changes to take effect.


=head2 RemoveTargets(Ids => ArrayRef[Str|Undef], Rule => Str)

Each argument is described in detail in: L<Paws::CloudWatchEvents::RemoveTargets>

Returns: a L<Paws::CloudWatchEvents::RemoveTargetsResponse> instance

  Removes the specified targets from the specified rule. When the rule is
triggered, those targets are no longer be invoked.

When you remove a target, when the associated rule triggers, removed
targets might continue to be invoked. Please allow a short period of
time for changes to take effect.


=head2 TestEventPattern(Event => Str, EventPattern => Str)

Each argument is described in detail in: L<Paws::CloudWatchEvents::TestEventPattern>

Returns: a L<Paws::CloudWatchEvents::TestEventPatternResponse> instance

  Tests whether the specified event pattern matches the provided event.

Most services in AWS treat : or / as the same character in Amazon
Resource Names (ARNs). However, CloudWatch Events uses an exact match
in event patterns and rules. Be sure to use the correct ARN characters
when creating event patterns so that they match the ARN syntax in the
event you want to match.




=head1 PAGINATORS

Paginator methods are helpers that repetively call methods that return partial results




=head1 SEE ALSO

This service class forms part of L<Paws>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

