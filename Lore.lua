-- Lore.Lua - "The scholar edition"
-- Create and use custom-defined languages within World of Warcraft.
-- Original version © 2005 K. Bishop

-- Localization information; used in Bindings.xml.
BINDING_HEADER_LORE			= "Lore v6.0";
INITIALIZATION_LORE			= "Lore v6.0";

-- Defaults on load
Lore_Archive = {};
Lore_Version = "6.0 'The scholar edition'";
Lore_HookEvent = 0;
Lore_Channelcheck = 0;
Lore_CurrentSkill = 100;
Lore_Init = 0;
Lore_PrevRequestName = "";
Lore_PreviousRequestCount = 0;
Lore_PrevRequestSkill = 100;

Lore_Color_R = 0.3;
Lore_Color_G = 0.3;
Lore_Color_B = 0.5;

-- Establish default variables -- hard reset
function Lore_Defaults()

	Lore_Language = "";		-- Current Lore specific spoken language (empty if none)
	Lore_CurrLanguage = "";		-- Current spoken language
	Lore_CurrentSkill = 100;	-- Skill level of the currently spoken language
	Lore_Cycle = {};		-- Table containing characters' tablet languages
	Lore_Skill = {};		-- Table containing characters' tablet language skills
	Lore_Users = {};		-- Table containing character names
	Lore_Interpreter = {};		-- Table containing characters' list of interpreters
	Lore_To = 0;			-- Mass translation
	Lore_Screen = 1;		-- Screening
	Lore_Visible = 1;		-- Lore UI show/hide
	Lore_Alpha = 100;		-- Tooltip's Alpha
	Lore_BorderAlpha = 1;		-- Tooltip border's Alpha
	Lore_Self = 0;			-- Translation to self
	Lore_Inform = 1;		-- Lore's command feedback to user
	Lore_Locked = 0;		-- Lore UI lock
	Lore_Left = 1;			-- Function assigned to left-click
	Lore_Right = 2;			-- Function assigned to right-click
	Lore_LastSaid = "";		-- Last spoken text, for translation purposes
	Lore_PrevMsg = "";		-- Last sent Lore command/request
	LoreToPlayer = "";		-- Last player command/request is sent to
	Lore_Autotrans = 0;		-- Auto translation status (0=on, -1=off)
	Lore_Effect = 0;		-- Speech effects (0=none, 1=stutter, 2=hiss, 3=lisp, 4=cut, 5=growl)
	Lore_Stutterfrequency = 50;	-- Stutter frequency (1-100)
	Lore_Tabletposition = 0;	-- Position of the tablet. Default 0 (right bottom of lore button)

	ReloadUI();
end

-- OnLoad function
function Lore_Initialize()

	-- Slash commands
	SLASH_LORE1 = "/lore";
	SlashCmdList["LORE"] = Lore_Options;

	-- Add Lore to myAddOns addons list
	if( myAddOnsFrame ) then
		myAddOnsList.Lore = {name = "Lore", description = "Create and use custom-defined languages", version = Lore_Version, category = MYADDONS_CATEGORY_CHAT, frame = "Lore_Tablet"};
	end

	if ( table.getn( Lore_Interpreter ) ~= 0 ) then
		DEFAULT_CHAT_FRAME:AddMessage( "Lore <> WARNING: Interpreters still active since last session!", 1.0, 0.3, 0.3 );
		LoreDialect:SetTextColor( 1.0, 0.1, 0.1, 1 );
	end

end


-- Identify character
function Lore_GetUser()

	Lore_Name = UnitName( "player" );
	local s = "";
	for i = 1, table.getn( Lore_Users ), 1 do
		if ( Lore_Users[i] == Lore_Name ) then
			s = UnitName( "player" );
		end
	end
	if ( s == "" ) then
		table.insert( Lore_Users, Lore_Name );
		Lore_Cycle[ Lore_Name ] = {};
		Lore_Skill[ Lore_Name ] = {};
	end
	if not ( Lore_Skill[ Lore_Name ] ) then
		Lore_Cycle[ Lore_Name ] = {};
		Lore_Skill[ Lore_Name ] = {};
	end

	if ( Lore_Init == 0 ) then
		local index = 0;
		local s = "";

		Lore_Init = 1;
		if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
			for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
				if ( Lore_CurrLanguage == Lore_Cycle[ Lore_Name ][i] ) then
					index = i;
				end
			end
			if ( index > 0 ) then
				if ( Lore_Archive[ Lore_Cycle[ Lore_Name ][ index ] ] ) then
					Lore_Language = Lore_Cycle[ Lore_Name ][ index ];
					if ( Lore_Cycle[ Lore_Name ][ index ] == "Troll" or Lore_Cycle[ Lore_Name ][ index ] == "Gutterspeak" or Lore_Cycle[ Lore_Name ][ index ] == "Taurahe" or Lore_Cycle[ Lore_Name ][ index ] == "Dwarvish" or Lore_Cycle[ Lore_Name ][ index ] == "Gnomish" or Lore_Cycle[ Lore_Name ][ index ] == "Darnassian" ) then
						DEFAULT_CHAT_FRAME.editBox.language = Lore_Cycle[ Lore_Name ][ index ];
					end
					Lore_CurrLanguage = Lore_Cycle[ Lore_Name ][ index ];
					Lore_SetSkill(Lore_CurrLanguage);
				else
					Lore_Language = "";
					--Lore_CurrLanguage = GetDefaultLanguage();
					Lore_SetSkill(Lore_CurrLanguage);
				end
				
				if ( string.sub(Lore_Language, 1, 1 ) ~= "*" ) then -- if no true dialect is spoken
					DEFAULT_CHAT_FRAME:AddMessage( "Lore :: v" .. Lore_Version .. " loaded   <>   language: [" .. Lore_CurrLanguage .. "]", 0.2, 0.7, 1.0 );
				else
					DEFAULT_CHAT_FRAME:AddMessage( "Lore :: v" .. Lore_Version .. " loaded   <>   dialect: [" .. Lore_CurrLanguage .. "]", 0.2, 0.7, 1.0 );
				end
			end
		end
		if ( index == 0 ) then
			-- Language not found on tablet, or no languages on tablet. Load Faction Common
			DEFAULT_CHAT_FRAME:AddMessage( "Lore :: v" .. Lore_Version .. " loaded", 0.2, 0.7, 1.0 );
			DEFAULT_CHAT_FRAME.editBox.language = GetDefaultLanguage();
			Lore_Language = "";
			Lore_CurrLanguage = GetDefaultLanguage();
			Lore_Currentskill = 100;
			LoreDialect:SetText( Lore_CurrLanguage );
		end
		if Lore_Stutterfrequency == 0 then
			Lore_Stutterfrequency = 50;
		end
	end
end


-- Tablet OnLoad function
function Lore_Tablet_OnLoad()

	this:RegisterForDrag( "LeftButton" );
	this:RegisterEvent( "VARIABLES_LOADED" );
	this:RegisterEvent( "PLAYER_ENTERING_WORLD" );

	LoreDialect:SetTextColor( 0.2, 0.7, 1.0, 1 );
	LoreDialect:SetText( Lore_CurrLanguage );
	Lore_Tablet:Show();
end

-- Function: Lore_msg
function Lore_msg( strmsg )

	if ( Lore_Inform == 1 ) then
		DEFAULT_CHAT_FRAME:AddMessage( "Lore <> " .. strmsg , 0.4, 1.0, 0.3 );
	end

end

-- Function: Lore_SetSkill
function Lore_SetSkill( lang )

	if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
		local index = 0;
		for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
			if ( lang == Lore_Cycle[ Lore_Name ][i] ) then
				index = i;
			end
		end
		if ( index > 0 ) then
			Lore_CurrentSkill = Lore_Skill[ Lore_Name ][index];
		else
			Lore_CurrentSkill = 100;
		end
	else
		Lore_CurrentSkill = 100;
	end
end

-- Tablet OnEvent function
function Lore_Tablet_OnEvent( event )
	if ( event == "VARIABLES_LOADED" ) then
		Lore_SetAlpha( Lore_Alpha );
		Lore_SetBorderAlpha( Lore_BorderAlpha );

		if ( Lore_Visible == 1 ) then
			Lore_Tablet:Show();
		else
			Lore_Tablet:Hide();
		end
	end
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		if ( Lore_Visible == 1 ) then
			Lore_Tablet:Show();
		else
			Lore_Tablet:Hide();
		end
	end
end

-- Key binding: Reset
function Lore_BindingReset()

	Lore_msg( "Reset. Interpreters: none, translations: off." );
	Lore_Interpreter = {};
	Lore_To = 0;

end

-- Key binding: Screening
function Lore_BindingScreening()

	if ( Lore_Screen ~=0 ) then
		Lore_Screen = 0;
		Lore_msg( "Lore now considers Party, Raid and Guild chat IC channels." );
	else
		Lore_Screen = 1;
		Lore_msg( "Lore now considers Party, Raid and Guild chat OOC channels." );
	end

