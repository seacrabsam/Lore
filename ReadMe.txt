Lore v6.0
(The scholar edition)											       17.02.2006
-------------------------------------------------------------------------------------------------------------------------
						Official Lore Manual
-------------------------------------------------------------------------------------------------------------------------

ORIGINAL AUTHOR: Rook on Earthen Ring (Alliance)
FOLLOWUP AUTHOR: Liise on Argent Dawn (Alliance)
ADDITIONAL DIALECTS FOR TURTLE WOW: Maxie

-------------------------------------------------------------------------------------------------------------------------

Index

[1.0]	What is Lore?
 [1.1]	What languages can I speak?
 [1.2]	How does Lore work?

[2.0]	Installing Lore
 [2.1]	Setting up Lore for use

[3.0]	Advanced settings
 [3.1]	IC/OOc for party, guild and raid
 [3.2]	Translating to yourself
 [3.3]	Showing/hiding the Lore button
 [3.4]	Locking/unlocking the Lore button
 [3.5]	Changing left- and right-click functionality
 [3.6]	Switching auto translation off
 [3.7]	Resetting Lore entirely
 [3.8]	Disabling Lore's command feedback
 [3.9]	Adding/removing languages to/from the tablet
 [3.10]	Setting a language skill (fluency) for your language
 [3.11]	Stuttering, hissing, growling, lisping, word cutting
 [3.12]	Changing the position of the Tablet

[4.0]	General commands
 [4.1]	Changing your current language
 [4.2]	Sending translations to a specific player
 [4.3]	Sending translations to guild, party or raid
 [4.4]	Finding out whether a player knows a language and if they have Lore v5.0+
 [4.5]	Getting a list of languages available to my character
 [4.6]	Cancelling translations
 [4.7]	Leaving certain words untranslated
 [4.8]	List of commands

[5.0]	Questions and Answers

[6.0]	Known issues & troubleshooting

[7.0]	Acknowledgements

[8.0]	Change list

-------------------------------------------------------------------------------------------------------------------------

[1.0]	What is Lore?
	
	Lore is designed to aid Roleplayers in World of Warcraft with the ability to speak in 'languages' other than
	those enabled by Blizzard. Lore contains a set of custom languages and you can make your own languages if you
	wish. So, if you want your character to be able to speak in Demonic, Elemental, or some other exotic language
	like Nerubian, Lore can help you there. This version of Lore also supports the use of dialects and you can
	define how well you master a certain language.

[1.1]	What languages can I speak?

	Lore does NOT allow cross-faction communication! So if you are a Forsaken, you will not be able to understand
	a Night Elf, and vise versa. Even if both set the same language (let's say that an Orc Warlock and Gnome Warlock
	both understand Demonic) they won't be able to understand each other. Cross faction communication is banned by
	Blizzard. Lore has no intention to break the rules. Lore does not allow you to add languages from the opposite
	faction to your tablet (so an Orc can not put Darnassian on the tablet).

	You can put any language of your own faction to the tablet, but you can only speak and understand it if you
	naturally know that language. E.g. a Gnome can put Darnassian on her tablet, but neither speak it nor get
	translation of it via Lore.

[1.2]	How does Lore work?

	When you have a custom language selected, the text that you type will be displayed with a language tag followed
	by what the text translates to in that language. So for example, when you type "I show no mercy" the result is
	"[Demonic] A ashj me nagas". Other people will see it just like that. Those people who have Lore v5.0 or higher
	and 'understand' this language will automatically get a translation of it. If you know someone does not have
	this version, or does not have Lore at all, you can set them as interpreter (explained later). They will then
	get a /whisper with the translation whenever you say something in Demonic. You can speak these custom languages
	in /say, /yell and optionally in /party, /raid, /guild. Lore does translations BEFORE the text enters Blizzard's
	language functions.

-------------------------------------------------------------------------------------------------------------------------

