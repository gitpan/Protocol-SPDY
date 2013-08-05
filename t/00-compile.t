use strict;
use warnings;

# This test was generated via Dist::Zilla::Plugin::Test::Compile 2.018

use Test::More 0.88;



use Capture::Tiny qw{ capture };

my @module_files = qw(
Protocol/SPDY.pm
Protocol/SPDY/Base.pm
Protocol/SPDY/Client.pm
Protocol/SPDY/Compress.pm
Protocol/SPDY/Constants.pm
Protocol/SPDY/Frame.pm
Protocol/SPDY/Frame/Control.pm
Protocol/SPDY/Frame/Control/CREDENTIAL.pm
Protocol/SPDY/Frame/Control/GOAWAY.pm
Protocol/SPDY/Frame/Control/HEADERS.pm
Protocol/SPDY/Frame/Control/PING.pm
Protocol/SPDY/Frame/Control/RST_STREAM.pm
Protocol/SPDY/Frame/Control/SETTINGS.pm
Protocol/SPDY/Frame/Control/SYN_REPLY.pm
Protocol/SPDY/Frame/Control/SYN_STREAM.pm
Protocol/SPDY/Frame/Control/WINDOW_UPDATE.pm
Protocol/SPDY/Frame/Data.pm
Protocol/SPDY/Frame/HeaderSupport.pm
Protocol/SPDY/Proxy.pm
Protocol/SPDY/Server.pm
Protocol/SPDY/Stream.pm
Protocol/SPDY/Test.pm
Protocol/SPDY/Tracer.pm
);

my @scripts = qw(

);

# no fake home requested

my @warnings;
for my $lib (@module_files)
{
    my ($stdout, $stderr, $exit) = capture {
        system($^X, '-Mblib', '-e', qq{require q[$lib]});
    };
    is($?, 0, "$lib loaded ok");
    warn $stderr if $stderr;
    push @warnings, $stderr if $stderr;
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};



done_testing;
