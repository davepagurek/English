use v6;
use English::Types;

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
    [<article> <.ws>]? [<ADJP> <.ws>]? [ <noun>+ % <.ws> ]
  }

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
