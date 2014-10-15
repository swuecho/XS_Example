use strict;
use warnings;

use Test::More tests => 7;
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
is_deeply(return_1_bar, [1,'bar']);
