-- dialects.lua
-- Create language tables for use by the Lore AddOn.

---------------------------------------------------------------------------------
--To add your own language, copy this structure to the end of the document:
--
--	Lore_Archive["Your Language's Name"] = {
--		[1] = {"sample_1"},
--		[2] = {"sample_2", "sample_3"},
--		[3] = {"sample_3"}
--	};
--
--To add words, place them in double quotes seperated by commas, within the curly
--braces for the appropriate word-length. You can add as many additional
--recognized word-lengths as you choose.
--
--
--To add your own DIALECT (note that this is not a full language!), follow the following example:
--
--	Lore_Archive["*Dialect's Name"] = {
--	};
--
--	-- Altwords: Common Dialect
--	Lore_Archive["*Dialect's Name"]["altwords"] = { 
--
--	["old"] = { "you", "your", "you're", "my", "i" },
--
--	["new"] = { "ye", "yer", "ye're", "me", "me" }
--
--	};
--
--Note, that DIALECTS have to start with an asterisk (*) to be recognised as such.
--
--For more details see the AddingLanguages.txt file.
---------------------------------------------------------------------------------


-- Language: Dark Iron
Lore_Archive["Dark Iron"] = {

	[1] = { "a", "i", "n", "g", "r'" },

	[2] = { "as", "ka", "da", "em", "im", "ag", "ha", "ek", "ak", "ah", "il", "ni", "va", "yl", "gy", "om" },

	[3] = { "kar", "nag", "aey", "gha", "gri", "gem", "nol", "azk", "gyr", "gal", "gol", "mud", "tur", "lia", "nus", "tag", "azh", "irg", "mar", "yrn", "ydi", "alg", "auz", "ech", "led", "gar", "rum" },

	[4] = { "rune", "grim", "modi", "khir", "ghar", "stag", "ylsa", "lode", "heim", "emga", "anos", "ampa", "grun", "yddi", "ghil", "saga", "duni", "dani", "soam", "khaz", "sada", "agri", "fryg", "frey", "mak'g", "so'tr" },

	[5] = { "rumas", "kharn", "modus", "grima", "tiora", "daorf", "nihbr", "anvil", "chagh", "grist", "nibel", "yspel", "jutos", "khael", "ryggr", "aglud", "imlut", "domil", "gimil", "gamli", "yl-gav", "efrit" },

	[6] = { "dun-gar", "gar-mod", "khatyy", "gat-lin", "mod-ham", "nispel", "mug-rod", "injorn", "gawnhi", "waspel", "ingear", "gear-ag", "tin-rud", "kharan", "anmodi", "bha-gul", "algash", "gimlok", "dunlok", "lok-mod" },

	[7] = { "kharnos", "gar-modi", "mod-ymil", "loknara", "yrraegh", "ael-heim", "darkhaz", "ironaya", "ymr-lode", "nagnyss", "yl-thaur", "thaurim", "rim-loki", "rimrygr", "an'del-ga", "ard-ygir" },

	[8] = { "dun-efrit", "jotun-gar", "jotygras", "kharanog", "bhaelrog", "balnagri", "imlissar", "yni-angor", "haelmane", "godhaldr", "mosskend", "azrethor", "gar-havas", "angor-red" },

	[9] = { "midrothar", "khaz-thaur", "modgud-dun", "hasanthyr", "bothelken", "raspindel", "unthod-lok", "dag-mundyl", "ghim-lodir", "grunholdd", "an-grim'lok" },

	[10] = { "yddlasthir", "omber-mokra", "ghael-baros", "ston-fortir", "rok-whispar", "thaur-modir", "ym'ras'ghand", "thadd-hamir", "modgud-lash", "lokindresh" },

	[11] = { "haspel-imbre", "mod-daglasgh", "helgrimdevi", "gar-hadthale", "miyr-ghandir", "hal-nav'narda", "mid-jutoghan", "hakel-ombras", "thale-dunlok", "nispel-modir", "gar-baeldorn", "thornlokang" },

	[12] = { "kharn-rumaste", "hamil-naradas", "zu-modr'ygrash", "leidhas-mogri", "thane-rasheim", "ymyggr-andlok", "zar'nagridhan" }

};


