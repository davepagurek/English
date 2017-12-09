my %types = 
  "noun" => /'N'/,
  "verb" => /['V'|'t'|'i']/,
  "verb_t" => /'t'/,
  "verb_i" => /'i'/,
  "adj" => /'A'/,
  "adv" => /'v'/,
  "conj" => /'C'/,
  "prep" => /'P'/,
  "inter" => /'!'/,
  "pro" => /'r'/,
  "article" => /['D'|'I']/
;

my %files;
for %types.kv -> $k, $v {
  %files{$k} = open("$k", :w);
}

my $i = 0;
#my $out = open "data/conv.data.adv", :w;
for "words-clean".IO.lines -> $line {
  $i += 1;
  say $i if $i % 1000 == 0;
  if ~$line ~~ /^ $<word>=[ <-[#]>* ] '#' $<t>=[.*] $/ {
    for %types.kv -> $k, $v {
      if $<t> ~~ $v {
        %files{$k}.say(~$<word>);
      }
    }
  } else {
    say "Nope: $line";
  }
}
