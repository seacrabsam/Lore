-- defaults.lua
-- Create language tables for use by the Lore AddOn.

---------------------------------------------------------------------------------
--
-- This file contains a substitute for languages that Blizzard has enabled for players. These are not
-- exactly the same as what you would normally see, but close enough to make it appear so. These languages
-- are not replacing the original languages, the keywords that you find here are only used to fill up
-- the gaps in your character's language knowledge, if your character has any.
--
---------------------------------------------------------------------------------

-- Language: Common - courtesy of Blizzard
Lore_Archive["Common"] = {
	[1] = { "a", "e", "i", "o", "u", "y" };

	[2] = { "lo", "ne", "ve", "ru", "an", "ti", "me", "lu", "re", "se", "va", "ko" };

	[3] = { "vil", "bor", "ras", "gol", "nud", "far", "wos", "mod", "ver", "ash", "lon", "bur", "hir" };

	[4] = { "nuff", "thor", "ruff", "odes", "noth", "ador", "dana", "vrum", "veld", "vohl", "lars", "goth", "agol", "uden" };

	[5] = { "wirsh", "novas", "regen", "gloin", "tiras", "barad", "garde", "majis", "ergin", "nagan", "algos", "eynes", "borne", "melka" };

	[6] = { "ruftos", "aesire", "rothas", "nevren", "rogesh", "skilde", "vandar", "valesh", "engoth", "aziris", "mandos", "goibon", "danieb", "daegil", "waldir", "ealdor" };

	[7] = { "novaedi", "lithtos", "ewiddan", "forthis", "faergas", "sturume", "vassild", "nostyec", "andovis", "koshhvel", "mandige", "kaelsig" };

	[8] = { "thonriss", "ruftvess", "aldonoth", "endirvis", "landowar", "hamerung", "cynegold", "methrine", "lordaere" };

	[9] = { "gloinador", "veldbarad", "gothalgos", "udenmajis", "danagarde", "vandarwos", "firalaine", "aetwinter", "eloderung", "regenthor" };

	[10] = { "vastrungen", "falhedring", "cynewalden", "dyrstigost", "aelgastron", "danavandar" };

	[11] = { "wershaesire", "thorlithtos", "forthasador", "vassildador", "agolandovis", "bornevalesh", "farlandowar" };

	[12] = { "nevrenrothas", "mandosdaegil", "waldirskilde", "adorstaerume", "golveldbarad" }

};

-- Language: Orcish - courtesy of Blizzard
Lore_Archive["Orcish"] = {
	[1] = { "a", "n", "g", "o", "l" };

	[2] = { "ha", "ko", "no", "mu", "ag", "ka", "gi", "il" };

	[3] = { "lok", "tar", "kaz", "ruk", "kek", "mog", "zug", "gul", "nuk", "aaz", "kil", "ogg" };

	[4] = { "rega", "nogu", "tago", "uruk", "kagg", "zaga", "grom", "ogar", "gesh", "thok", "dogg", "maka", "maza" };

	[5] = { "regas", "nogah", "kazum", "magan", "no'bu", "golar", "throm", "throm", "zugas", "re'ka", "no'ku", "ro'th" };

	[6] = { "thrakk", "revash", "nakazz", "moguna", "no'gor", "goth'a", "raznos", "ogerin", "gezzno", "thukad", "makogg", "aaz'no" };

	[7] = { "lok'tar", "gul'rok", "kazreth", "tov'osh", "zil'nok", "rath'is", "kil'azi" };

	[8] = { "throm'ka", "osh'kava", "gul'nath", "kog'zela", "ragath'a", "zuggossh", "moth'aga" };

	[9] = { "tov'nokaz", "osh'kazil", "no'throma", "gesh'nuka", "lok'mogul", "lok'balar", "ruk'ka'ha" };

	[10] = { "regasnogah", "kazum'nobu", "throm'bola", "gesh'zugas", "maza'rotha", "ogerin'naz" };

	[11] = { "thrakk'reva", "kaz'goth'no", "no'gor'goth", "kil'azi'aga", "zug-zug'ama", "maza'thrakk" };

	[12] = { "lokando'nash", "ul'gammathar", "dalggo'mazah", "golgonnashar", "golgonmathar" };

	[13] = { "khaz'rogg'ahn", "moth'kazoroth", "thok'rogg'gul" };
};

