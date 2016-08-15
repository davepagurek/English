use v6;
use English::Part;

#use Grammar::Tracer;
grammar English::Grammar {
  token TOP { ^ <sentence> $ }

  proto regex sentence {*}
  regex sentence:sym<compound> {
    [ [ <independent-clause> ','? ]+ % <conj>] <end>?
  }

  regex independent-clause {
    <NP> <.ws> <VP>
  }

  regex NP {
    [<article> <.ws>]? [<ADJP> <.ws>]? <noun>
  }

  regex VP {
    [[ [<ADVP> <.ws>]? <verb> [<.ws> <ADVP>]?]+ % <.ws>] [<.ws> <NP>]? [<.ws> <ADVP>]? [<.ws> <PP> [<.ws> <ADVP>]?]*
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

  regex word { \w+ }
  
  token noun {
    <word> <?{
      my $w = ~$/;
      $w ~~ English::Part::Noun
      || ($w.chars > 1 && $w.substr(*-1) eq "s" && $w.substr(0, *-1) ~~ English::Part::Noun)
    }>
  }
  token verb {
    <word> <?{
      my $w = ~$/;
      $w ~~ English::Part::Verb
      || ($w.chars > 2 && $w.substr(*-2) eq "ed" && $w.substr(0, *-2) ~~ English::Part::Verb)
      || ($w.chars > 1 && $w.substr(*-1) eq "s" && $w.substr(0, *-1) ~~ English::Part::Verb)
    }>
  }
  token adv {
    <word> <?{~$/ ~~ English::Part::Adv}>
  }
  token adj {
    <word> <?{~$/ ~~ English::Part::Adj}>
  }
  token article {
    <word> <?{~$/ ~~ English::Part::Article}>
  }
  token prep {
    <word> <?{~$/ ~~ English::Part::Prep}>
  }

  token conj { :i
    'and' | 'or' | 'but' | 'nor' | 'so' | 'for' | 'yet'
  }

  token end {
    '.' | ';' | '!' | '?'
  }
}