-- Keywords: Dark Iron
Lore_Archive["Dark Iron"]["keywords"] = { "thaurissan", "t" };


-- Language: Kalimag ( Elemental ) - courtesy of Blizzard
Lore_Archive["Kalimag"] = {

	[1] = { "a", "o", "k", "t", "g", "u" },

	[2] = { "ko", "ta", "gi", "ka", "tu", "os", "ma", "ra" },

	[3] = { "fel", "rok", "kir", "dor", "von", "nuk", "tor", "kan", "tas", "gun", "dra", "sto" },

	[4] = { "brom", "kras", "toro", "drae", "krin", "zoln", "fmer", "guto", "reth", "shin", "tols", "mahn" },

	[5] = { "bromo", "krast", "torin", "draek", "kranu", "zoern", "fmerk", "gatin", "roath", "shone", "talsa", "fraht" },

	[6] = { "ben'nig", "korsul", "ter'ran", "for'kin", "suz'ahn", "dratir", "fel'tes", "toka'an", "drinor", "tadrom" },

	[7] = { "kel'shae", "dak'kaun", "tchor'ah", "zela'von", "telsrah", "kis'tean", "dorvrem", "koaresh", "fiilrok", "ven'tiro", "gi'frazsh", "chokgan", "fanroke" },

	[8] = { "taegoson", "kilagrin", "roc'grare", "gi'azol'em", "nuk'tra'te", "quin'mahk", "ties'alla", "shodru'ga", "os'retiak", "desh'noka", "rohh'krah", "krast'ven", "aasrugel" },

	[9] = { "tae'gel'kir", "draemierr", "dor'dra'tor", "zoln'nakaz", "mastrosum", "gatin'roth", "ahn'torunt", "thukad'aaz", "gesh'throm", "brud'remek" },

	[10] = { "aer'rohgmar", "mok'tavaler", "torrath'unt", "ignan'kitch", "caus'tearic", "borg'helmak", "huut'vactah", "tzench'drah", "vendo're'mik", "kraus'ghosa", "dalgo'nizha" },

	[11] = { "moth'keretch", "bach'usiv'hal", "jolpat'krim", "thloy'martok", "danal'korang", "kawee'fe'more", "sunep'kosach", "peng'yaas'ahn", "nash'lokan'ar", "derr'moran'ki", "moor'tosav'ak", "kis'an'tadrom", "korsukgrare" },

	[12] = { "golgo'nishver", "tagha'senchal" }

};


-- Keywords: Kalimag
Lore_Archive["Kalimag"]["keywords"] = { "kalimag", "ragnaros", "neptulon", "therazane", "t" };


-- Altwords: Kalimag
Lore_Archive["Kalimag"]["altwords"] = {

	["old"] = { "elemental", "elementals" },

	["new"] = { "kalimag", "kalimar" }

};


-- Alternate title: Elemental - language: Kalimag
Lore_Archive["Elemental"] = Lore_Archive["Kalimag"];