-- Language: Troll - courtesy of Blizzard
Lore_Archive["Troll"] = {

	[1] = { "m", "h", "e", "n", "h", "a", "j" },

	[2] = { "fu", "yu", "is", "so", "ju", "fi", "di", "ir", "im" },

	[3] = { "sca", "tor", "wha", "deh", "noh", "dim", "mek", "fus" },

	[4] = { "duti", "cyaa", "iyaz", "riva", "yudo", "skam", "ting" },

	[5] = { "ackee", "nehjo", "difus", "atuad", "siame", "t'ief", "wassa", "caang" },

	[6] = { "saakes", "stoosh", "quashi", "bwoyar", "wi'mek", "deh'yo", "fidong", "italaf", "smadda" },

	[7] = { "reespek", "rivasuf", "yahsoda", "lok'dim", "craaweh", "godeshi", "uptfeel" },

	[8] = { "machette", "oondasta", "wehnehjo", "nyamanpo", "whutless", "zutopong" },

	[9] = { "or'manley", "fus'obeah", "tor'wassa" }
};

-- Language: Dwarvish - courtesy of Blizzard
Lore_Archive["Dwarvish"] = {

	[1] = { "a" },

	[2] = { "ke", "lo", "we", "go", "am", "ta", "ok" },

	[3] = { "ruk", "red", "mok", "mos", "gor", "kha", "ahz", "hor" },

	[4] = { "hrim", "modr", "rand", "khaz", "grum", "gear", "kost", "loch", "gosh", "gear", "guma", "rune", "hoga" },

	[5] = { "goten", "mitta", "modor", "angor", "skalf", "thros", "dagum", "havar", "scyld", "havas" },

	[6] = { "syddan", "rugosh", "bergum", "haldji", "drugan", "robush", "modoss", "modgud" },

	[7] = { "mok-kha", "kaelsag", "godkent", "thorneb", "geardum", "dun-fel", "havagun", "ok-hoga" },

	[8] = { "golganar", "moth-tur", "gefrunon", "mogodune", "khaz-dum", "misfaran" },

	[9] = { "arad-khaz", "ahz-dagum", "khaz-rand", "mund-helm", "kost-guma" },

	[10] = { "hoga-modan", "angor-magi", "midd-havas", "nagga-roth", "kael-skalf" },

	[11] = { "azgol-haman" }
};

-- Language: Gnomish - courtesy of Blizzard
Lore_Archive["Gnomish"] = {

	[1] = { "g", "o", "c", "i", "t" },

	[2] = { "ti", "ga", "am", "ok", "we", "lo", "ke", "ti", "um" },

	[3] = { "giz", "dun", "gal", "gar", "mos", "zah", "fez", "dun", "nid" },

	[4] = { "grum", "lock", "rand", "gosh", "riff", "kahs", "cost", "dani", "hine", "helm" },

	[5] = { "tiras", "angor", "nagin", "algos", "thros", "mitta", "haven", "dagem", "goten", "havis" },

	[6] = { "danieb", "helmok", "drugan", "rugosh", "gizber", "dumssi", "waldor", "mergud" },

	[7] = { "geardum", "scrutin", "ferdosr", "godling", "bergrim", "haidren", "noxtyec", "thorneb", "costirm" },

	[8] = { "landivar", "gefrunon", "aldanoth", "kahzregi", "kahsgear", "methrine", "landivar", "godunmug", "mikthros" },

	[9] = { "nockhavis", "naggirath", "angordame", "elodmodor", "elodergrim" },

	[10] = { "sihnvulden", "danavandar", "mundgizber", "angordame", "elodmodor", "dyrstagist", "ahzodaugum", "frendgalva", "throsigear" },

	[11] = { "thrunon'gol", "robuswaldir", "helmokheram", "thrunon'gol", "kahzhaldren", "haldjinagin", "skalfgizgar", "lockrevoshi" }

};

