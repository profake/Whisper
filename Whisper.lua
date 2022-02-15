script_name('Whisper')
script_author('Nasif')
require "lib.moonloader"

whisper = true

function main()

	while not isSampAvailable() do wait(100) end
	
	sampAddChatMessage("[Whisper] {FFFFFF}Use /whisper to toggle auto whisper {00FF00}on{FFFFFF} and {FF0000}off!", 0x6667ab)
	
	sampRegisterChatCommand("whisper", whisperToggle)
	
	while true do
		wait(0)
		if sampIsChatInputActive() and whisper then
			chatText = sampGetChatInputText()
			if chatText ~= nil then
				if string.len(chatText) > 0 and string.len(chatText) < 2 then 
					if chatText:sub(1, 1) ~= "!"
					and chatText:sub(1, 1) ~= "#"
					and chatText:sub(1, 1) ~= "@"
					and chatText:sub(1, 1) ~= "~"
					and chatText:sub(1, 1) ~= "/"
					and chatText:sub(1, 1) ~= "*"
					and chatText:sub(1, 1) ~= "$"
					and chatText:sub(1, 1) ~= " "
					then
						sampSetChatInputText("~" .. sampGetChatInputText()) 
					end
				else 
					if chatText:sub(1, 1) == "~" and chatText:sub(2,2) == "k" then
						sampSetChatInputText("~ k" .. chatText:sub(3)) 
					end
				end
			end
		end
	end
end

function whisperToggle()
	whisper = not whisper
	if (whisper) then
		sampAddChatMessage("[Whisper] {eee6ff}Turning {00FF00}on{eee6ff} automatic whisper!", 0x6667ab)
	else
		sampAddChatMessage("[Whisper] {eee6ff}Turning {FF0000}off{eee6ff} automatic whisper!", 0x6667ab)
	end
end
