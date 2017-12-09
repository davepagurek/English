use v6;

unit module English::Part;

our $nouns = "%?RESOURCES<noun>".IO.lines.Set;
our $verbs = "%?RESOURCES<verb>".IO.lines.map(*.lc).Set;
our $adjs = "%?RESOURCES<adj>".IO.lines.map(*.lc).Set;
our $articles = "%?RESOURCES<article>".IO.slurp.lines.Set;
our $preps = "%?RESOURCES<prep>".IO.lines.map(*.lc).Set;
our $advs = "%?RESOURCES<adv>".IO.lines.Set (-) $preps;
our $conjs = "%?RESOURCES<conj>".IO.lines.Set (-) $preps;

subset English::Part::Noun of Str where {$_ (elem) $nouns || $_.lc (elem) $nouns};
subset English::Part::Verb of Str where *.lc (elem) $verbs;
subset English::Part::Adv of Str where *.lc (elem) $advs;
subset English::Part::Adj of Str where *.lc (elem) $adjs;
subset English::Part::Article of Str where *.lc (elem) $articles;
subset English::Part::Prep of Str where *.lc (elem) $preps;
subset English::Part::Conj of Str where *.lc (elem) $conjs;