[2.0]	Installing Lore

	Along with this readme file you should find the following files:
		AddingLanguages.txt, Bindings.xml, Lore.lua, Lore.toc and Lore.xml
	You will need the following file (downloadable from where you found this version of Lore):
		dialects.lua
	Locate the folder where your copy of World of Warcraft is installed. Copy or extract the files in here:
		\World of Warcraft\Interface\Addons\Lore
	NOTE: When extracting, you can do it straight to \World of Warcraft\Interface\Addons\ because the zip file
	will create the folder \Lore itself.
	If you happen to use the AddOn called 'Ephemeral', it is strongly recommended to install a patch to that
	AddOn in the \Ephemeral folder. You can find this patch in the same place where you downloaded Lore.

	The dialects.lua file has been separated from the rest of Lore on purpose to prevent updates from overwriting
	your own custom-defined languages which you have added to the dialects.lua file. Once you have dialects.lua
	you do not need to download it again for updates, but it is recommended to have the latest version that is
	available.
	NOTE: Lore version 5.2 recommends the latest version of dialects.lua to be downloaded to make its new
	language skill feature to work as intended. If you already have a modified dialects.lua you can also simply
	copy the language sets for Common, Orcish and other defaults to your own file (they are to be found nearly at the
	end, after the scottish dialect).

	When you start up your copy of World of Warcraft, press the 'AddOns' button that you find at the left bottom
	of your character selection screen. From here you can Enable Lore (place a checkmark with Lore). If Blizzard
	has updated their version numbers it is possible that Lore is listed as 'out of date'. Simply check the
	checkmark at the right top of that window to disable version checking.

