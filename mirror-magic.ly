\version "2.18.2"
\language "english"

\header {
  title = "Mirror Temple – Mirror Magic Mix"
  composer = "2 Mello"
}

harmonies = \chordmode { c\breve:m7 g:7 ef:/bf a:m7.5- af:maj7 g:m7 f:7 g:7 }

saxophoneMusic = \relative c' {
  \key c \minor
  r1 |
  r2 c16 bf c8 ef16 f8 g16~ |
  g2. g16 c8 f,16~
  f4\turn ef16 c8 bf16 c8 ef d16 bf8 g16~ |
  g2~g16 c ef8 g16 g8 g16 |
  gqf16 gqf8 gqf16 gf16 gf8 gf16 \acciaccatura gf8 g16 ef8 \acciaccatura gf8 g16 ef8 \acciaccatura gf8 g16 c16~ |
  c2.~c8. ef,16 |
  f8 ef16 f16~f e16 g8~g bf,16 c ef g ef f~ |
  f1 |
  \repeat percent 7 { r1 }
}

drumMusic = \drummode { \repeat percent 16 { r1 } }

pianoRHMusic = \relative g' {
  \key c \minor
  \repeat percent 2 { r8 g, d' ef bf' d, ef bf' | }
  \repeat percent 2 { r8 g, d' ef g d ef g | }
  \repeat percent 2 { r8 g, d' ef bf' d, ef bf' | }
  \repeat percent 4 {
    \repeat percent 2 { r8 g, d' ef g d ef g | }
  }
  r8 b, d ef g d ef g |
  r8 b, d4 <g, b>8. <g b> <b d>8 |
}
pianoLHMusic = \relative c { \clef bass \key c \minor \repeat percent 16 { r1 } }

bassMusic = \relative c, {
  \clef "bass_8" \key c \minor
  c8. bf c8~c4~c16 g bf g |
  c8. bf c8~c4~c16 f, bf f |
  g=,,8. g g8~g4~g16 f bf f |
  g8. g g8~g8 g16 ef~ef4 |
  bf'=,,8. bf bf8 r2 |
  \repeat percent 11 { r1 }
}


\score {
  <<
    \new ChordNames {
      \harmonies
    }
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = #"Saxophone"
        \saxophoneMusic
      }
    >>
    \new DrumStaff <<
      \set DrumStaff.instrumentName = #"Drumset"
      \drumMusic
    >>
    \new PianoStaff <<
      \set PianoStaff.instrumentName = #"Piano"
      \new Staff { \pianoRHMusic }
      \new Staff { \pianoLHMusic }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = #"Electric Bass"
        \bassMusic
      }
    >>
  >>
}
