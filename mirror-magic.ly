\version "2.18.2"
\language "english"

\header {
  title = "Mirror Temple – Mirror Magic Mix"
  composer = "2 Mello"
}

harmonies = \chordmode {
  \tempo 4 = 98
  \set Score.markFormatter = #format-mark-box-alphabet
  \mark \default
  c\breve:m7 g:7- ef:/bf a:m7.5- af:maj7 g:m7 f:7 g:7
  % c\breve:m9 g:7.13- ef:maj7/bf a:m7.5- af:maj7 g:m7 f:7 g:7
  \repeat unfold 5 {
    \break
    \mark \default
    R1*16
  }
  \bar "|."
}
% harmonies = \chordmode { }

trumpetVerseA =
#(define-music-function (parser location breakNotes)
  (ly:music?)
  #{
  c16 bf c8 ef16 f8 g16~ |
  g2 r4 g16 c8 f,16~\turn
  f4 ef16 c8 bf16 c8 ef d16 bf8 g16~ |
  g2 r16

  #breakNotes

  r8. ef,16 |
  f8 ef16 f16~f ef16 g8~g bf,16 c ef g ef f~ |
  f2 r8 bf,16 c ef bf'8 f16~ |
  f2 bf8 af g16 ef8 c16~ |
  c16 bf8.~bf4 r4 \tuplet 3/2 { c8 ef f } |
  d8 bf16 ef d bf8. r8 c d16 c8 d16~ |
  d16 c8. r4 r8 c16 d ef c8 g'16~
  | g16 c,8. r4 r8 gf' f16 ef8 f16~ |
  f4 r2 r8. ef16 |
  f='8 ef16 f16~f ef16 g8~g16 f8.~f4 |
  #})

trumpetMusic = \relative c' {
  \key c \minor

  r1 |
  r2
  \trumpetVerseA {
    c16 ef8 g16 g8 g16 |
    gqf16 gqf8 gqf16 gf16 gf8 gf16 \acciaccatura gf8 g16 ef8 \acciaccatura gf8 g16 ef8 \acciaccatura gf8 g16 c16~ |
    c2.
  }

  R1*16*2

  d'=''2 c4 g |
  bf2 af4 ef |
  f16 g f8~f2.~ |
  f2 r2 |
  c'2 bf4 ef, |
  f2 g4 ef |
  a1~ |
  a2. r4 |
  af?2 b4 c |
  ef2 f4 g |
  d2.. c8 |
  b1 |
  c2 g4 f |
  ef d
  b cf |
  ef1 |
  d1 |

  c1~ |
  c4 r4
  \trumpetVerseA {
    c16 ef8 g8. c16~ |
    c8 ef16 f16~f ef8 d16~d bf8 g16~g8 bf16 c16~ |
    c2.
  }

  R1*16
}

lowBeat = \drummode {
  bd8. bd16 sn8 bd r bd sn8. bd16
}

ridePattern = \drummode {
  cymr8 cymr cymr r cymr cymr
}

drumMusic = \drummode {
  \repeat percent 15 { \repeat unfold 2 { hh8 hh hho hh } | }
  hh8 hh hho hh hh toml <sn tomh>16 <sn tomh> toml8 |

  \repeat percent 15 {
    <<
      { \repeat unfold 8 { hh8 } }
      \\
      { \lowBeat }
    >> |
  }
  <<
    { hh8 hh hh hh hh s4. }
    \\
    { bd8. bd16 sn8 bd r toml <sn tomh>16 <sn tomh> toml16 bd }
  >> |

  \repeat unfold 2 {
    % <<
    %   { cymc8 cymr \ridePattern |
    %     r8 hh \ridePattern |
    %     r8 hh \ridePattern |
    %     cymr8 hh \ridePattern |
    %   }
    %   \\
    %   { \repeat percent 4 { \lowBeat | } }
    % >> |

    \repeat percent 4 {
      <<
        {
          cymr8^"Crash" cymr \ridePattern |
          r8 hh \ridePattern |
          r8 hh \ridePattern |
          cymr8 hh \ridePattern |
        }
        \\
        { \repeat percent 4 { \lowBeat | } }
      >>
    }
  }


  \repeat percent 3 {
    <<
      {
        cymr8^"Crash" cymr \ridePattern |
        r8 hh \ridePattern |
        r8 hh \ridePattern |
        cymr8 hh \ridePattern |
      }
      \\
      { \repeat percent 4 { \lowBeat | } }
    >>
  }
  <<
    {
      cymr8 cymr \ridePattern |
      r8 hh \ridePattern |
      r8 hh \ridePattern |
      cymr8 hh cymr cymr cymr s4. |
    }
    \\
    { \repeat percent 3 { \lowBeat | }
      bd8. bd16 sn8 bd r toml <sn tomh>16 <sn tomh> toml8 }
  >> |

  cymc8 hh hho hh hh hh hho hh |
  \repeat percent 14 {
    \repeat unfold 2 { hh8 hh hho hh } |
  }
  r1 |
}

pianoRHMusic = \relative g'' {
  \key c \minor
  \repeat percent 2 { r8 g, d' ef bf' d, ef bf' | }
  \repeat percent 2 { r8 g, d' ef g d ef g | }
  \repeat percent 2 { r8 g, d' ef bf' d, ef bf' | }
  \repeat percent 4 {
    \repeat percent 2 { r8 g, d' ef g d ef g | }
  }
  r8 b, d ef g d ef g |
  r8 b,=' d4 <g, b>8. <g b> <b d>8 |
}
pianoLHMusic = \relative c' {
  \clef bass \key c \minor
  R1*16
}

bassMusic = \relative c, {
  \clef "bass_8" \key c \minor
  \repeat unfold 6 {
    c8. bf-. c8~c4 r16 g bf g |
    c8. bf-. c8~c4 r16 g bf f |
    g8. g-. g8~g4 r16 g bf f |
    g8. g-. g8~g8 g16 ef~ef4 |
    bf'8. bf-. bf8~bf4 r16 ef, g ef |
    bf'8. bf-. bf8~bf4 r16 ef, f ef |
    a8. g-. a8~a4 r16 ef f ef |
    a8. g-. a8~a4 r16 ef f ef |
    af8. af-. af8~af4 r16 ef f ef |
    af8. af-. af8~af4 r16 ef f ef |
    g8. g-. g8~g4 r16 ef f ef |
    g8. g-. g8~g4 r16 ef f ef |
    f8. f-. f8~f4 r16 ef f ef |
    f8. f-. f8~f4 r16 ef f ef |
    g8. g-. g8~g4 r16 ef f ef |
  }
  \alternative {
    { g=,,8. b-. d8~d4 r4 | }
    { r1 | }
  }
}


\score {
  <<
    \new ChordNames {
      \harmonies
    }
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = #"Trumpet"
        \trumpetMusic
      }
    >>
    \new PianoStaff <<
      \set PianoStaff.instrumentName = #"Piano"
      \new Staff { \pianoRHMusic }
      \new Staff { \pianoLHMusic }
    >>
    \new DrumStaff <<
      \set DrumStaff.instrumentName = #"Drumset"
      \drumMusic
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = #"Electric Bass"
        \bassMusic
      }
    >>
  >>
}
