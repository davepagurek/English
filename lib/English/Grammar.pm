use v6;
use English::Types;

use Grammar::Tracer;
grammar English::Grammar {
  token TOP { ^ <sentence> $ }

  proto token sentence {*}
  token sentence:sym<compound> {
    [ [ <independent-clause> ','? ]+ % <conj>] <end>?
  }

  token independent-clause {
    <NP> <.ws> <VP>
  }

  token NP {
    [<article> <.ws>]? [<ADJP> <.ws>]? [ <noun>+ % <.ws> ]
  }

  token VP {
    [[ [<ADVP> <.ws>]? <verb> ]+ % <.ws>] [<.ws> <NP>]?
  }

  token ADJP {
    [ [<ADVP> <.ws>]? <adj> ]+ % <.ws>
  }

  token ADVP {
    <adv>+ % <.ws>
  }

  token word { \w+ }
  
  token noun {
    <word> <?{(~$/).lc ~~ English::Types::Noun}>
  }
  token verb {
    <word> <?{(~$/).lc ~~ English::Types::Verb}>
  }
  token adv {
    <word> <?{(~$/).lc ~~ English::Types::Adv}>
  }
  token adj {
    <word> <?{(~$/).lc ~~ English::Types::Adj}>
  }
  token article {
    <word> <?{(~$/).lc ~~ English::Types::Article}>
  }
  token prep {
    <word> <?{(~$/).lc ~~ English::Types::Prep}>
  }

  token conj { :i
    'and' | 'or' | 'but' | 'nor' | 'so' | 'for' | 'yet'
  }

  token end {
    '.' | ';' | '!' | '?'
  }
}
