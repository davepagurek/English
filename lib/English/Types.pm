use v6;

unit module English::Types;

our $nouns = "{$?FILE.IO.dirname}/data/conv.data.noun".IO.lines.map(*.lc).Set;
our $verbs = "{$?FILE.IO.dirname}/data/conv.data.verb".IO.lines.map(*.lc).Set;
our $adjs = "{$?FILE.IO.dirname}/data/conv.data.adj".IO.lines.map(*.lc).Set;
our $articles = "{$?FILE.IO.dirname}/data/conv.data.article".IO.slurp.lines.Set;
our $preps = "{$?FILE.IO.dirname}/data/conv.data.prep".IO.lines.map(*.lc).Set;
our $advs = "{$?FILE.IO.dirname}/data/conv.data.adv".IO.lines.Set (-) $preps;

subset English::Types::Noun of Str where *.lc (elem) $nouns;
subset English::Types::Verb of Str where *.lc (elem) $verbs;
subset English::Types::Adv of Str where *.lc (elem) $advs;
subset English::Types::Adj of Str where *.lc (elem) $adjs;
subset English::Types::Article of Str where *.lc (elem) $articles;
subset English::Types::Prep of Str where *.lc (elem) $preps;