end

-- Key binding: Effect - Stuttering
function Lore_BindingStutter()

	if ( Lore_Effect ~= 1 ) then
		Lore_Effect = 1;
		Lore_msg( "Stuttering has been switched on" );
	else
		Lore_Effect = 0;
		Lore_msg( "Speech effects have been switched off" );
	end
end

-- Key binding: Effect - Hissing
function Lore_BindingHiss()

	if ( Lore_Effect ~= 2 ) then
		Lore_Effect = 2;
		Lore_msg( "Hissing has been switched on" );
	else
		Lore_Effect = 0;
		Lore_msg( "Speech effects have been switched off" );
	end
end

-- Key binding: Effect - Lisping
function Lore_BindingLisp()

	if ( Lore_Effect ~= 3 ) then
		Lore_Effect = 3;
		Lore_msg( "Lisping has been switched on" );
	else
		Lore_Effect = 0;
		Lore_msg( "Speech effects have been switched off" );
	end
end

-- Key binding: Effect - Word cutting
function Lore_BindingCut()

	if ( Lore_Effect ~= 4 ) then
		Lore_Effect = 4;
		Lore_msg( "Word cutting has been switched on" );
	else
		Lore_Effect = 0;
		Lore_msg( "Speech effects have been switched off" );
	end
end

-- Key binding: Effect - Word cutting
function Lore_BindingGrowl()

	if ( Lore_Effect ~= 5 ) then
		Lore_Effect = 5;
		Lore_msg( "Growling has been switched on" );
	else
		Lore_Effect = 0;
		Lore_msg( "Speech effects have been switched off" );
	end
end

-- Key binding: add interpreter
function Lore_BindingInterpreterAdd()

	if ( UnitName( "target" ) ) then
		if ( UnitPlayerControlled("target") ) then
			if ( UnitFactionGroup( "player" ) == UnitFactionGroup( "target" ) ) then
				local params = UnitName( "target" );
				local n = table.getn( Lore_Interpreter );
				local index = 0;
				local s = string.gsub( params, '([%a+])[%s.*]', '%1' );
				s = string.upper( strsub( s, 1, 1 ) ) .. string.lower( strsub( s, 2 ) );

				-- Find the interpreter if he/she already exists
				for i = 1, n, 1 do
					if ( Lore_Interpreter[i] == s ) then
						index = i;
					end
				end
				if ( index == 0 ) then
					table.insert( Lore_Interpreter, s );
					Lore_msg( "translator added: " .. s );
				else
					table.remove( Lore_Interpreter, index );
					Lore_msg( "translator removed: " .. s );
				end

			else
				Lore_msg( "invalid translator" );
			end
		else
			Lore_msg( "invalid translator" );
		end

	else
		Lore_msg( "invalid translator" );
	end

end

-- Key binding: cycle language
function Lore_BindingAdvanceCycle()

	if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
		local s = "";
		local index = 0;
		if ( Lore_Language ~= "" ) then
			s = Lore_Language;
		else
			s = DEFAULT_CHAT_FRAME.editBox.language;
		end
		for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
			if ( s == Lore_Cycle[ Lore_Name ][i] ) then
				index = i;
			end
		end
		if ( index > 0 ) then
			if ( index == table.getn( Lore_Cycle[ Lore_Name ] ) ) then
				index = 1;
			else
				index = index + 1;
			end
		else
			index = 1;
		end
		if ( Lore_Archive[ Lore_Cycle[ Lore_Name ][ index ] ] ) then
			Lore_Language = Lore_Cycle[ Lore_Name ][ index ];
			if ( Lore_Language == "Darnassian" or Lore_Language == "Dwarvish" or Lore_Language == "Gnomish" or Lore_Language == "Troll" or Lore_Language == "Gutterspeak" or Lore_Language == "Taurahe" ) then
				DEFAULT_CHAT_FRAME.editBox.language = Lore_Cycle[ Lore_Name ][ index ];

				if ( GetNumLaguages() > 0 ) then
					local langnotallowed = 1;
					for j = 1, GetNumLaguages(), 1 do
						if (Lore_Language == GetLanguageByIndex( j )) then
							langnotallowed = 0;
						end
					end
					if (langnotallowed == 1) then
						LoreDialect:SetTextColor( 0.5, 0.5, 0.5, 1 );
					end
				end
			else
				DEFAULT_CHAT_FRAME.editBox.language = GetDefaultLanguage();
			end
		else
			Lore_Language = "";
			DEFAULT_CHAT_FRAME.editBox.language = Lore_Cycle[ Lore_Name ][ index ];
		end
		LoreDialect:SetText( Lore_Cycle[ Lore_Name ][ index ] );
		Lore_CurrLanguage = Lore_Cycle[ Lore_Name ][ index ];
		Lore_SetSkill(Lore_CurrLanguage);
	else
		Lore_msg( "Tablet: currently empty" );
	end

end

-- Lore_Umlaut function, courtesy of LuckyArts
function Lore_Umlaut( letter )

	if letter == "\195\150" then return "Oe"; end
	if letter == "\195\132" then return "Ae"; end
	if letter == "\195\156" then return "Ue"; end
	if letter == "\195\182" then return "oe"; end
	if letter == "\195\164" then return "ae"; end
	if letter == "\195\188" then return "ue"; end
	if letter == "\195\159" then return "ss"; end
	if letter == "\195\168" or letter == "\195\136" then return "e"; end
	if letter == "\195\169" or letter == "\195\137" then return "e"; end
	if letter == "\195\170" or letter == "\195\138" then return "e"; end
	if letter == "\195\171" or letter == "\195\139" then return "e"; end
	if letter == "\195\160" or letter == "\195\128" then return "a"; end
	if letter == "\195\161" or letter == "\195\129" then return "a"; end
	if letter == "\195\162" or letter == "\195\130" then return "a"; end
	if letter == "\195\165" or letter == "\195\133" then return "a"; end
	if letter == "\195\135" or letter == "\195\167" then return "c"; end
	if letter == "\195\185" or letter == "\195\153" then return "u"; end
	if letter == "\195\186" or letter == "\195\154" then return "u"; end
	if letter == "\195\187" or letter == "\195\155" then return "u"; end
	if letter == "\195\178" or letter == "\195\146" then return "o"; end
	if letter == "\195\179" or letter == "\195\147" then return "o"; end
	if letter == "\195\180" or letter == "\195\148" then return "o"; end
	if letter == "\195\172" or letter == "\195\140" then return "i"; end
	if letter == "\195\173" or letter == "\195\141" then return "i"; end
	if letter == "\195\174" or letter == "\195\142" then return "i"; end
	if letter == "\195\175" or letter == "\195\143" then return "i"; end
	return "";
end

-- Auxilliary function: alter tablet
function Lore_AlterTablet( params )

	local s = "";
	local index = 0;

	for i = 1, GetNumLaguages(), 1 do
		if ( params == string.lower( GetLanguageByIndex( i ) ) ) then
			s = GetLanguageByIndex( i );
		end
	end
	for key, value in Lore_Archive do
		if ( ( params == string.lower( key ) ) and ( key ~= "Languages" ) ) then
			s = key;
		end
	end
	if (UnitFactionGroup("player") == "Alliance") then
		if ( ( string.lower(params) == "orcish" ) or ( string.lower(params) == "gutterspeak" )  or ( string.lower(params) == "troll" )  or ( string.lower(params) == "taurahe" ) ) then
			s = "";
		end
	else
		if ( ( string.lower(params) == "common" ) or ( string.lower(params) == "darnassian" )  or ( string.lower(params) == "gnomish" )  or ( string.lower(params) == "dwarvish" ) ) then
			s = "";
		end
	end
	if ( s ~= "" ) then
		for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
			if ( Lore_Cycle[ Lore_Name ][i] == s ) then
				index = i;
			end
		end
		if ( index ~= 0 ) then
			table.remove( Lore_Cycle[ Lore_Name ], index );
			table.remove( Lore_Skill[ Lore_Name ], index );
			Lore_msg( "Tablet: " .. s .. " removed" );
		else
			table.insert( Lore_Cycle[ Lore_Name ], s );
			table.insert( Lore_Skill[ Lore_Name ], 100 );
			Lore_msg( "Tablet: " .. s .. " added" );
		end
	end
end


-- Blizzard's SendText function
Lore_ChatEdit_SendText = ChatEdit_SendText;


