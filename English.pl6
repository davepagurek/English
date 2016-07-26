constant $nouns = "data/conv.data.noun".IO.lines.Set;
constant $verbs = "data/conv.data.verb.broken".IO.lines.Set;
constant $adv = "data/conv.data.adv".IO.lines.Set;

subset Noun of Str where * (elem) $nouns;
subset Verb of Str where * (elem) $verbs;
subset Adv of Str where * (elem) $adv;

my token word {
  \w+
}

my token noun {
  <word> { say "$/: {~$/ ~~ Noun}" } <?{~$/ ~~ Noun}>
}

my $sentence = "The quick brown fox jumped over the lazy dog";
$sentence.say;
$sentence.split(" ").map(-> $w {
  ?($w ~~ /^<noun>/)
}).say;
