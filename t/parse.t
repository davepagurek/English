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
  done-testing;
}, "Matches valid simple sentences";

subtest {
  my @sentences = [
    "I run and I walk."
  ];
  for @sentences -> $sentence {
    ok(English::Grammar.parse($sentence), $sentence);
  }
  done-testing;
}, "Matches valid compound sentences";

subtest {
  my @sentences = [
    "I already.",
    "The fox.",
    "Went to the the already store.",
    "Dog.",
  ];
  for @sentences -> $sentence {
    nok(English::Grammar.parse($sentence), $sentence);
  }
  done-testing;
}, "Doesn't match invalid sentences";

done-testing;