-- SendText hook
function ChatEdit_SendText( editBox, addHistory )

	ChatEdit_ParseText( editBox, 1 );
	LoreToPlayer = "";
	local translated = 0;
	local Screensuppress = 0;

	-- Get the channel type and contents of the edit box
	local text = editBox:GetText();
	local type = editBox.chatType;
	-- Remembering the original text
	old2 = text;
	old = "] " .. text;

	Lore_LastSaid = text;

	-- Join the Lore channel if it is not yet joined (only once per session)
	if ( Lore_Channelcheck == 0 ) then
		if ( GetChannelName( "LoreSkyIsTheLimit" ) == 0 ) then
			JoinChannelByName("LoreSkyIsTheLimit", nil, nil, true);
		end
		Lore_Channelcheck = 1;
	end

	-- Check if player is allowed to speak the default language, or if (s)he should speak faction common instead.
	if (( GetNumLaguages() > 0 ) and (Lore_Language == "Troll" or Lore_Language == "Gutterspeak" or Lore_Language == "Taurahe" or Lore_Language == "Dwarvish" or Lore_Language == "Gnomish" or Lore_Language == "Darnassian")) then
		Screensuppress = 1;
		for j = 1, GetNumLaguages(), 1 do
			if (Lore_Language == GetLanguageByIndex( j )) then
				Screensuppress = 0;
			end
		end
	end

	-- Apply the screening also for default languages
	if ( ( Lore_Screen == 1 ) and ( type == "PARTY" or type == "GUILD" or type == "RAID" or type == "OFFICER" ) ) then
		if ( Lore_Language == "Darnassian" or Lore_Language == "Dwarvish" or Lore_Language == "Gnomish" or Lore_Language == "Troll" or Lore_Language == "Gutterspeak" or Lore_Language == "Taurahe" ) then
			Screensuppress = 1;
		end
	end

	if ( Screensuppress == 1 ) then
		editBox:SetText( text );
		local lang = DEFAULT_CHAT_FRAME.editBox.language;
		DEFAULT_CHAT_FRAME.editBox.language = GetDefaultLanguage();
		Lore_ChatEdit_SendText( editBox, addHistory );
		DEFAULT_CHAT_FRAME.editBox.language = lang;
	end

	-- Use a custom Lore Language if applicable
	if ( Lore_Language ~= "" ) and ( Lore_Language ~= "Orcish" and Lore_Language ~= "Common" and Lore_Language ~= "Darnassian" and Lore_Language ~= "Dwarvish" and Lore_Language ~= "Gnomish" and Lore_Language ~= "Troll" and Lore_Language ~= "Gutterspeak" and Lore_Language ~= "Taurahe") then
		if ( strlen(gsub(text, "%s*(.*)", "%1")) > 0 ) then
			-- Custom Language handling
			if ( type ~= "CHANNEL" and type ~= "CUSTOM" and type ~="WHISPER" and type ~= "EMOTE" ) then
				if not ( ( Lore_Screen == 1 ) and ( type == "PARTY" or type == "GUILD" or type == "RAID" or type == "OFFICER" ) ) then
					if ( Lore_Archive[ Lore_Language ] ~= "" and strsub( text, 1, 2 ) ~= "((" ) then

						-- Item Link solution
						text = string.gsub( text, "|Hitem:(%d+:%d+:%d+:%d+)|h(.-)|h|r", "" );
						text = string.gsub( text, "%|", "");
	
						-- Handling special language specific characters
						text = string.gsub( text, "(\195[\182\164\188\150\132\156\159\168\136\169\137\170\138\171\139\160\128\161\129\162\130\165\133\135\167\185\153\186\154\187\155\178\146\179\147\180\148\172\140\173\141\174\142\175\143])", Lore_Umlaut ); -- NEW by LuckyArts
	
						-- Apply full translation to the text
						Lore_PartialTrans = 0;
						text = string.gsub( text, "([^%a]*)([%a]*)", Lore_Translate );
						-- Partially translate original text if character lacks language skills
						if ( tonumber(Lore_CurrentSkill) < 100 ) then
							Lore_PartialTrans = 1;
							old2 = string.gsub( old2, "([^%a]*)([%a]*)", Lore_Translate );
							old = "] " .. old2;
						end
						old = "[Translation - " .. Lore_Language .. old;
						-- Add language tag
						if ( string.sub(Lore_Language, 1, 1 ) ~= "*" ) then -- if no true dialect is spoken
							text = "[" .. Lore_Language .. "] " .. text;
						end
						old = string.gsub( old, "%$", ""); -- NEW by LuckyArts
						old2 = string.gsub( old2, "%$", ""); -- NEW by LuckyArts
						old = string.gsub( old, "%=", ""); -- NEW by LuckyArts
						old2 = string.gsub( old2, "%=", ""); -- NEW by LuckyArts
						Lore_LastSaid = old2;

						translated = 1;
					end
				end
			end
		end

		-- send mass translations and private translations
		if ( string.sub(Lore_Language, 1, 1 ) ~= "*" ) then -- if no true dialect is spoken
			if (translated == 1) then
				if ( table.getn( Lore_Interpreter ) >= 1 ) then
					for i = 1, table.getn( Lore_Interpreter ), 1 do
						SendChatMessage( old, "WHISPER", GetDefaultLanguage(), Lore_Interpreter[i] );
						Lore_HookEvent = Lore_HookEvent + 1;
					end
				end
				if ( ( Lore_To == 1 ) and ( GetNumPartyMembers() > 0 ) ) then
					SendChatMessage( old, "PARTY" );
				end
				if ( ( Lore_To == 2 ) and ( GetNumRaidMembers() ) ) then
					SendChatMessage( old, "RAID" );	
				end	
				if ( Lore_To == 3 ) then
					SendChatMessage( old, "GUILD" );
				end
				if ( Lore_Self == 1 ) then
					DEFAULT_CHAT_FRAME:AddMessage( "(" .. Lore_Name .. ": " .. old2 .. ")", Lore_Color_R, Lore_Color_G, Lore_Color_B );
				end
			end
		end
	else
		-- An original language is spoken
		if ( tonumber( Lore_CurrentSkill ) < 100 ) then
			if ( type ~= "CHANNEL" and type ~= "CUSTOM" and type ~="WHISPER" and type ~= "EMOTE" ) then
				if not ( ( Lore_Screen == 1 ) and ( type == "PARTY" or type == "GUILD" or type == "RAID" or type == "OFFICER" ) ) then
					Lore_PartialTrans = 1;
					text = string.gsub( text, "([^%a]*)([%a]*)", Lore_Translate );
					editBox:SetText( text );
				end
			end
		end
	end

	-- Apply special language effects
	if ( type ~= "CHANNEL" and type ~= "CUSTOM" and type ~="WHISPER" and type ~= "EMOTE" ) then
		if not ( ( Lore_Screen == 1 ) and ( type == "PARTY" or type == "GUILD" or type == "RAID" or type == "OFFICER" ) ) then
			if ( Lore_Effect == 1 ) then
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\66)", " B-B" ); 
					text = string.gsub( text, "(\32\98)", " b-b" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\67)", " C-C" );
					text = string.gsub( text, "(\32\99)", " c-c" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\68)", " D-D" );
					text = string.gsub( text, "(\32\100)", " d-d" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\70)", " F-F" );
					text = string.gsub( text, "(\32\102)", " f-f" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\71)", " G-G" );
					text = string.gsub( text, "(\32\103)", " g-g" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\75)", " K-K" );
					text = string.gsub( text, "(\32\107)", " k-k" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\77)", " M-M" );
					text = string.gsub( text, "(\32\109)", " m-m" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\83)", " S-S" );
					text = string.gsub( text, "(\32\115)", " s-s" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\87)", " W-W" );
					text = string.gsub( text, "(\32\119)", " w-w" );
				end
				if not ( math.random( 1, 100 ) > tonumber(Lore_Stutterfrequency) ) then
					text = string.gsub( text, "(\32\90)", " Z-Z" );
					text = string.gsub( text, "(\32\122)", " z-z" );
				end
			elseif ( Lore_Effect == 2 ) then
				text = string.gsub( text, "(\83\32)", "SSh" );
				text = string.gsub( text, "(\115)", "ss" );
				text = string.gsub( text, "(\83)", "SS" );
			elseif ( Lore_Effect == 3 ) then
				text = string.gsub( text, "([\90\83])([\122\115])", "Th" );
				text = string.gsub( text, "([\122\115])([\122\115])", "th" );
				text = string.gsub( text, "([\90\83])([\90\83])", "TH" );
				text = string.gsub( text, "([\122\115])", "th" );
				text = string.gsub( text, "([\90\83])", "Th" );
			elseif ( Lore_Effect == 4 ) then
				text = string.gsub( text, "(\78[\71\103\75\107])", "N'" );
				text = string.gsub( text, "(\110[\71\103\75\107])", "n'" );
			elseif ( Lore_Effect == 5 ) then
				text = string.gsub( text, "(\114)", "rr" );
				text = string.gsub( text, "(\82)", "RR" );
			end
		end
	end

	if (Screensuppress ~= 1) then
		-- Call the original SendText function
		editBox:SetText( text );
		if ( ( Lore_Screen == 1 ) and ( DEFAULT_CHAT_FRAME.editBox.language ~= GetDefaultLanguage() ) and ( type == "CHANNEL" or type == "CUSTOM" or type =="WHISPER" or type == "EMOTE" ) ) then
			local lang = DEFAULT_CHAT_FRAME.editBox.language;
			DEFAULT_CHAT_FRAME.editBox.language = GetDefaultLanguage();
			Lore_ChatEdit_SendText( editBox, addHistory );
			DEFAULT_CHAT_FRAME.editBox.language = lang;
		else
			Lore_ChatEdit_SendText( editBox, addHistory );
		end
	end
