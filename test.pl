#!/usr/bin/env perl6
use v6;

use lib "lib";
use English;
use JSON::Tiny;

my $match = English::Grammar.parse("This is fun.");
say $match;
#say English::Grammar.parse: "I saw the man with the binoculars.";
#say English::Grammar.parse: "The big group sings terribly";
