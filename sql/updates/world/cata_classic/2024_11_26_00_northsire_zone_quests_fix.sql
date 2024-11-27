DELETE FROM `quest_request_items` WHERE `ID` IN (3100 /*3100*/, 54 /*54*/, 26393 /*26393*/, 47 /*47*/, 26389 /*26389*/);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES
(3100, 2, 0, 0, 0, 'Ah, you got my letter, $N... good.$B$BThere\'s been an influx of warriors in Elwynn recently--which is good for Stormwind, but bad for the orcs in the area.', 0), -- 3100
(54, 1, 0, 0, 0, 'You have word from McBride?  Northshire is a garden compared to Elwynn Forest, but I wonder what Marshal McBride has to report.$B$BHere, let me have his papers...', 0), -- 54
(26393, 6, 0, 0, 0, 'You look like you\'re in a hurry.  Well, then you came to the right place!', 0), -- 26393
(47, 0, 0, 0, 0, 'Psst!  You have that Gold Dust for me...for me?', 0), -- 47
(26389, 6, 0, 0, 0, 'Have you killed the rampaging orc hordes?', 0); -- 26389

DELETE FROM `quest_request_items` WHERE `ID` IN (3105 /*3105*/, 3104 /*3104*/, 3103 /*3103*/, 3102 /*3102*/, 3101 /*3101*/, 26910 /*26910*/);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES
(3105, 1, 0, 0, 0, 'Ah, so you\'ve arrived, and not a moment too soon, $N. Some of the guards were over here a moment ago and were giving me curious looks... pathetic mundanes.', 0), -- 3105
(3104, 6, 0, 0, 0, 'Hello, $N. I am Khelden. Is there something I can do for you?', 0), -- 3104
(3103, 2, 0, 0, 0, 'Ah, at last you\'ve come. I knew you would find your way to me. The Holy Light shines upon you, and the path you\'ve chosen. These times are harsh--the Burning Legion still has a presence upon Azeroth, the entirety of Kalimdor seeks new ways to defend itself from its own tribulations, and it is up to you to aid as many as you can.', 0), -- 3103
(3102, 2, 0, 0, 0, 'You made it here in one piece, and it doesn\'t look like too many people saw you. Good enough for me. I don\'t like to have much attention drawn to me back here... nice and quiet. I\'m sure you can understand.$B$BHave any trouble yet? I\'m glad to hear not. That\'ll change soon enough.', 0), -- 3102
(3101, 4, 0, 0, 0, 'Finally! We meet face to face, brother to $gbrother:sister;. I welcome you to Northshire. This will be your home for a short time while you learn the ins and outs of how things are done, but know that Stormwind is not far off, and sooner or later, your path will take you there. But until then, be patient... Knight of the Silver Hand.', 0), -- 3101
(26910, 6, 0, 0, 0, 'Hello, $N. Is there something I can do for you?', 0); -- 26910


