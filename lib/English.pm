use v6;

unit module English;

use English::Grammar;
use English::Types;

say "2";
say "the" ~~ English::Types::Article;
say English::Grammar.parse: "The quick brown fox jumped";
