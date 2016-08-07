use v6;

unit module English::Part;

our $nouns = "{$?FILE.IO.dirname}/data/noun".IO.lines.map(*.lc).Set;
our $verbs = "{$?FILE.IO.dirname}/data/verb".IO.lines.map(*.lc).Set;
our $adjs = "{$?FILE.IO.dirname}/data/adj".IO.lines.map(*.lc).Set;
our $articles = "{$?FILE.IO.dirname}/data/article".IO.slurp.lines.Set;
our $preps = "{$?FILE.IO.dirname}/data/prep".IO.lines.map(*.lc).Set;
our $advs = "{$?FILE.IO.dirname}/data/adv".IO.lines.Set (-) $preps;
our $conjs = "{$?FILE.IO.dirname}/data/conj".IO.lines.Set (-) $preps;

subset English::Part::Noun of Str where *.lc (elem) $nouns;
subset English::Part::Verb of Str where *.lc (elem) $verbs;
subset English::Part::Adv of Str where *.lc (elem) $advs;
subset English::Part::Adj of Str where *.lc (elem) $adjs;
subset English::Part::Article of Str where *.lc (elem) $articles;
subset English::Part::Prep of Str where *.lc (elem) $preps;
subset English::Part::Conj of Str where *.lc (elem) $conjs;