DELETE FROM `quest_offer_reward` WHERE `ID` IN (26919 /*26919*/, 3103 /*3103*/, 28771 /*28771*/, 28763 /*28763*/, 26914 /*26914*/, 3105 /*3105*/, 28773 /*28773*/, 28765 /*28765*/, 26918 /*26918*/, 3101 /*3101*/, 28770 /*28770*/, 28762 /*28762*/, 26917 /*26917*/, 26910 /*26910*/, 28759 /*28759*/, 28767 /*28767*/, 3102 /*3102*/, 28772 /*28772*/, 28764 /*28764*/, 26916 /*26916*/, 3104 /*3104*/, 28769 /*28769*/, 28757 /*28757*/);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
(26919, 1, 0, 0, 0, 0, 0, 0, 0, 'You\'re a quick learner, $N, and the wounded are fortunate to have your aid. Return to me as you grow stronger and I\'ll teach you other spells.', 57564), -- 26919
(3103, 1, 1, 0, 0, 0, 0, 0, 0, 'As you grow in experience, return to me and I will do what I can to impart my knowledge upon you. Until then, go with compassion in your heart, and let wisdom be your guide. Remember, the world only becomes a better place if you make it so.', 57564), -- 3103
(28771, 21, 1, 5, 0, 0, 0, 0, 0, 'Excellent work, $N. You\'ve turned out to be quite an asset to this garrison. It\'s time for you to train!', 57564), -- 28771
(28763, 1, 1, 0, 0, 0, 0, 0, 0, 'You\'ve bought us a little time, $N, but we\'ve got even bigger problems to deal with now.', 57564), -- 28763
(26914, 1, 0, 0, 0, 0, 0, 0, 0, 'I see you have already mastered Immolation! I look forward to instructing you in the future. Do not forget to return for further lessons as you grow in power.', 57564), -- 26914
(3105, 1, 1, 0, 0, 0, 0, 0, 0, 'As you grow in power, you will be tempted--you must always remember to control yourself. I will not lie--corruption can come to any practitioner of the arcane; especially one who deals with creatures from the Twisting Nether. Be patient, and be prudent... but do not let that repress your ambition.$B$BAs you grow more powerful, return to me and I will teach you more about our ways.', 57564), -- 3105
(28773, 21, 1, 5, 0, 0, 0, 0, 0, 'Excellent work, $N. You\'ve turned out to be quite an asset to this garrison. It\'s time for you to train!', 57564), -- 28773
(28765, 1, 1, 0, 0, 0, 0, 0, 0, 'You\'ve bought us a little time, $N, but we\'ve got even bigger problems to deal with now.', 57564), -- 28765
(26918, 1, 0, 0, 0, 0, 0, 0, 0, 'You\'re a quick learner, $N. Return to me as you grow stronger and I\'ll teach you more about using the Light to vanquish your enemies and strengthen your allies.', 57564), -- 26918
(3101, 1, 1, 0, 0, 0, 0, 0, 0, 'In the meantime, you should know one or two other things. You are a symbol to many here in this land--act accordingly. The Holy Light shines within you, and it will be obvious to both your allies and your enemies.$B$BAlso, as you gain in wisdom and power, you will need to train to learn new abilities. That\'s where I come in. When you feel you\'ve gained some experience here in Northshire, come back to me and I will teach you what I feel you are ready to learn. Good luck... $c!', 57564), -- 3101
(28770, 21, 1, 5, 0, 0, 0, 0, 0, 'Excellent work, $N. You\'ve turned out to be quite an asset to this garrison. It\'s time for you to train!', 57564), -- 28770
(28762, 1, 1, 0, 0, 0, 0, 0, 0, 'You\'ve bought us a little time, $N, but we\'ve got even bigger problems to deal with now.', 57564), -- 28762
(26917, 1, 0, 0, 0, 0, 0, 0, 0, 'I knew you would master Steady Shot quickly. I\'m looking forward to showing you other techniques as you get more experienced in the ways of the hunter.', 57564), -- 26917
(26910, 11, 1, 1, 0, 0, 0, 0, 0, 'So you received my note? Excellent. You\'ve proven yourself quite capable in dealing with those orcs. As you continue to grow in power, I will teach you some new techniques.', 57564), -- 26910
(28759, 21, 1, 5, 0, 0, 0, 0, 0, 'Excellent work, $N. You\'ve turned out to be quite an asset to this garrison. It\'s time for you to train!', 57564), -- 28759
(28767, 1, 1, 0, 0, 0, 0, 0, 0, 'You\'ve bought us a little time, $N, but we\'ve got even bigger problems to deal with now.', 57564), -- 28767
(3102, 1, 1, 1, 0, 0, 0, 0, 0, 'You\'re gonna find a number of outfits that covet our skills, $N. Adventurers, SI:7... heck, even the disorganized rabble wouldn\'t mind a spy or two inside Stormwind. But you remember this: You\'re your own $gman:woman;. Don\'t let nobody bully you into doing something you don\'t wanna do! Besides, we hold all the cards... at least, we do before the game\'s done. Know what I mean?$B$BAnyway, just wanted to introduce myself and let you know that I\'m here if you need any training. Come by anytime.', 57564), -- 3102
(28772, 21, 1, 5, 0, 0, 0, 0, 0, 'Excellent work, $N. You\'ve turned out to be quite an asset to this garrison. It\'s time for you to train!', 57564), -- 28772
(28764, 1, 1, 0, 0, 0, 0, 0, 0, 'You\'ve bought us a little time, $N, but we\'ve got even bigger problems to deal with now.', 57564), -- 28764
(26916, 1, 0, 0, 0, 0, 0, 0, 0, 'Have you mastered the use of Arcane Missiles already? You are a quick study in the arcane arts and you have a promising future ahead. Don\'t forget to return to me for training as you grow in power.', 57564), -- 26916
(3104, 11, 1, 1, 0, 0, 0, 0, 0, 'Haha, I knew my note would not dissuade you from your path. So, you\'re prepared then, are you? Prepared to accept your fate? Prepared to challenge the gods and any other forces that stand before you in the pursuit of knowledge and power?$B$BI will not lie, $N, you will be feared as much as respected. But also know this, I will be here for you when you need training. Simply seek me out as you grow more powerful.', 57564), -- 3104
(28769, 21, 1, 5, 0, 0, 0, 0, 0, 'Excellent work, $N. You\'ve turned out to be quite an asset to this garrison. It\'s time for you to train!', 57564), -- 28769
(28757, 1, 1, 0, 0, 0, 0, 0, 0, 'You\'ve bought us a little time, $N, but we\'ve got even bigger problems to deal with now.', 57564); -- 28757