-- Language: Eredun ( Demonic ) - courtesy of Blizzard
Lore_Archive["Eredun"] = {

	[1] = { "a", "e", "i", "o", "u", "y", "g", "x" },

	[2] = { "il", "no", "az", "te", "ur", "za", "ze", "re", "ul", "me", "xi" },

	[3] = { "tor", "gul", "lok", "asj", "kar", "lek", "daz", "maz", "ril", "ruk", "laz", "shi", "zar" },

	[4] = { "ashj", "alar", "orah", "amir", "aman", "ante", "kiel", "maez", "maev", "veni", "raka", "zila", "zenn", "parn", "rikk" },

	[5] = { "melar", "ashke", "rakir", "tiros", "modas", "belan", "zekul", "soran", "gular", "enkil", "adare", "golad", "buras", "nagas", "revos", "refir", "kamil" },

	[6] = { "rethul", "rakkan", "rakkas", "tichar", "mannor", "archim", "azgala", "karkun", "revola", "mishun", "arakal", "kazile", "thorje" },

	[7] = { "belaros", "tiriosh", "faramos", "danashj", "amanare", "kieldaz", "karaman", "gulamir", "toralar", "rethule", "zennshi" },

	[8] = { "maladath", "kirasath", "romathis", "amanare", "theramas", "azrathud", "mordanas", "amanalar", "ashjraka", "azgalada", "rukadare", "sorankar", "enkilzar", "belankar" },

	[9] = { "naztheros", "zilthuras", "kanrethad", "melarorah", "arakalada", "soranaman", "nagasraka", "teamanare" },

	[10] = { "matheredor", "ticharamir", "pathrebosh", "benthadoom", "enkilgular", "burasadare", "melarnagas", "zennrakkan", "ashjrethul", "amanemodas", "kamilgolad" },

	[11] = { "zekulrakkas", "archimtiros", "mannorgulan", "mishunadare", "ashjrakamas" },

	[12] = { "zennshinagas" }

};


-- Keywords: Eredun
Lore_Archive["Eredun"]["keywords"] = { "eredun", "eredar", "sargeras", "archimonde", "mannoroth", "t" };


-- Altwords: Eredun
Lore_Archive["Eredun"]["altwords"] = { 

	["old"] = { "demonic", "demon" },

	["new"] = { "eredun", "eredar" }

};


-- Alternate title: Demonic - language: Eredun
Lore_Archive["Demonic"] = Lore_Archive["Eredun"];


-- Alternate title: Titan - language: Eredun
Lore_Archive["Titan"] = Lore_Archive["Eredun"];


-- Alternate title: Draconic - language: Eredun
Lore_Archive["Draconic"] = Lore_Archive["Eredun"];


-- Keywords: Draconic
Lore_Archive["Draconic"]["keywords"] = { "Nozdormu", "Alexstrasza", "Ysera", "Malygos", "Neltharion", "Krasus", "Korialstrasz", "Tyrannostrasz", "Vaelastrasz", "Belnistrasz", "Azuregos", "Haleh", "Kalec", "Kalecgyos", "Sapphiron", "Eranikus", "Itharius", "Ysondre", "Lethon", "Emeriss", "Taerar", "Morphaz", "Chronormu", "Occulus", "Chronalis", "Onyxia", "Nefarian", "Kalaran", "Teremus", "Searinox", "Gyth", "Drakkisath", "Wyrmthalak", "t" };


-- Language: Druidic
Lore_Archive["Druidic"] = {

	[1] = { "a", "i", "y" },

	[2] = { "aw", "en", "ae", "ne", "cy", "iy", "ey", "na" },

	[3] = { "aos", "era", "fey", "nen", "tre", "awr", "duw", "aur", "gey", "tir", "cad", "anu", "kin", "ddu", "fae", "tir", "nog" },

	[4] = { "caer", "waer", "daea", "bael", "bryn", "iaen", "cetr", "tref", "maen", "trud", "nuid", "aech", "faer", "yser", "mana", "ffin", "leir", "awen", "iona", "mach", "rvyf" },

	[5] = { "gwion", "skaen", "dgaes", "ma'nae", "waith", "dagda", "rae'an", "sidhe", "faery", "ffyrd", "aegya", "celti", "gaegh", "waend", "esgid", "aegas", "laedr" },

	[6] = { "claedd", "gildas", "taulkn", "darrow", "aefror", "ynifer", "mynydd", "llythr", "braegg", "areant", "cyffes", "aelfin", "mircae", "eliade", "thaede", "caegis", "tirnag" },

	[7] = { "haegest", "dyffryn", "faerion", "nenneas", "swyddwr", "esgidin", "myrddin", "loch'wae", "gwydean", "elidaea", "creirwy", "afaegdu", "cenaryn" },

	[8] = { "talaesin", "caer-mana", "noswaith", "aeswaith", "maerthyr", "ffenestr", "talhearn", "glaerdas", "irenaeus", "nemaeddr", "vaughran", "gwendydd", "fyrdraga" },

	[9] = { "rhydderch", "llallogan", "angrboden", "gogyrwen", "marchaewg", "cynfeirdd", "milwraeth", "caeridwen", "arianrhed", "aaeyweayn" },

	[10] = { "anysberwyd", "caer-tolgen", "aenydarrow", "saef'gyraen", "waithlaend", "caerhmn'ken", "andaest'ken", "nun'daergyr", "mal'faerion", "caer-aefryt", "ffaeryllt", "cynfaelyn" },

	[11] = { "caermarthen", "nogdruddymn", "cenariumnae", "gwerthmandd", "darrowgryal", "ffelmnirhod", "mana-waeddyr", "feyffilndel" },

	[12] = { "gremydigaeth", "aendlwygaere", "dae'neirwaith", "gaegh'ffaenyr", "weirglaerdas", "theymnaeddyr" }

};