[2.1]	Setting up Lore for use

	The first time you have Lore enabled you will see the 'Lore button' at the middle of your screen. You can drag
	it to the place where you want it (a good place is just above your character's name). If you cannot drag it,
	please type "/lore unlock", but that should not be necessary the first time.

	Once the lore button is at a place you like, it is recommended to lock it so you can't move it by accident.
	Locking also enables you to left click the button (a special function can be assigned to that). Lock the
	Lore button by typing "/lore lock".

	Now is probably a good time to assign some functions to right- and left-clicking the Lore button. For now,
	type "/lore left cycle" and "/lore right int". Later on in this manual you find more information on this.

	Next, you want to tell Lore what languages your character is supposed to know. To do this, you add these
	languages to the so called 'tablet'. The tablet is the pop-up tooltip that you see when you hover over the
	Lore button. Initially there are no languages there. If your faction is Alliance, type "/lore tablet Common"
	and if your faction is Horde, type "/lore tablet Orcish". These are the basic languages, spoken by almost
	everyone. It is a good idea to have those on your tablet. Then add whatever languages you want your character
	to know, e.g. "/lore tablet Demonic". If you made up your mind and you want to remove a language, just repeat
	the command and it will remove the language again.

	Finally you can set your character's fluency in a specific language. This is optional and explained later on.
	The default fluency in each language is 100% and it is recommended to keep it that way unless your character
	is bad at a language.

-------------------------------------------------------------------------------------------------------------------------

[3.0]	Advanced settings

	Lore supports a series of settings that allow you to have Lore behave in a bit different fashion than
	what is default. Everyone has their own preferences and these functions help to customise Lore to that.

[3.1]	IC/OOc for party, guild and raid

	By default you will not be talking your custom languages in party, raid and guild chat, even if you have
	your current language set to those. However, some players and guilds like to stay 'in character' on their
	guild channel and in their party chat.

	If you want your character to be able to speak e.g. Demonic in guild chat and party chat, you can type the
	following command: "/lore screen off". Of course, if you want to undo this, you can type "/lore screen on".
	'Screen' is a shorthand for 'screening'. You can also use the function as a toggle (by typing "/lore screen").
	The latter may be handy if you want to use it in a macro, to be able to quickly switch between the two.
	NOTE: it is also possible to assign e.g. right-clicking the Lore button to this. The command for that is
	"/lore right screen".

[3.2]	Translating to yourself

	Normally, when you type something in a custom language, you will not be able to read what you typed anymore.
	For this purpose you can enable the 'translation to yourself' functionality. To translate to yourself, type:
	"/lore self on". To disable this functionality type "/lore self off". You can also use it as a toggle function:
	"/lore self". This feature does not send translation every time you type something, only when you type in a
	custom language.

[3.3]	Showing/hiding the Lore button

	The lore button is handy if you want to see on your screen what your current (custom) language is, and to
	quickly execute Lore commands by left-/right-clicking. However, not everyone wants this button to show on
	their screen, especially those who already have a lot of AddOns and don't want to clutter their screen.
	Hiding the Lore button is done by typing "/lore hide".
	Showing the Lore button is done by typing "/lore show".

[3.4]	Locking/unlocking the Lore button

	If you want to move your Lore button to another place on your screen, it has to be unlocked first. If you want
	to be able to use its left-click functionality and prevent that you accidentally drag it out of position, you want
	to lock it.
	Unlocking is done by typing "/lore unlock"
	Locking is done by typing "/lore lock"

[3.5]	Changing left- and right-click functionality

	This function allows you to change what happens when you left-click or right-click on the Lore button.
	A recommend choice is given in chapter [2.1], but you can of course customise it as you like.
	The basic commands are "/lore leftclick" and "/lore rightclick" (but you can also use the shorter version
	"/lore left" and "/lore right"). This command requires one parameter. The choices are as follows:
	none -> do nothing when you click
	cycle -> cycle (change) languages when you click
	int -> add/remove a targetted character as interpreter
	screen -> toggle screening (see chapter [3.1])
	reset -> reset interpreters and translation settings
	self -> toggle translating to yourself
	stutter -> toggle stuttering
	hiss -> toggle hissing
	growl -> toggle growling
	lisp -> toggle lisping
	cut -> toggle word cutting

	Example: "/lore left cycle"

[3.6]	Switching auto translation off

	Auto-translation is a feature that has been introduced with Lore version 5.0. Basically it automatically
	shows you a translation if another player speaks in a custom language that you know. The other player also
	needs to have at least Lore v5.0 for this to work, otherwise you won't see any translations. It is recommended
	to keep this feature switched on, but if you really want to you can switch it off by using the command:
	"/lore auto off".
	Switching auto translation to yourself back on is done with "/lore auto on".

[3.7]	Resetting Lore entirely

	It is possible to reset Lore entirely, changing all settings back to their default and clearing all your
	characters' tablets. This is not recommended, but in case 'something' is wrong with your copy of Lore and
	you are just getting errors and other problems, executing this command MAY help. It is not a guarantee, but
	it is one of the first things to try if you have a problem.
	The command is "/lore default"

[3.8]	Disabling Lore's command feedback

	With a lot of actions that you take within Lore, you see a line of text on your screen. This can be something
	like "Lore <> CharacterName set as interpreter". If you are advanced enough a user and you don't request lore
	to confirm that this or that function has been accepted (or you simply don't like spam) you can easily switch
	it off by typing "/lore inform off". If you make up your mind you can always turn command feedback back on by
	typing "/lore inform on".

[3.9]	Adding/removing languages to/from the tablet

	For Lore to really work the way it is designed to work, you should make a good habbit of putting all the
	languages your character knows onto the tablet. This includes the Faction Common language (Common/Orcish).
	There is only one command for this, that adds as well removes these languages. It works as a toggle function.
	If the language you specify is not yet on the tablet, it will be added. Otherwise removed.
	The command is "/Lore tablet" and as parameter you type the language name.
	Example: "/lore tablet Elemental"

[3.10]	Setting a language skill (fluency) for your language

	If your character knows a language but is less fluent in it, you may want to think about telling lore that
	your character hasn't mastered that language entirely. This generally works for all languages, as long as
	they are not Blizzard languages that your character normally can't know. So, when you're an Orc and want
	to master Gutterspeak for 25%, it will not work. But if you're a Forsaken you can do that. You can also
	adjust your fluency in your Faction Common language if you wish. It will at this time not influence what
	NPCs say.

	To change a language's fluency, you FIRST have to add it to your tablet (See chapter [3.9])
	Then you select that language (see chapter [4.1])
	After that you type the command "/lore skill" followed by a number ranging from 0 to 100.
	Example: "/lore skill 75" will set your current fluency in that language to 75%

	In practise this means, that when you hear that language, you only understand about 75% of it, and when you
	speak it other people will only understand roughly 75% of it. Roughly, because it is based on a random
	generator, and sometimes more than three quarters of the words is left untranslated, other times less.

	Note that if the speaker and listener BOTH have a handicap, it can make understanding each other even more
	difficult. Naturally, if one cannot speak it well to start with and someone who hears it doesn't understand
	much of the language, the effect will be doubled.

	To set your language's fluency back to the default you type "/lore skill 100".

	NOTE: If you want to disable your character from understanding any of the languages he/she naturally knows,
	you should add the language to your tablet and change it's fluency to 0. This can be useful for a Gnome who
	has never before heard Gnomish (set Gnomish to skill 0) or a Dwarf who was raised in a cupboard and they
	spoke only Dwarvish to him (set Common skill to 0). Try to imagine walking near the bank and not understand
	anything anyone is saying in Common? That's exactly what will happen.

[3.11]	Stuttering, hissing, growling, lisping, word cutting

	If you want your character to stutter, hiss, growl, lisp or automatically say e.g. swimmin' instead of swimming,
	you can use the Lore Language Effects:
	"/lore effect stutter" - Switches auto-stuttering on/off.
	"/lore effect hiss" - Switches automatic hissing on/off.
	"/lore effect growl" - Switches automatic growling on/off.
	"/lore effect lisp" - Switches automatic lisping on/off.
	"/lore effect cut" - Switches automatic word cutting on/off.

	I think everyone knows what stuttering, hissing and growling is. What it looks like to have Lore take care of
	this, you can of course easily see to just switch it on and try it out. Lisping may not be known to all
	non-native English speakers. Lisping is the inability to pronounce the letters 's' and 'z'. Instead of these,
	these are pronounced as 'th'. The cutting of words is nothing more than removal of 'g's and 'k's when they
	appear after an 'n'. It changes for example "I was swimming like nothing mattered" into "I was swimmin' like
	nothin' mattered".

	There is one additional command, this is for the stuttering. It is possible to tell Lore how badly your
	character stutters:

	"/lore stutter 50"

	You can give a number ranging from 1 to 100. 100 means that your character will stutter almost every word. If
	you put a low number, e.g. 10, it will let your character only occasionally stutter a word. The stutter
	frequency is by default 50.

	You can assign effects to left-clicking and right-clicking if you wish. See chapter [3.5] for the details.
	You can also define hotkeys to toggling these effects on/off. This is done in the keybindings that you find
	in Blizzard's settings menu.

[3.12]	Changing the position of the Tablet

	By default, the Tablet (tooltip) will show up to the right and below the Lore Button. If you wish to change
	this positioning you can use the following command:
	"/lore position topleft" -> to change the position to above the button, left aligned.
	"/lore position topright" -> to change the position to above the button, right aligned.
	"/lore position bottomleft" -> to change the position to the left and below of the Lore Button.
	"/lore position bottomright" -> to change the position back to the right and below of the Lore Button.
	"/lore position tooltip" -> to change the position of the Tablet to Blizzard's default tooltip corner.

	The command 'position' can be shortened to 'pos', and the parameters can be shortened to 'tl', 'tr', 'bl', 'br'
	and 'tt'.

-------------------------------------------------------------------------------------------------------------------------

[4.0]	General commands

	These commands are those you may want to use on a more frequent basis than what you find in the previous
	section. Some of them can be linked to left-/right-click functionality for faster and easier access. If you
	don't find a command in this section, check the previous section. It may be listed there.

[4.1]	Changing your current language

	Your character may be speaking Dwarvish. But most likely they don't speak Dwarvish all the time. So you
	sometimes want to switch to Common, or perhaps even to Dark Iron. There are several ways to change your
	language:
	- Selecting the language from Blizzard's chat pop up window (the original language menu)
	- Clicking on your tablet to cycle to the next language (if you have set click functionality, see [3.5])
	- Using the command "/lore cycle" (does the same as explained in the line above)
	- Typing the language command: "/lore language". You have to type the language name after this command
	  as a parameter. Example: "/lore language Dwarvish"

[4.2]	Sending translations to a specific player

	When you type like this: "[Demonic] A ashj me nagas", the chance that anyone around you understands even
	the slightest thing of it is very very small. However, another Warlock would most likely be able to know
	what you are talking about if you are talking in the language of Demons. Well, to make them understand,
	you can add them as 'interpreter' or translator (they could translate then to the rest of the people who
	don't understand you).

	The command for this is "/lore interpreter" or in short "/lore int". You can use it in two ways:
	- Type a character's name after this command (E.g. "/lore int BoyJorge")
	- Have a character selected (and type "/lore int").

	If the character is not yet an interpreter, Lore will set him/her as interpreter. If the character is
	already an interpreter, the character will stop being an interpreter. (So it is a toggle function).
	You can set multiple people as interpreters and the Lore Tablet shows you who are currently set as
	interpreters.

	NOTE: This function is useful mostly when talking to people who do NOT have Lore installed, or have a
	version older than 5.0. People who have Lore 5.0 or higher will have the auto-translate feature and
	generally won't be needing you to set them as interpreter.

	To check whether someone has Lore version 5.0 or higher you can type "/lore ver" followed by the
	character's name. To check whether some character knows the language you speak (and thus gets the
	autotranslation) you type "/lore check" followed by the character name. Example: "/lore check BoyJorge".
	If BoyJorge has the recent Lore version installed you may get something like this back:
	"I know the following languages: Common, Dwarvish, Dark Iron(45%)". This latter command requires the
	opposing player to have at least Lore version 5.1 installed.

[4.3]	Sending translations to guild, party or raid

	Optionally you can broadcast translations of everything you are saying in custom languages to your
	guild, party or raid. The commands to do this are as follows:
	"/lore to party" - Send your translations to the party
	"/lore to raid" - Send translations to the entire raid
	"/lore to guild" - Send translations to the guild chat
	"/lore to none" - Disable this feature, don't send 'mass' translations

	On the tablet you can easily see to which place you are sending translations, if any.

[4.4]	Finding out whether a player knows a language and if they have Lore v5.0+

	When you're communicating with a person (or a group of people) you may want to know whether a character
	has Lore 5.0+ installed (so they have the auto-translation feature) and if they actually 'know' the
	custom language that you speak.

	To find out what Lore version a player has, type "/lore ver" followed by the character's name. If you
	do not get any answer, it means that the player either does not have Lore running, or has a too old version.

	To find out what languages a character knows, you can type "/lore check" followed by the character's name.
	Unless the player has an older Lore version than 5.1, you will get a reply with a list of languages.
	Languages mention their fluency if it is not 100%.

	You can test both of these commands on yourself by typing "/lore check" followed by your own character name.

[4.5]	Getting a list of languages available to my character

	If you want to know what languages that are available to you, you can type "/lore list".
	NOTE: Some cross faction languages may be listed, but those cannot be added to the tablet.

[4.6]	Cancelling translations

	At the end of your conversation or roleplay session you probably no longer want to send translations directly
	to the interpreters (assuming you had any set) or e.g. party chat. You can do this by manually removing the
	interpreters again (see chapter [4.2]) and resetting the mass translation (see chapter [4.3]) but you can
	also do this with one command: "/lore reset". You can assign this to left-/right-clicking of the Lore button if
	you find that useful (see chapter [3.5] for that).

[4.7]	Leaving certain words untranslated

	If you are typing something that includes a character's or place's name you may want to leave that name
	untranslated. You can do this by typing an '=' or '$' sign directly in front of a word.
	Example: When you type "I show =Stormwind no mercy" it will come out as:
	"[Demonic] A ashj Stormwind me nagas".

	NOTE: Bad fluency in the spoken language may overrule this.

	It is also possible to start a sentence with double parantheses '((', which renders it OOC and the test on that
	line should not be translated, but may at this moment be affected by bad fluency neverteless.

[4.8]	List of commands

	You can get a list of Lore commands with short descriptions by simply typing "/lore".

-------------------------------------------------------------------------------------------------------------------------

[5.0]	Questions and Answers

	Q: How do I...?
	A: First read the previous chapters. If the answer is not there, then look here again.

	Q: Can I talk cross-faction with Lore? (Allicance to Horde / Horde to Alliance)
	A: No. That is forbidden by Blizzard. Lore does not support this.

	Q: What is the difference between a language and a dialect?
	A: A language is a 'full set of words'. Whatever you type, everything will be translated. A dialect is
	   merely a group of words that will be replaced by something else, all other words stay the way they
	   are typed. So, with a dialect, it could replace "Do you like the stove yourself?" to
	   "Do ye like da stove yerself?". Dialects are also not translated. They stay as they are, everywhere.

	Q: Can I whisper in a custom language?
	A: No. You can't whisper in e.g. Gutterspeak or Gnomish either, even if you're not using Lore. I cannot
	   change that, and I thought it would be more logical to not implement that for custom languages either.
	   It would only bring confusion.

	Q: What is this Tablet and where do I find it?
	A: The Tablet is a tooltip pop-up that appears when you hover with your mouse cursor over the Lore button.
	   On it you can see some of the important settings as well as to whom you're sending translations.

	Q: How do I know if someone else has Lore, how do I know if they understand me?
	A: Check chapter [4.4]

	Q: How do I change the colour of the auto-translations and translations to myself?
	A: This cannot currently be done from within the game, but it is not difficult. If you open the Lore.lua
	   file into a text editor, among the first lines you will see the following words: Lore_Color_R,
	   Lore_Color_G and Lore_Color_B. They have values behind them, which are the RGB values for the translations.
	   Each of these values can be changed into something ranging from 0.0 to 1.0. Save the file. The next time
	   you load your character in the change will have taken effect.

-------------------------------------------------------------------------------------------------------------------------

[6.0]	Known issues & troubleshooting

	Known issues:
	- Linked items show up as scrambled text in translation to yourself.
	- There is an incompatibility issue between Lore and the AddOn Ephemeral. If you use both, please
	  download the 'Ephemeral fix' from where Lore is downloadable. That should fix your problem.
	- Received translations are not checked vs. your Language Skills. This because they don't contain language info.
	- Using %T works alright, but returns %T to self if translating to self.
	- Receiving an auto-translation while being AFK results in an error box (Interface\FrameXML\ChatFrame.lua:1357...).
	  At this moment I don't have a solution for that yet. Error box can just be closed and playing can be resumed.
	  Lore will also keep working after this.

	Problemsolving:
	* Problem: I installed Lore, but it does not load when I enter the world.
	* Solution: It is likely disabled in your AddOns options. Go to the character selection screen, click the
	  'AddOns' button at the left bottom corner of your screen. Select Lore, and select the option to 'ignore
	  version checking' (this allows you to use 'out of date' versions). Blizzard updates their UI version
	  number all the time and I don't want to keep uploading a new version of Lore each time they do, so it
	  will go out of date but that shouldn't matter. Also a new patch may reset this.

	* Problem: I get an error on my screen, mentioning something
	  like "argument #1 to `getn' (table expected, got string)".
	* Solution: Type the command "/lore reset". If that doesn't work, you can try "/lore default". If that also
	  doesn't work, please check that you have downloaded the dialects.lua file and that it is in the same
	  directory as the rest of Lore.

-------------------------------------------------------------------------------------------------------------------------

[7.0]	Acknowledgements

	I want to send my personal 'thanks' to the people who have contributed in ways to help me make Lore into
	what it is today.
	- Blizzard for its creation of a magnificent fantasy world and game, as well as allowing for AddOn customisation.
	- Rook for starting the Lore project, without her I think there would be no Lore today.
	- Hiutale for RL support and helping with testing when it was needed
	- Nysae for online support, sparking inspiration as well as several hours of testing
	- SilverShadow for the help in transfering authorship of Lore
	- AlphaMaelstrom for support, useful feedback and the compliments
	- LuckyArts for introducing a solution to make 'word untranslating' possible as well as dealing with special letters
	- Anidrin for piecing together a dialect. (still waiting to see more of those)
	- Galzek for adding even more dialects.
	- Rabidlemming who inspired me to start working on a language skill implementation
	- Shaodahr for compliments and other positive feedback
	- Dark Imakuni just for having such a cute avatar ^.^
	- and finally YOU, for reading the manual (sure you did *grins*), downloading and using Lore! Without you it'd all be wasted time.

-------------------------------------------------------------------------------------------------------------------------

[8.0]	Change list


	Lore v6.0 ---

	 <> Small fix to prevent wrong languages being shown/spoken when switching characters.

	 <> A number of special characters have been added to the filters to benefit the French roleplayers.

	 <> 'LangFilter' functionality has been added. Language knowledge level can now be set for languages on the tablet. (Languages on the tablet will be reset upon first use of this version).

	 <> Your faction's default languages can now be added to the tablet. Non-native languages can not be spoken, but auto-translation works for these between lore 6.0+ users.

	 <> The altwords section in the dialects.lua file now accepts apostrophes. Note, that they are to be used only in the 'new' section.

	 <> Item links should no longer generate an error. They are replaced by some funny word in custom languages. However, in translation to self it doesn't look so good yet.

	 <> A new .lua file has been added to the project. This file contains a substitute set for Blizzard languages, used when hearing or speaking a language you don't master.

	 <> Lore now allows you to stutter, hiss, growl, lisp and cut off words (just not all at the same time). Toggles can be keybound, as well as assigned to right-/leftclicking.

	 <> The ReadMe.txt document has been entirely rewritten, it should be a lot easier to read and find information you are looking for. It is recommended to at least skim over it.

	 <> The position of the Tablet can now be changed to be to the left as well as top of the Lore Button, or to be in the default tooltip location.

	 <> The screening setting is now saved between sessions.

	 <> The AddOn Eloquence should no longer interfere with Lore's auto-translation feature (Adjustment done Lore-side).


	Lore v5.1 ---

	 <> Small fix to the UI show/hide function.

	 <> New command to switch auto translation to yourself on/off: /lore auto [blank/on/off].

	 <> Status of auto translation to yourself has been added to the tablet.

	 <> New command to check player's language understanding (knowing they have Lore 5.0 or higher does not mean they understand the language you speak). /lore check (chk) [player_name]. Only returns an answer if the specified player has Lore 5.1 or higher.

	 <> Made a change to the way Lore joins its channel. It should no longer mess up existing channels and remember the last used channel it was on.

	Lore v5.0 ---

	 <> Lore has been enriched with auto-translation, a feature I dubbed "The sky is the limit". I upped the version's main
	    digit for this, because of it's influence within the Lore project. All former releases have become seriously outdated
	    as Lore v5.0 (and later versions) will flourish at their best if other Lore users are also using Lore 5.0 or higher.
	    Auto-translation works ONLY if both the speaking and the listening party have at least Lore 5.0.

	 <> The /lore version command now optionally takes a parameter. "/lore ver Playername" will now request from the given
	    player their Lore version number. This helps you detecting whether a certain player is "Lore-Sky" enabled. If no version
	    number returns on your screen, it means they either have an outdated version (4.3 or lower) or no Lore installed at all.

	 <> A substitute version of Ephemeral.lua has been provided for people using the Ephemeral AddOn. Due to Ephemeral unregistering
	    some important functions, it causes some unwanted effects if used in it's original form. Downloading the file you find
	    here solves this problem (I implemented a few lines so they work well together).

	 <> A Lore.NOPATCH file has been added to the package, which should have Lore disregard Blizzard version checking.

	Lore v4.3 ---

	 <> Lore now accepts the usage of Dialects in addition to Languages. Dialect names start with an asterisk (*). Example: *Scottish

	Lore v4.2 ---

	 <> = and $ typed straight in front of a word leaves the word untranslated. Example: "I go to =Stormwind" -> Stormwind is not translated. (Courtesy of LuckyArts)

	 <> German characters (Ö,Ä,Ü, ß) will now pass through alike regular alphabet letters. (Courtesy of LuckyArts)


	Lore v4.1 ---

	 <> Added the command /lore version (ver). This command shows the version number to the user.

	 <> Lore version is now also showing when Lore is loaded

	 <> Added the command /lore default. This command resets Lore entirely to the default settings.

	 <> Language problem fixed: Selecting Blizzard defined and Faction Common languages from the language menu now sets the correct language.

	 <> The selected language is now showing up in RED if translators are still defined since last session. This to help the user notice that they may be sending translations unintended.


	Lore v4.0 ---

	 <> The Reset command has been changed to have a different function (reset translation settings only, rather than everything including languages the character knows). This makes it a handy command to use after a rp encounter.

	 <> The /lore command now gives the correct list of commands and parameters.

	 <> The /lore command now gives a short explanation of what each command does.

	 <> The State command has been taken out of use. It was not working well and is mostly obsolete, specifically if you add your faction's common language to your tablet ( /lore tablet )

	 <> The tablet now mentions whether translations are sent out to party, raid or guild.

	 <> The commands Si, Ni and New have been taken out of use. The command Interpreter (int) now singlehanded replaces them. Only one command to remember instead of four, seemed better. The working of int is explained above.

	 <> The currently Specified language is no longer whispered. See for explanation of the reasons above.

	 <> Selections in the Tablet are 'grayed' in the case that no entities are chosen.

	 <> Keybindings have been changed. There is now a keybinding for addition/removal of interpreters, for cycling of languages, toggling screening and for resetting translation settings.

	 <> Right clicking the tablet no longer switches screening mode, but by default now adds/removes <target> as interpreter.

	 <> The new commands Leftclick and Rightclick can be used to customise left-/rightclicking. Defaults are leftclick=cycle, rightclick=interpreter. User can e.g. set leftclick to interpreter and rightclick to reset.

	 <> Added a command /lore self [blank/on/off]. This command switches translation to yourself on/off, in case you may want to scroll up later and still understand what you said yourself. The state is saved between sessions.

	 <> A warning is now shown upon entering the world, if there are still interpreters in your list from last session.

	 <> Inform command added. This enables/disables Lore's feedback to the user upon executing a (typed) command.


	Lore v3.0 ---

	 <> Removed the setlanguage command.

	 <> Removed the toparty command.

	 <> Removed the showparty command.

	 <> Added the to command. This option allows you to optionally send a translation to guild, party or raid chat.

	 <> Added the screen command. When enabled, all chat to party, raid and guild will be issued in faction Common without changing your specified language for say, yell and whisper.

	 <> Added the list command. This option displays all in-game and Lore languages available to your character.

	 <> Integrated katana's modified version of jINx's LanguageCommand. This change allows the use of the superior /language method of designating your language. NOTE: this change has not been extensively tested with a standalone version of LanguageCommand.

	 <> Added the Tablet. This is a configurable frame tied to the current language and the new cycle feature.

	 <> The Tablet introduces functionality to designate and cycle through a character-specified list of languages through the tablet and cycle commands as well as an optional key binding.

	 <> While locked, you can cycle to the next language on the Tablet by left-clicking on it. You can toggle screening by right-clicking.

	 <> The Tablet now allows viewing of your interpreters and languages assigned to the Tablet. To view these details, mouse over the Tablet.

	 <> Added the Titan alternate title to Eredun. Blizzard uses the same wordlist for both languages.


	Lore v2.0 ---

	 <> Any time translating is enabled, the in-game language is set to Common for the best effect.

	 <> Languages can now be chosen from the in-game language-selection menu.

	 <> In dialects.lua, languages can be optionally specified for inclusion on the in-game language-selection menu.

	 <> Added the Nerubian language to dialects.lua.

	 <> Combined the Demonic and Draconic languages as they already used the same wordset.

	 <> Identified an irregularity with the wordlist for 5-letter words. If there are exactly 16 words in it, the first one is always used. To avoid this, an additional word was added to or removed from Demonic and Thelassian.

	 <> Added a key bindable ability to maintain multiple interpreters simultaneously. You can add and remove individual interpreters via the /lore add [name] command.


	Lore v1.7 ---

	 <> The Lore state/enable binding now displays the current language when translation is reenabled.

	 <> Setting a language now automatically enables translating.


	Lore v1.6 ---

	 <> The status of the toparty option now similarly affects guild and raid chat.

	 <> The setinterpreter command/key binding now properly recognizes the enemy faction when not PvP enabled.

	 <> Emotes are no longer modified while translating is enabled.


	Lore v1.5 ---

	 <> Added language-specific keyword support; you can now specify words that will not be translated by Lore. For example: in Tier, "ysera" will always appear as "ysera".

	 <> Added language-specific altword support; you can now specify words that will be replaced with a designated translation. For example: in Tier, "druidic" will translate as "tier".

	 <> Updated the AddingLanguages.txt file with keyword and altword tutorials.

	 <> Added a key bindable option to set your target as your current interpreter.

	 <> Added slash command options for toggle language and set interpreter options.


	Lore v1.4 ---

	 <> Changed the interpreter event to not generate the 'No player named X is currently playing' and 'You whisper to X: text'. Note that this is aimed at a single chat frame; if you have multiple chat frames set up to show whispers, system messages or say, the notification blocking will not be complete currently.

	 <> Updated dialects.lua with the Draconic and Thelassian languages, courtesy of Blizzard.

	 <> Added a few words to Tier; this is partly because previously the 6-letter word for Tier would always be the first one in the list. This appears to be related to the number of entries that were in the list, as adding one fixed the anamoly.


	Lore v1.3 ---

	 <> Added myAddOns support.

	 <> The toparty option no longer generates the default notification if you aren't in a party.

	 <> Refined the hash algorithm to even out distribution.

	 <> Key bindings set up; you can now configure bindings to toggle translation and display current state.

	 <> Lore_State is now saved between sessions.

	 <> Added the AddingLanguages.txt tutorial file.


	Lore v1.1 ---

	 <> Fixed the capitalization applicator to work when the word resulting from a translation contains non-alphabetical characters; for example, the 6-letter word result "lok-mod" would previously receive capitalization incorrectly due to the hyphen. This fix allows any number of non-alphabetical characters to be present in a result word; capitalization will pass over them and continue on the next alphabetical character.

	 <> Languages are now properly stored in dialects.lua.

	 <> Languages can now have alternate titles defined. When setting a language with /lore setlanguage, the title entered will be the one displayed in the language tag upon speaking.
	    Example:
		/lore setl elemental
		/s I'm honored.
		...translates to "[Elemental] G'k ven'tiro.", whereas
		/lore setl kalimag
		/s I'm honored.
		...translates to "[Kalimag] G'k ven'tiro."

	 <> Added the Tier (Yserran / Druidic) language.

-------------------------------------------------------------------------------------------------------------------------
