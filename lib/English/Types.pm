use v6;

unit module English::Types;

my $nouns = "{$?FILE.IO.dirname}/data/conv.data.noun".IO.lines.Set;
my $verbs = "{$?FILE.IO.dirname}/data/conv.data.verb".IO.lines.Set;
my $advs = "{$?FILE.IO.dirname}/data/conv.data.adv".IO.lines.Set;
my $adjs = "{$?FILE.IO.dirname}/data/conv.data.adj".IO.lines.Set;
my $articles = "{$?FILE.IO.dirname}/data/conv.data.article".IO.lines.Set;
my $preps = "{$?FILE.IO.dirname}/data/conv.data.prep".IO.lines.Set;

subset English::Types::Noun of Str where * (elem) $nouns;
subset English::Types::Verb of Str where * (elem) $verbs;
subset English::Types::Adv of Str where * (elem) $advs;
subset English::Types::Adj of Str where * (elem) $adjs;
subset English::Types::Article of Str where * (elem) $articles;
subset English::Types::Prep of Str where * (elem) $preps;
