# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Example.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 6;
BEGIN { use_ok('Example') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
is(treble(1), 3);
print_hello();
is(treble(2), 6);
is(add_numbers(2,4),6);
is(treble_then_add(2,4),18);
is(add_numbers_perl(2,4),6);
is( get_version(), '6.0.0', 'chromaprint version is 6.0.0' );
