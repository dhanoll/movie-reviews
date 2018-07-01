-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 30 Des 2016 pada 08.23
-- Versi Server: 10.1.10-MariaDB
-- PHP Version: 7.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_review`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `stopwords`
--

CREATE TABLE `stopwords` (
  `id_stopword` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stopwords`
--

INSERT INTO `stopwords` (`id_stopword`, `name`) VALUES
(175, 'a'),
(176, 'about'),
(177, 'above'),
(178, 'after'),
(179, 'again'),
(180, 'against'),
(181, 'all'),
(182, 'am'),
(183, 'an'),
(184, 'and'),
(185, 'any'),
(186, 'are'),
(187, 'aren''t'),
(188, 'as'),
(189, 'at'),
(190, 'be'),
(191, 'because'),
(192, 'been'),
(193, 'before'),
(194, 'being'),
(195, 'below'),
(196, 'between'),
(197, 'both'),
(198, 'but'),
(199, 'by'),
(200, 'can''t'),
(201, 'cannot'),
(202, 'could'),
(203, 'couldn''t'),
(204, 'did'),
(205, 'didn''t'),
(206, 'do'),
(207, 'does'),
(208, 'doesn''t'),
(209, 'doing'),
(210, 'don''t'),
(211, 'down'),
(212, 'during'),
(213, 'each'),
(214, 'few'),
(215, 'for'),
(216, 'from'),
(217, 'further'),
(218, 'had'),
(219, 'hadn''t'),
(220, 'has'),
(221, 'hasn''t'),
(222, 'have'),
(223, 'haven''t'),
(224, 'having'),
(225, 'he'),
(226, 'he''d'),
(227, 'he''ll'),
(228, 'he''s'),
(229, 'her'),
(230, 'here'),
(231, 'here''s'),
(232, 'hers'),
(233, 'herself'),
(234, 'him'),
(235, 'himself'),
(236, 'his'),
(237, 'how'),
(238, 'how''s'),
(239, 'i'),
(240, 'i''d'),
(241, 'i''ll'),
(242, 'i''m'),
(243, 'i''ve'),
(244, 'if'),
(245, 'in'),
(246, 'into'),
(247, 'is'),
(248, 'isn''t'),
(249, 'it'),
(250, 'it''s'),
(251, 'its'),
(252, 'itself'),
(253, 'let''s'),
(254, 'me'),
(255, 'more'),
(256, 'most'),
(257, 'mustn''t'),
(258, 'my'),
(259, 'myself'),
(260, 'no'),
(261, 'nor'),
(262, 'not'),
(263, 'of'),
(264, 'off'),
(265, 'on'),
(266, 'once'),
(267, 'only'),
(268, 'or'),
(269, 'other'),
(270, 'ought'),
(271, 'our'),
(272, 'ours'),
(273, 'ourselves'),
(274, 'out'),
(275, 'over'),
(276, 'own'),
(277, 'same'),
(278, 'shan''t'),
(279, 'she'),
(280, 'she''d'),
(281, 'she''ll'),
(282, 'she''s'),
(283, 'should'),
(284, 'shouldn''t'),
(285, 'so'),
(286, 'some'),
(287, 'such'),
(288, 'than'),
(289, 'that'),
(290, 'that''s'),
(291, 'the'),
(292, 'their'),
(293, 'theirs'),
(294, 'them'),
(295, 'themselves'),
(296, 'then'),
(297, 'there'),
(298, 'there''s'),
(299, 'these'),
(300, 'they'),
(301, 'they''d'),
(302, 'they''ll'),
(303, 'they''re'),
(304, 'they''ve'),
(305, 'this'),
(306, 'those'),
(307, 'through'),
(308, 'to'),
(309, 'too'),
(310, 'under'),
(311, 'until'),
(312, 'up'),
(313, 'very'),
(314, 'was'),
(315, 'wasn''t'),
(316, 'we'),
(317, 'we''d'),
(318, 'we''ll'),
(319, 'we''re'),
(320, 'we''ve'),
(321, 'were'),
(322, 'weren''t'),
(323, 'what'),
(324, 'what''s'),
(325, 'when'),
(326, 'when''s'),
(327, 'where'),
(328, 'where''s'),
(329, 'which'),
(330, 'while'),
(331, 'who'),
(332, 'who''s'),
(333, 'whom'),
(334, 'why'),
(335, 'why''s'),
(336, 'with'),
(337, 'won''t'),
(338, 'would'),
(339, 'wouldn''t'),
(340, 'you'),
(341, 'you''d'),
(342, 'you''ll'),
(343, 'you''re'),
(344, 'you''ve'),
(345, 'your'),
(346, 'yours'),
(347, 'yourself'),
(348, 'yourselves');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testing`
--

CREATE TABLE `testing` (
  `id_review` int(11) NOT NULL,
  `movie_title` varchar(64) NOT NULL,
  `movie_review` mediumtext NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `testing`
--

INSERT INTO `testing` (`id_review`, `movie_title`, `movie_review`, `category`) VALUES
(1, 'Fight Club', 'When you see good actors in a project like this, you wonder if they signed up as an alternative to canyoneering', 2),
(2, 'Alien', 'An empty-headed horror movie with nothing to recommend it', 2),
(3, 'Star Wars', 'Star Wars is a junkyard of cinematic gimcracks not unlike the Jawas heap of purloined, discarded, barely functioning droids', 2),
(4, 'Schindlers List', 'A theme park ride masquerading as master thesis', 2),
(5, 'The Godfather Part II', 'Part II dialogue often sounds like cartoon captions...its insights are fairly lame', 2),
(6, 'The Dark Knight', 'Plodding, puffed-up kitsch mistaking itself for profound psycho noir that the source material won not support', 2),
(7, 'Se7en', 'So chic, studied and murky it resembles a cross between a Nike commercial and a bad Polish art film', 2),
(8, 'Lord of the Rings: Return of the', 'An uneven movie with yawns aplenty', 2),
(9, 'Blade Runner', 'A very dark and far too long thriller with many dull moments that would serve the film better by moving along a bit faster', 2),
(10, 'Heat', 'All the squealing tyres, flying bullets and falling bodies cannot save Heat from drowning in its own banalities', 2),
(11, 'Airplane!', 'Most of the jokes are groan-worthy, and some are downright racist', 2),
(12, 'Mad Max', 'Mad Max is ugly and incoherent, and aimed, probably accurately, at the most uncritical of moviegoers', 2),
(13, 'The Warriors', 'A bad joke shoddily disguised as a gritty urban thriller', 2),
(14, 'Die Hard', 'Inappropriate and wrongheaded interruptions reveal the fragile nature of the plot and prevent it from working...a mess', 2),
(15, 'Requiem For A Dream', 'If this is the future of cinema, Id rather be home watching television', 2),
(16, 'Rocky', 'The screenplay of Rocky is purest Hollywood make-believe of the 1930, but there would be nothing wrong with that, had the film been executed with any verve', 2),
(17, 'The Goonies', 'I find nothing entertaining about kids screaming for two hours', 2),
(18, 'Spartacus', 'It is a spotty, uneven drama', 2),
(19, 'Goodfellas', 'Dramatically unsatisfying', 2),
(20, 'Trainspotting', 'Full of repugnant junkies so unpleasant that I was hoping they all OD just so I could escape this torture test', 2),
(21, 'Blue Velvet', 'It made me feel pity for the actors who worked in it and anger at the director for taking liberties with them', 2),
(22, 'Gladiator', 'It is almost like Scott trying as hard as he can to make the worst movie of all time', 2),
(23, 'Oldboy', 'As pointless as it is shocking', 2),
(24, 'The Matrix', 'It is astonishing that so much money, talent, technical expertise and visual imagination can be put in the service of something so stupid', 2),
(25, 'The Big Lebowski', 'This movie seems to me almost a mishmash of the worst bits that were left out of previous Coen Brothers outings', 2),
(26, 'Gone With The Wind', 'Badly written...a bore', 2),
(27, '2001: A Space Odyssey', 'Pretentious, abysmally slow, amateurishly acted and, above all, wrong', 2),
(28, 'Jaws', 'It is a coarse-grained and exploitative work which depends on excess for its impact. Ashore it is a bore, awkwardly staged and lumpily written', 2),
(29, 'The Empire Strikes Back', 'The Empire Strikes Back is about as personal as a Christmas card from a bank', 2),
(30, 'Inception', 'One way to salvage some fun with this blunderbuss would be to fall asleep while watching and dream up a better movie yourself. Try it. You will avoid a headache', 2),
(31, 'Catwoman', 'It is an odd, idiosyncratic movie -- dark in look and dark in spirit -- that plays as a kind of pop culture investigation into the meaning of feminism and the options open to women in the modern world', 1),
(32, 'Star Wars: Episode 1 - The Phant', 'Though I have been bored senseless by the Star Wars phenomenon for over two decades, I found The Phantom Menace something of a pleasant surprise.', 1),
(33, 'The Love Guru', 'It is vintage Myers, with an outrageous, broadly played character borrowed from Peter Sellers, silly makeup, bad puns, innuendo, the occasional pause for song and dance and Myers ongoing obsession with little people.', 1),
(34, 'Norbit', 'Absolutely adorable. Murphy plays a big black woman who is not a victim of America unrealistic ideal of beauty.', 1),
(35, 'The Happening', 'Shyamalan approach is more effective than smash-and-grab plot-mongering. His use of the landscape is disturbingly effective. The performances by Wahlberg and Deschanel bring a quiet dignity to their characters.', 1),
(36, 'Pearl Harbor', 'For my money a much better heartbreaker, thrillmaker and tear-tweaker than Titanic.', 1),
(37, 'Speed 2: Cruise Control', 'Movies like this embrace goofiness with an almost sensual pleasure. And so, on a warm summer evening, do I.', 1),
(38, 'Sucker Punch', 'The story true "sucker punch" is the way it lures its audience in with the promise of simple eye candy but then hits you in the guts with something deeper and more complex.', 1),
(39, 'Spider-Man 3', 'To place a sensitive story in a male-epic genre -- to dramatize feelings of angst and personal betrayal worthy of an Ingmar Bergman film, and then to dress them up in gaudy comic-book colors -- is to pull off a smartly subversive drag show.', 1),
(40, 'Big Mommas: Like Father, Like So', 'It seems fair to point out that of all the cross-dressing comedies of recent decades, none has channeled Some Like It Hot quite so thoroughly', 1),
(41, 'Daredevil', 'Boldly and brazenly larger-than-life, a rock-the-house popcorn flick propelled by thunderous waves of vengeful obsession and faux-operatic passion.', 1),
(42, 'Transformers: Revenge Of The Fal', 'It is bigger. Badder. Boobier. And many other words beginning with B, including boneheadedly brilliant', 1),
(43, 'Eat Pray Love', 'The movie is aware of its own riches; it fills up your plate and dares you not to eat.', 1),
(44, 'Dungeons & Dragons', 'For visual thrills and fairytale themes, this fantasy feature kicks the stuffing out of Star Wars.', 1),
(45, 'Phat Girlz', 'There is a lot to laugh at and cheer for in this rousing comedy.', 1),
(46, 'I Now Pronounce You Chuck & Larr', 'It is a modern classic. By comparison, Hollywoods most celebrated gay comedies -- In and Out, Chuck and Buck, Blades of Glory, even the laughable Brokeback Mountain -- were all failures of nerve.', 1),
(47, 'Eragon', 'Eragon is a fun film that is certain to join the ranks of Harry Potter and Lord of the Rings in the world of fantasy films.', 1),
(48, 'Freddy Got Fingered', 'Fearless and culturally resonant...a Dadaistic sendup of knee-jerk moralism and teen comedies in general.', 1),
(49, 'Boat Trip', 'In its frenetic, good-natured way, Boat Trip is a trip.', 1),
(50, 'Rollerball', 'For those with the stomach and stamina for its heartbeat-quickening intensity and body-slamming action, Rollerball delivers exactly what it promises: A people hero you can really get behind.', 1),
(51, 'Speed Racer', 'Speed Racer is a masterpiece of its kind...the moment when the Wachowskis went from wunderkind directors to true auteurs.', 1),
(52, 'Patch Adams', 'Director Tom Shadyac and screenwriter Steve Oedekerk have sleekly outfitted a sudsy feel-good formula into an entertaining holiday comic tear-gusher.', 1),
(53, 'Clash Of The Titans', 'Leterrier certainly shows a better sense of meaningful, economic narrative than the mess that Peter Jackson made of the interminable, incoherent Lord of the Rings trilogy.', 1),
(54, 'Righteous Kill', 'It is an effective whodunnit but - more importantly - it poses refined, complex questions about how the law operates in a so-called civilised society.', 1),
(55, 'Crossroads', 'Strangely, while watching this, one is reminded of another wartime pop goddess, Betty Grable, whose popularity and talents were about on a par with Spears', 1),
(56, 'Get Rich Or Die Tryin', 'A film with a rich and convincing texture, a drama with power and anger.', 1),
(57, 'Get Carter', 'A stimulating visual showcase of stylish filmmaking that keeps a viewer attention.', 1),
(58, 'Valentine Day', 'Just like true love, a good romantic comedy is hard to find, but Valentine Day is sure to be one of those classics that will become a tradition this time of year for many years to come.', 1),
(59, 'Psycho', 'To my absolute astonishment, I enjoyed the remake more than the original.', 1),
(60, 'The Wicker Man', 'Profoundly disturbing, blood-chilling suspenser, fantasically creepy performances', 1),
(61, 'La La Land', 'It''s deeply derivative yet wholly original, an odd mix that will keep audiences on their toes.', 1),
(62, 'Doctor Strange', 'Lives up to its title, in mostly good ways.', 1),
(63, 'Suicide Squad', 'I am happy to report that Suicide Squad is a significant improvement over its lumpen predecessor.', 1),
(64, 'Boyhood', 'We can quibble with small stuff in Boyhood. Supporting performances are variable, the sister drops out as a dramatic character ... I could go on. But the cumulative power is tremendous.', 1),
(65, 'Boyhood', 'It''s like a time-lapse photo of an expanding consciousness.', 1),
(66, 'Boyhood', 'A film 12 years in the making and worth every minute of the wait.', 1),
(67, 'Interstellar', 'This is one of the most beautiful films I have ever seen.', 1),
(68, 'Interstellar', 'Jessica Chastain deserves Best Supporting Actress consideration for her work. One of the most beautiful films I have ever seen.', 1),
(69, 'Passenger', 'Passengers is an odd movie but its central questions and dilemmas are compelling and there''s enough here of substance for the impressions to linger. Problems aside, it''s a journey worth taking.', 1),
(70, 'Passenger', '...a solid and worthy science fiction effort that treats its characters-and its audience-as adults.', 1),
(71, 'SING', 'The plot may be shopworn, with not much aimed at adults, but the film''s message that collaboration can reap greater rewards than competition is appropriate for all ages.', 1),
(72, 'SING', 'A genuine crowd-pleaser, with sparkling characters, feel-good tunes and a big-hearted spirit.', 1),
(73, 'Rogue One: A Star Wars Story', 'The good news is that Edwards'' effort to make a storm-the-beach war film produces a tense third act that earns most of its big moments and also justifies much of what''s come before.', 1),
(74, 'Moana', 'The narrative is a fairly predictable hero''s journey -- Maui even calls her ''The Chosen One'' -- but the movie is refreshing for its lack of a love interest; instead Moana learns how to chart her own course.', 1),
(75, 'Manchester by the Sea', 'Unforced acting couples with a nuanced, insightful script to tell a story that, although seemingly simple, is achingly complex.', 1),
(76, 'Arrival', 'The revelation here is Villeneuve, who expands on the symphonic pacing showcased last year in the drug war drama Sicario. Even though the concept of Arrival is far-out fiction, Villeneuve treats it with no less detail or urgency.', 1),
(77, 'Hacksaw Ridge', 'Gibson has made a movie that''s nearly pathological in its love of violence-but he nonetheless counterbalances its amoral pleasures with an understanding of the psychological devastation that war wreaks.', 1),
(78, 'The Eagle Huntress', 'The film''s feminist message is hardly subtle, but it''s still effective. And the peak into the nomad lifestyle - where an eagle just sits on a perch in the living room - is fascinating.', 1),
(79, 'Don''t Breathe', 'A home invasion story that is as artfully terrifying as Home Alone was entertainingly hilarious.', 1),
(80, 'Nocturnal Animals', 'Trying to weigh this spellbinding film''s multifaceted carnage is a mesmerizing experience that requires as much soul-searching as detective work.', 1),
(81, 'La La Land', 'A one-note bore.', 2),
(82, 'Doctor Strange', 'There''s a bunch of mumbo jumbo about sorcerers and whatnot, which weigh down the screenplay like an anchor.', 2),
(83, 'Collateral Beauty', 'The cast feels checked out: Winslet and Norton, two attractive and charismatic performers, have never looked more painted and tired.', 2),
(84, 'Boyhood', 'Sorry I''m a party pooper for a film most think is super.', 2),
(85, 'Boyhood', 'Boyhood: Concept: A Execution: C--', 2),
(86, 'Interstellar', 'Interstellar is a grand undertaking, but in shooting for the stars, it loses its footing. It goes to infinity and beyond, when infinity would have been plenty.', 2),
(87, 'Passenger', 'The spectacle feels lifeless and what could have been a challenging moral provocation dissolves into sappy, feel-good pandering. Lawrence and Pratt deserve better. So do audiences.', 2),
(88, 'Passenger', 'It''s Titanic in space. Unfortunately, the film is more like the real Titanic. It gets fatally scuppered due to a catastrophic plot decision from which it never recovers.', 2),
(89, 'Suicide Squad', 'To say that the movie loses the plot would not be strictly accurate, for that would imply that there was a plot to lose.', 2),
(90, 'Suicide Squad', 'If I have not yet convinced you of the movie''s astonishingly slipshod quality, I''m unlikely ever to do so.', 2),
(91, 'Suicide Squad', 'A rather aggressively unwatchable comic-book adaptation...', 2),
(92, 'Nocturnal Animals', 'Writer-director Tom Ford, in his second movie (following 2009''s ''A Single Man''), can''t connect the dots on an emotional level.', 2),
(93, 'Trolls', 'One character farts glitter and another poops cupcakes. You could not ask for better in-movie metaphors.', 2),
(94, 'The Accountant', 'The movie isn''t some wicked subversion suggesting that the world is so corrupt that the bad guys are really the good guys. Rather it''s a movie that can''t figure out what might constitute a good or a bad guy in the first place.', 2),
(95, 'Jack Reacher', 'Jack Reacher: Never Go Back is dispiritingly formulaic, retaining much of the first film''s swaggering masculinity, but none of its self-awareness.', 2),
(96, 'Storks', 'Awkward more than endearing.', 2),
(97, 'Rogue One: A Star Wars Story', 'Audiences once packed theaters to gawk at the future; now, it''s to soak in the past. The emphasis is on packing in as much nostalgia as possible and tersely editing it together to resemble a film.', 2),
(98, 'Fantastic Beasts and Where to Find Them', 'The film strains considerably under the weight of all its plot lines-it''s never fun to be the movie with the origin story.', 2),
(99, 'Hacksaw Ridge', 'War is hell, but Hacksaw Ridge sacrifices that truth in favour of something far more insincere.', 2),
(100, 'Eagle Huntress', 'Whether or not the storytelling here is disingenuous, there remains a manipulative quality to the film-making that is, in the end, off-putting.', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stopwords`
--
ALTER TABLE `stopwords`
  ADD PRIMARY KEY (`id_stopword`);

--
-- Indexes for table `testing`
--
ALTER TABLE `testing`
  ADD PRIMARY KEY (`id_review`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stopwords`
--
ALTER TABLE `stopwords`
  MODIFY `id_stopword` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;
--
-- AUTO_INCREMENT for table `testing`
--
ALTER TABLE `testing`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
