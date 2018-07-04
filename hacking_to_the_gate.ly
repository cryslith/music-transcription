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

suujuuokumono = \relative a' { | a4 f8 f4 d4 | e4 f8 g4. }
kodounokazusae = \relative d' { d8 d | e4 c8 g'4 c,8 e4 | d2 }
anataniwa = \relative d' { d4 f | g a8 g4. }
matatakiteidono = \relative g' { g8 g a4 }  % TODO

\score {
  \new Staff <<
    {
      \clef treble
      \key a \minor
      \time 4/4
      \intro
      \suujuuokumono \kodounokazusae
      \anataniwa \matatakiteidono
    }
  >>
}
