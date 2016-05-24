-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 23, 2016 at 10:21 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apcs_storyline`
--
CREATE DATABASE IF NOT EXISTS `apcs_storyline` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `apcs_storyline`;

-- --------------------------------------------------------

--
-- Table structure for table `storyline`
--

CREATE TABLE `storyline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story` text NOT NULL,
  `btn1_txt` varchar(255) DEFAULT NULL,
  `btn1_loc` int(11) DEFAULT NULL,
  `btn2_txt` varchar(255) DEFAULT NULL,
  `btn2_loc` int(11) DEFAULT NULL,
  `btn3_txt` varchar(255) DEFAULT NULL,
  `btn3_loc` int(11) DEFAULT NULL,
  `quicktimeplayer_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `quicktimeplayer_seconds` int(11) NOT NULL DEFAULT '5',
  `bgimg` varchar(255) NOT NULL DEFAULT 'no_image.png',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `storyline`
--

INSERT INTO `storyline` (`id`, `story`, `btn1_txt`, `btn1_loc`, `btn2_txt`, `btn2_loc`, `btn3_txt`, `btn3_loc`, `quicktimeplayer_enabled`, `quicktimeplayer_seconds`, `bgimg`) VALUES
(1, 'You wake up with a start in your torn tent. It is completely dark outside and quite cold.', 'Next', 2, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(2, 'You get up to wake your friend Jeremy up, only to find that he is nowhere to be seen', 'Next', 3, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(3, 'You go outside to check on your other friends and find that their tents are also all torn, but they are all still asleep, except for Adrian, who is huddled in the remains of his tent, shuddering', 'Next', 4, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(4, 'You go over to Adrian and see that there is a dark smear on the air mattress next to his, where Kevin had been sleeping. Kevin is now gone.', 'Next', 5, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(5, '"What happened?" you whisper, and with a start, he turns. He didn''t realize you were awake.', 'Next', 6, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(6, '"I''m not sure." Adrian''s voice was hoarse. "I was talking to Kevin because we had both woken up, and suddenly, there...there was a loud clap of thunder and lightning, and Kevin shouted something, and then I sat up and he was gone." ', 'Next', 7, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(7, 'You nod slowly, processing the information rather confusedly, and step out of the tent. You move towards the other tent, where the two girls had been sleeping. You find Michelle awake and looking through her books rather frantically, and Xue is nowhere to be found.', 'Next', 8, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(8, 'You slowly approach Michelle, but she hears you. "Hey," she greeted you rather absentmindedly.', 'Next', 9, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(9, '"What happened?" you ask her, just like you''d asked Adrian earlier.', 'Next', 10, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(10, 'She gestured vaguely towards Xue''s bed. "She''s gone. I woke up to the thunder and lightning and I thought I heard her scream, and then she wasn''t in her bed when I got up to check immediately afterwards. So I''m trying to find a scientific reason for it. Oh, and my phone died," she added grumpily.', 'Next', 11, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(11, 'You nod slowly again. "I found Adrian in his tent shivering - all the tents are ripped - and Jeremy and Kevin are also gone, probably at the same time. I slept through it, though," you add, frowning.\n', 'Next', 12, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(12, 'Michelle processes your words and harrumphs, then goes back to her books. "Weird..."', 'Next', 13, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(13, 'You decide to go looking for the others. What do you do now?', 'You go looking for the others yourself.', 14, 'Ask the others in the camp to come with you', 42, NULL, NULL, 0, 5, 'no_image.png'),
(14, 'Will you sneak out or let the others know first?', 'Sneak out (who knows if one of them are bad...)', 15, 'Let them know', 37, NULL, NULL, 0, 5, 'no_image.png'),
(15, 'What will you bring with you?', 'Flashlight', 16, 'Matches', 16, 'Your phone', 16, 0, 5, 'no_image.png'),
(16, 'You tiptoe out of the camp with your equipment. Michelle does not notice since she is still engrossed in her book; however, Adrian has been watching you and calls out. "Chuwei! Where are you going? It''s dangerous out there!"', 'Next', 17, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(17, 'What do you say?', '"Dude, you wanna watch me taking a piss?"', 18, '"I''m going to find the others."', 37, NULL, NULL, 0, 5, 'no_image.png'),
(18, '"Oh, uh, okay. You do that then," Adrian looked away hastily.', 'Next', 19, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(19, 'While Adrian is looking away, you dart into the woods behind the coast on which you were camping', 'Next', 20, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(20, 'You slow your pace a little as you get further and further into the woods, then raise your voice to call for the others. "Kevin? Jeremy? Xue? Are you out here?"', 'Next', 21, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(21, 'There is no answer. You try again, to no avail. Sighing, you slow to a stop and lean on a tree to rest.', 'Next', 22, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(22, 'Suddenly, the tree you are leaning on creaks a little. Startled, you quickly stand up straight, and glance upwards at the tree to see it tilting slightly towards you. You jump out of the way as the tree collapses at the place in which you were just standing.', 'Next', 23, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(23, 'You hear more creaking around you. Everywhere around you, trees are leaning precariously and falling extremely close to you.', 'Next', 24, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(24, 'What do you do? (QuickTIme)', 'Panic and scream, rooted in place', 25, 'Begin running', 26, NULL, NULL, 1, 5, 'no_image.png'),
(25, 'The trees all fall on top of you and you die. (GAME OVER)', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(26, 'You dart through the trees and their crashing behind you rings in your ears.', 'Next', 27, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(27, 'You come to a slight fork in the middle of the forest. What do you do? (QuickTime)', 'Run back', 25, 'Turn right', 33, 'Turn left', 28, 1, 5, 'no_image.png'),
(28, 'The crashing behind you dies away as you continue to run. You begin to slow to a stop, and emerge into a clearing with a cave on one side and a fire pit, with coals and still-burning embers, in the center. Someone had been here before.', 'Next', 29, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(29, 'What do you do?', 'Call for the others', 30, 'Investigate the cave', 32, 'Investigate the fire pit', NULL, 0, 5, 'no_image.png'),
(30, 'You call the others'' names', 'Next', 31, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(31, 'A huge bear comes charging out of the cave and attacks you, overwhelming you and killing you in the matter of a few seconds. (GAME OVER)', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(32, 'You move towards the cave to check it out. But you are not paying attention to your surroundings, so you accidentally step on a twig, which snaps loudly.', 'Next', 31, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(33, 'The crashing behind you continues as you keep running.', 'Next', 34, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(34, 'There is a fallen tree in the way! What do you do?', 'Climb over it', NULL, 'Jump over it!', 35, 'Jump over it!', 36, 0, 5, 'no_image.png'),
(35, 'You almost make it over the tree, but your jump wasn''t quite high enough. You fall to the ground, feeling one of your ankles twist and grimacing in pain, then look up to see a tree falling right above you. (GAME OVER)', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(36, 'You successfully leap with agility over the tree and continue running, barely breaking your stride in the process.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(37, '"I''m going to find the others."', 'Next', 38, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(38, 'Michelle looked up at your words.', 'Next', 39, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(39, '"I - we''re coming with you," Michelle declared firmly. "You''re not going out there alone. It''s too dangerous. You need the brains." Adrian nodded a little weakly in agreement.', 'Next', 40, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(40, 'What do you do?', 'Convince Michelle to stay back and watch the camp while you take Adrian to find the others', 41, 'Agree', 79, 'Convince Michelle that having Adrian along will just be a burden', 62, 0, 5, 'no_image.png'),
(41, '"Fine," sighed Michelle, turning back to her books. "Take care, okay?"', 'Next', 43, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(42, 'Pick one', 'Adrian', 43, 'Michelle', 63, 'Both', 79, 0, 5, 'no_image.png'),
(43, 'Adrian appears to be hesitant. Though agrees to go anyway.', 'Next', 44, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(44, 'What will you bring with you?', 'Flashlight', 45, 'Maches', 45, 'Phone', 45, 0, 5, 'no_image.png'),
(45, 'You wait for Adrian to grab his blanket, say a goodbye to Michelle, and head for the forest behind the coast on which you were camping.', 'Next', 46, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(46, 'Adrian is shivering. "Hey...Chuwei?" he asks.', 'Next', 47, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(47, '"Yes?" you replied absentmindedly, trying to think of ways to find your friends.', 'Next', 48, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(48, '"Will Michelle be in danger back at the camp?"', 'Next', 49, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(49, '"Nah, she''ll be fine," you say. At the same time, a huge rumble of thunder echoes and a bright flash of lightning slices through the sky, and you and Adrian both instinctively whip around to see the lightning strike the tent Michelle had been sitting in, where a terrified scream issued from. You both dash back to the campsite to find that Michelle is gone and her books strewn about.', 'Next', 50, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(50, 'Breathing heavily, you try to look on the bright side. "She''s not dead," you say, reassuring yourself as well as the terrified Adrian. "She''s just disappeared with the others. C''mon, let''s go," you add and turn away from the smoking tent. "We have even more reason to look for the others now - not that we didn''t have reason before."', 'Next', 51, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(51, ' You both head into the forest after taking a last glance around at the burnt camp.', 'Next', 52, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(52, 'It''s not long before you begin to get a little uneasy. Adrian is shivering besides you and clinging to you, and you find the utter silence in the forest strange. One would''ve thought that, even in the dead of night, there would be at least some sound in the forest.', 'Next', 53, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(53, 'You begin to watch your step, in case you step on a twig or something and make too loud of a sound. Adrian tries to tread carefully, and tries to talk to you a little as well. "Chuwei? How long do you think it would take us to find them?"', 'Next', 54, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(54, '"I don''t know," you reply distractedly.', 'Next', 55, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(55, '"Because, well, I''m really scared, because it''s so quiet right now, and we''re in the middle of a forest in the middle of the night, and it''s cold, and our friends are missing, and we just witnessed Michelle get hit by lightning, and..." he babbles on and on.', 'Next', 56, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(56, 'Suddenly, you notice Adrian is about to step on a twig and break it. What do you do? (QuickTime)', 'Stop him!', 57, 'Let it be.', 59, NULL, NULL, 1, 5, 'no_image.png'),
(57, 'You grab Adrian and lift him off of the ground. He squeaks a little but you cover his mouth and hiss to him, "Watch where you''re going!"', 'Next', 58, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(58, 'You grab Adrian and lift him off of the ground. He squeaks a little but you cover his mouth and hiss to him, "Watch where you''re going!"', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(59, 'Adrian''s foot comes down upon the twig and a loud snap is heard. He freezes, worry and then guilt clouding his expression, and you look around frantically.', 'Next', 60, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(60, 'Adrian''s foot comes down upon the twig and a loud snap is heard. He freezes, worry and then guilt clouding his expression, and you look around frantically.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(61, '61 is error and empty :)', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(62, '"Oh, alright," Michelle signed, interrupting your speech. "We''ll leave him here."', 'Next', 63, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(63, 'What will you bring with you?', 'Phone', 64, 'Flashlight', 64, 'Matches', 64, 0, 5, 'no_image.png'),
(64, 'You watch as Michelle gathers her books, try to reassure a trembling Adrian, and head for the forest behind the coast on which you were camping.', 'Next', 65, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(65, 'Michelle is rifling through her books when she suddenly looks up. "Chuwei, will it be a problem if we leave Adrian back at the camp? I mean, there''s a kind of pattern -- "', 'Next', 66, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(66, 'You are about to shake your head when a huge rumble of thunder echoes and a bright flash of lightning slices through the sky. You and Michelle turn to see the tent in which Adrian had been huddled in go up in flames. You dash back to the camp, but Michelle calls after you, "It''s no use, Chuwei. Either he''s dead or he''s disappeared as well."', 'Next', 67, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(67, 'Despite her blunt words, you still rush to the still smoking tent, and, with a slight sigh of relief, realize that there is no sign of Adrian''s dead body anywhere. "He''s gone," you say, and add "but not dead."', 'Next', 68, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(68, '"Then let''s go look for him," Michelle replied, a little impatiently. "C''mon. There''s nothing you can do here now. We need to hurry, Chuwei," she says more urgently when you don''t move from the smoking tent.', 'Next', 69, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(69, 'You look up with a start. "Right, right. Coming," You and Michelle head off into the forest without a backwards glance.', 'Next', 70, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(70, 'After a while, you break the uneasy silence. "Should we, um, call for them or something?"', 'Next', 71, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(71, 'After a while, you break the uneasy silence. "Should we, um, call for them or something?"', 'Next', 72, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(72, '"Okay, well, what else can we do?" you replied, a little defensively.', 'Next', 73, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(73, '"We have to search for clues," she replied like it was quite obvious. "A footprint, a thread caught on a bush, something to indicate that someone might''ve been there before. And follow a trail that it''ll lead."', 'Next', 74, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(74, 'What are you going to do?', 'Ignore her advice and call for the others..', 75, 'Search quietly for clues.', 77, NULL, NULL, 0, 5, 'no_image.png'),
(75, '"Kevin! Adrian! Jeremy! Xue!" you call again and again, until Michelle clamps a hand over your mouth.', 'Next', 76, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(76, '"What the hell are you doing?!" she hissed, and began walking faster and dragging you along. "You''re gonna get us killed, you moron!"', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(77, 'You turn around and around for clues, until you spot a trail of footprints in the dirt. "Hey, I found something!"', 'Next', 78, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(78, 'Michelle glanced over and shook her head in exasperation. "Those are our footprints, you idiot."', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(79, 'What will you bring with you?', 'Phone', 80, 'Matches', 80, 'Flashlight', 80, 0, 5, 'no_image.png'),
(80, 'You wait as Michelle gathers her books and Adrian grabs his blanket, then you all try to pack up as nicely as possible so that your stuff is secure in case anyone else comes by.', 'Next', 81, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(81, 'You all head into the forest.', 'Next', 82, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(82, '"Okay, so we need to think of ways to find the others." Michelle is thinking out loud. "Any ideas?"', 'Next', 83, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(83, '"Calling out loud?" you suggest, but Michelle shakes her head and looks at you as if you are stupid. "They''d totally find us that way. Hang on -- Chuwei, do you have your phone? Or does either of you have your phone?"', 'Has phone', 84, 'Doesn''t have phone', 95, NULL, NULL, 0, 5, 'no_image.png'),
(84, 'You take out your phone. "Yeah, why?"', 'Next', 85, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(85, 'Michelle grabs your phone from you. "Hey!" you exclaim indignantly. "You don''t even know the password!" Ignoring you, Michelle quickly types in the password, to your surprise, and begins fiddling with the phone.', 'Next', 86, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(86, 'What do you do?', 'Let her use your phone', 87, 'Take your phone back', 90, NULL, NULL, 0, 5, 'no_image.png'),
(87, 'You sigh a little impatiently, tapping your foot as she continues using your phone. After about five minutes, she hands it back to you. "C''mon, let''s go," she said, without explaining what she had been doing.', 'Next', 88, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(88, '"Uh, would you mind explaining to us what''s going on, instead of using our stuff and not telling us what you''re doing with it?" you ask a little indignantly as you and Adrian follow her.', 'Next', 89, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(89, 'Michelle seemed to suppress a snicker before saying "You wouldn''t understand anyways."', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(90, '"Hey, give that back!" you snatch the phone from Michelle, who glares at you and then stalks off. You quickly unlock your phone and check for any damage, but see nothing suspicious.', 'Next', 91, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(91, 'What do you do?', 'Follow Michelle', 92, 'Let her leave', 93, NULL, NULL, 0, 5, 'no_image.png'),
(92, 'You and Adrian hurry to catch up to Michelle after exchanging a glance. "Look, I''m sorry, okay? I just don''t want you messing around on my personal property, that''s all," you try to explain.', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(93, 'You and Adrian watch Michelle walk off alone. Adrian tugs a little on your sleeve, trying to get your attention. "Um, Chuwei?" he asks in a very small voice. "Shouldn''t we be following her?"', 'Next', 94, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(94, 'You glance at Adrian, who looks like a small child with his blanket wrapped around his shoulders and his eyes huge and terrified. "No, she''s been kind of a jerk to us. I think we''re better off without her."', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(95, 'None of you have a phone. "Well, crap," grumbled Michelle. ', 'Next', 96, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(96, '"Why, did you need it for something?" you ask.', 'Next', 97, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(97, '"Yeah, I put tracking devices on all of you while you were asleep...just in case," Michelle replied offhandedly.', 'Next', 98, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(98, '"Y-you did what?" you stammer, shocked at her indifference. "You''ve been keeping tabs on us this entire time?"', 'Next', 99, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png'),
(99, '"Well, yeah," Michelle looks at you oddly. "It was a precaution. And also, I installed an app to keep track of them on each of your phones. While you were asleep." She sighed a little at your indignant expression. "See, this is why I did it in secret. I knew you''d react badly, so why bother telling you in the first place?"', NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'no_image.png');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