DELETE FROM `creature_queststarter` WHERE (`id`=375 AND `quest` IN (28786,26919)) OR (`id`=197 AND `quest` IN (3103,28771,28763,3105,28773,28765,3101,28770,28762,26910,28759,28767,3102,28772,28764,3104,28769,28757)) OR (`id`=459 AND `quest` IN (28788,26914)) OR (`id`=925 AND `quest` IN (28785,26918)) OR (`id`=43278 AND `quest` IN (28780,26917)) OR (`id`=915 AND `quest`=26915) OR (`id`=198 AND `quest` IN (28784,26916));
INSERT INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES
(375, 28786, 57564), -- 28786 offered by 375
(375, 26919, 57564), -- 26919 offered by 375
(197, 3103, 57564), -- 3103 offered by 197
(197, 28771, 57564), -- 28771 offered by 197
(197, 28763, 57564), -- 28763 offered by 197
(459, 28788, 57564), -- 28788 offered by 459
(459, 26914, 57564), -- 26914 offered by 459
(197, 3105, 57564), -- 3105 offered by 197
(197, 28773, 57564), -- 28773 offered by 197
(197, 28765, 57564), -- 28765 offered by 197
(925, 28785, 57564), -- 28785 offered by 925
(925, 26918, 57564), -- 26918 offered by 925
(197, 3101, 57564), -- 3101 offered by 197
(197, 28770, 57564), -- 28770 offered by 197
(197, 28762, 57564), -- 28762 offered by 197
(43278, 28780, 57564), -- 28780 offered by 43278
(43278, 26917, 57564), -- 26917 offered by 43278
(197, 26910, 57564), -- 26910 offered by 197
(197, 28759, 57564), -- 28759 offered by 197
(197, 28767, 57564), -- 28767 offered by 197
(915, 26915, 57564), -- 26915 offered by 915
(197, 3102, 57564), -- 3102 offered by 197
(197, 28772, 57564), -- 28772 offered by 197
(197, 28764, 57564), -- 28764 offered by 197
(198, 28784, 57564), -- 28784 offered by 198
(198, 26916, 57564), -- 26916 offered by 198
(197, 3104, 57564), -- 3104 offered by 197
(197, 28769, 57564), -- 28769 offered by 197
(197, 28757, 57564); -- 28757 offered by 197


DELETE FROM `creature_questender` WHERE (`id`=375 AND `quest` IN (26919,3103)) OR (`id`=197 AND `quest` IN (28771,28763,28773,28765,28770,28762,28759,28767,28772,28764,28769,28757, 31139, 31140, 31145)) OR (`id`=459 AND `quest` IN (26914,3105)) OR (`id`=925 AND `quest` IN (26918,3101)) OR (`id`=43278 AND `quest` IN (26917,26910)) OR (`id`=915 AND `quest`=3102) OR (`id`=198 AND `quest` IN (26916,3104));
INSERT INTO `creature_questender` (`id`, `quest`, `VerifiedBuild`) VALUES
(375, 26919, 57564), -- 26919 ended by 375
(375, 3103, 57564), -- 3103 ended by 375
(197, 28771, 57564), -- 28771 ended by 197
(197, 28763, 57564), -- 28763 ended by 197
(459, 26914, 57564), -- 26914 ended by 459
(459, 3105, 57564), -- 3105 ended by 459
(197, 28773, 57564), -- 28773 ended by 197
(197, 28765, 57564), -- 28765 ended by 197
(925, 26918, 57564), -- 26918 ended by 925
(925, 3101, 57564), -- 3101 ended by 925
(197, 28770, 57564), -- 28770 ended by 197
(197, 28762, 57564), -- 28762 ended by 197
(43278, 26917, 57564), -- 26917 ended by 43278
(43278, 26910, 57564), -- 26910 ended by 43278
(197, 28759, 57564), -- 28759 ended by 197
(197, 28767, 57564), -- 28767 ended by 197
(915, 3102, 57564), -- 3102 ended by 915
(197, 28772, 57564), -- 28772 ended by 197
(197, 28764, 57564), -- 28764 ended by 197
(198, 26916, 57564), -- 26916 ended by 198
(198, 3104, 57564), -- 3104 ended by 198
(197, 28769, 57564), -- 28769 ended by 197
(197, 28757, 57564); -- 28757 ended by 197