-- Keywords: Druidic
Lore_Archive["Druidic"]["keywords"] = { "tier", "ysera", "cenarius", "t" };


-- Altwords: Druidic
Lore_Archive["Druidic"]["altwords"] = {

	["old"] = { "druid", "druids", "druidic", "yseran", "dream", "dreams" },

	["new"] = { "weir", "weirye", "tier", "tier", "faery", "fiaery" }

};


-- Alternate title: Tier - language: Druidic
Lore_Archive["Tier"] = Lore_Archive["Druidic"];


-- Alternate title: Yserran - language: Druidic
Lore_Archive["Yseran"] = Lore_Archive["Druidic"];


-- Language: Thelassian - courtesy of Blizzard
Lore_Archive["Thelassian"] = {

	[1] = { "a", "n", "i", "o", "e", "d" },

	[2] = { "da", "lo", "an", "ni", "al", "do", "ri", "su", "no" },

	[3] = { "ano", "dur", "tal", "nei", "ash", "dor", "anu", "fal", "tur", "ala", "nor", "osa" },

	[4] = { "alah", "andu", "dath", "mush", "shar", "thus", "fulo", "aman", "diel", "dieb", "rini", "anar", "t'as'e" },

	[5] = { "talah", "adore", "ish'nu", "ishnu", "bandu", "balah", "fandu", "thera", "turus", "shari", "shano", "terro", "eburi", "u'phol", "neph'o", "man'ar", "do'rah" },

	[6] = { "dorini", "shando", "ethala", "fallah", "belore", "asto're", "ishura", "alah'ni", "dor'ano", "al'shar", "mush'al", "aman'ni", "shan're", "d'ana'no", "il'amare" },

	[7] = { "anoduna", "dal'dieb", "thoribas" },

	[8] = { "mandalas", "eraburis", "dorithur", "neph'anis", "dune'adah", "fala'andu", "dath'anar", "shari'fal", "thori'dal" },

	[9] = { "banthalos", "thero'shan", "isera'duna", "ash'therod", "dorados'no", "shar'adore" },

	[10] = { "fandu'talah", "dor'ana'badu", "shari'adune", "t'ase'mushal" },

	[11] = { "u'phol'belore" },

	[12] = { "turus'il'amare", "shindu'fallah'na" },

	[13] = { "anu'dorannador", "asto're'dunadah" },

	[14] = { "fando’thorinish", "el’endunan’alora" },

	[15] = { "thoribas'no'thera", "ando'meth'derador", "anu'dorinni'talah", "esh'thero'mannash" }

};


-- Keywords: Thelassian
Lore_Archive["Thelassian"]["keywords"] = { "thelassian", "darnassian", "darnassus", "teldrassil", "elune", "t" };


-- Alternate title: High Elven - language: Thelassian
Lore_Archive["High Elven"] = Lore_Archive["Thelassian"];


