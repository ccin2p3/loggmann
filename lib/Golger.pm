package Golger;

use strict;
use warnings;
use 5.008002;

use AnyEvent::WebSocket::Client;
use JSON::Any;

our $VERSION = '0.1';

sub connect {
	my $connect_info = shift;
	my $client = AnyEvent::WebSocket::Client -> new();
	$client -> connect($connect_info)
        -> cb(
					sub {
						our $connection = eval { shift -> recv };
						if ($@) {
							warn $@;
							return
						}
						$connection->on(each_message => sub {
								my($connection, $message) = @_;
								if ($message -> isa('AnyEvent::WebSocket::Message')) {
									if (exists $message -> {body}) {
										my $omsg = JSON::Any -> jsonToObj ($message -> {body});
										my @fm = @{$omsg}{ qw/time host service description/ };
										print join " ", map {defined ($_) ? $_ : "N/A" } @fm, "\n";
									} else {
										warn "oh noes! message has no body";
										return
									}
								} else {
									warn "message is garbled";
									return
								}
							}
						);
					}
				);
	AnyEvent->condvar->recv;
}

1;

