use v6;

unit module English;

say "starting";
constant $nouns = "{$?FILE.IO.dirname}/data/conv.data.noun".IO.lines.Set;
constant $verbs = "{$?FILE.IO.dirname}/data/conv.data.verb".IO.lines.Set;
constant $advs = "{$?FILE.IO.dirname}/data/conv.data.adv".IO.lines.Set;
say "got here";
#constant $adjs = "{$?FILE.IO.dirname}/data/conv.data.adj".IO.lines.Set;
#constant $articles = "{$?FILE.IO.dirname}/data/conv.data.article".IO.lines.Set;
#constant $preps = "{$?FILE.IO.dirname}/data/conv.data.prep".IO.lines.Set;

subset English::Noun of Str where * (elem) $nouns;
subset English::Verb of Str where * (elem) $verbs;
subset English::Adv of Str where * (elem) $advs;
#subset English::Adj of Str where * (elem) $adjs;
#subset English::Article of Str where * (elem) $articles;
#subset English::Prep of Str where * (elem) $preps;

my token word {
  \w+
}

my token noun {
  <word> <?{~$/ ~~ English::Noun}>
}

my $sentence = "The quick brown fox jumped over the lazy dog";
$sentence.say;
$sentence.split(" ").map(-> $w {
  ?($w ~~ /^<noun>/)
}).say;
