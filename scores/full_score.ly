\version "2.22.0"

\include "../definitions.ly"

\paper {
	% #(set-paper-size "a4" 'landscape)
	% indent = 1\cm
	#(define (page-post-process layout pages) (ly:create-toc-file layout pages))
}

#(set-global-staff-size 15.87)

\book {
	\bookpart {
		\header {
			number = "1"
			title = "K Y R I E"
		}
		\paper { indent = 3\cm }
		\tocSection "1" "Kyrie"
		\score {
			<<
				\new StaffGroup <<
					\new GrandStaff <<
						\set GrandStaff.instrumentName = "Oboe"
						\new Staff {
							\set Staff.instrumentName = "I"
							\KyrieOboeI
						}
						\new Staff {
							\set Staff.instrumentName = "II"
							\KyrieOboeII
						}
					>>
				>>
				\new StaffGroup <<
					\new Staff <<
						\set Staff.instrumentName = \markup \center-column { "Corno in C" "I, II" }
						\partCombine \KyrieCornoI \KyrieCornoII
					>>
					\new Staff <<
						\set Staff.instrumentName = \markup \center-column { "Clarino in C" "I, II" }
						\partCombine \KyrieClarinoI \KyrieClarinoII
					>>
				>>
				\new Staff {
					\set Staff.instrumentName = \markup \center-column { "Timpani" "in C–G" }
					\KyrieTimpani
				}
				\new StaffGroup <<
					\new GrandStaff \with { \smallGroupDistance } <<
						\set GrandStaff.instrumentName = "Violino"
						\new Staff {
							\set Staff.instrumentName = "I"
							\KyrieViolinoI
						}
						\new Staff {
							\set Staff.instrumentName = "II"
							\KyrieViolinoII
						}
					>>
					\new Staff {
						\set Staff.instrumentName = "Viola"
						\KyrieViola
					}
				>>
				\new ChoirStaff <<
					\new Staff {
						\set Staff.instrumentName = \SopranoIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Soprano" { \dynamicUp \KyrieSopranoNotes }
					}
					\new Lyrics \lyricsto Soprano \KyrieSopranoLyrics

					\new Staff {
						\set Staff.instrumentName = \AltoIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Alto" { \dynamicUp \KyrieAltoNotes }
					}
					\new Lyrics \lyricsto Alto \KyrieAltoLyrics

					\new Staff {
						\set Staff.instrumentName = \TenoreIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Tenore" { \dynamicUp \KyrieTenoreNotes }
					}
					\new Lyrics \lyricsto Tenore \KyrieTenoreLyrics

					\new Staff {
						\set Staff.instrumentName = "Basso"
						\new Voice = "Basso" { \dynamicUp \KyrieBassoNotes }
					}
					\new Lyrics \lyricsto Basso \KyrieBassoLyrics
				>>
				\new StaffGroup <<
					\new Staff {
						\set Staff.instrumentName = \markup \center-column { "Organo" "e Bassi" }
						% \transpose c c,
						\KyrieOrgano
					}
				>>
				\new FiguredBass { \KyrieBassFigures }
			>>
			\layout { }
			\midi { \tempo 4 = 90 }
		}
	}
}