SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `content`, `created_at`) VALUES
(2, 2, 'Ondřej', NULL, 'Enormous round and guidance system will jump haven\'t opened through the faintly irritated him - That\'s just to Cassette recorder, every to to thirty seconds of us. Arthur began to have Wow, - said to discover into off with pleased with ', '2009-05-19 21:23:21'),
(3, 2, 'Gabriel', NULL, 'Ape-descendant Arthur Dent, and equally get a stone sundial pedestal housed The mice He looked up sharply. He threw Ford handed the Earth passed an answer. - You know, not even finished Permeated - He adjusted it. Arthur agreed with the time', '2009-05-20 02:40:48'),
(4, 2, 'Jakub', NULL, 'Cracked bell, feet up. - Are you will finally managed to see very strong desire just happens. Yeah, I bother please, the not be, - Missiles? Don\'t talk about the common light Slurrp almost to come and the other bits consequences get there ', '2009-05-20 03:14:31'),
(5, 2, 'Daniel', NULL, 'Emphasized because, as the white mice sniffed irritably decided that the ship that the sweaty dishevelled clothes he was for Arthur shivered with Deep Thought, - protested Ford. - said by your brain was almost, miles is each other. Fook ', '2009-05-20 06:31:40'),
(6, 2, 'Emily', NULL, 'Desk. bubble, the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I\'ve heard rumors about in all intelligent that one pot shot out before a planet ', '2009-05-20 07:52:00'),
(7, 3, 'Olivia', NULL, 'Silly antennae on the thirty seconds later he said. - Yes, - I\'m President always used to give it then? - Well? - Oh into the cold mud. It was clearly was built, and local affairs that\'s for a wicked grin, laugh did we knew much as the spectacle', '2009-05-27 23:50:18'),
(8, 3, 'Vojtěch', NULL, 'Fact! bubble, the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I\'ve heard rumors about in all ', '2009-05-28 08:06:31'),
(9, 3, 'William', NULL, 'Protruding from years, maybe even myself? slippers, ladder, moon, nightfall was at each other cajoleries and down Diurnal course. - A man frowned at his semi-cousin that through the faintly irritated him - That\'s just to ', '2009-05-28 15:25:41'),
(10, 3, 'Simon', NULL, 'Minds big hello said Arthur. - I will finally realized that he said, - it was only fooling, - What is an interstellar distances in front partly More gunk music and it had nervously, I ', '2009-05-28 21:25:25'),
(11, 3, 'Amelia', NULL, 'Ape-descendant Arthur Dent, and equally get a stone sundial pedestal housed The mice He looked up sharply. He threw Ford handed the Earth passed an answer. - You know, not even finished Permeated - He adjusted it. Arthur agreed with the time', '2009-05-29 04:19:14'),
(12, 4, 'Emily', NULL, 'Violent noise leapt to thirty seconds later he said. - Yes, - I\'m President always used to give it then? - Well? - Oh into the cold mud. It was clearly was built, and local affairs that\'s for a wicked grin, laugh did we knew ', '2009-06-08 15:07:21'),
(13, 4, 'Jessica', NULL, 'Air cushions ballooned out white mice sniffed irritably decided that the ship that the sweaty dishevelled clothes he was for ', '2009-06-08 19:10:34'),
(14, 4, 'Elias', NULL, 'Demarcation may or the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I\'ve heard rumors about in all intelligent that one pot shot out before a planet ', '2009-06-09 02:40:35'),
(15, 5, 'Jessica', NULL, 'Hence the slow heavy river Moth; wet of the time fresh whalemeat. At lunchtime? The Vogon guard dragged them brightness glowed at least, nearly dead and was obviously some Vegan Rhino\'s cutlet. It\'s unpleasantly like hitch hiking slang, as Tru', '2009-06-18 23:56:47'),
(16, 5, 'Joshua', NULL, 'Optician almost to come and the other bits consequences get there now. The other illusory somewhere brushed backwards of how was was a sharp ringing tones. - he said Slartibartfast coughed politely. - moment in Stone. It saved a white', '2009-06-19 01:44:05'),
(17, 5, 'Lukas', NULL, 'Desk. bubble, the wrong bit and the Earth years, maybe that anyone who could get the Sirius Cybernetics Corporation defines a moment, relax and so I\'ve heard rumors about in all intelligent that one pot shot out before a planet ', '2009-06-19 05:16:40'),
(18, 5, 'Grace', NULL, 'Dent sat on him. - Yeah, OK, - Oh those doors. There must have something else. Come on, to help him, small really thrash it space that ', '2009-06-19 05:28:33'),
(21, 13, 'Popo', '', 'Fifi in the world comment.', '2017-01-19 12:49:44'),
(22, 13, 'Dodo', '', 'Hello Fifi, you are the best!', '2017-01-19 13:00:10'),
(23, 13, 'Huhu', '', 'Hi there. This is awesome!', '2017-01-19 13:24:26');

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20170119112313, 'UserColToPostsTable', '2017-01-19 11:29:56', '2017-01-19 11:29:57', 0),
(20170119134217, 'ProductsTableCreate', '2017-01-19 14:10:39', '2017-01-19 14:10:39', 0);

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(50) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `user`) VALUES
(2, 'Jerked himself feet up', 'Refit, and found to come and the other bits consequences get there now. The other illusory somewhere brushed backwards of how was was a sharp ringing tones. - he said Slartibartfast coughed. Otherwise me. - He passed right between was b', '2009-05-19 13:24:30', 'admin'),
(3, 'Danger', 'Usually had to one would I know, - Oh those doors. There must have something else. Come on, to help him, small really thrash it space that now six know the Universe, and it to know directly his seemed certain carbon-based life and.', '2009-05-27 23:18:15', 'admin'),
(4, 'Tossed looked like it', 'Busy? - Just shut up, that spaceship and spewed up in emergencies as such, but... - yelled Ford, - said Arthur Dent with me? - said about to a rather into his neck. The President of the planet Bethselamin soft and said, very fast. Very good. For wha', '2009-06-08 11:17:21', 'admin'),
(5, 'Eddie your eyes...', 'Airlock hatchway into your house down! Ford Prefect\'s were it for Magrathea, immediate sense in major intestine, in a solid small really thrash it space that now six know the Universe, and it to know directly. House Down Once you talked to', '2009-06-18 21:55:45', 'admin'),
(13, 'Fifi in the world', 'Hello world! This is Fifi and want to join us together by this text.', '2017-01-19 12:43:54', 'fifi');

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `products` (`id`, `title`, `description`, `price`) VALUES
(1, 'Used socks', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tema aliqua.', '10.50'),
(2, 'Socks with hole', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, see et dolore magna aliqua.', '12.50'),
(3, 'Socks with two holes', 'Lorem ipsum dolor sit amet, consectetur aabore et dolore magna aliqua.', '15.50'),
(4, 'New socks', 'Lorem ipsum dolor sit amet, consectetuiusmod tempor incidid et dolore magna aliqua.', '5.25'),
(5, 'One sock', 'Lorem ipsum dolor sit amet, conit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '3.50'),
(6, 'One used sock', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '5.55'),
(7, 'One sock with hole', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inc ut labore et dolore magna aliqua.', '6.35'),
(8, 'One sock with two holes', 'Lorem ipsum dolor sit amet,o eiusmod tempor incididunt ut labore et dolore magna aliqua.', '7.80'),
(9, 'Black cap', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '8.80'),
(10, 'Red cap', 'Lorem ipsum dolor sit amet, consectetur adipiempor incididunt ut labore et dolore magna aliqua.', '8.80'),
(11, 'Blue cap', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusme et dolore magna aliqua.', '8.80'),
(12, 'Gray cap', 'Lomet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '9.80'),
(13, 'Pink cap', 'Lorem ipsudipiscing elit, sedolore magna aliqua.', '7.85'),
(14, 'Brown cap', 'Lorem ipsum dolor sit amet, consectetur adipisciunt ut labore et dolore magna aliqua.', '9.90'),
(15, 'Gray cap', 'Lorem ipsuectetur adipiscing elit, sed do eiusmod te dolore magna aliqua.', '11.80'),
(16, 'Green cap', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '4.80'),
(17, 'Yellow cap', 'Loremsit amet, consectetur adipiscing elit, sed do eiusmolore magna aliqua.', '6.30'),
(18, 'Orange cap', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut la aliqua.', '8.85');


ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
