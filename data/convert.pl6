my $out = open "data/conv.data.adv", :w;
for "data/2of12id.txt".IO.lines -> $line {
  if $line ~~ /(\S+)" A: "(.+)/ {
    for ($0 ~ " " ~ $1).subst(/<-[\w\s]>/, "", :g).split(/\s+/) -> $word {
      $out.say($word);
    }
  }
  #$out.say
}
