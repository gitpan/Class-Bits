# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 10;
BEGIN { use_ok('Class::Bits') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

package Foo;

use Class::Bits;
make_bits(foo=>1, bar=>4, dor=> 2);

package main;


my $obj=Foo->new();

is($obj->length, 10, 'length');

is($obj->dor, 0, 'init to 0');

is($obj->bar(3), 3, 'set to 3');

is($obj->bar, 3, 'get 3');

is($obj->bar(255), 15, 'set out of range');

is($$obj, "\xf0\x00", 'as string');

my $o2=Foo->new("\xf0\x01");

is($o2->dor, 1, "init from string");

my $o3=Foo->new(foo=>1, bar=>2, dor=>2);

is($o3->bar, 2, "init from array");

is($$o3, "\x21\x02", "as string 3");
