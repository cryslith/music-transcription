\version "2.14.2"
\language "english"

kidzukeba = \relative a' { <a d fs>8\arpeggio e'8~e4 fs8 <a, d>8~<a d>4 }
itsudemo = \relative a' { <a d fs>8\arpeggio e'8~e4 fs8 <b, d>8~ }
sobaniirukenedo = \relative a' { r8 a \repeat unfold 4 { <a d g> } <a d g>4
                                 <a d g>8 <a d fs> }
kiraisuki = \relative a' { <a d fs>8\arpeggio e'8~e fs~fs \grace fs <b, d g> }

melody = \new Voice = "melody" {
  \time 4/4
  \key d \major
  \relative d'' {
    \repeat unfold 2 {
      <a d g>4 <a d g> <a d g> fs'8 <a, d a'> |
      r4 \transpose a' a { \kidzukeba \itsudemo } <b, d>1 |
    }
    r4 fs'8 <a, d g>~<a d g>4 fs'8 <a, d a'>~<a d a'>4
    \kidzukeba \itsudemo <b'' d>2.
    \sobaniirukenedo
    \kidzukeba \kiraisuki
  }
}

verseZero = \lyricmode {
  KISS KISS FALL IN LOVE!
  \repeat unfold 8 { \skip1 }
  MAY -- BE YOU'RE MY LOVE!
  \repeat unfold 12 { \skip1 }
  kid -- zu -- ke -- ba   it -- su -- de -- mo
  so -- ba   ni   i -- ru   ke -- ne -- do
  HO -- N -- TO   wa   KI -- RAI    SU -- KI
}

chordnames = \new ChordNames {
  \chordmode {
    \repeat unfold 6 { a1 d a g }
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
