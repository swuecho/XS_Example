use strict;
use warnings;

use Test::More tests => 13;
BEGIN { use_ok('Example') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
is(treble(1), 3);
is(treble(2), 6);
is(add_numbers(2,4),6);
is(treble_then_add(2,4),18);
is(add_numbers_perl(2,4),6);
is_deeply(return_1_bar, [1,'bar']);
is_deeply(get_third_element_from_arrayref([1, 2, 3]), 3, 'get third elements');
my $aref = [12,3];
is( aref([12,3]) , 1, "[12,3] is an arrrayref");
is(aref($aref), 1, "aref is an arrrayref");
ok(!aref(12),  "12 is not an arrrayref");
ok(!aref({1..4}), "hashref is an arrrayref");
ok(href({1..4}), "hashref is a hash ref");