-- Language: Nerubian
Lore_Archive["Nerubian"] = {

	[1] = { "m", "a", "t", "c", "k", "s", "u" },

	[2] = { "s'k", "ix", "t'k", "w'k", "qa", "h'r", "ph", "te", "en", "m'g" },

	[3] = { "ikh", "mar", "has", "mah", "chk", "mhj", "rhj", "ner", "m'rh", "kah", "sdh", "aa't", "k'st", "at't", "hs'p" },

	[4] = { "mh'gh", "tckh", "sujt", "gash", "tadh", "hasn", "kuht", "ahpt", "gher", "hadr", "ahtj", "anq'j", "uahr", "katc", "nifn", "mht'l", "ahtl", "anll", "tuvh", "qhna", "tajh" },

	[5] = { "hsatl", "tihkh", "nerub", "ankan", "anhqi", "mersk", "ind'eu", "ahtil", "tuhtl", "nehhm", "tutha", "xstha", "rhash", "sc'chk", "huskh", "ankha", "ni'cht", "asknq", "tchir", "cthsu", "khath", "nedhk", "nirjk", "ernhb" },

	[6] = { "natchk", "arahtl", "st'hcha", "ner'zuh", "anshtj", "thema't", "xhlatl", "tutank", "mahcrj", "qhuz'mn", "tas'qkb", "amnenn", "ras'zuj", "ak'schk" },

	[7] = { "amni'gkh", "zh'aqlir", "gaishan", "as'aith", "khashab", "tahattu", "ahamtik", "amhawnj", "gahdhmn", "ner'khan", "zub'amna", "narjhgt", "ash'rhjn" },

	[8] = { "thsk'anqi", "ashnt'khu", "ahtshakh", "amraa'nsh", "anj'khasz", "aman'ginh", "chak'sckh", "abrihght", "thkimpsa", "tltoani", "akh'nerig" },

	[9] = { "amnennar", "aszarh'itl", "nah'ahlzir", "ahjs'mhari", "nerub'anka", "mhandarjh", "ahlt'anksq", "qui'xhitl" },

	[10] = { "askh'nadfir", "zelk'neruzh", "gahdamarah", "erubtijiel", "unkh'leifra", "shiq'jhahnr", "tahat'ahk'nm", "haf'rahtuth" },

	[11] = { "hahse'nerutl", "anmhrabhskt", "majhanqhji", "gaht'nerdjhz", "nerhtl'qansh" }

};


-- Keywords: Nerubian
Lore_Archive["Nerubian"]["keywords"] = { "nerubian", "azjol", "nerub", "t" };


-- Language: Common Dialect
Lore_Archive["*Dialect"] = {
};

-- Altwords: Common Dialect
Lore_Archive["*Dialect"]["altwords"] = { 

	["old"] = { "you", "your", "you're", "my", "i" },

	["new"] = { "ye", "yer", "ye're", "me", "me" }

};



-- Language: Scottish Dialect
Lore_Archive["*Scottish"] = {
};

 -- Altwords: Scottish Dialect
Lore_Archive["*Scottish"]["altwords"] = {

	["old"] = { "yes", "child", "kid", "children", "kids", "moron",
	"splendid", "drink", "alcohol", "drunk", "good", "mess", "river",
	"inn", "house", "dance", "cold", "frost", "cloth", "coarse", "do",
	"you", "understand", "thirst", "dog", "idiot", "ass", "doing",
	"person", "clumsy", "broken", "broke", "dont", "shit", "church",
	"crazy", "male", "female", "woman", "man", "smelly", "stinky", "no",
	"not", "nothing", "oh", "out", "piss", "pissed", "money", "rare",
	"food", "cheer", "cheers", "small", "steal", "wife", "and", "old",
	"young", "you", "mom", "mother", "your", "night", "house", "town",
	"to", "little", "into", "beer" },

	["new"] = { "aye", "bairn", "bairn", "bairn", "bairn", "bampot",
	"barry", "bewy", "bewy", "hammered", "braw", "burach", "burn", "but and ben",
	"byre", "ceilidh", "chanken", "chanken", "cloot", "coorse",
	"dee", "ye", "ken", "druth", "dug", "edjit", "arse", "doos", "gadgee",
	"galoot", "gassed", "hosed", "dunnae", "shite", "kirk", "a loon",
	"mannie", "biddie", "biddie", "mannie", "minky", "minky", "nay", "nay",
	"nuh-hing", "och", "oot", "pish", "pished", "poppy", "rocking horse shite",
	"scran", "slange", "slange", "tad", "weech", "wifey", "an'",
	"ol'", "youngin", "ye", "mum", "mammy", "yer", "nicht", "hoose",
	"toon", "tae", "wee bit", "intae", "swally" }

};

