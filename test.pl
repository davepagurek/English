#!/usr/bin/env perl6
use v6;

use lib "lib";
use English;

say English::Grammar.parse: "The quick brown fox jumped over the lazy dog.";
#say English::Grammar.parse: "I saw the man with the binoculars.";
#say English::Grammar.parse: "The big group sings terribly";

