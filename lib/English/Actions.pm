use v6;

role English::Piece {
  has Str $.text is required;
  method serialize { ... }
}

class English::Atom does English::Piece {
  method serialize { $.text; }
}

class English::Composite does English::Piece {
  has Pair @.components is required;
  method serialize {
    @.components.map: -> $k, $v {
      {
        $k => $v.serialize;
      };
    }
  }
}

class English::Actions {
  method TOP($/) {
    $/.make: English::Composite.new(
      text => ~$/,
      [sentence => $<sentence>.made]
    );
  }

  method sentence($/) {
    $/.make: English::Composite.new(
      text => ~$/,
      []
    )
  }
}