-- Language: Darnassian - courtesy of Blizzard
Lore_Archive["Darnassian"] = {

	[1] = { "o", "d", "n" },

	[2] = { "al", "ni", "su", "ri", "lo", "do", "no", "su" },

	[3] = { "osa", "fal", "ash", "tur", "nor", "dur", "tal" },

	[4] = { "dieb", "shar", "alah", "fulo", "mush", "dath", "anar", "rini", "diel", "thus", "aman" },

	[5] = { "turus", "balah", "shari", "ishnu", "terro", "talah", "thera", "falla" },

	[6] = { "ishura", "shando", "t'as'e", "ethala", "neph'o", "do'rah", "belore" },

	[7] = { "alah'ni", "dor'ano", "aman'ni", "al'shar", "shan're", "asto're" },

	[8] = { "eraburis", "d'ana'no", "mandalas", "dal'dieb", "thoribas" },

	[9] = { "thori'dal", "banthalos", "shari'fal", "fala'andu", "talah'tur" },

	[10] = { "ash'therod", "isera'duna", "shar'adore", "thero'shan", "dorados'no" },

	[11] = { "shari'adune", "fandu'talah", "t'ase'mushal" },

	[12] = { "t'ase'mushal", "dor'ana'badu", "dur'osa'dieb" }
};

-- Language: Gutterspeak - courtesy of Blizzard
Lore_Archive["Gutterspeak"] = {

	[1] = { "o", "y", "e" },

	[2] = { "lo", "va", "lu", "an", "ti", "re", "ne", "me", "ko", "ru" },

	[3] = { "bor", "bur", "ash", "mod", "ras", "wos", "lon", "ver", "nud", "far", "gol" },

	[4] = { "thor", "ruff", "veld", "agol", "vrum", "dana", "uden", "noth", "agol", "odes", "lars", "vohl" },

	[5] = { "tiras", "garde", "borne", "gloin", "wirsh", "ergin", "tiras", "eynes", "algos", "nagan" },

	[6] = { "ruftos", "rothas", "danieb", "valesh", "aziris", "aesire", "engoth", "ealdor", "vandar", "mandos", "skilde" },

	[7] = { "koshvel", "vassild", "faergas", "andovis", "sturume", "ewiddan", "nandige", "kaelsig", "novaedi", "lithtos" },

	[8] = { "aldonoth", "endirvis", "methrine", "lordaere", "hamerung", "thorniss", "ruftvess", "cynegold", "methrine" },

	[9] = { "vandarwos", "eloderung", "danagarde", "udenmajis", "regenthor", "gothalgos", "gloinador", "aetwinter", "firalaine" },

	[10] = { "danavandar", "falhedring", "cynewalden", "dyrstigost", "aelgestron" },

	[11] = { "farlandowar", "thorlithos", "bornevalesh", "forthasador", "agolandovis" },

	[12] = { "golvelbarad", "nevrenrothas", "waldirskilde", "mandosdaegil", "adorstaerume" }

};

-- Language: Taurahe - courtesy of Blizzard
Lore_Archive["Taurahe"] = {

	[1] = { "i", "o", "e", "a", "n" },

	[2] = { "te", "ta", "po", "tu", "lo", "ki", "wa" },

	[3] = { "uku", "chi", "owa", "kee", "ich", "awa", "alo", "rah", "ish" },

	[4] = { "nahe", "balo", "awak", "isha", "mani", "tawa", "towa", "a'ke", "halo", "shte" },

	[5] = { "nechi", "shush", "a'hok", "nokee", "tanka", "ti'ha", "pawni", "anohe", "ishte", "yakee" },

	[6] = { "ichnee", "sho'wa", "hetawa", "washte", "lomani", "owachi", "lakota", "aloaki" },

	[7] = { "shteawa", "pikialo", "ishnelo", "kichalo", "tihikea", "sechalo" },

	[8] = { "awaihilo", "akiticha", "porahalo", "ovaktalo", "shtumani", "towateke", "ishnialo", "owatanka", "awaihilo" },

	[9] = { "echeyakee", "haloyakee", "tawaporah", "ishne'alo", "tanka'kee" },

	[10] = { "ichnee'awa", "shteowachi", "awaka'nahe", "ishamuhale", "ishte'towa" },

	[11] = { "shtumanialo", "aloaki'shne", "awakeekielo", "aloaki'shne", "lakota'mani" }

};