-- Language: Canid
Lore_Archive["Canid"] = {

    [1] = { "a", "o", "u", "r" },

    [2] = { "ro", "ar", "rr", "ra", "wo", "ow", "gr" },

    [3] = { "arr", "roo", "aro", "rar", "gra", "raw", "owo", "woo", "wof", "yip", "aoo", "grr", "arg", "ruf", "awo", "rrg", "wif", "rag", "rwr" },

    [4] = { "raoo", "grar", "argh", "graw", "awoo", "aroo", "woof", "woff", "warg", "worg", "rarr", "ruff", "grrr", "roff", "rgrr", "roff", "wiff", "aooo", "rarg", "ragh", "wuff" },

    [5] = { "awroo", "grawr", "wrowl", "growl", "rawrf", "fwoof", "rrarg", "rwarg", "wroof", "grarg", "hawoo", "arrrr", "snarl", "grarr", "grarg", "graul", "awoof", "rwoof", "rawoo" },

    [6] = { "graroo", "grawoo", "rawoof", "rawoff", "rawuff", "grar'g", "grarrg", "rawarg", "wroofg", "rawroo",  "growrl", "rwroof", "aooooo", "grr'rg", "arrwoo", "rargrr", "arorrg", "grruff" },

    [7] = { "grarr'g", "awroo'fr", "grauwro", "grauwrl", "growoof", "rawroof", "graghrr", "gr'awrg", "arrgrar", "grar-rr", "rarwoof", "rawroof", "rarrgrr", "aoo-woo", "aroowrf", "grawoof", "yip-yip", "arr-grr" },

    [8] = { "woofwoof", "aroo-roo", "grauwoof", "grar-rar", "arr-grar", "grarr'arg", "aroowoof", "rawrgrrl", "growl-rr", "graw rar", "aroo woo", "grr ruff", "gra-wuff" }

};

-- Alternate title: Wolf - language: Canid
Lore_Archive["Wolf"] = Lore_Archive["Canid"];

-- Alternate title: Worgen - language: Canid
Lore_Archive["Worgen"] = Lore_Archive["Canid"];

-- Language: Ursid
Lore_Archive["Ursid"] = {

    [1] = { "g", "o", "a", "r" },

    [2] = { "ro", "ar", "rr", "ra", "gr" },

    [3] = { "grr", "ggr", "arg", "raa" },

    [4] = { "rawr", "roar", "argh", "graw"  },

    [5] = { "grawr", "growl", "rrarg", "rwarg", "grarg", "arrrr", "snarl", "grarr", "grarg", "graul", "grr-r" },

    [6] = { "graroo", "grawoo", "grar'g", "grarrg", "rawarg", "wroofg", "rawroo",  "growrl", "aoo-oo", "grr'rg", "rargrr", "arorrg" },

    [7] = { "grarr'g", "awroo'fr", "grauwro", "grauwrl", "graghrr", "gr'awrg", "arrgrar", "grar-rr", "rarrgrr" },

    [8] = { "aroo-roo", "grar-rar", "arr-grar", "grarr'arg", "rawrgrrl", "growl-rr", "graw rar" }

};

-- Alternate title: Bear - language: Ursid
Lore_Archive["Bear"] = Lore_Archive["Ursid"];

