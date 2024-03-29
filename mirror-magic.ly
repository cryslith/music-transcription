\version "2.18.2"
\language "english"

\header {
  title = "Mirror Temple – Mirror Magic Mix"
  composer = "2 Mello"
}

\paper {
  left-margin = 2\cm
}

harmonies = \chordmode {
  \tempo 4 = 98
  \set Score.markFormatter = #format-mark-box-alphabet
  \mark \default
  c\breve:m7 g:7 ef:/bf a:m7.5- af:maj7 g:m f:9 g:7
  \repeat unfold 5 {
    \break
    \mark \default
    R1*16
  }
  \bar "|."
}

trumpetVerseA =
#(define-music-function (parser location breakNotes)
  (ly:music?)
  #{
  c16 bf c8 ef16 f8 g16~ |
  g2 r4 g16 c8 f,16 |
  \tuplet 3/2 { gf f ef } f8 ef16 c8 bf16 c8 ef d16 bf8 g16~ |
  g2 r16

  #breakNotes

  r8. ef,16 |
  f8 ef16 f16~f ef16 g8~g bf,16 c ef g ef f~ |
  f2 r8 bf,16 c ef bf'8 f16~ |
  f2 bf8 af g16 ef8 \acciaccatura b8 c16~ |
  c16 bf8.~bf4 r4 \tuplet 3/2 { c8 ef f } |
  d8 bf16 ef d bf8. r8 c d16 c8 d16~ |
  d16 c8. r4 r8 c16 df d c8 g'16~
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
  b c |
  ef1 |
  d1 |

  c1~ |
  c4 r4
  \trumpetVerseA {
    c16 ef8 g8. c16~ |
    c8 ef16 f16~f ef8 d16~d bf8 g16~g8 bf16 c16~ |
    c2.
  }
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
    { hh8 hh hh hh hh r4. }
    \\
    { bd8. bd16 sn8 bd r toml <sn tomh>16 <sn tomh> toml16 bd }
  >> |

  \repeat unfold 2 {
    <<
      {
        cymc8 cymr \ridePattern |
        r8 hh \ridePattern |
        r8 hh \ridePattern |
        cymr8 hh \ridePattern |
        \repeat unfold 3 {
          cymr8 cymr \ridePattern |
          r8 hh \ridePattern |
          r8 hh \ridePattern |
          cymr8 hh \ridePattern |
        }
      }
      \\
      { \repeat percent 16 { \lowBeat | } }
    >>
  }

  <<
    {
      cymc8 cymr \ridePattern |
      r8 hh \ridePattern |
      r8 hh \ridePattern |
      cymr8 hh \ridePattern |
      \repeat unfold 3 {
        cymr8 cymr \ridePattern |
        r8 hh \ridePattern |
        r8 hh \ridePattern |
      }
      \alternative {
        { cymr8 hh \ridePattern | }
        { cymr8 hh cymr cymr cymr r4. | }
      }
    }
    \\
    {
      \repeat percent 15 { \lowBeat | }
      bd8. bd16 sn8 bd r toml <sn tomh>16 <sn tomh> toml8 |
    }
  >>

  cymc8 hh hho hh hh hh hho hh |
  \repeat percent 14 {
    \repeat unfold 2 { hh8 hh hho hh } |
  }
  r1 |
}

pianoRHMusic = \relative g'' {
  \key c \minor
  \repeat unfold 4 {
    \repeat percent 2 { r8 g, d' ef bf' d, ef bf' | }
    \repeat percent 2 { r8 g, d' ef g d ef g | }
    \repeat percent 2 { r8 g, d' ef bf' d, ef bf' | }
    \repeat percent 4 {
      \repeat percent 2 { r8 g, d' ef g d ef g | }
    }
  }
  \alternative {
    {
      r8 b,=' d ef g d ef g |
      r8 b,=' d4 <g, b>8. <g b> <b d>8 |
    }
    { \repeat percent 2 { r8 b=' d ef g d ef g | } }
    { \repeat percent 2 { r8 b,=' d ef g d ef g | } }
    { \repeat percent 2 { r8 b,=' d ef g d ef g | } }
  }
}
pianoLHMusic = \relative c {
  \clef bass \key c \minor
  \repeat unfold 4 {
    <c c'>1 | c |
    <b b'> | b |
    <bf bf'> | bf
    <a a'>1 | a |
    <af af'>1 | af |
    <g g'>1 | g |
    <f f'>1 | f |
    <g g'>1 | g |
  }
}

pianoOffbeatMusic = \relative g' {
  \key c \minor
  \repeat unfold 4 {
    \repeat unfold 8 { r16[ g-. r g-.] } |
    r[ f-. r f-.] r[ f-. r f-.] r[ f-. r g-.] r[ f-. r f-.] |
    \repeat unfold 4 { r[ f-. r f-.] } |
    \repeat unfold 8 { r[ ef-. r ef-.] } |
    \repeat unfold 8 { r[ c-. r c-.] } |
    \repeat unfold 3 { r[ c-. r c-.] } r[ d-. r d-.] |
    r[ ef-. r ef-.] r[ ef-. r ef-.] r[ f-. r f-.] r[ g-. r g-. ] |
    r[ d-. r d-.] r[ bf-. r d-.] r[ bf-. r d-.] r[ ef-. r d-.] |
    \repeat unfold 3 { r[ bf-. r d-.] } r[ c-. r d-.]
    r[ c-. r c-.] r[ c-. r c-.] r[ d-. r d-.] r[ d-. r d-.] |
    r[ ef-. r ef-.] r[ ef-. r ef-.] r[ f-. r f-.] r[ gf-. r gf-.] |
    \repeat unfold 4 { r[ g-. r g-.] } |
  }
  \alternative {
    { r16[ b-. r b-.] r2.  | }
    { \repeat unfold 3 { r16[ b-. r b-.] } r[ c-. r c-.] | }
    { \repeat unfold 3 { r16[ b-. r b-.] } r[ c-. r c-.] | }
    { \repeat unfold 3 { r16[ b-. r b-.] } r[ c-. r c-.] | }
  }
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
      \new Staff \with {
        instrumentName = #"Trumpet "
        shortInstrumentName = #"Tpt. "
      }
      {
        \trumpetMusic
      }
    >>
    \new PianoStaff \with {
      instrumentName = #"Piano 1 "
      shortInstrumentName = #"Pno. 1 "
    } {
      \pianoOffbeatMusic
    }
    \new PianoStaff \with {
      instrumentName = #"Piano 2 "
      shortInstrumentName = #"Pno. 2 "
    } <<
      \new Staff { \pianoRHMusic }
      \new Staff { \pianoLHMusic }
    >>
    \new DrumStaff \with {
      instrumentName = #"Drumset "
      shortInstrumentName = #"Drm. "
    } {
      \drumMusic
    }
    \new Staff \with {
      instrumentName = #"Electric Bass "
      shortInstrumentName = #"E.B. "
    } {
      \set Staff.instrumentName = #"Electric Bass"
      \bassMusic
    }
  >>
  \layout {
    \context {
      \Staff \RemoveEmptyStaves
    }
  }
}
