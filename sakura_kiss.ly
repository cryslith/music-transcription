\version "2.14.2"
\language "english"

maybelove = \relative a' { \repeat unfold 3 { <a d g>4 } fs'8 <a, d a'> | }
kidzuke = \relative a' { <a=' d fs>8\arpeggio e'8~e4 fs8 }
kidzukeba = \relative a' { \kidzuke <a=' d>8~<a d>4 }
itsudemo = \relative a' { \kidzuke <b=' d>8~ | }
sobaniirukenedo = \relative a' { r8 a | \repeat unfold 4 { <a d g> } <a d g>4
                                 <a d g>8 <a d fs> | }
hontowa = \kidzukeba
kiraisu = \relative a' { <a d fs>8\arpeggio e'8~e fs~fs }
kiraisuki = \relative a' { \kiraisu \grace fs'=''8 <b,=' d g>~ | }
mousounano = \relative a' { <d fs>2 | <a d a'>8\arpeggio fs'~fs
                            <a, e'>~<a e'> <a d>~<a d>4 }
hosutodemo = \relative a' { \kiraisu fs'=''8 | <b,=' d g>2 }
sukininateku = \relative b' { \repeat unfold 3 { <b d fs>4 } <b d fs>8
                            <b d g>~<b d g> <b d a'>~<b d a'> <g=' b d>8~ | }
riyuuwaminna = \relative g' { \repeat unfold 3 { <g b d>4 } <g b d>8
                              <g b e>~<g b e> <g b fs'>~<g b fs'>
                              <g=' c e g=''>8~ | }
chigauyonekedo = \relative c'' { \repeat unfold 3 { <c e g>4 } <c e g>8
                                <c e a>~<c e a> <c e b'>~<c e b'>
                                <a=' cs e>8~ | }
aitaiima = \relative fs'' { \repeat unfold 2 { fs8 <a,=' d a'>~<a=' d a'>4 }
                            fs'=''8 <a,=' d a'=''> }
yasashiikimini = \relative fs'' { \repeat unfold 3
                                  { fs8 <b,=' d a'>~<b d a'>4 }
                                  <b d b'>8~<b d b'> | }
sakurakissu = \relative d'' { <d a'>4 <fs d'> <fs cs'> <d a'>~ | }
tokimeitara = \relative fs'' { fs4 g | <d a'> <fs d'> <fs cs'> <d a'> | }
harunokoiwa = \relative fs'' { fs4 g | <d a'> <fs d'> <fs cs'>
                               \grace a8 <d, g b>4~ | }
hanasakuotomeno = \relative a'' { a4 b8 <c, a'>8~<c a'> d~d4
                                  a'4 b8 <b, a'>8~<b a'> d~d2 }
bikagu = \relative d'' { d8 <d fs a d>~ }

melody = \new Voice = "melody" {
  \clef treble
  \key d \major
  \time 4/4
  \repeat unfold 2 {
    \maybelove |
    \skip1 \skip1 \skip1
  }
  \skip1
  \skip4 \kidzukeba \itsudemo \relative b' { <b d>2. }
  \sobaniirukenedo |
  r4 \kidzukeba \kiraisuki \relative b' { <b d fs>2 }
  \mousounano |
  r4 \kidzukeba \itsudemo \relative b' { <b d>2. }
  \sobaniirukenedo |
  r4 \kidzukeba \hosutodemo
  \mousounano |
  r2 \sukininateku \relative g' { <g b d>2 }
  \riyuuwaminna \relative g' { <g c e g=''>2 }
  \chigauyonekedo \relative a' { <a cs e>1 } |
  \maybelove |
  r4 \aitaiima \skip2 \skip4 \yasashiikimini |
  \sakurakissu \relative d'' { <d a'>2 }
  \tokimeitara | \maybelove |
  r4 \aitaiima \skip2 \skip4 \yasashiikimini |
  \sakurakissu \relative d'' { <d a'>2 }
  \harunokoiwa \relative d'' { <d g b>2 }
  \hanasakuotomeno
  \bikagu \relative d'' { <d fs a d>4 }
  \skip2. \skip1 \skip1
  \maybelove |
  \skip1 \skip1 \skip1
  \maybelove |
}

accompaniment = \new Voice = "accompaniment" {
  \clef treble
  \key d \major
  \time 4/4
  \repeat unfold 2 {
    \skip1 |
    r4 \transpose a' a { \kidzukeba \itsudemo } \relative b { <b d>1 } |
  }
  \relative fs' { r4 fs8 <a, d g>~<a d g>4 fs'8 <a, d a'>~<a d a'>4 }
}

verseZero = \lyricmode {
  KISS  KISS  FALL  IN  LOVE!
  MAY -- BE  YOU'RE  MY  LOVE!
  kid -- zu -- ke -- ba  it -- su -- de -- mo
  so -- ba  ni  i -- ru  ke -- ne -- do
  HO -- N -- TO  wa  KI -- RAI  SU -- KI
  mou -- so -- u  na  no

  ji -- bun _  no  ki -- mo -- chi  ga
  KU -- RI -- A  ni  mi -- e -- ta -- ra
  RE -- DII  de -- mo  HO -- SU -- TO  de -- mo
  ka -- ma -- wa -- nai  yo

  SU -- KI  ni  na _ -- te -- ku
  ri -- yu -- u  wa  mi -- n -- na
  chi -- ga -- u  yo  ne  KE -- DO
  MAY -- BE  YOU'RE  MY  LOVE!

  a -- i -- ta -- i  i -- ma
  ya -- sa -- shi -- i  ki -- mi  ni
  SA -- KU -- RA  KISSU
  TO -- KI -- ME -- I -- TA -- RA
  ran -- man  koi  shi -- yo

  mi -- ra -- i  yo -- ri  mo
  i -- ma  ga  ka -- n -- ji -- n
  u -- ru -- wa -- shi
  ha -- ru  no  ko -- i  wa

  ha -- na -- sa -- ku  o -- to -- me  no
  bikagu
}

chordnames = \new ChordNames {
  \chordmode {
    \skip1
    \repeat unfold 6 { d1 a g a }
    b\breve:m g c a
    d g b2.:m a4 a1 g a
    d\breve g b2.:m a4 a1 g\breve
    c1 g
    \repeat unfold 2 { d1 a g a }
  }
}

\score {
  <<
    \chordnames
    \new Staff <<
      \melody
      \accompaniment
    >>
    \new Lyrics \lyricsto "melody" {
      \verseZero
    }
  >>
}