end

-- Translation function
function Lore_Translate( pre, word )

	local sub, up, low, getn = string.sub, string.upper, string.lower, table.getn;

	local transWord = up( word );
	local temp1 = word;
	local length = string.len( word );
	local hash = Lore_Hash( transWord );
	local archive = Lore_Archive[ Lore_Language ];
	local flag = "";
	local altwordUsed = 0;

	if ( string.sub(pre, -1, -1) == "\124" ) then -- Link encountered
		if ( word == "Hitem" ) then
			return pre .. "Hitem";
		end
		if ( word == "cffffffff" or word == "cff" ) then
			return pre .. "cffffffff";
		end
		word = "thingybob";
		length = 9;
	end

	if ( Lore_PartialTrans == 1 ) then
		if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
			for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
				if ( transWord == up(Lore_Cycle[ Lore_Name ][i]) ) then
					return pre .. word;
				end
			end
		end
		i = math.random( 1, 100 );
		if not ( i > tonumber( Lore_CurrentSkill ) ) then
			return pre .. word;
		end
	end

	if ( (string.sub(pre, -1, -1)) == "$" or (string.sub(pre, -1, -1)) == "=" ) then -- NEW by LuckyArts
		return string.sub(pre, 1, -2) .. word; -- NEW by LuckyArts
	end -- NEW by LuckyArts

	if ( archive ) then
		if ( length > getn( archive ) ) then
			length = getn( archive );
		end

		if ( archive["keywords"] ) then
			for i = 1, getn( archive["keywords"] ), 1 do
				if ( low( word ) == archive["keywords"][i] ) then
					flag = archive["keywords"][i];
				end
			end
		end
		if ( archive["altwords"] ) then
			for i = 1, getn( archive["altwords"]["old"] ), 1 do
				if ( low( word ) == archive["altwords"]["old"][i] ) then
					flag = archive["altwords"]["new"][i];
					altwordUsed = 1;
				end
			end
		end

		archive = Lore_Archive[ Lore_Language ][ length ];

		if ( string.sub(Lore_Language, 1, 1 ) == "*" ) then -- A true dialect is spoken
			if ( altwordUsed == 0 ) then
				return pre .. word;
			end
		end

		if ( ( archive ) or ( flag ~= "" ) ) then
			if ( flag == "" ) then
				transWord = archive[ mod( hash, getn( archive ) ) + 1 ];
			else
				transWord = flag;
			end

			-- Apply word's capitalization to transWord
			local temp2 = low( temp1 );
			local j = 0;

			for i = 1, string.len( word ), 1 do
				if ( j <= ( string.len( transWord ) - 1 ) ) then
					if (strfind( sub( transWord, j + 1 ), '%a' ) ~= nil) then 
						j = j + strfind( sub( transWord, j + 1 ), '%a' );
						if ( sub( temp1, i, i ) == sub( temp2, i, i ) ) then
							transWord = sub( transWord, 0, ( j - 1 ) ) .. low( sub( transWord, j, j ) ) .. sub( transWord, ( j + 1 ) );
						else
							transWord = sub( transWord, 0, ( j - 1 ) ) .. up( sub( transWord, j, j ) ) .. sub( transWord, ( j + 1 ) );
						end
					end
				end
			end	

		else
			transWord = word;
		end

	end

	return pre .. transWord;
end


-- Iriel's simpleHash algorithm: modified, also at Iriel's suggestion,
-- to reproduce the djb2 algorithm
function Lore_Hash( text )

	local l = strlen( text );
	-- Prime numbers
	local primes = { 5347, 5351, 5381, 5387, 5393, 5399, 5407, 5413, 5417, 5419, 5431, 5437, 5441, 5443, 5449 };

	local h = 5381;

	for i = 1, l, 1 do
		local v = strbyte( text, i );
		local p = primes[ mod( v, table.getn( primes ) ) + 1 ];

		h = ( ( h * p ) + v );
	end

	return h;

end

