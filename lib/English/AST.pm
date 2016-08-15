use v6;

class English::AST {
  has Pair @.children;
  has Int $.from;
  has Int $.to;

  method to-hash returns Hash {
    {
      from => $!from,
      to => $!to,
      children => @!children.map(-> $p {
        { $p.key => $p.value.to-hash };
      })
    };
  }

  method from-match(Match $match) returns English::AST {
    English::AST.new(
      from => $match.from,
      to => $match.to,
      children => $match.caps.map(-> $p {
        $p.key => English::AST.from-match($p.value)
      })
    );
  }
}
