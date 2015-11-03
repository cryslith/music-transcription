\version "2.18.2"
\language "english"

\header {
  title = "Hacking to the Gate"
  composer = "Kanako Ito"
}

intro = \relative d' { << { \voiceOne | d1 | df | c | cf | }
                          \new Voice
                          { \voiceTwo
                            | \skip4 f8 a4 f4. |
                            | \skip4 f8 a4 f4. |
                            | \skip4 r8 r4 r4. |  % TODO
                            | \skip4 r8 r4 r4. |  % TODO
                          }
                        >>
                       \oneVoice
                       | d2 e f g a bf cs e |
                     }

\score {
  \new Staff <<
    {
      \clef treble
      \key a \minor
      \time 4/4
      \intro
    }
  >>
}
