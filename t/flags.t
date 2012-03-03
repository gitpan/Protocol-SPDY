use strict;
use warnings;

use Test::More tests => 9;
use Protocol::SPDY;

my $pkt = new_ok('Protocol::SPDY::Frame::Control');
{
	my $flags = $pkt->control_flags;
	is($pkt->control_flags(Protocol::SPDY::Frame::FLAG_COMPRESS), $pkt, 'sets flag and returns $self for chaining');
	ok($pkt->flag_compress, 'flag is set afterwards');
	ok($pkt->control_flags & Protocol::SPDY::Frame::FLAG_COMPRESS, 'flag mask matches');
	is($pkt->control_flags & ~Protocol::SPDY::Frame::FLAG_COMPRESS, $flags, 'other flags are untouched');
}
{
	my $flags = $pkt->control_flags;
	is($pkt->flag_fin(1), $pkt, 'sets flag and returns $self for chaining');
	ok($pkt->flag_fin, 'flag is set afterwards');
	ok($pkt->control_flags & Protocol::SPDY::Frame::FLAG_FIN, 'flag mask matches');
	is($pkt->control_flags & ~Protocol::SPDY::Frame::FLAG_FIN, $flags, 'other flags are untouched');
}