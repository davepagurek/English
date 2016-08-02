use v6;

use Test;
plan *;

use lib "lib";
use English::Grammar;

subtest {
  my @sentences = [
    "I am.",
    "The quick brown fox jumped over the lazy dog.",
    "He went to the store.",
    "He went to the store today.",
    "The dog is brown.",
    "I always run.",
    "I run always.",
  ];
  for @sentences -> $sentence {
    ok(English::Grammar.parse($sentence), $sentence);
  }
}, "Matches valid sentences";

#subtest {
  #my @sentences = [
    #"I already",
    #"The quick brown fox",
    #"Went to the the already store.",
  #];
  #for @sentences -> $sentence {
    #nok(English::Grammar.parse($sentence), $sentence);
  #}
#}, "Doesn't match invalid sentences";
