#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Digest::Mock::Size' ) || print "Bail out!\n";
}

diag( "Testing Digest::Mock::Size $Digest::Mock::Size::VERSION, Perl $], $^X" );
