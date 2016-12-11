package Paws::SQS;
  use Moose;
  sub service { 'sqs' }
  sub version { '2012-11-05' }
  sub flattened_arrays { 1 }
  has max_attempts => (is => 'ro', isa => 'Int', default => 5);
  has retry => (is => 'ro', isa => 'HashRef', default => sub {
    { base => 'rand', type => 'exponential', growth_factor => 2 }
  });
  has retriables => (is => 'ro', isa => 'ArrayRef', default => sub { [
       sub { defined $_[0]->http_status and $_[0]->http_status == 403 and $_[0]->code eq 'RequestThrottled' },
  ] });

  with 'Paws::API::Caller', 'Paws::API::EndpointResolver', 'Paws::Net::V4Signature', 'Paws::Net::QueryCaller', 'Paws::Net::XMLResponse';

  has '+region_rules' => (default => sub {
    my $regioninfo;
      $regioninfo = [
    {
      constraints => [
        [
          'region',
          'equals',
          'us-east-1'
        ]
      ],
      uri => 'https://queue.amazonaws.com'
    },
    {
      constraints => [
        [
          'region',
          'startsWith',
          'cn-'
        ]
      ],
      uri => 'https://{region}.queue.amazonaws.com.cn'
    },
    {
      constraints => [
        [
          'region',
          'notEquals',
          undef
        ]
      ],
      uri => 'https://{region}.queue.amazonaws.com'
    }
  ];

    return $regioninfo;
  });

  
  sub AddPermission {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::AddPermission', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ChangeMessageVisibility {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::ChangeMessageVisibility', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ChangeMessageVisibilityBatch {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::ChangeMessageVisibilityBatch', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub CreateQueue {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::CreateQueue', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteMessage {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::DeleteMessage', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteMessageBatch {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::DeleteMessageBatch', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteQueue {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::DeleteQueue', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub GetQueueAttributes {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::GetQueueAttributes', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub GetQueueUrl {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::GetQueueUrl', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ListDeadLetterSourceQueues {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::ListDeadLetterSourceQueues', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ListQueues {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::ListQueues', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub PurgeQueue {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::PurgeQueue', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ReceiveMessage {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::ReceiveMessage', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub RemovePermission {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::RemovePermission', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub SendMessage {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::SendMessage', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub SendMessageBatch {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::SendMessageBatch', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub SetQueueAttributes {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::SQS::SetQueueAttributes', @_);
    return $self->caller->do_call($self, $call_object);
  }
  


  sub operations { qw/AddPermission ChangeMessageVisibility ChangeMessageVisibilityBatch CreateQueue DeleteMessage DeleteMessageBatch DeleteQueue GetQueueAttributes GetQueueUrl ListDeadLetterSourceQueues ListQueues PurgeQueue ReceiveMessage RemovePermission SendMessage SendMessageBatch SetQueueAttributes / }

1;

### main pod documentation begin ###

=head1 NAME

Paws::SQS - Perl Interface to AWS Amazon Simple Queue Service

=head1 SYNOPSIS

  use Paws;

  my $obj = Paws->service('SQS');
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

Welcome to the I<Amazon Simple Queue Service API Reference>. This
section describes who should read this guide, how the guide is
organized, and other resources related to the Amazon Simple Queue
Service (Amazon SQS).

Amazon SQS offers reliable and scalable hosted queues for storing
messages as they travel between computers. By using Amazon SQS, you can
move data between distributed components of your applications that
perform different tasks without losing messages or requiring each
component to be always available.

B<Helpful Links>

=over

=item *

Making API Requests

=item *

Amazon SQS product page

=item *

Using Amazon SQS Message Attributes

=item *

Using Amazon SQS Dead Letter Queues

=item *

Regions and Endpoints

=back

We also provide SDKs that enable you to access Amazon SQS from your
preferred programming language. The SDKs contain functionality that
automatically takes care of tasks such as:

=over

=item *

Cryptographically signing your service requests

=item *

Retrying requests

=item *

Handling error responses

=back

For a list of available SDKs, see Tools for Amazon Web Services.

=head1 METHODS

=head2 AddPermission(Actions => ArrayRef[Str|Undef], AWSAccountIds => ArrayRef[Str|Undef], Label => Str, QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::AddPermission>

Returns: nothing

  Adds a permission to a queue for a specific principal. This allows for
sharing access to the queue.

When you create a queue, you have full control access rights for the
queue. Only you (as owner of the queue) can grant or deny permissions
to the queue. For more information about these permissions, see Shared
Queues in the I<Amazon SQS Developer Guide>.

C<AddPermission> writes an Amazon SQS-generated policy. If you want to
write your own policy, use SetQueueAttributes to upload your policy.
For more information about writing your own policy, see Using The
Access Policy Language in the I<Amazon SQS Developer Guide>.

Some API actions take lists of parameters. These lists are specified
using the C<param.n> notation. Values of C<n> are integers starting
from 1. For example, a parameter list with two elements looks like
this:

C<&amp;Attribute.1=this>

C<&amp;Attribute.2=that>


=head2 ChangeMessageVisibility(QueueUrl => Str, ReceiptHandle => Str, VisibilityTimeout => Int)

Each argument is described in detail in: L<Paws::SQS::ChangeMessageVisibility>

Returns: nothing

  Changes the visibility timeout of a specified message in a queue to a
new value. The maximum allowed timeout value you can set the value to
is 12 hours. This means you can't extend the timeout of a message in an
existing queue to more than a total visibility timeout of 12 hours.
(For more information visibility timeout, see Visibility Timeout in the
I<Amazon SQS Developer Guide>.)

For example, let's say you have a message and its default message
visibility timeout is 5 minutes. After 3 minutes, you call
C<ChangeMessageVisiblity> with a timeout of 10 minutes. At that time,
the timeout for the message would be extended by 10 minutes beyond the
time of the ChangeMessageVisibility call. This results in a total
visibility timeout of 13 minutes. You can continue to call
ChangeMessageVisibility to extend the visibility timeout to a maximum
of 12 hours. If you try to extend beyond 12 hours, the request will be
rejected.

A message is considered to be I<in flight> after it's received from a
queue by a consumer, but not yet deleted from the queue.

For standard queues, there can be a maximum of 120,000 inflight
messages per queue. If you reach this limit, Amazon SQS returns the
C<OverLimit> error message. To avoid reaching the limit, you should
delete messages from the queue after they're processed. You can also
increase the number of queues you use to process your messages.

For FIFO queues, there can be a maximum of 20,000 inflight messages per
queue. If you reach this limit, Amazon SQS returns no error messages.

If you attempt to set the C<VisibilityTimeout> to an amount more than
the maximum time left, Amazon SQS returns an error. It will not
automatically recalculate and increase the timeout to the maximum time
remaining.

Unlike with a queue, when you change the visibility timeout for a
specific message, that timeout value is applied immediately but is not
saved in memory for that message. If you don't delete a message after
it is received, the visibility timeout for the message the next time it
is received reverts to the original timeout value, not the value you
set with the C<ChangeMessageVisibility> action.


=head2 ChangeMessageVisibilityBatch(Entries => ArrayRef[L<Paws::SQS::ChangeMessageVisibilityBatchRequestEntry>], QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::ChangeMessageVisibilityBatch>

Returns: a L<Paws::SQS::ChangeMessageVisibilityBatchResult> instance

  Changes the visibility timeout of multiple messages. This is a batch
version of ChangeMessageVisibility. The result of the action on each
message is reported individually in the response. You can send up to 10
ChangeMessageVisibility requests with each
C<ChangeMessageVisibilityBatch> action.

Because the batch request can result in a combination of successful and
unsuccessful actions, you should check for batch errors even when the
call returns an HTTP status code of 200.

Some API actions take lists of parameters. These lists are specified
using the C<param.n> notation. Values of C<n> are integers starting
from 1. For example, a parameter list with two elements looks like
this:

C<&amp;Attribute.1=this>

C<&amp;Attribute.2=that>


=head2 CreateQueue(QueueName => Str, [Attributes => L<Paws::SQS::QueueAttributeMap>])

Each argument is described in detail in: L<Paws::SQS::CreateQueue>

Returns: a L<Paws::SQS::CreateQueueResult> instance

  Creates a new standard or FIFO queue or returns the URL of an existing
queue. You can pass one or more attributes in the request.

=over

=item *

If you don't specify the C<FifoQueue> attribute, Amazon SQS creates a
standard queue.

You can't change the queue type after you create it and you can't
convert an existing standard queue into a FIFO queue. You must either
create a new FIFO queue for your application or delete your existing
standard queue and recreate it as a FIFO queue. For more information,
see Moving From a Standard Queue to a FIFO Queue in the I<Amazon SQS
Developer Guide>.

=item *

If you don't provide a value for an attribute, the queue is created
with the default value for the attribute.

=item *

If you delete a queue, you must wait at least 60 seconds before
creating a queue with the same name.

=back

To successfully create a new queue, you must provide a queue name that
adheres to the limits related to queues and is unique within the scope
of your queues.

To get the queue URL, use the GetQueueUrl action. GetQueueUrl requires
only the C<QueueName> parameter.

=over

=item *

If you provide the name of an existing queue along with the exact names
and values of all the queue's attributes, C<CreateQueue> returns the
queue URL for the existing queue.

=item *

If the queue name, attribute names, or attribute values don't match an
existing queue, C<CreateQueue> returns an error.

=back

Some API actions take lists of parameters. Specify these lists using
the C<param.n> notation. Values of C<n> are integers starting from 1.
The following is an example of a parameter list with two elements:

C<&amp;Attribute.1=this>

C<&amp;Attribute.2=that>


=head2 DeleteMessage(QueueUrl => Str, ReceiptHandle => Str)

Each argument is described in detail in: L<Paws::SQS::DeleteMessage>

Returns: nothing

  Deletes the specified message from the specified queue. You specify the
message by using the message's C<receipt handle> and not the C<message
ID> you received when you sent the message. Even if the message is
locked by another reader due to the visibility timeout setting, it is
still deleted from the queue. If you leave a message in the queue for
longer than the queue's configured retention period, Amazon SQS
automatically deletes it.

The receipt handle is associated with a specific instance of receiving
the message. If you receive a message more than once, the receipt
handle you get each time you receive the message is different. When you
request C<DeleteMessage>, if you don't provide the most recently
received receipt handle for the message, the request will still
succeed, but the message might not be deleted.

It is possible you will receive a message even after you have deleted
it. This might happen on rare occasions if one of the servers storing a
copy of the message is unavailable when you request to delete the
message. The copy remains on the server and might be returned to you
again on a subsequent receive request. You should create your system to
be idempotent so that receiving a particular message more than once is
not a problem.


=head2 DeleteMessageBatch(Entries => ArrayRef[L<Paws::SQS::DeleteMessageBatchRequestEntry>], QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::DeleteMessageBatch>

Returns: a L<Paws::SQS::DeleteMessageBatchResult> instance

  Deletes up to ten messages from the specified queue. This is a batch
version of DeleteMessage. The result of the delete action on each
message is reported individually in the response.

Because the batch request can result in a combination of successful and
unsuccessful actions, you should check for batch errors even when the
call returns an HTTP status code of 200.

Some API actions take lists of parameters. These lists are specified
using the C<param.n> notation. Values of C<n> are integers starting
from 1. For example, a parameter list with two elements looks like
this:

C<&amp;Attribute.1=this>

C<&amp;Attribute.2=that>


=head2 DeleteQueue(QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::DeleteQueue>

Returns: nothing

  Deletes the queue specified by the B<queue URL>, regardless of whether
the queue is empty. If the specified queue doesn't exist, Amazon SQS
returns a successful response.

Use C<DeleteQueue> with care; once you delete your queue, any messages
in the queue are no longer available.

When you delete a queue, the deletion process takes up to 60 seconds.
Requests you send involving that queue during the 60 seconds might
succeed. For example, a SendMessage request might succeed, but after
the 60 seconds, the queue and that message you sent no longer exist.
Also, when you delete a queue, you must wait at least 60 seconds before
creating a queue with the same name.

We reserve the right to delete queues that have had no activity for
more than 30 days. For more information, see How Amazon SQS Queues Work
in the I<Amazon SQS Developer Guide>.


=head2 GetQueueAttributes(QueueUrl => Str, [AttributeNames => ArrayRef[Str|Undef]])

Each argument is described in detail in: L<Paws::SQS::GetQueueAttributes>

Returns: a L<Paws::SQS::GetQueueAttributesResult> instance

  Gets attributes for the specified queue.

Some API actions take lists of parameters. These lists are specified
using the C<param.n> notation. Values of C<n> are integers starting
from 1. For example, a parameter list with two elements looks like
this:

C<&amp;Attribute.1=this>

C<&amp;Attribute.2=that>


=head2 GetQueueUrl(QueueName => Str, [QueueOwnerAWSAccountId => Str])

Each argument is described in detail in: L<Paws::SQS::GetQueueUrl>

Returns: a L<Paws::SQS::GetQueueUrlResult> instance

  Returns the URL of an existing queue. This action provides a simple way
to retrieve the URL of an Amazon SQS queue.

To access a queue that belongs to another AWS account, use the
C<QueueOwnerAWSAccountId> parameter to specify the account ID of the
queue's owner. The queue's owner must grant you permission to access
the queue. For more information about shared queue access, see
AddPermission or see Shared Queues in the I<Amazon SQS Developer
Guide>.


=head2 ListDeadLetterSourceQueues(QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::ListDeadLetterSourceQueues>

Returns: a L<Paws::SQS::ListDeadLetterSourceQueuesResult> instance

  Returns a list of your queues that have the RedrivePolicy queue
attribute configured with a dead letter queue.

For more information about using dead letter queues, see Using Amazon
SQS Dead Letter Queues in the I<Amazon SQS Developer Guide>.


=head2 ListQueues([QueueNamePrefix => Str])

Each argument is described in detail in: L<Paws::SQS::ListQueues>

Returns: a L<Paws::SQS::ListQueuesResult> instance

  Returns a list of your queues. The maximum number of queues that can be
returned is 1000. If you specify a value for the optional
C<QueueNamePrefix> parameter, only queues with a name beginning with
the specified value are returned.


=head2 PurgeQueue(QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::PurgeQueue>

Returns: nothing

  Deletes the messages in a queue specified by the B<queue URL>.

When you use the C<PurgeQueue> API, the deleted messages in the queue
can't be retrieved.

When you purge a queue, the message deletion process takes up to 60
seconds. All messages sent to the queue before calling C<PurgeQueue>
will be deleted; messages sent to the queue while it is being purged
might be deleted. While the queue is being purged, messages sent to the
queue before C<PurgeQueue> was called might be received, but will be
deleted within the next minute.


=head2 ReceiveMessage(QueueUrl => Str, [AttributeNames => ArrayRef[Str|Undef], MaxNumberOfMessages => Int, MessageAttributeNames => ArrayRef[Str|Undef], ReceiveRequestAttemptId => Str, VisibilityTimeout => Int, WaitTimeSeconds => Int])

Each argument is described in detail in: L<Paws::SQS::ReceiveMessage>

Returns: a L<Paws::SQS::ReceiveMessageResult> instance

  Retrieves one or more messages, with a maximum limit of 10 messages,
from the specified queue. Long poll support is enabled by using the
C<WaitTimeSeconds> parameter. For more information, see Amazon SQS Long
Polling in the I<Amazon SQS Developer Guide>.

Short poll is the default behavior where a weighted random set of
machines is sampled on a C<ReceiveMessage> call. This means only the
messages on the sampled machines are returned. If the number of
messages in the queue is small (less than 1000), it is likely you will
get fewer messages than you requested per C<ReceiveMessage> call. If
the number of messages in the queue is extremely small, you might not
receive any messages in a particular C<ReceiveMessage> response; in
which case you should repeat the request.

For each message returned, the response includes the following:

=over

=item *

Message body

=item *

MD5 digest of the message body. For information about MD5, see RFC1321.

=item *

Message ID you received when you sent the message to the queue.

=item *

Receipt handle.

=item *

Message attributes.

=item *

MD5 digest of the message attributes.

=back

The receipt handle is the identifier you must provide when deleting the
message. For more information, see Queue and Message Identifiers in the
I<Amazon SQS Developer Guide>.

You can provide the C<VisibilityTimeout> parameter in your request,
which will be applied to the messages that Amazon SQS returns in the
response. If you don't include the parameter, the overall visibility
timeout for the queue is used for the returned messages. For more
information, see Visibility Timeout in the I<Amazon SQS Developer
Guide>.

A message that is not deleted or a message whose visibility is not
extended before the visibility timeout expires counts as a failed
receive. Depending on the configuration of the queue, the message might
be sent to the dead letter queue.

Going forward, new attributes might be added. If you are writing code
that calls this action, we recommend that you structure your code so
that it can handle new attributes gracefully.


=head2 RemovePermission(Label => Str, QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::RemovePermission>

Returns: nothing

  Revokes any permissions in the queue policy that matches the specified
C<Label> parameter. Only the owner of the queue can remove permissions.


=head2 SendMessage(MessageBody => Str, QueueUrl => Str, [DelaySeconds => Int, MessageAttributes => L<Paws::SQS::MessageBodyAttributeMap>, MessageDeduplicationId => Str, MessageGroupId => Str])

Each argument is described in detail in: L<Paws::SQS::SendMessage>

Returns: a L<Paws::SQS::SendMessageResult> instance

  Delivers a message to the specified queue.

The following list shows the characters (in Unicode) that are allowed
in your message, according to the W3C XML specification:

C<#x9> | C<#xA> | C<#xD> | [C<#x20> to C<#xD7FF>] | [C<#xE000> to
C<#xFFFD>] | [C<#x10000> to C<#x10FFFF>]

For more information, see RFC1321. If you send any characters that
aren't included in this list, your request will be rejected.


=head2 SendMessageBatch(Entries => ArrayRef[L<Paws::SQS::SendMessageBatchRequestEntry>], QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::SendMessageBatch>

Returns: a L<Paws::SQS::SendMessageBatchResult> instance

  Delivers up to ten messages to the specified queue. This is a batch
version of C< SendMessage >. For a FIFO queue, multiple messages within
a single batch are enqueued in the order they are sent.

The result of sending each message is reported individually in the
response. Because the batch request can result in a combination of
successful and unsuccessful actions, you should check for batch errors
even when the call returns an HTTP status code of 200.

The maximum allowed individual message size and the maximum total
payload size (the sum of the individual lengths of all of the batched
messages) are both 256 KB (262,144 bytes).

The following list shows the characters (in Unicode) that are allowed
in your message, according to the W3C XML specification:

C<#x9> | C<#xA> | C<#xD> | [C<#x20> to C<#xD7FF>] | [C<#xE000> to
C<#xFFFD>] | [C<#x10000> to C<#x10FFFF>]

For more information, see RFC1321. If you send any characters that
aren't included in this list, your request will be rejected.

If you don't specify the C<DelaySeconds> parameter for an entry, Amazon
SQS uses the default for the queue.

Some API actions take lists of parameters. These lists are specified
using the C<param.n> notation. Values of C<n> are integers starting
from 1. For example, a parameter list with two elements looks like
this:

C<&amp;Attribute.1=this>

C<&amp;Attribute.2=that>


=head2 SetQueueAttributes(Attributes => L<Paws::SQS::QueueAttributeMap>, QueueUrl => Str)

Each argument is described in detail in: L<Paws::SQS::SetQueueAttributes>

Returns: nothing

  Sets the value of one or more queue attributes. When you change a
queue's attributes, the change can take up to 60 seconds for most of
the attributes to propagate throughout the SQS system. Changes made to
the C<MessageRetentionPeriod> attribute can take up to 15 minutes.

In the future, new attributes might be added. When you write code that
calls this action, we recommend structuring your code so that it can
handle new attributes gracefully.




=head1 PAGINATORS

Paginator methods are helpers that repetively call methods that return partial results




=head1 SEE ALSO

This service class forms part of L<Paws>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

