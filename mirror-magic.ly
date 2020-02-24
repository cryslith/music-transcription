\version "2.18.2"
\language "english"

\header {
  title = "Mirror Temple – Mirror Magic Mix"
  composer = "2 Mello"
}

harmonies = \chordmode { c\breve:m7 g:7- ef:/bf a:m7.5- af:maj7 g:m7 f:7 g:7 }
% harmonies = \chordmode { c\breve:m9 g:7.13- ef:maj7/bf a:m7.5- af:maj7 g:m7 f:7 g:7 }

saxophoneMusic = \relative c' {
  \key c \minor
  r1 |
  r2 c16 bf c8 ef16 f8 g16~ |
  g2 r4 g16 c8 f,16~\turn
  f4 ef16 c8 bf16 c8 ef d16 bf8 g16~ |
  g2 r16 c ef8 g16 g8 g16 |
  gqf16 gqf8 gqf16 gf16 gf8 gf16 \acciaccatura gf8 g16 ef8 \acciaccatura gf8 g16 ef8 \acciaccatura gf8 g16 c16~ |
  c2. r8. ef,16 |
  f8 ef16 f16~f ef16 g8~g bf,16 c ef g ef f~ |
  f2 r8 bf,16 c ef bf'8 f16~ |
  f2 bf8 af g16 ef8 c16~ |
  c16 bf8.~bf4 r4 \tuplet 3/2 { c8 ef f } |
  d8 bf16 ef d bf8. r8 c d16 c8 d16~ |
  d16 c8. r4 r8 c16 d ef c8 g'16~
  | g16 c,8. r4 r8 gf' f16 ef8 f16~ |
  f4 r2 r8. ef16 |
  f8 ef16 f16~f ef16 g8~g16 f8.~f4 |
}

drumMusic = \drummode { R1*16 }

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
pianoLHMusic = \relative c { \clef bass \key c \minor R1*16 }

bassMusic = \relative c, {
  \clef "bass_8" \key c \minor
  c8. bf c8~c4~c16 g bf g |
  c8. bf c8~c4~c16 f, bf f |
  g=,,8. g g8~g4~g16 f bf f |
  g8. g g8~g8 g16 ef~ef4 |
  bf'=,,8. bf bf8 r2 |
  R1*11
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
    % \new DrumStaff <<
    %   \set DrumStaff.instrumentName = #"Drumset"
    %   \drumMusic
    % >>
    % \new PianoStaff <<
    %   \set PianoStaff.instrumentName = #"Piano"
    %   \new Staff { \pianoRHMusic }
    %   \new Staff { \pianoLHMusic }
    % >>
    % \new StaffGroup <<
    %   \new Staff {
    %     \set Staff.instrumentName = #"Electric Bass"
    %     \bassMusic
    %   }
    % >>
  >>
}