DELETE FROM `quest_objectives` WHERE `ID` IN (440878 /*440878*/, 440877 /*440877*/, 382171 /*382171*/, 442545 /*442545*/, 442538 /*442538*/, 440867 /*440867*/, 440866 /*440866*/, 381980 /*381980*/, 442547 /*442547*/, 442540 /*442540*/, 440876 /*440876*/, 440875 /*440875*/, 440874 /*440874*/, 382029 /*382029*/, 442544 /*442544*/, 442537 /*442537*/, 440873 /*440873*/, 440872 /*440872*/, 440862 /*440862*/, 442535 /*442535*/, 442542 /*442542*/, 440869 /*440869*/, 440868 /*440868*/, 382396 /*382396*/, 442546 /*442546*/, 442539 /*442539*/, 440871 /*440871*/, 440870 /*440870*/, 382104 /*382104*/, 442543 /*442543*/, 379994 /*379994*/, 379993 /*379993*/, 442533 /*442533*/);
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(440878, 26919, 5, 1, 1, 2061, 1, 0, 0, 0, '', 57564), -- 440878
(440877, 26919, 0, 0, 0, 44175, 5, 0, 0, 0, 'Heal Wounded Trainee', 57564), -- 440877
(382171, 3103, 1, 0, 0, 9548, 1, 0, 1, 0, '', 57564), -- 382171
(442545, 28771, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442545
(442538, 28763, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442538
(440867, 26914, 5, 1, 1, 348, 1, 0, 0, 0, '', 57564), -- 440867
(440866, 26914, 0, 0, 0, 44175, 5, 0, 0, 0, 'Practice Immolate', 57564), -- 440866
(381980, 3105, 1, 0, 0, 9576, 1, 0, 1, 0, '', 57564), -- 381980
(442547, 28773, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442547
(442540, 28765, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442540
(440876, 26918, 5, 2, 2, 20154, 1, 0, 0, 0, '', 57564), -- 440876
(440875, 26918, 0, 1, 1, 44420, 1, 0, 0, 0, 'Learn Spell: Judgement', 57564), -- 440875
(440874, 26918, 0, 0, 0, 44175, 1, 0, 0, 0, 'Practice using Judgement', 57564), -- 440874
(382029, 3101, 1, 0, 0, 9570, 1, 0, 1, 0, '', 57564), -- 382029
(442544, 28770, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442544
(442537, 28762, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442537
(440873, 26917, 5, 1, 1, 56641, 1, 0, 0, 0, '', 57564), -- 440873
(440872, 26917, 0, 0, 0, 44175, 5, 0, 0, 0, 'Practice Steady Shot', 57564), -- 440872
(440862, 26910, 1, 0, 0, 60677, 1, 0, 1, 0, '', 57564), -- 440862
(442535, 28759, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442535
(442542, 28767, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442542
(440869, 26915, 5, 1, 1, 2098, 1, 0, 0, 0, '', 57564), -- 440869
(440868, 26915, 0, 0, 0, 44175, 3, 0, 0, 0, 'Practice Eviscerate', 57564), -- 440868
(382396, 3102, 1, 0, 0, 9555, 1, 0, 1, 0, '', 57564), -- 382396
(442546, 28772, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442546
(442539, 28764, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442539
(440871, 26916, 5, 1, 1, 5143, 1, 0, 0, 0, '', 57564), -- 440871
(440870, 26916, 0, 0, 0, 44175, 2, 0, 0, 0, 'Practice casting Arcane Missiles', 57564), -- 440870
(382104, 3104, 1, 0, 0, 9571, 1, 0, 1, 0, '', 57564), -- 382104
(442543, 28769, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442543
(379994, 12, 0, 1, 1, 95, 15, 0, 0, 0, '', 57564), -- 379994
(379993, 12, 0, 0, 0, 504, 15, 0, 0, 0, '', 57564), -- 379993
(442533, 28757, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564); -- 442533

DELETE FROM `quest_objectives` WHERE `ID` IN (440878 /*440878*/, 440877 /*440877*/, 382171 /*382171*/, 442545 /*442545*/, 442538 /*442538*/, 440867 /*440867*/, 440866 /*440866*/, 381980 /*381980*/, 442547 /*442547*/, 442540 /*442540*/, 440876 /*440876*/, 440875 /*440875*/, 440874 /*440874*/, 382029 /*382029*/, 442544 /*442544*/, 442537 /*442537*/, 440873 /*440873*/, 440872 /*440872*/, 440862 /*440862*/, 442535 /*442535*/, 442542 /*442542*/, 440869 /*440869*/, 440868 /*440868*/, 382396 /*382396*/, 442546 /*442546*/, 442539 /*442539*/, 440871 /*440871*/, 440870 /*440870*/, 382104 /*382104*/, 442543 /*442543*/, 379994 /*379994*/, 379993 /*379993*/, 442533 /*442533*/);
INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES
(440878, 26919, 5, 1, 1, 2061, 1, 0, 0, 0, '', 57564), -- 440878
(440877, 26919, 0, 0, 0, 44175, 5, 0, 0, 0, 'Heal Wounded Trainee', 57564), -- 440877
(382171, 3103, 1, 0, 0, 9548, 1, 0, 1, 0, '', 57564), -- 382171
(442545, 28771, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442545
(442538, 28763, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442538
(440867, 26914, 5, 1, 1, 348, 1, 0, 0, 0, '', 57564), -- 440867
(440866, 26914, 0, 0, 0, 44175, 5, 0, 0, 0, 'Practice Immolate', 57564), -- 440866
(381980, 3105, 1, 0, 0, 9576, 1, 0, 1, 0, '', 57564), -- 381980
(442547, 28773, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442547
(442540, 28765, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442540
(440876, 26918, 5, 2, 2, 20154, 1, 0, 0, 0, '', 57564), -- 440876
(440875, 26918, 0, 1, 1, 44420, 1, 0, 0, 0, 'Learn Spell: Judgement', 57564), -- 440875
(440874, 26918, 0, 0, 0, 44175, 1, 0, 0, 0, 'Practice using Judgement', 57564), -- 440874
(382029, 3101, 1, 0, 0, 9570, 1, 0, 1, 0, '', 57564), -- 382029
(442544, 28770, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442544
(442537, 28762, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442537
(440873, 26917, 5, 1, 1, 56641, 1, 0, 0, 0, '', 57564), -- 440873
(440872, 26917, 0, 0, 0, 44175, 5, 0, 0, 0, 'Practice Steady Shot', 57564), -- 440872
(440862, 26910, 1, 0, 0, 60677, 1, 0, 1, 0, '', 57564), -- 440862
(442535, 28759, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442535
(442542, 28767, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442542
(440869, 26915, 5, 1, 1, 2098, 1, 0, 0, 0, '', 57564), -- 440869
(440868, 26915, 0, 0, 0, 44175, 3, 0, 0, 0, 'Practice Eviscerate', 57564), -- 440868
(382396, 3102, 1, 0, 0, 9555, 1, 0, 1, 0, '', 57564), -- 382396
(442546, 28772, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442546
(442539, 28764, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564), -- 442539
(440871, 26916, 5, 1, 1, 5143, 1, 0, 0, 0, '', 57564), -- 440871
(440870, 26916, 0, 0, 0, 44175, 2, 0, 0, 0, 'Practice casting Arcane Missiles', 57564), -- 440870
(382104, 3104, 1, 0, 0, 9571, 1, 0, 1, 0, '', 57564), -- 382104
(442543, 28769, 0, 0, 0, 49874, 8, 0, 0, 0, '', 57564), -- 442543
(379994, 12, 0, 1, 1, 95, 15, 0, 0, 0, '', 57564), -- 379994
(379993, 12, 0, 0, 0, 504, 15, 0, 0, 0, '', 57564), -- 379993
(442533, 28757, 0, 0, 0, 49871, 6, 0, 0, 0, '', 57564); -- 442533


