use v6;

unit module English;

use English::Types;

my token word {
  \w+
}

my token noun {
  <word> <?{~$/ ~~ English::Types::Noun}>
}

my $sentence = "The quick brown fox jumped over the lazy dog";
$sentence.say;
$sentence.split(" ").map(-> $w {
  ?($w ~~ /^<noun>/)
}).say;
