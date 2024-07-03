-- This file will include any basic bot functions modification
-- Like modify for what modes bot can summon companion.

-- In this table there will be all references to all modified function/table to restore them
-- when mode is switched from Daily hunt
DailyHuntAssistantMode.BotFunctions = 
{
	c_companion = c_companion
}

-- Will monitor current mode and do switch original->modified->original functions/tables
DailyHuntAssistantMode.MonitorModeThrottle = 1000
DailyHuntAssistantMode.MonitorModeNextUpdateTick = 0
function DailyHuntAssistantMode.MonitorMode(_,tickcount)
	local dham = DailyHuntAssistantMode
	-- Do throttling
	if ( dham.MonitorModeNextUpdateTick < tickcount) then
		-- Check current mode		
		if ( gBotMode == dham.modeName ) then
			c_companion = DailyHuntAssistantMode.c_companion
		else
			c_companion = DailyHuntAssistantMode.BotFunctions.c_companion
		end
		dham.MonitorModeNextUpdateTick = tickcount + dham.MonitorModeThrottle
	end
end

-- Modified ffxiv_common_cne c_companion - make companion summonable for this mode
DailyHuntAssistantMode.c_companion = inheritsFrom( ml_cause )
function DailyHuntAssistantMode.c_companion:evaluate()
	    if (Player.ismounted or IsMounting() or IsDismounting() or
		IsCompanionSummoned() or Player.castinginfo.lastcastid == 851) 
	then
        return false
    end
	local currentHunt = DailyHuntAssistantMode.currentTask.currentHunt
    if ( currentHunt and currentHunt.coordinates and ( currentHunt.coordinates.fateId and DailyHuntAssistantMode.Settings.SummonCompanionMode >= 2
		or not currentHunt.coordinates.fateId and DailyHuntAssistantMode.Settings.SummonCompanionMode == 3 )
		) then	
		local green = GetItem(4868)
		if (green and green:IsReady()) then
			return true
		end
    end
	
    return false
end

RegisterEventHandler("Gameloop.Update", DailyHuntAssistantMode.MonitorMode)