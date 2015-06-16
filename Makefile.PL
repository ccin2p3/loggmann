use strict;
use warnings;
use inc::Module::Install;

# META
name     'Golger';
author   'Fabien Wernli <wernli at in2p3.fr>';
license  'perl';
all_from 'lib/Golger.pm';
abstract_from 'script/golger';

# REQUIRES
requires 'AnyEvent::WebSocket::Client' => 0;
requires 'JSON::Any' => 0;
requires 'Getopt::Long::Descriptive' => 0;
requires 'URI::Escape' => 0;
recommends 'Config::Any' => 0;

# CLI
install_script $_ for qw/golger/;

makemaker_args(
	PREREQ_FATAL => 1,
	dist => { PREOP => 'pod2markdown script/golger > README.md' },
);

WriteAll;