-- Options
function Lore_Options( cmd )
	if ( ( not cmd ) or ( strlen( cmd ) <= 0 ) ) then
		DEFAULT_CHAT_FRAME:AddMessage( " " );
		DEFAULT_CHAT_FRAME:AddMessage( "Lore   <>   options", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "----------------------", 0.2, 0.7, 1.0 );
		DEFAULT_CHAT_FRAME:AddMessage( "Format :: cmd (abbrv) [parameters]", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/language (lang) [language] -> Change to language X", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore tablet (tab) [language] -> Add/remove language on tablet ", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore skill [0-100] -> Set current language skill percentage", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore effect (eff) [none/stutter/hiss/lisp/cut/growl] -> Set speech effect", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore stutter [1-100] -> Set stutter frequency", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore interpreter (int) [<target>/name] -> Add/rem interpreter", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore to [party/raid/guild/none] -> Translate to Channel X", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore self [blank/on/off] -> Send translation to yourself", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore screen (sc) [blank/on/off] -> Toggle screening (group OOC)", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore cycle -> Use next language on tablet", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore list -> List available languages", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore lock -> Lock tablet window", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore unlock -> Unlock tablet window", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore leftclick (left) [none/cycle/int/screen/reset/self/stutter/hiss/lisp/cut/growl] -> Assign leftclick", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore rightclick (right) [none/cycle/int/screen/reset/self/stutter/hiss/lisp/cut/growl] -> Assign rightclick", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore inform [blank/on/off] -> command feedback to chat on/off", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore auto [blank/on/off] -> set auto translation on/off", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore check (chk) [Playername] -> Request known language list", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore hide -> hide tablet window", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore show -> Show tablet window", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore position (pos) [br/bl/tr/tl/tt/bottomright/bottomleft/topright/topleft/tooltip] -> Set position of the Tablet compared to Lore Button", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore version (ver) [Blank/Name] -> Show current Lore version", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore default -> Reset all Lore settings (incl. known languages)", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "/lore reset -> Reset translation settings", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( "Note: typing = or $ directly in front of a word leaves that word untranslated.", 0.4, 1.0, 0.3 );
		DEFAULT_CHAT_FRAME:AddMessage( " " );

	end

	local command, params = Lore_Extract_NextParameter( cmd );

	command = string.lower( command );
	params = string.lower( params );

	if ( command == "to" ) then
		if ( ( params == "none" ) or ( params == "guild" ) or ( params == "raid" ) or ( params == "party" ) or ( params == "group" ) ) then
			if ( params == "none" ) then
				Lore_To = 0;
				Lore_msg( "translations will not display to any group" );
			end
			if ( ( params == "party" ) or ( params == "group" ) ) then
				Lore_To = 1;
				Lore_msg( "translations will now display to the party" );
			end
			if ( params == "raid" ) then
				Lore_To = 2;
				Lore_msg( "translations will now display to the raid" );
			end
			if ( params == "guild" ) then
				Lore_To = 3;
				Lore_msg( "translations will now display to your guild" );
			end
		end
	end

	if ( ( command == "position" ) or ( command == "pos" ) ) then
		if ( ( params == "bottomright" ) or ( params == "br" ) ) then
			Lore_Tabletposition = 0;
			Lore_msg( "The Tablet is now positioned bottom-right of the Lore Button" );
		elseif ( ( params == "bottomleft" ) or ( params == "bl" ) ) then
			Lore_Tabletposition = 1;
			Lore_msg( "The Tablet is now positioned bottom-left of the Lore Button" );
		elseif ( ( params == "topright" ) or ( params == "tr" ) ) then
			Lore_Tabletposition = 2;
			Lore_msg( "The Tablet is now positioned top-right of the Lore Button" );
		elseif ( ( params == "topleft" ) or ( params == "tl" ) ) then
			Lore_Tabletposition = 3;
			Lore_msg( "The Tablet is now positioned top-left of the Lore Button" );
		elseif ( ( params == "tooltip" ) or ( params == "tt" ) ) then
			Lore_Tabletposition = 4;
			Lore_msg( "The Tablet is now positioned in the default tooltip location" );
		end
	end

	if ( command == "self" ) then
		if ( ( params == "off" ) or ( params == "on" ) ) then
			if ( params == "off" ) then
				Lore_Self = 0;
				Lore_msg( "translations will not display to yourself" );
			else
				Lore_Self = 1;
				Lore_msg( "translations will now display to yourself" );
			end
		else
			-- Toggle
			if ( Lore_Self ~= 0 ) then
				Lore_Self = 0;
				Lore_msg( "translations will not display to yourself" );
			else
				Lore_Self = 1;
				Lore_msg( "translations will now display to yourself" );
			end
		end
	end

	if ( ( command == "screen" ) or ( command == "sc" ) ) then
		if ( ( params == "off" ) or ( params == "on" ) ) then
			if ( params == "off" ) then
				Lore_Screen = 0;
				Lore_msg( "Lore now considers Party, Raid and Guild chat IC channels." );
			else
				Lore_Screen = 1;
				Lore_msg( "Lore now considers Party, Raid and Guild chat OOC channels." );
			end
		else
			-- Toggle
			if ( Lore_Screen ~= 0 ) then
				Lore_Screen = 0;
				Lore_msg( "Lore now considers Party, Raid and Guild chat IC channels." );
			else
				Lore_Screen = 1;
				Lore_msg( "Lore now considers Party, Raid and Guild chat OOC channels." );
			end
		end
	end

	if ( command == "skill" ) then
		if ( ( params == "" ) or ( tonumber(params) == nil ) ) then
			Lore_msg( "The language skill command requires a number from 0 to 100." );
		else
			if ( ( params == "" ) or ( tonumber(params) < 0 ) or ( tonumber(params) > 100 ) ) then
				Lore_msg( "The language skill command requires a number from 0 to 100." );
			else
				if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
	
					local s = "";
					local index = 0;
					if ( Lore_Language ~= "" ) then
						s = Lore_Language;
					else	
						s = DEFAULT_CHAT_FRAME.editBox.language;
					end
					for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
						if ( s == Lore_Cycle[ Lore_Name ][i] ) then
							index = i;
						end
					end
					if ( index > 0 ) then
						Lore_CurrentSkill = params; -- val(params) or int(params) ?
						Lore_Skill[ Lore_Name ][index] = params; -- val(params) or int(params) ?
						Lore_msg( Lore_Name .. " now has " .. Lore_CurrentSkill .. "% skill in " .. s );
					else
						Lore_msg( "The current language is not on the tablet. Lore cannot set a skill level for it." );
					end
				else
					Lore_msg( "The current language is not on the tablet. Lore cannot set a skill level for it." );
				end
			end
		end
	end

	if ( command == "stutter" ) then
		if ( ( params == "" ) or ( tonumber(params) == nil ) ) then
			Lore_msg( "The stutter frequency command requires a number from 1 to 100." );
		else
			if ( ( params == "" ) or ( tonumber(params) < 1 ) or ( tonumber(params) > 100 ) ) then
				Lore_msg( "The stutter frequency command requires a number from 1 to 100." );
			else
				Lore_Stutterfrequency = tonumber(params);
				Lore_Effect = 1;
				Lore_msg( "Stutter frequency has been set to " .. Lore_Stutterfrequency .. "%. Stuttering switched on." );
			end
		end
	end

	if ( command == "effect" ) or ( command == "eff" ) then
		if ( params == "stutter" ) then
			Lore_Effect = 1;
			Lore_msg( "Stuttering has been switched on" );
		elseif ( params == "hiss" ) then
			Lore_Effect = 2;
			Lore_msg( "Hissing has been switched on" );
		elseif ( params == "lisp" ) then
			Lore_Effect = 3;
			Lore_msg( "Lisping has been switched on" );
		elseif ( params == "cut" ) then
			Lore_Effect = 4;
			Lore_msg( "Word cutting has been switched on" );
		elseif ( params == "growl" ) then
			Lore_Effect = 5;
			Lore_msg( "Growling has been switched on" );
		else
			Lore_Effect = 0;
			Lore_msg( "Speech effects have been switched off" );
		end
	end

	if ( ( command == "interpreter" ) or ( command == "int" ) ) then -- [1] Add/remove by name given
		if ( ( params ~="" ) and ( strlen( params ) > 0 ) ) then
			local n = table.getn( Lore_Interpreter );
			local index = 0;
			local s = string.gsub( params, '([%a+])[%s.*]', '%1' );
			s = string.upper( strsub( s, 1, 1 ) ) .. string.lower( strsub( s, 2 ) );

			-- Find the interpreter if he/she already exists
			for i = 1, n, 1 do
				if ( Lore_Interpreter[i] == s ) then
					index = i;
				end
			end
			if ( index == 0 ) then
				table.insert( Lore_Interpreter, s );
				Lore_msg( "translator added: " .. s );
			else
				--Print( "Removing at index " .. n );
				table.remove( Lore_Interpreter, index );
				Lore_msg( "translator removed: " .. s );
			end
		else							-- [2] Add/remove by target (no name given)
			Lore_BindingInterpreterAdd();
		end
	end

	if ( ( command == "tablet" ) or ( command == "tab" ) ) then
		if ( params ~= "" ) then
			Lore_AlterTablet( params );
		end
	end

	if ( ( command == "check" ) or ( command == "chk" ) ) then
		if ( params ~= "" ) then
			if ( ( GetChannelName( "LoreSkyIsTheLimit" ) > 0 ) ) then
				SendChatMessage( "LORE::LR::" .. params , "CHANNEL", GetDefaultLanguage(), GetChannelName( "LoreSkyIsTheLimit" ) );
			end
		end
	end

	if ( command == "cycle" ) then
		Lore_BindingAdvanceCycle();
	end

	if ( ( command == "version" ) or ( command == "ver" ) ) then
		if ( params == "" ) then
			DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Version: v" .. Lore_Version, 0.2, 0.7, 1.0 );
		else
			DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Requesting " .. params .. "'s Lore version...", 0.2, 0.7, 1.0 );
			DEFAULT_CHAT_FRAME:AddMessage( "Lore <> No version number means 4.3, older, or no Lore installed.", 0.2, 0.7, 1.0 );
			-- request for other player's Lore version number to be sent
			SendChatMessage( "LORE::VER::" .. params , "CHANNEL", GetDefaultLanguage(), GetChannelName( "LoreSkyIsTheLimit" ) );
		end
	end

	if ( command == "list" ) then
		DEFAULT_CHAT_FRAME:AddMessage( "Default languages:", 0.2, 0.7, 1.0 );
		local s = "";
		if ( GetNumLaguages() > 0 ) then
			s = GetLanguageByIndex( 1 );
			for i = 2, GetNumLaguages(), 1 do
				s = s .. ", " .. GetLanguageByIndex( i );
			end
		end
		DEFAULT_CHAT_FRAME:AddMessage( "- " .. s, 0.4, 1.0, 0.3 ); 

		DEFAULT_CHAT_FRAME:AddMessage( "Lore languages:", 0.2, 0.7, 1.0 );
		s = "";
		local i = 0;
		for key, value in Lore_Archive do
			if ( key ~= "Languages" ) then
				if ( i == 0 ) then
					i = 1;
				else
					s = s .. ", ";
				end					
				s = s .. key;
			end
		end
		DEFAULT_CHAT_FRAME:AddMessage( "- " .. s, 0.4, 1.0, 0.3 ); 
	end

	if ( command == "reset" ) then
		Lore_msg( "Reset. Interpreters: none, translations: off." );
		--Lore_Defaults();
		Lore_Interpreter = {};
		Lore_To = 0;
	end

	if ( ( command == "default" ) or ( command == "defaults" ) ) then
		Lore_Defaults();
	end

	if ( command == "hide" ) then
		Lore_Tablet:Hide();
		Lore_Visible = 0;
		return;
	end 

	if ( command == "show" ) then
		Lore_Tablet:Show();
		Lore_Visible = 1;
		return;	
	end

	if ( command == "inform" ) then
		if ( ( params == "off" ) or ( params == "on" ) ) then
			if ( params == "off" ) then
				Lore_Inform = 0;
				DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Lore will no longer confirm given commands to chat window", 0.4, 1.0, 0.3  );
			else
				Lore_Inform = 1;
				DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Lore will now again confirm given commands to chat window", 0.4, 1.0, 0.3  );
			end
		else
			-- toggle
			if (Lore_Inform ~= 0 ) then
				Lore_Inform = 0;
				DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Lore will no longer confirm given commands to chat window", 0.4, 1.0, 0.3  );
			else
				Lore_Inform = 1;
				DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Lore will now again confirm given commands to chat window", 0.4, 1.0, 0.3  );
			end
		end
	end

	if ( command == "auto" ) then
		if ( ( params == "off" ) or ( params == "on" ) ) then
			if ( params == "off" ) then
				Lore_Autotrans = -1;
				DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Lore will no longer auto-translate to you", 0.4, 1.0, 0.3  );
			else
				Lore_Autotrans = 0;
				DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Lore will now again auto-translate to you", 0.4, 1.0, 0.3  );
			end
		else
			-- toggle
			if (Lore_Autotrans ~= -1 ) then
				Lore_Autotrans = -1;
				DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Lore will no longer auto-translate to you", 0.4, 1.0, 0.3  );
			else
				Lore_Autotrans = 0;
				DEFAULT_CHAT_FRAME:AddMessage( "Lore <> Lore will now again auto-translate to you", 0.4, 1.0, 0.3  );
			end
		end
	end


	if ( command == "lock" ) then
		Lore_Locked = 1;
		Lore_msg( "Tablet locked" );
		return;	
	end

	if ( command == "unlock" ) then
		Lore_Locked = 0;
		Lore_msg( "Tablet unlocked" );
		return;	
	end

	if ( ( command == "left" ) or ( command == "leftclick" ) ) then
		if ( params == "none" ) then
			Lore_Left = 0;
			Lore_msg( "Leftclick disabled" );
		end
		if ( params == "cycle" ) then
			Lore_Left = 1;
			Lore_msg( "Leftclick assigned to cycling languages" );
		end
		if ( ( params == "int" ) or ( params == "interpreter" ) ) then
			Lore_Left = 2;
			Lore_msg( "Leftclick assigned to adding/removing targetted interpreter" );
		end
		if ( params == "screen" ) then
			Lore_Left = 3;
			Lore_msg( "Leftclick assigned to toggling screening on/off" );
		end
		if ( params == "reset" ) then
			Lore_Left = 4;
			Lore_msg( "Leftclick assigned to resetting translators and translations" );
		end
		if ( params == "self" ) then
			Lore_Left = 5;
			Lore_msg( "Leftclick assigned to toggling translation to self on/off" );
		end
		if ( params == "stutter" ) then
			Lore_Left = 6;
			Lore_msg( "Leftclick assigned to toggling stuttering on/off" );
		end
		if ( params == "hiss" ) then
			Lore_Left = 7;
			Lore_msg( "Leftclick assigned to toggling hissing on/off" );
		end
		if ( params == "lisp" ) then
			Lore_Left = 8;
			Lore_msg( "Leftclick assigned to toggling lisping on/off" );
		end
		if ( params == "cut" ) then
			Lore_Left = 9;
			Lore_msg( "Leftclick assigned to toggling word cutting on/off" );
		end
		if ( params == "growl" ) then
			Lore_Left = 10;
			Lore_msg( "Leftclick assigned to toggling growling on/off" );
		end
	end

	if ( ( command == "right" ) or ( command == "rightclick" ) ) then
		if ( params == "none" ) then
			Lore_Right = 0;
			Lore_msg( "Rightclick disabled" );
		end
		if ( params == "cycle" ) then
			Lore_Right = 1;
			Lore_msg( "Rightclick assigned to cycling languages" );
		end
		if ( ( params == "int" ) or ( params == "interpreter" ) ) then
			Lore_Right = 2;
			Lore_msg( "Rightclick assigned to adding/removing targetted interpreter" );
		end
		if ( params == "screen" ) then
			Lore_Right = 3;
			Lore_msg( "Rightclick assigned to toggling screening on/off" );
		end
		if ( params == "reset" ) then
			Lore_Right = 4;
			Lore_msg( "Rightclick assigned to resetting translators and translations" );
		end
		if ( params == "self" ) then
			Lore_Right = 5;
			Lore_msg( "Rightclick assigned to toggling translation to self on/off" );
		end
		if ( params == "stutter" ) then
			Lore_Right = 6;
			Lore_msg( "Rightclick assigned to toggling stuttering on/off" );
		end
		if ( params == "hiss" ) then
			Lore_Right = 7;
			Lore_msg( "Rightclick assigned to toggling hissing on/off" );
		end
		if ( params == "lisp" ) then
			Lore_Right = 8;
			Lore_msg( "Rightclick assigned to toggling lisping on/off" );
		end
		if ( params == "cut" ) then
			Lore_Right = 9;
			Lore_msg( "Rightclick assigned to toggling word cutting on/off" );
		end
		if ( params == "growl" ) then
			Lore_Right = 10;
			Lore_msg( "Rightclick assigned to toggling growling on/off" );
		end
	end

	if ( command == "alpha" ) then
		if ( params ) then
			Lore_SetAlpha( params );
			Lore_Alpha = params;
			return;
		end
	end

	if ( command == "borderalpha" ) then
		if ( params ) then
			Lore_SetBorderAlpha( params );
			Lore_BorderAlpha = params;
			return;
		end
	end
end


-- Juna's Extract_NextParameter, from the excellent QuickCash AddOn
function Lore_Extract_NextParameter( msg )
	local params = msg;
	local command = params;
	if ( command ) then
		local index = strfind( command, " ");
		if ( index ) then
			command = strsub(command, 1, index-1);
			params = strsub(params, index+1);
		else
			params = "";
		end
	end

	return command, params;
end


-- LanguageCommand method
local function SetLanguage( msg )

	local numLangs = GetNumLaguages();
	local found = 0;
	msg = string.lower( msg );

	if (UnitFactionGroup("player") == "Alliance") then
		if ( ( msg == "orcish" ) or ( msg == "gutterspeak" )  or ( msg == "troll" )  or ( msg == "taurahe" ) ) then
			msg = "common";
		end
	else
		if ( ( msg == "common" ) or ( msg == "darnassian" )  or ( msg == "gnomish" )  or ( msg == "dwarvish" ) ) then
			msg = "orcish";
		end
	end

	-- Set the language to a default one, if matched
	for i = 1, numLangs, 1 do
		local lang = string.lower( GetLanguageByIndex( i ) );

		if ( ( ( msg == lang ) or ( string.sub( lang, 1, string.len( msg ) ) == msg ) ) and ( found == 0 ) ) then
			if ( DEFAULT_CHAT_FRAME ) then
				DEFAULT_CHAT_FRAME.editBox.language = GetLanguageByIndex( i );
				--Lore_msg( "Now speaking " .. GetLanguageByIndex( i ) );
				Lore_Language = "";
				found = 1;
				LoreDialect:SetText( GetLanguageByIndex( i ) );
				Lore_CurrLanguage = GetLanguageByIndex( i );
				Lore_SetSkill(Lore_CurrLanguage);
			end
		end
	end

	-- Set the language to one availabe through Lore, if matched
	if ( Lore_Archive ~= "" ) then
		for key, value in Lore_Archive do
			key2 = string.lower( key );
			if ( key2 ~= "languages" ) then
				if ( ( ( msg == key2 ) or ( string.sub( key2, 1, string.len( msg ) ) == msg ) ) and ( found == 0 ) ) then
					if ( DEFAULT_CHAT_FRAME ) then
						DEFAULT_CHAT_FRAME.editBox.language = GetLanguageByIndex( 0 );
						--Lore_msg( "Now speaking " .. key );
						Lore_Language = key;
						found = 1;
						LoreDialect:SetText( Lore_Language );
						Lore_CurrLanguage = Lore_Language;
						Lore_SetSkill(Lore_CurrLanguage);
					end
				end
			end
		end
	end
end


-- LanguageCommand initialization
function LanguageCommand_OnLoad()

	if not SlashCmdList["LANGUAGECMD"] then
		SlashCmdList["LANGUAGECMD"] = SetLanguage;
		SLASH_LANGUAGECMD1 = "/language";
		SLASH_LANGUAGECMD2 = "/lang";
	end
end


-- Blizzard's ChatFrame_OnEvent function
Lore_ChatFrame_OnEvent = ChatFrame_OnEvent;


-- ChatFrame hook
function ChatFrame_OnEvent( event )

	local LorePrint = 1;
	local LoreArg1 = arg1;


--(1)	-- Handle the printing of translation/version replies and withold whispers containing LoRe-CoDe.
	if( event == "CHAT_MSG_WHISPER" ) then

		if ( string.find( arg1, "<LoRe5>" ) ) then
			Lore_HookEvent = Lore_HookEvent + 1;
			LorePrint = 0;
			if ( Lore_PrevMsg ~= arg1 ) then
				if (arg2 == Lore_PrevRequestName) and (Lore_PreviousRequestCount > 0) then
					Lore_PreviousRequestCount = Lore_PreviousRequestCount - 1;
					local temp_LoreSkill = Lore_CurrentSkill;
					Lore_CurrentSkill = Lore_PrevRequestSkill;
					Lore_PartialTrans = 1;
					arg1 = string.gsub( arg1, "([^%a]*)([%a]*)", Lore_Translate );
					Lore_CurrentSkill = temp_LoreSkill;
				end
				DEFAULT_CHAT_FRAME:AddMessage( "(" .. arg2 .. ": " .. string.sub( arg1, 8, string.len(arg1) ) .. ")", Lore_Color_R, Lore_Color_G, Lore_Color_B );
				Lore_PrevMsg = arg1; -- for antiduplicate
			end
		end
	end

	-- Withold sent whispers containing LoRe-CoDe.
	if( event == "CHAT_MSG_WHISPER_INFORM" ) then
		if ( string.find( arg1, "<LoRe5>" ) ) then
			Lore_HookEvent = Lore_HookEvent + 1;
			LorePrint = 0;
		end
	end

--(2)	-- Detect language tags, check whether your character knows them and if so; send a translation request.
	if ( ( arg2 ~= Lore_Name ) and ( arg1 ~= nil ) ) then
		if ( event == "CHAT_MSG_SAY" ) or ( event == "CHAT_MSG_YELL" ) or ( event == "CHAT_MSG_MONSTER_SAY" ) or ( event == "CHAT_MSG_MONSTER_YELL" ) or ( event == "CHAT_MSG_PARTY" ) or ( event == "CHAT_MSG_RAID" ) or ( event == "CHAT_MSG_GUILD" ) or ( event == "CHAT_MSG_OFFICER" ) then
			local index = 0; -- index of the language on the tablet
			local i = 0;
			local lang1 = "";
			local langskill = 100;
			local monlan = "";

			-- Apply tag-checking when official language is spoken
			if ( ( event == "CHAT_MSG_SAY" or event == "CHAT_MSG_YELL" or event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_RAID" or event == "CHAT_MSG_GUILD" or event == "CHAT_MSG_OFFICER" or event == "CHAT_MSG_MONSTER_SAY" or event == "CHAT_MSG_MONSTER_YELL" ) ) then
				if ( ( arg3 ~= "Common") and ( arg3 ~= "Orcish" ) ) then
					monlan = " " .. arg3;
				end
			end

			-- Check if a default or custom language is used and on the tablet (find by tag)
			if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
				for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
					if ( string.find( monlan .. arg1, Lore_Cycle[ Lore_Name ][i] ) == 2 ) then
						-- Language tag found!
						index = i;
						lang1 = Lore_Cycle[ Lore_Name ][i];
						langskill = tonumber(Lore_Skill[ Lore_Name ][i]);
					end
				end
			end

			-- Check if Faction Common (has no tag) is used and on the tablet
			if ( ( index == 0 ) and ( ( arg3 == "Common") or ( arg3 == "Orcish" ) ) ) then
				if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
					for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
						if ( arg3 == Lore_Cycle[ Lore_Name ][i] ) then
							-- Faction Common found on tablet
							index = i;
							lang1 = Lore_Cycle[ Lore_Name ][i];
							langskill = tonumber(Lore_Skill[ Lore_Name ][i]);
						end
					end
				end
			end

			-- Continue if the spoken language is on the tablet
			if ( index > 0 ) then
				-- Handle language skills
				if ( langskill < 100 ) then
					if not ( (Lore_Screen==1) and ( ( event == "CHAT_MSG_PARTY" ) or ( event == "CHAT_MSG_RAID" ) or ( event == "CHAT_MSG_GUILD" ) or ( event == "CHAT_MSG_OFFICER" ) ) ) then
						local temp_LoreSkill = Lore_CurrentSkill;
						Lore_CurrentSkill = langskill;
						Lore_PartialTrans = 1;
						arg1 = string.gsub( arg1, "([^%a]*)([%a]*)", Lore_Translate );
						Lore_CurrentSkill = temp_LoreSkill;
					end
				end
				-- Send request for translation to the channel (but don't send reqests to yourself or monsters, nor request for FCommon translations (that's only spam))

				if ( ( GetChannelName( "LoreSkyIsTheLimit" ) > 0 ) and ( Lore_Autotrans ~= -1 ) and ( arg2 ~= Lore_Name ) and ( event ~= "CHAT_MSG_MONSTER_SAY" ) and ( event ~= "CHAT_MSG_MONSTER_YELL" ) and ( lang1 ~= "Common" ) and ( lang1 ~= "Orcish" ) ) then
					if ( GetNumLaguages() > 0 ) then
						local langbydefault = 0;
						for j = 1, GetNumLaguages(), 1 do
							if (lang1 == GetLanguageByIndex( j )) then
								langbydefault = 1;
							end
						end
						if (langbydefault == 0) then
							SendChatMessage( "LORE::TR::" .. arg2 , "CHANNEL", GetDefaultLanguage(), GetChannelName( "LoreSkyIsTheLimit" ) );
							Lore_PrevRequestSkill = langskill;
							if (Lore_PrevRequestSkill ~= 100) then
								if arg2 == Lore_PrevRequestName then
									-- send another request
									Lore_PreviousRequestCount = Lore_PreviousRequestCount + 1;
									if Lore_PreviousRequestCount > 10 then
										Lore_PreviousRequestCount = 5;
									end
								else
									Lore_PreviousRequestCount = 1;
									Lore_PrevRequestName = arg2;
								end
							else
								Lore_PreviousRequestName = "";
								Lore_PreviousRequestCount = 0;
							end
						end
					end
				end
			end
		end
	end

--(3)	-- Handling the Lore channel
	if ( Lore_HookEvent > 0 ) then
		if( ( event == "CHAT_MSG_SYSTEM" ) or ( event == "CHAT_MSG_WHISPER_INFORM" ) or (event == "CHAT_MSG_CHANNEL") or ( event == "CHAT_MSG_WHISPER" and string.find( arg1, "<LoRe5>" ) ) ) then
			Lore_HookEvent = Lore_HookEvent - 1;
			LorePrint = 0;
		end
	else
		-- Handling the secret messaging service
		if(event == "CHAT_MSG_CHANNEL") then
			if ( arg9 == "LoreSkyIsTheLimit" ) then
				--DEFAULT_CHAT_FRAME:AddMessage( "Lore :: CHANNEL received, " .. arg2 .. " -> " .. arg1 , 0.2, 0.7, 1.0 );
				if ( arg1 == "LORE::TR::" .. Lore_Name ) or ( arg1 == "Lore, tr, " .. Lore_Name .. "." ) then -- latter is a Eloquence fix. Damn Eloquence!
					-- send last translation to the requesting player
					if ( ( Lore_LastSaid ~= "" ) and ( LoreToPlayer ~= arg2 ) ) then
						Lore_PrevMsg = arg1;
						LoreToPlayer = arg2;
						SendChatMessage( "<LoRe5>" .. Lore_LastSaid , "WHISPER", GetDefaultLanguage(), arg2 );
					end
				end
				if ( arg1 == "LORE::LR::" .. string.lower( Lore_Name ) ) or ( arg1 == "Lore, lr, " .. string.lower( Lore_Name ) .. "." ) then -- latter is a Eloquence fix. Damn Eloquence!
					-- send known language list to the requesting player
					if ( LoreToPlayer ~= arg2 ) then
						if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
							Lore_PrevMsg = arg1;
							LoreToPlayer = arg2;
							if ( Lore_Autotrans == 0 ) then
								s = "I understand ";
								for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
									if ( i > 1 ) then
										s = s .. ", ";
									end
									s = s .. Lore_Cycle[ Lore_Name ][i];
									if ( tonumber(Lore_Skill[ Lore_Name ][i]) < 100 ) then
										s = s .. "(" .. Lore_Skill[ Lore_Name ][i] .. "%)";
									end
								end
								SendChatMessage( "<LoRe5>" .. s, "WHISPER", GetDefaultLanguage(), arg2 );
							else
								SendChatMessage( "<LoRe5>OOC: I have auto-translation switched off, won't get translations.", "WHISPER", GetDefaultLanguage(), arg2 );
							end
						else
							SendChatMessage( "<LoRe5>I don't know any languages.", "WHISPER", GetDefaultLanguage(), arg2 );
						end
					end
				end
				if ( arg1 == "LORE::VER::" .. string.lower( strsub( Lore_Name, 1 ) ) and ( Lore_PrevMsg ~= arg1 ) ) then
					-- send your Lore version number to the requesting player
					Lore_PrevMsg = arg1;
					SendChatMessage( "<LoRe5>OOC: My Lore version is v" .. Lore_Version , "WHISPER", GetDefaultLanguage(), arg2 );
				end

				LorePrint = 0;
			end
		end
	end

	if ( LorePrint == 1 ) then
		Lore_ChatFrame_OnEvent( event );
	end
end


-- Language menu hook
Lore_LanguageMenu_LoadLanguages = LanguageMenu_LoadLanguages;

function LanguageMenu_LoadLanguages()

	Lore_LanguageMenu_LoadLanguages();
	for i = 1, table.getn( Lore_Archive["Languages"] ), 1 do
		UIMenu_AddButton( Lore_Archive["Languages"][i], nil, LanguageMenu_Click );
	end
end


-- Language menu click
Lore_LanguageMenu_Click = LanguageMenu_Click;

function LanguageMenu_Click()

	local str1 = "";

	if ( arg1 == "LeftButton" ) then
		if ( this:GetID() <= GetNumLaguages() ) then
			Lore_LanguageMenu_Click();
			LoreDialect:SetText( GetLanguageByIndex( this:GetID() ) );
			SetLanguage ( LoreDialect:GetText() );
			Lore_CurrLanguage = LoreDialect:GetText();
		else
			for key, value in Lore_Archive do
				if ( key == Lore_Archive["Languages"][( this:GetID() - GetNumLaguages() )] ) then
					DEFAULT_CHAT_FRAME.editBox.language = GetLanguageByIndex( 0 );
					Lore_Language = Lore_Archive["Languages"][( this:GetID() - GetNumLaguages() )];
					LoreDialect:SetText( Lore_Language );
					Lore_CurrLanguage = Lore_Language;
					Lore_SetSkill( Lore_Language );
				end
			end
		end
	end
end


-- Tablet -> begin dragging
function Lore_Tablet_OnMouseDown( arg1 )
	
	LoreDialect:SetTextColor( 1.0, 1.0, 1.0 );
	if ( arg1 == "LeftButton" ) then
		if ( Lore_Locked == 0 ) then
			Lore_Tablet:StartMoving();
		end
	end
end


-- Tablet -> finish dragging
function Lore_Tablet_OnMouseUp( arg1 )

	LoreDialect:SetTextColor( 0.2, 0.7, 1.0, 1 );
	if ( arg1 == "LeftButton" ) then
		Lore_Tablet:StopMovingOrSizing();
		if ( Lore_Locked == 1 ) then
			-- LEFT CLICK HANDLING
			if ( Lore_Left == 1 ) then
				Lore_BindingAdvanceCycle();
			end
			if ( Lore_Left == 2 ) then
				Lore_BindingInterpreterAdd();
			end
			if ( Lore_Left == 3 ) then
				Lore_BindingScreening();
			end
			if ( Lore_Left == 4 ) then
				Lore_BindingReset();
			end
			if ( Lore_Left == 5 ) then
				if ( Lore_Self ~= 0 ) then
					Lore_Self = 0;
					Lore_msg( "translations will not display to yourself" );
				else
					Lore_Self = 1;
					Lore_msg( "translations will now display to yourself" );
				end
			end
			if ( Lore_Left == 6 ) then
				Lore_BindingStutter();
			end
			if ( Lore_Left == 7 ) then
				Lore_BindingHiss();
			end
			if ( Lore_Left == 8 ) then
				Lore_BindingLisp();
			end
			if ( Lore_Left == 9 ) then
				Lore_BindingCut();
			end
			if ( Lore_Left == 10 ) then
				Lore_BindingGrowl();
			end

			Lore_OnEnter(); -- refresh tooltip (not automatic if mouse is over)
		end
	end
	if ( arg1 == "RightButton" ) then
		-- RIGHT CLICK HANDLING
		if ( Lore_Right == 1 ) then
			Lore_BindingAdvanceCycle();
		end
		if ( Lore_Right == 2 ) then
			Lore_BindingInterpreterAdd();
		end
		if ( Lore_Right == 3 ) then
			Lore_BindingScreening();
		end
		if ( Lore_Right == 4 ) then
			Lore_BindingReset();
		end
		if ( Lore_Right == 5 ) then
			if ( Lore_Self ~= 0 ) then
				Lore_Self = 0;
				Lore_msg( "translations will not display to yourself" );
			else
				Lore_Self = 1;
				Lore_msg( "translations will now display to yourself" );
			end
		end
		if ( Lore_Right == 6 ) then
			Lore_BindingStutter();
		end
		if ( Lore_Right == 7 ) then
			Lore_BindingHiss();
		end
		if ( Lore_Right == 8 ) then
			Lore_BindingLisp();
		end
		if ( Lore_Right == 9 ) then
			Lore_BindingCut();
		end
		if ( Lore_Right == 10 ) then
			Lore_BindingGrowl();
		end

		Lore_OnEnter(); -- refresh tooltip (not automatic if mouse is over)
	end
end


-- Tablet -> show tooltip
function Lore_OnEnter()

	-- put the tool tip in the default position
	-- GameTooltip_SetDefaultAnchor( GameTooltip, this );
	GameTooltip:SetOwner( Lore_Tablet, "ANCHOR_BOTTOMLEFT" );
	if ( Lore_Tabletposition == 1 ) then
		GameTooltip:SetOwner( Lore_Tablet, "ANCHOR_BOTTOMLEFT" );
	elseif ( Lore_Tabletposition == 2 ) then
		GameTooltip:SetOwner( Lore_Tablet, "ANCHOR_TOPRIGHT" );
	elseif ( Lore_Tabletposition == 3 ) then
		GameTooltip:SetOwner( Lore_Tablet, "ANCHOR_TOPLEFT" );
	elseif ( Lore_Tabletposition == 4 ) then
		GameTooltip_SetDefaultAnchor( GameTooltip, this );
	else
		GameTooltip:SetOwner( Lore_Tablet, "ANCHOR_BOTTOMRIGHT" );
	end
	
	-- set the tool tip text
	GameTooltip:SetText( " --- Lore Tablet", 0.2, 0.7, 1.0, 1 );
	if ( Lore_Screen == 1 ) then
		GameTooltip:AddLine( "< screening enabled >", 0.5, 0.5, 0.5, 1 );
	else
		GameTooltip:AddLine( "< screening disabled >", 0.5, 0.5, 0.5, 1 );
	end

	if ( Lore_Self == 1 ) then
		GameTooltip:AddLine( "< trans. to self: ON >", 0.5, 0.5, 0.5, 1 );
	else
		GameTooltip:AddLine( "< trans. to self: OFF >", 0.5, 0.5, 0.5, 1 );
	end

	if ( GetChannelName( "LoreSkyIsTheLimit" ) > 0 ) then
		if ( Lore_Autotrans == -1 ) then
			GameTooltip:AddLine( "< auto-trans.: OFF >", 0.5, 0.5, 0.5, 1 );
		else
			GameTooltip:AddLine( "< auto-trans.: ON >", 0.5, 0.5, 0.5, 1 );
		end
	else
		GameTooltip:AddLine( "< Lore channel missing! >", 1.0, 0.2, 0.2, 1 );
	end

	GameTooltip:AddLine( Lore_Name .. "'s fluency:", 0.4, 1.0, 0.3, 1 );
	if ( table.getn( Lore_Cycle[ Lore_Name ] ) > 0 ) then
		for i = 1, table.getn( Lore_Cycle[ Lore_Name ] ), 1 do
			local tc = 1.0;
			if (( GetNumLaguages() > 0 ) and ((Lore_Cycle[ Lore_Name ][i] == "Troll" or Lore_Cycle[ Lore_Name ][i] == "Gutterspeak" or Lore_Cycle[ Lore_Name ][i] == "Taurahe" or Lore_Cycle[ Lore_Name ][i] == "Dwarvish" ) or Lore_Cycle[ Lore_Name ][i] == "Gnomish" or Lore_Cycle[ Lore_Name ][i] == "Darnassian")) then
				tc = 0.7;
				for j = 1, GetNumLaguages(), 1 do
					if (Lore_Cycle[ Lore_Name ][i] == GetLanguageByIndex( j )) then
						tc = 1.0;
					end
				end
			end

			GameTooltip:AddLine( " - " .. Lore_Cycle[ Lore_Name ][i] .. " (" .. Lore_Skill[ Lore_Name ][i] .. "%)", 1.0, tc, tc );
		end
	else
		GameTooltip:AddLine( " - none", 0.5, 0.5, 0.5 );
	end

	GameTooltip:AddLine( "Language Effect:", 0.4, 1.0, 0.3, 1 );
	if ( Lore_Effect == 1 ) then
		GameTooltip:AddLine( " - Stuttering", 1.0, 0.5, 0.5, 1 );
	elseif ( Lore_Effect == 2 ) then
		GameTooltip:AddLine( " - Hissing", 1.0, 0.5, 0.5, 1 );
	elseif ( Lore_Effect == 3 ) then
		GameTooltip:AddLine( " - Lisping", 1.0, 0.5, 0.5, 1 );
	elseif ( Lore_Effect == 4 ) then
		GameTooltip:AddLine( " - Word cutting", 1.0, 0.5, 0.5, 1 );
	elseif ( Lore_Effect == 5 ) then
		GameTooltip:AddLine( " - Growling", 1.0, 0.5, 0.5, 1 );
	else
		GameTooltip:AddLine( " - none", 0.5, 0.5, 0.5, 1 );
	end

	GameTooltip:AddLine( "Translating to:", 0.4, 1.0, 0.3, 1 );
	if ( table.getn( Lore_Interpreter ) > 0 ) then
		for i = 1, table.getn( Lore_Interpreter ) do
			GameTooltip:AddLine( " - " .. Lore_Interpreter[i], 1.0, 1.0, 1.0 );
		end
	else
		GameTooltip:AddLine( " - no interpreter set", 0.5, 0.5, 0.5 );
	end

	GameTooltip:AddLine( "Mass translating to:", 0.4, 1.0, 0.3, 1 );
	if ( Lore_To == 1 ) then
		GameTooltip:AddLine( " - Party", 1.0, 1.0, 1.0 );
	elseif ( Lore_To == 2 ) then
		GameTooltip:AddLine( " - Raid", 1.0, 1.0, 1.0 );
	elseif ( Lore_To == 3 ) then
		GameTooltip:AddLine( " - Guild", 1.0, 1.0, 1.0 );
	else
		GameTooltip:AddLine( " - none", 0.5, 0.5, 0.5 );
	end

	GameTooltip:Show();
end


-- Tablet -> set background opacity
function Lore_SetAlpha( alpha )

	Lore_Tablet:SetBackdropColor( TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b, alpha );
end


-- Tablet -> set border opacity
function Lore_SetBorderAlpha( alpha )

	Lore_Tablet:SetBackdropBorderColor( TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, alpha );
end

