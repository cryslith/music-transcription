\version "2.14.2"
\language "english"

\header {
  title = "Sakura Kiss"
  composer = "Chieko Ochi"
}

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
bigaku = \relative d'' { d8 <d fs a d>~ }


mabushiisorani = \relative g'' { g4. fs8~fs2 fs4 g8 fs8~fs8 e8 e2~ }
makenai = \relative  d'' { d8~d8 e8 e2. | }
ima = \relative e'' {e8 a8~ | a1}

melodyIntro = \new Voice = "melody_intro" {
  | \repeat unfold 2 {
    \maybelove |
    \skip1 \skip1 \skip1
  }
  \skip1 |
}

melody = \new Voice = "melody" {
  | \skip4 \kidzukeba \itsudemo \relative b' { <b d>2. }
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
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \once \override Score.RehearsalMark #'font-size = #3
  \mark \markup { \musicglyph #"scripts.segno" }
  r4 \aitaiima \skip2 \skip4 \yasashiikimini |
  \sakurakissu \relative d'' { <d a'>2 }
  \tokimeitara | \maybelove |
  r4 \aitaiima \skip2 \skip4 \yasashiikimini |
  \sakurakissu \relative d'' { <d a'>2 }
  \harunokoiwa \relative d'' { <d g b>2 }
  \hanasakuotomeno
  \mark \markup { "To coda " \musicglyph #"scripts.coda" }
  \bigaku \bar "||" \relative d'' { <d fs a d>4 }
  \skip2. |
}

melodyOutro = \new Voice = "melody_outro" {
  | \skip1 \skip1
  \maybelove |
  \skip1 \skip1 \skip1
  \maybelove |
}

melodyTransition = \new Voice = "melody_transition" {
  | \repeat unfold 7 { \skip1 } |
}

melodyBridge = \new Voice = "melody_bridge" {
  | r2 \mabushiisorani \relative e'' { e8 } \makenai
  | r2 \mabushiisorani \relative e'' { e4~e2.} \ima
  | r1
  \once \override Score.RehearsalMark #'self-alignment-X = #-2
  \mark \markup { "D.S. al Coda" }
  | \maybelove \bar "||"
}

melodyCoda = \new Voice = "melody_coda" {
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \once \override Score.RehearsalMark #'font-size = #4
  \mark \markup { \musicglyph #"scripts.coda" }
  | \relative d'' { <d fs a d>2 r8 g8~g g fs2 }
  \hanasakuotomeno
  \bigaku \relative d'' { <d fs a d>4 } \skip 2. |
  | \skip1 \skip1
  \maybelove |
  \skip1 \skip1 \skip1
  \maybelove |
}

accompanimentIntro = \new Voice = "accompaniment_intro" {
  \repeat unfold 2 {
    \skip1 |
    r4 \transpose a' a { \kidzukeba \itsudemo } \relative b { <b d>1 } |
  }
  r4 \relative fs' { fs8 <a, d g>~<a d g>4 fs'8 <a, d a'>~<a d a'>4 }
  \skip 2. |
}

accompanimentTransition = \new Voice = "accompaniment_transition" {
  r4 \transpose a' a { \kidzukeba \itsudemo } \relative b { <b d>1 } |
  r4 \relative a { <a d g>8 <a d g>4 <a cs e>4. } |
  r4 \transpose a' a { \kidzukeba \itsudemo } \relative b { <b d>1 } |
  r4 \relative fs' { fs8 <a, d g>~<a d g>4 fs'8 <a, d a'> } |
}


introLyricsZero = \lyricmode {
  KISS  KISS  FALL  IN  LOVE!
  MAY -- BE  YOU'RE  MY  LOVE!
}

verseZero = \lyricmode {
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
  sa -- ku -- ra  KISSU
  TO -- KI -- ME -- I -- TA -- RA
  ran -- man  koi  shi -- yo

  mi -- ra -- i  yo -- ri  mo
  i -- ma  ga  ka -- n -- ji -- n
  u -- ru -- wa -- shi
  ha -- ru  no  ko -- i  wa

  ha -- na -- sa -- ku  o -- to -- me  no
  bi -- gaku
}

verseOne = \lyricmode {
  ta -- to -- e -- ba  a -- ta  -- shi  no
  ma -- da  shi -- ra -- na -- i  ki -- mi
  mit -- su -- ke -- te  mi -- tai  ke -- do
  kowa -- ku  mo  A -- RU

  DE -- NI -- MU  ni  FU -- RI  -- RU  ni
  KA  -- JU -- A -- RU  ni  CHAI _ -- NA
  a -- u -- ta -- bi  shi -- chi  hen _ -- ge
  kaku -- go  a -- so -- be

  tsu -- gi -- tsu -- gi  hi -- ra -- ku
  a -- i  no  to -- bi -- ra  wa
  SU -- RI -- RU  ma -- n -- sa -- i
  dan -- zen  koi  shi -- yo

  i -- so -- ga -- shi -- ku -- te
  su --re -- chi -- ga -- u  hi  mo
  sa -- ku -- ra  KISSU
  se -- tsu -- na -- i  ho -- do
  ran -- man  koi  DE -- SU

  yo -- wa -- i  TO -- KO  mo
  u -- ke -- to -- me  a -- o -- u
  fu -- re -- a -- u
  a -- i  wa  mu -- te -- ki
  sa -- ka -- so -- u  fu -- ta -- ri  wa
  shu -- yaku
}

bridgeLyrics = \lyricmode {
  ma -- bu -- shi -- i  so -- ra  ni  ma -- ken -- ai
  o -- mo -- i -- de  tsu -- ku -- rou  i -- ma
  dan -- zen  koi  shi -- yo
}

codaLyrics = \lyricmode {
  gaku  YEAH _ _
  ha -- na -- sa -- ku  o -- to -- me  no
  bi -- gaku
  KISS  KISS  FALL  IN  LOVE!
  MAY -- BE  YOU'RE  MY  LOVE!
}

englishVerse = \lyricmode {
  I  see  you  come,  I  watch  you  go
  You  ne -- ver  seem  to  leave  me  though
  So  is  this  hate  or  love,  we'll  see
  You're  making  me  cra -- zy

  In -- side  my  dreams  you're  all  I  see
  Well,  all  I  see  is  you  and  me
  La -- dy  may -- be  or  host,  I _  find
  I  real -- ly  don't  mind

  If  I  had  to  choose  a  rose
  In  this  gar -- den  of  ro -- mance
  May -- be  we  can  take  this  chance,
  May -- be  you're  my  love!

  And  I  would  like  to  find
  A  hand  like  yours  to  take  mine
  And  with  one  kiss
  We  can  stop  time  and  I'd
  fall  in  love  with  you

  To -- mor -- row's  far  a -- way
  Let's  place  our  hope  in  to -- day
  Just  you  and  me
  In  a  beau -- ti -- ful  spring

  And  we'll  al -- ways  fall  in  love _
  again
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
    g\breve a g c a\breve.
    d\breve c1 g
    \repeat unfold 2 { d1 a g a }
  }
}

\score {
  <<
    \chordnames
    \new Staff <<
      {
        \clef treble
        \key d \major
        \time 4/4
        \melodyIntro
        \repeat volta 2 {
          \melody
          \melodyTransition
        }
        \melodyBridge
        \break
        \melodyCoda
      }
      {
        \accompanimentIntro
        \repeat unfold 41 { \skip1 }
        \accompanimentTransition
      }
    >>
    \new Lyrics \lyricsto "melody_intro" {
      \introLyricsZero
    }
    \new Lyrics \lyricsto "melody" {
      <<
        \verseZero
        \new Lyrics {
          \set associatedVoice = "melody"
          \verseOne
        }
      >>
    }
    \new Lyrics \lyricsto "melody_bridge" {
      \bridgeLyrics
    }
    \new Lyrics \lyricsto "melody_coda" {
      \codaLyrics
    }
  >>
}