-- Language: Felid
Lore_Archive["Felid"] = {

    [1] = { "e", "o", "i", "r" },

    [2] = { "rw", "ow", "mi", "ra", "er", "rw", "rr", "pr" },

    [3] = { "brr", "prr", "mrr", "rrr" },

    [4] = { "mrow", "rowr", "miew", "miao", "meow", "reow", "purr" },

    [5] = { "mrowr", "rowrr", "miewr", "miaor", "meowr", "reorr", "reowr", "purrr" },

    [6] = { "purrrr", "burrrr", "mirrrr" },

    [7] = { "meerrro", "mirowr" },

    [8] = { "meerrror", "mirowrr" }

};

-- Alternate title: Cat - language: Felid
Lore_Archive["Cat"] = Lore_Archive["Felid"];

-- Language: Moonkin
Lore_Archive["Moonkin"] = {

    [1] = { "h", "w", "l", "o" },

    [2] = { "ho", "wo", "ol", "oo" },

    [3] = { "hoh", "woh", "hol", "oow", "koo", "ool" },

    [4] = { "honk", "honk", "howo" },

    [5] = { "howol", "wohol", "hoonk", "owoow", "kokoo", "ooool" },

    [6] = { "howhol", "wohwol", "holhol", "oowoow", "hooonk", "oohhooo" },

};

-- Language: Murloc
Lore_Archive["Murloc"] = {

	[1] = {"b","u","r","g","l","m",},

	[2] = {"rm","bg","lr","gl","gu","mg","gg","uu","mr","ur",},

	[3] = {"rmu","ggb","mmm","rur","rrr","bbu","glu","mrg","ggg","brl",},

	[4] = {"rugm","ubrg","lgub","mllm","grml","rmrl","gurl","gurr","rlur","glur",},

	[5] = {"lglgb","uubbg","glrub","gmrgu","rgmur","lgglm","rlrlr","rurlg","mgulm","uugru",},

	[6] = {"uuggrr","rlmgug","ulllur","gurggm","lugrgg","guguug","mruurr","rgruuu","uuuulg","umuugu",},

	[7] = {"brumbbr","mgrurgg","lrruuur","uluumgm","urmumrg","rmbrugu","rrugrru","uluuubr","rmbglrg","lgumggg",},

	[8] = {"uumrurrm","uggbubur","urlumbbu","glumrggg","gbrlrugm","uuuuubrg","lgubgruu","mllmgrml","ubguuuum","rmrllglg",},

	[9] = {"buubbgglr","ubgmrgurg","murlgglmr","lrlrrurlg","mgulmuugr","uuuggrrrl","mgugulllu","rgurggmlu","grggguguu","gmruurrrg",},

	[10] = {"ruuuuuuulg","umuugubrum","bbrmgrurgg","lrruuurulu","umgmurmumr","grmbrugurr","ugrruuluuu","brrmbglrgl","gumggguumr","urrmuggbub",},

	[11] = {"ururlumbbug","lumrggggbrl","rugmuuuuubr","glgubgruuml","lmgrmlubguu","uumrmrllglg","buubbgglrub","gmrgurgmurl","gglmrlrlrru","rlgmgulmuug",},

	[12] = {"ruuuggrrrlmg","ugulllurgurg","gmlugrgggugu","ugmruurrrgru","uuuuuulgumuu","gubrumbbrmgr","urgglrruuuru","luumgmurmumr","grmbrugurrug","rruuluuubrrm",},

};

-- Alternate title: Cat - language: Murloc
Lore_Archive["Slime"] = Lore_Archive["Murloc"];

-- Language Menu: languages to be added to the existing in-game language-selection menu
Lore_Archive["Languages"] = {

	"Canid",
	"Dark Iron",
	"Demonic",
	"Draconic",
	"Druidic",
	"Eredun",
	"Felid",
	"Kalimag",
	"Moonkin",
	"Murloc",
	"Nerubian",
	"Thelassian",
	"Titan",
	"Ursid",
};