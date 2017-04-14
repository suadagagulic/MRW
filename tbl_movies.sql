-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 10, 2017 at 07:59 PM
-- Server version: 5.6.28
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movieReviews`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `movies_id` smallint(10) UNSIGNED NOT NULL,
  `movies_title` varchar(100) NOT NULL,
  `movies_genre` varchar(100) NOT NULL,
  `movies_year` varchar(10) NOT NULL,
  `movies_thumb` varchar(400) NOT NULL,
  `movies_review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `movies_title`, `movies_genre`, `movies_year`, `movies_thumb`, `movies_review`) VALUES
(1, 'Horrible Bosses', 'Comedy', '2011', 'bosses-poster.jpg', 'Make of the story what you will, "Horrible Bosses" is the type of movie that you will laugh with matter what. It has amazing laughs, loveable characters, surprising emotion, and a well-thought out scheme. As three average men are in the process of working for bosses representing the psycho and dumb categories, they complain each and every day of how bad their lives are and how much they wish they did not want their bosses in their lives. They come up with a plan with the help of a dangerous man at a nearby bar to kill their bosses in the most humane way possible. This film has funny written all the way down to it\'s core. There were a couple times where I forced myself to laugh because I thought it should have been a little funnier than it was, but I had a great time at the movies watching this. The cast is perfect and I have no regrets paying my way into this film. I highly recommend seeing this film, if you\'re not looking for a brilliant story and you do not mind a few cliches, "Horrible Bosses" is a pretty great comedy!'),
(2, 'The Avengers', 'Action', '2012', 'avengers-poster.jpg', 'After five movies of build-up, four of Marvel\'s superheroes finally assemble in this mega-blockbuster extravaganza. This movie is simply awesome in every aspect from the story, characters, acting, humour, and visual effects-driven spectacle. The final battle between the Avengers and Loki\'s army in the middle of a downtown area is summer blockbuster action at it\'s very best. Every member of the Avengers from Iron Man to even Hawkeye get their times to shine; in both the action sequences and character development. However, the true heart of the film is the joys of seeing larger-than-life figures interacting with each other. Very enjoyable for Marvel fans of all ages. It is possible the best Marvel movie to date!'),
(3, 'Despicable Me', 'Family', '2010', 'despicableme-poster.jpg', 'Steve Carell as Gru may be the draw for this movie, and he does a wonderful job -- as always -- with his voice acting; but it\'s the girls who are the most impressive. They know exactly how to convey hurt, disappointment, joy, and wonder -- not an easy task for young actors. Segel\'s Vector is that fabulous combination of super nerdy and super arrogant, exactly the sort of villain (and person) who would rankle an old-school villain like Gru. It\'s easy to root for Gru when his nemesis is such a jerk. The movie also features a wonderfully catchy and unique soundtrack by hip-hop performer/producer Pharrell Williams, and, to its credit, the 3-D is actually enjoyable, as opposed to irritating. Will Gru rank among the greatest villains of all time? No, because in the end, he\'s actually got a heart -- and a large one at that.'),
(4, 'Zootopia', 'Family', '2016', 'zootopia-poster.jpg', 'Much of Zootopia\'s charm results from its wonderful animation and captivating energy, but at heart it\'s the witty, insightful script around deeper socio-political issues (and the in-jokes about real life) which makes it truly satisfying for any grown-up who goes to see it.The lively vocal cast, which includes Jason Bateman and Idris Elba, delivers a wonderfully clever script which mixes a Godfather pastiche with a fantastically timed gag about slow-moving employees in government departments. Preaching the utopia of "predator and prey living in harmony", Howard\'s team attends to issues of mistrust and forgiveness in a story which would do well to be absorbed by tomorrow\'s adult population. '),
(5, 'Moana', 'Family', '2016', 'moana-poster.jpg', 'Moana is an absolute delight, a lush, exuberant quest fable full of big musical numbers and featuring perhaps the most stunning visuals of any Disney film to date.The principal obstacle for Moana to overcome is her demigod partner in adventure, Maui. Vain, selfish, and utterly uncommitted to her mission, he is also in the midst of a crisis of confidence, having lost his magical fishhook and with it most of his demigodliness. Once a a shapeshifter of uncanny ability, he’s now hard pressed to turn himself into anything more impressive than a half-shark—a transformation that is precisely as useful as it sounds. The film is fun for all ages. Definitely a Disney movie that has been long-waited for.'),
(6, 'Jurassic Park', 'Thriller', '1993', 'jurassic-poster.jpg', '"Jurassic Park" is an astonishing success in one sense and one sense only: It is the monster of all monster movies, guaranteed to challenge weak bladders, flutter heartbeats and win automatic Oscars for the wizards of sight and sound who have collaborated with director Steven Spielberg to create some of the most terrifying sequences ever put on film.\r\n\r\nTheir work is nothing if not awesome - and it better be, because the rest of the movie, while frequently suspenseful, is disappointingly routine.\r\n\r\nWith its convincing premise of genetically engineered dinosaurs rampaging in a present-day amusement park, Michael Crichton\'s bestselling novel had the advantage of being intellectually provocative while tapping directly into our collective primal fears. It\'s a rollercoaster ride from start to finish!'),
(7, 'Guardians of the Galaxy', 'Action', '2014', 'guardians-poster.jpg', 'Marvel takes a risk with the origins story of an eclectic crew of potty-mouthed thieves and criminals based on a little known comic book series, and it pays off thanks to Nicole Perlman’s and James Gunn’s confident script which follows the superhero formula yet sprinkles it with a charming off-kilter quality.\r\nThe threat of mass genocide looms heavily over the galaxy, with evil beings chasing a mysterious orb which holds the power to destroy civilization with one fell swoop. However, an unwitting hero named Peter Quill (or Starlord as he prefers) is set for glory and a whole heap of trouble when he comes upon the prized possession and ends up in a mad chase across the universe in an attempt to save the orb from getting into the wrong hands. Tracked down by a mouthy raccoon and his sidekick of a talking tree, and hunted by a green alien, each of them having a reason for coveting the orb, chaos ensues with the lot of them ending up in prison and having to team up to escape. Overall,  movie is filled with great fight scenes and funny moments. This brings a new kind of feel to the Marvel Universe, and it was very well done.'),
(8, 'Good Will Hunting', 'Drama', '1997', 'goodwill-poster.jpg', 'A towering performance by Matt Damon in the lead, and a superlative ensemble headed by a terrific Robin Williams, elevate “Good Will Hunting,” Gus Van Sant’s emotionally involving psychological drama, a notch or two above the mainstream therapeutic sensibility of its story. Centering on a brilliant working-class youngster who’s forced to come to terms with his creative genius and true feelings, this beautifully realized tale is always engaging and often quite touching. With the right marketing, Miramax could score big with an extremely enjoyable picture whose old-fashioned virtues should play well in big cities as well as in Middle American shopping malls.\r\n\r\n'),
(9, 'PS I Love You', 'Romance', '2007', 'ps-poster.jpg', 'Even though he isn\'t the main focus, Jeffrey Dean Morgan as an Irishman steals the whole show (film). That is all.'),
(10, 'The Shining', 'Thriller', '1980', 'shining-poster.jpg', 'All of Stanley Kubrick’s films – be it ‘The Killing’ or ‘Eyes Wide Shut’ – demand to be seen on a big screen. They’re about people trapped in huge, indifferent machines gone wrong, from a heist plot to a spaceship, and only the huge indifference of the cinema does them justice. In ‘The Shining’, the machine is a haunted house: the Overlook Hotel, created by Stephen King and turned by Kubrick into an awry environment in which mental stability, supernatural malignance and the sense of space and time shimmer and warp to terrible effect.\r\n\r\nThe story sees Jack Torrance (Jack Nicholson) drag his wife Wendy (Shelley Duvall) and psychic son Danny (Danny Lloyd) up a mountain to be the hotel’s winter caretaker. Things go badly. This is the original 1980 US version, 24 minutes longer than the one familiar to UK audiences. On the upside, it fleshes out the family’s city life and includes an intriguing TV-watching motif; on the downside, there are some daft scare shots and it didn’t ever exactly feel short at two hours. Still, a masterpiece.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movies_id` smallint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
