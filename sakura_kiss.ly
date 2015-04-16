\version "2.14.2"
\language "english"

kidzuke = \relative a' { <a d fs>8\arpeggio e'8~e4 fs8 }
kidzukeba = \relative a' { \kidzuke <a=' d>8~<a d>4 }
itsudemo = \relative a' { \kidzuke <b=' d>8~ }
sobaniirukenedo = \relative a' { r8 a | \repeat unfold 4 { <a d g> } <a d g>4
                                 <a d g>8 <a d fs> | }
kiraisu = \relative a' { <a d fs>8\arpeggio e'8~e fs~fs }
kiraisuki = \relative a' { \kiraisu \grace fs=' <b=' d g>~ }
mousounano = \relative a' { <d fs>2 | <a d a'>8\arpeggio fs'~fs
                            <a, e'>~<a e'> <a d>~<a d>4 }
hosutodemo = \relative a' { \kiraisu fs'=''8 | <b,=' d g>2 }

melody = \new Voice = "melody" {
  \time 4/4
  \key d \major
  \relative d'' {
    \repeat unfold 2 {
      <a d g>4 <a d g> <a d g> fs'8 <a, d a'> |
      r4 \transpose a' a { \kidzukeba \itsudemo } <b, d>1 |
    }
    r4 fs'8 <a, d g>~<a d g>4 fs'8 <a, d a'>~<a d a'>4
    \kidzukeba \itsudemo <b' d>2.
    \sobaniirukenedo |
    r4 \kidzukeba \kiraisuki <b d fs>2
    \mousounano |
    r4 \kidzukeba \kiraisuki <b d fs>2.
    \sobaniirukenedo |
    r4 \kidzukeba \hosutodemo
    \mousounano |
  }
}

verseZero = \lyricmode {
  KISS KISS FALL IN LOVE!
  \repeat unfold 8 { \skip1 }
  MAY -- BE YOU'RE MY LOVE!
  \repeat unfold 12 { \skip1 }
  kid -- zu -- ke -- ba  it -- su -- de -- mo
  so -- ba  ni  i -- ru  ke -- ne -- do
  HO -- N -- TO  wa  KI -- RAI  SU -- KI
  mou -- so -- u  na  no
  ji -- bun _  no  ki -- mo -- chi  ga
  KU -- RI -- A  ni  mi -- e -- ta -- ra
  RE -- DII  de -- moo  HO -- SU -- TO  de -- mo
  ka -- ma -- wa -- nai  yo
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
    \melody
    \new Lyrics \lyricsto "melody" {
      \verseZero
    }
  >>
}
