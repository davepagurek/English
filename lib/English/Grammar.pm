use v6;
use English::Part;

#use Grammar::Tracer;
grammar English::Grammar {
  token TOP { ^ <sentence> $ }

  proto regex sentence {*}
  regex sentence:sym<compound> {
    #<independent-clause:sym<incomplete>>* <independent-clause:sym<complete> <end>?
    [ [ <independent-clause> ','? ]+ % <conj>] <end>?
  }

  #regex independent-clause:sym<incomplete> {
    #<NP> <.ws> <VP> <conj>
  #}

  regex independent-clause {
    <NP> <.ws> <VP>
  }

  regex NP {
    [<article> <.ws>]? [<ADJP> <.ws>]? <noun>
  }

  #regex VP:sym<intransitive> {
    #[$<pre>=<ADVP> <.ws>]? [<VP:sym<intransitive>> | <verb>] [<.ws> $<post>=<ADVP>]? [<.ws> <PP>]?
  #}

  #regex VP:sym<transitive> {
    #[$<pre>=<ADVP> <.ws>]? <VP:sym<intransitive>> [<.ws> $<post>=<ADVP>]? <.ws> <NP> [<.ws> <PP>]?
  #}
  regex VP {
    [[ [$<pre>=<ADVP> <.ws>]? <verb> [<.ws> $<post>=<ADVP>]?]+ % <.ws>] [<.ws> <NP>]? [<.ws> <ADVP>]? [<.ws> <PP> [<.ws> <ADVP>]?]*
  }

  regex ADJP {
    [ [<ADVP> <.ws>]? <adj> ]+ % <.ws>
  }

  regex ADVP {
    <adv>+ % <.ws>
  }

  regex PP {
    <prep> <.ws> <NP>
  }

  token word { \w+ }
  
  token noun {
    <word> <?{(~$/).lc ~~ English::Part::Noun}>
  }
  token verb {
    <word> <?{
      my $w = (~$/).lc;
      $w ~~ English::Part::Verb
      || ($w.chars > 2 && $w.substr(*-2) eq "ed" && $w.substr(0, *-2) ~~ English::Part::Verb)
      || ($w.chars > 3 && $w.substr(*-3) eq "s" && $w.substr(0, *-1) ~~ English::Part::Verb)
    }>
  }
  token adv {
    <word> <?{(~$/).lc ~~ English::Part::Adv}>
  }
  token adj {
    <word> <?{(~$/).lc ~~ English::Part::Adj}>
  }
  token article {
    <word> <?{(~$/).lc ~~ English::Part::Article}>
  }
  token prep {
    <word> <?{(~$/).lc ~~ English::Part::Prep}>
  }

  token conj { :i
    'and' | 'or' | 'but' | 'nor' | 'so' | 'for' | 'yet'
  }

  token end {
    '.' | ';' | '!' | '?'
  }
}
