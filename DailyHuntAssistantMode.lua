DailyHuntAssistantMode = inheritsFrom(ml_task)
DailyHuntAssistantMode.version = "3.0.0"
DailyHuntAssistantMode.mode = 1 -- 1 - setup, 2 - run
DailyHuntAssistantMode.modeName = "XDaily Hunt Assistant"
DailyHuntAssistantMode.targetName = ""
DailyHuntAssistantMode.database = {} -- another files load information to this collection
DailyHuntAssistantMode.hunts = {} -- collection for hunts grouped by Hunt Bill
DailyHuntAssistantMode.currentTask = nil -- I'm tired to mess with ml_task_hub:CurrentTask() (now I know I could use ml_task_hub:RootTask() but this works fine)
--[[
Credits:
mmominion.com foruum user anahronik made the bulk of this code and he/she should have most of your praise. 
board users lanceangel, itsu, and kali have also helped along the way.

Thank you all for your help! I will try to maintain this for as long as i can and will work to document this file in a way so that others may pick up the torch.

-Gafgarion
]]--

-- Set up tables that hold hunt data per expansion/level of hunt

DailyHuntAssistantMode.hunts[1] = {
	GUI = { open = false },
    data = DailyHuntAssistantMode.database.arr,
	name = "Mark Bills (ARR)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[2] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.hw,
	name = "Level 1 Clan Marks (HW)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[3] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.hw,
	name = "Level 2 Clan Marks (HW)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[4] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.hw,
	name = "Level 3 Clan Marks (HW)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[5] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.sb,
	name = "Level 1 Veteran Clan Marks (StB)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[6] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.sb,
	name = "Level 2 Veteran Clan Marks (StB)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[7] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.sb,
	name = "Level 3 Veteran Clan Marks (StB)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[8] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.shb,
	name = "One-nut Clan Marks (ShB)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[9] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.shb,
	name = "Two-nut Clan Marks (ShB)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[10] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.shb,
	name = "Three-nut Clan Marks (ShB)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[11] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.ew,
	name = "Junior Guildship Marks (EW)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[12] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.ew,
	name = "Associate Guildship Marks (EW)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[13] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.ew,
	name = "Senior Guildship Marks (EW)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[14] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.dt,
	name = "Beginner Dawn Hunt Bills (DT)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[15] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.dt,
	name = "Intermediate Dawn Hunt Bills (DT)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.hunts[16] = {
	GUI = { open = false },
	data = DailyHuntAssistantMode.database.dt,
	name = "Advanced Dawn Hunt Bills (DT)",
	tasks = {
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 },
		{ targetName = "", isDone = false, isBuggy = false, attempts = 0, deaths = 0 }
	}
}

DailyHuntAssistantMode.Settings  = {
	GUI = { 
		open = false,
		name = "Settings"
	}
}

DailyHuntAssistantMode.Jobs = {
	"WARRIOR"
	,"PALADIN"
	,"DARKKNIGHT"
	,"GUNBREAKER"
	,"WHITEMAGE"	
	,"SCHOLAR"		
	,"ASTROLOGIAN"
	,"SAGE"
	,"BARD"
	,"MACHINIST"
	,"DANCER"
	,"BLACKMAGE"
	,"SUMMONER"
	,"REDMAGE"
	,"BLUEMAGE"
	,"DRAGOON"		
	,"REAPER"		
	,"MONK"
	,"NINJA"		   
	,"SAMURAI"
	,"PICTOMANCER"
	,"VIPER"
}

DailyHuntAssistantMode.GCs = {
	[1] = "Adders",
	[2] = "Flames",
	[3] = "Maelstrom"
}

DailyHuntAssistantMode.CompanionSummonMode = {
	[1] = "None",
	[2] = "Fate only",
	[3] = "All hunts"
}

DailyHuntAssistantMode.HuntBoard = nil

-- Add mode to list if not already added
-- Add Toggle DailyHunt to Shortcut Manager
function DailyHuntAssistantMode.ModuleInit()
	if not ffxivminion.modes[DailyHuntAssistantMode.modeName] then
		ffxivminion.AddMode(DailyHuntAssistantMode.modeName, DailyHuntAssistantMode)
		-- Add Toggle DailyHunt to Shortcut Manager 
		local shortcut = {{
			label = "Toggle DailyHunt", mod1 = "DHAM_Toggle_Mod1", mod2 = "DHAM_Toggle_Mod2", key = "DHAM_Toggle_Key", mouse = "DHAM_Toggle_Mouse",
			event = function () 
				local mode = DailyHuntAssistantMode.mode
				if mode == 1 then
					mode = 2
				else
					mode = 1
				end
				DailyHuntAssistantMode.mode = mode
			end
		}}
		sck.AddShortcuts(shortcut)
		ml_input_mgr.registerFunction({
			name = shortcut[1].label,
			func = shortcut[1].event,
			toggle = true,
		})
	end
end

-- Basic task constructor
function DailyHuntAssistantMode.Create()
    local newinst = inheritsFrom(DailyHuntAssistantMode)
    --ml_task members
    newinst.valid = true
    newinst.completed = false
    newinst.subtask = nil
    newinst.auxiliary = false
    newinst.process_elements = {}
    newinst.overwatch_elements = {}
	newinst.name = "DHAM"

	--daily hunter assistant vars
	newinst.currentHunt = {}
	-- It easier to have direct link for the Task instead of checking ml_task_hub:RootTask()
	-- or it's only for me because I'm not used to it
    DailyHuntAssistantMode.currentTask = newinst
    return newinst
end

-- Draw GUI under Mode selection
function DailyHuntAssistantMode:Draw()
	if(GUI:RadioButton("Setup##DHAM",DailyHuntAssistantMode.mode == 1)) then
		DailyHuntAssistantMode.mode = 1
	end				
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Click setup and start, then scroll through hunt logs to add them to the database. To add marks selectively, toggle start & Stop.")
	end
	GUI:SameLine(100)
	if(GUI:RadioButton("Run##DHAM",DailyHuntAssistantMode.mode == 2)) then
		DailyHuntAssistantMode.mode = 2
	end
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Click run, then start to move and hunt marks.")
	end
	GUI:SameLine(180)
	-- Configuration for Settings button and pop-up window
	local settings = DailyHuntAssistantMode.Settings
	if(GUI:Button(settings.GUI.name .. "##DHAM",100,20)) then
		settings.GUI.open = not settings.GUI.open
	end
		if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Idle, GC, Job Switching, and Companion Settings.")
	end
	GUI:SameLine()
	-- Reset button
	if(GUI:Button("Reset##DHAM",72,20)) then
		for _,e in pairs(DailyHuntAssistantMode.hunts) do
			for _,e2 in pairs(e.tasks) do
				e2.targetName = ""
				e2.isDone = false
				e2.coordinates = nil
				e2.isBuggy = false
				e2.level = nil
				e2.attempts = 0
				e2.deaths = 0
				e2.starttime = nil
			end
		end
		DailyHuntAssistantMode.SaveState()
	end	
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("This will remove all hunt marks from the database.")
	end
	GUI:Separator()
if ( DailyHuntAssistantMode.mode == 1 and FFXIV_Common_BotRunning) then
		local clicked = false
		GUI:Text("Teleport To HuntBoard: \n")
		if(GUI:Button("ARR##DHAM",40,20)) then
			clicked = true
			if ( settings.GC == 1 ) then
				DailyHuntAssistantMode.HuntBoard = {
					mapId = 132, -- Gridania
					pos = {
						x = -76.347450256348,
						y = -0.50310283899307,
						z = 1.4406703710556
					}
				}
			elseif ( settings.GC == 2 ) then
				DailyHuntAssistantMode.HuntBoard = {
					mapId = 130, -- Uldah
					pos = {
						x = -150.88859558105,
						y = 4.0999999046326,
						z = -93.640563964844
					}
				}
			else
				DailyHuntAssistantMode.HuntBoard = {
					mapId = 128, -- Limsa
					pos = {
						x = 93.190574645996,
						y = 40.247924804688,
						z = 61.893478393555
					}
				}
			end
		end
		if (GUI:IsItemHovered()) then
			GUI:SetTooltip("Move to Hunt Board of your Grand Company (ARR).")
		end
		GUI:SameLine();
		if(GUI:Button("HW##DHAM",40,20)) then
			clicked = true
			DailyHuntAssistantMode.HuntBoard = {
				mapId = 418, -- Foundation
				pos = {
					x = 72.972564697266,
					y = 23.979127883911,
					z = 20.28108215332
				}
			}
		end
		if (GUI:IsItemHovered()) then
			GUI:SetTooltip("Move to Hunt Board in Foundation (HW).")
		end
		GUI:SameLine();
		if(GUI:Button("StB##DHAM",40,20)) then
			clicked = true
			DailyHuntAssistantMode.HuntBoard = {
				mapId = 628, -- Kugane
				pos = {
					x = -30.261198043823,
					y = 0.10000133514404,
					z = -43.215656280518
				}
			}
		end
		if (GUI:IsItemHovered()) then
			GUI:SetTooltip("Move to Hunt Board in Kugane (StB).")
		end
		GUI:SameLine();
		if(GUI:Button("ShB##DHAM",40,20)) then
			clicked = true
			DailyHuntAssistantMode.HuntBoard = {
				mapId = 819, -- The Crystarium
				pos = {
					x = -84.60,
					y = 0.20,
					z = -90.72
				}
			}
		end
		if (GUI:IsItemHovered()) then
			GUI:SetTooltip("Move to Hunt Board in The Crystarium (ShB).")
		end
		GUI:SameLine();
		if(GUI:Button("EW##DHAM",40,20)) then
			clicked = true
			DailyHuntAssistantMode.HuntBoard = {
				mapId = 962, -- Old Sharlayan
				pos = {
					x = 29.58,
					y = -15.65,
					z = 100.22
				}
			}
		end
		if (GUI:IsItemHovered()) then
			GUI:SetTooltip("Move to Hunt Board in Sharlayan (EW).")
		end
		GUI:SameLine();
		if(GUI:Button("DT##DHAM",40,20)) then
			clicked = true
			DailyHuntAssistantMode.HuntBoard = {
				mapId = 1185, -- Tuliyollal
				pos = {
					x = 22.10,
					y = -14.00,
					z = 133.44
				}
			}
		end
		if (GUI:IsItemHovered()) then
			GUI:SetTooltip("Move to Hunt Board in Tuliyollal (DT).")
		end
		if (clicked and ml_task_hub:CurrentTask().name ~= "DHAM") then
				ml_task_hub:CurrentTask().completed = true
		end
	GUI:Separator()
	end
	-- Text information about currency and current hunt
	GUI:Text("Current hunt: " .. DailyHuntAssistantMode.targetName)
	GUI:Separator()
	local alliedCount = Inventory:Get(2000):GetList()[9]
	local centurioCount = Inventory:GetSpecialCurrencies()[10307]
	local nutCount = Inventory:GetSpecialCurrencies()[26533]
	GUI:Text("Allied Seals: " .. tostring(alliedCount ~= nil and alliedCount.count or "no info") .. "/4000")
	GUI:Text("Centurio Seals: " .. tostring( centurioCount ~= nil and centurioCount.count or "no info") .. "/4000")
	GUI:Text("Sacks of Nuts: " .. tostring( nutCount ~= nil and nutCount.count or "no info") .. "/4000")
	GUI:Separator()
	-- GUI for Settings button
	local changed = false
	local varName = ""
	if(settings.GUI.open) then
		GUI:SetNextWindowPosCenter(GUI.SetCond_FirstUseEver)
		_, settings.GUI.open = GUI:Begin(" " .. settings.GUI.name .. "##DHAM", settings.GUI.open, GUI.WindowFlags_NoResize + GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize)	
		local tabindex = GUI_DrawTabs(DailyHuntAssistantMode.Settings.Tabs)
		if ( tabindex == 1 ) then -- General
	
			local locations = {
				[132] = "Gridania",
				[129] = "Limsa",
				[130] = "Uldah",
				[418] = "Foundation",
				[628] = "Kugane",
				[819] = "The Crystarium",
				[962] = "Old Sharlayan"
			}
			-- varNames are equal to names in DailyHuntAssistantMode:UIInit (where values for variables ale loaded)
			-- Settings.DailyHuntAssistantMode - Settings is a global table for ffxivminion where all settings for 
			-- current account are saved (FFXIVMinion64\MinionFiles\Settings\default.lua)
			-- DailyHuntAssistantMode.Settings - this module table. Don't confuse them.
			varName = "IdleLocation"
			-- get changed value into DailyHuntAssistantMode.Settings
			settings[varName], changed = GUI:Combo("Idle location##DHAM", settings[varName], locations)
			-- if value has been changed - save to Settings.DailyHuntAssistantMode
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Where to return after all hunts are done.")
			end
			GUI:Separator()
			
			varName = "GC"
			settings[varName], changed = GUI:Combo("Grand company##DHAM", settings[varName], DailyHuntAssistantMode.GCs)
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Where to go on \"Grand Company\" button click.")
			end
			GUI:Separator()

			varName = "MoveTimeout"
			settings[varName], changed = GUI:SliderInt( "Move timeout##DHAM", settings[varName], 30, 600)
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("How many seconds bot wait while moving to hunt location.\r\nAfter time passed bot thinks it stuck/path broken and teleport to make 2nd attempt.\r\nCtrl+click for manual number entry without slider.")
			end
			GUI:Separator()
			varName = "SaveHuntsState"
			settings[varName], changed = GUI:Checkbox("Save state of hunts##DHAM", settings[varName])
			if (changed) then 
				Settings.DailyHuntAssistantMode[varName] = settings[varName] 
				DailyHuntAssistantMode.SaveState()
			end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Enabled - will save state and load it after bot/lua reload (use Reset button to reset state)\nDisabled - will not save state and on bot/lua reload you'll need to setup hunts from scratch.")
			end
			GUI:Separator()
			
			varName = "FATELeastPriorityEnabled"
			settings[varName], changed = GUI:Checkbox("Don't wait for FATE if there is non-fate hunts##DHAM", settings[varName])
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Enabled - will move to next map if there is a non-fate hunt instead of waiting on current map for FATE popup\nDisabled - if there is a fate-type hunt on current map bot will wait it to popup and only after finishing it bot will move to next map\nBasically it means that if Enabled - FATEs will be done last.")
			end
		elseif ( tabindex == 2 ) then -- Job Switch
			if ( GUI:TreeNode("Explanation##DHAM") ) then
				GUI:TextWrapped("You can select Jobs for non-fate and fate type hunts.\nFor example Red mage for non-fate because of dps and Summoner for fate because of survivability.\nAdditionally you can select two Jobs for non-fate type for different level enemies (for experience).\nBot will move from one hunt to another using Job you select as High Non Fate (because it logically should be the highest level).\nExample: if you set \"Low/High level\" to 30, then for 1-29 level enemies \"low level on fate job\" is using and for >= 30 - High.\n\nSo if you don't need two Jobs for non-fate - Set \"Low/High level\" to 1")

				GUI:TreePop()
			end
			GUI:Separator()
			varName = "JobSwitchEnabled"
			settings[varName], changed = GUI:Checkbox("Use job switch##DHAM", settings[varName])
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
			
			varName = "JobForFates"
			settings[varName], changed = GUI:Combo("Fate Job##DHAM", settings[varName], DailyHuntAssistantMode.Jobs)
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
			
			varName = "JobSwitchLevelBorder"
			settings[varName], changed = GUI:SliderInt( "Low/High level##DHAM", settings[varName], 1, 90)
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Ctrl+click for manual number entry without slider.")
			end
				
			varName = "JobForNonFatesLow"
			settings[varName], changed = GUI:Combo("Low level Non Fate Job##DHAM", settings[varName], DailyHuntAssistantMode.Jobs)
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
			
			varName = "JobForNonFatesHigh"
			settings[varName], changed = GUI:Combo("High level Non Fate Job##DHAM", settings[varName], DailyHuntAssistantMode.Jobs)
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
		elseif ( tabindex == 3 ) then -- Companion
			varName = "SummonCompanionMode"
			settings[varName], changed = GUI:Combo("Summon mode##DHAM", settings[varName], DailyHuntAssistantMode.CompanionSummonMode)
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
--[[		
			varName = "gChocoStanceString"
			local stances = {}
			local selected = 1
			local index = 1
			for i in pairs(ml_global_information.chocoStance) do
				if (gChocoStanceString == i ) then selected = index end
				table.insert(stances,i)
				index = index + 1
			end
			selected, changed = GUI:Combo("Stance##DHAM", selected, stances)
			if (changed) then 
				gChocoStanceString = stances[selected]
				Settings.DailyHuntAssistantMode[varName] = gChocoStanceString
			end
]]--
		elseif ( tabindex == 4 ) then -- Hacks
			GUI:Text("Hacks! Use carefully\nBut! Bot monitors if someone is near (almost at max range) and automatically turn off hacks.\nSo, it's pretty safe to use.")
			-- Ground hack is not working (values changes but speed is not affected)
			--[[varName = "SpeedHackGroundEnabled"
			settings[varName], changed = GUI:Checkbox("Double speed for mount on the ground##DHAM", settings[varName])
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end]]--
			
			varName = "SpeedHackFlyEnabled"
			settings[varName], changed = GUI:Checkbox("Double fly speed##DHAM", settings[varName])
			if (changed) then Settings.DailyHuntAssistantMode[varName] = settings[varName] end
		end
		
		GUI:End()
	end
	-- From this point - buttons for fate bills and pop-up windows
	for i,e in pairs(DailyHuntAssistantMode.hunts) do
		local countToDo = 0
		local countDone = 0
		local countSetted = 0
		local countFailed = 0
		for ii,t in pairs(e.tasks) do
			countToDo = countToDo + 1
			if t.isDone and t.coordinates ~= nil then 
				countDone = countDone + 1
			end
			if t.isBuggy and t.coordinates ~= nil then 
				countFailed = countFailed + 1
			end
			if t.coordinates ~= nil then
				countSetted = countSetted + 1
			end
		end
		if ( countFailed > 0 ) then GUI:PushStyleColor(GUI.Col_Button, .355, 0, 0, 72) end
		if ( countDone > 0 and countDone == countSetted ) then GUI:PushStyleColor(GUI.Col_Button, 0, .355, 0, 72) end
		if(GUI:Button(e.name .. "##DHAM",280,20)) then
			e.GUI.open = not e.GUI.open
		end
		if ( countFailed > 0 ) then GUI:PopStyleColor(1) end
		if ( countDone > 0 and countDone == countSetted ) then GUI:PopStyleColor(1) end
		GUI:SameLine();
		GUI:Text(" " .. tostring(countDone) .. " / " .. tostring(countSetted) .. " / " .. tostring(countToDo))
		if(e.GUI.open) then
			GUI:SetNextWindowPosCenter(GUI.SetCond_FirstUseEver)
			_, e.GUI.open = GUI:Begin(" " .. e.name .. "##DHAM", e.GUI.open, GUI.WindowFlags_NoResize + GUI.WindowFlags_AlwaysAutoResize)
			GUI:Columns(5) GUI:SetColumnOffset(1, 20) GUI:SetColumnOffset(2, 200) GUI:SetColumnOffset(3, 255) GUI:SetColumnOffset(4, 310) GUI:SetColumnOffset(5, 365)
			GUI:Text("# ") 
			GUI:NextColumn()
			GUI:Text("Name")
			GUI:NextColumn()
			GUI:Text("In DB?")
			GUI:NextColumn()
			GUI:Text("Done?")
			GUI:NextColumn()
			GUI:Text("Failed")
			GUI:Columns(1)
			GUI:Separator()
			GUI:Columns(5) GUI:SetColumnOffset(1, 20) GUI:SetColumnOffset(2, 200) GUI:SetColumnOffset(3, 255) GUI:SetColumnOffset(4, 310) GUI:SetColumnOffset(5, 365)			
			for ii,t in pairs(e.tasks) do
				GUI:Text(tostring(ii) .. " ")
				GUI:NextColumn()
				GUI:Text(t.targetName)
				GUI:NextColumn()				
				GUI:Text(t.coordinates ~= nil and "  Yes  " or "  No   ")
				GUI:NextColumn()
				GUI:PushItemWidth(200)
				local enabled,changed = GUI:Checkbox("##DHAMIsDone" .. tostring(ii),t.isDone)
				if(changed) then
					t.isDone = not t.isDone
					t.isDone = t.coordinates ~= nil and t.isDone
					DailyHuntAssistantMode.SaveState()
				end
				GUI:NextColumn()
				enabled,changed = GUI:Checkbox("##DHAMIsBuggy" .. tostring(ii),t.isBuggy)
				if(changed) then
					t.isBuggy = not t.isBuggy
					t.isBuggy = t.coordinates ~= nil and t.isBuggy
					if ( t.isBuggy == false ) then
						t.attempts = 0
						t.deaths = 0
						t.starttime = nil
					end
					DailyHuntAssistantMode.SaveState()
				end
				GUI:NextColumn()
			end
			GUI:Columns(1)
			GUI:Separator()
			if GUI:Button("Close##DHAMClose", 365, 20) then
				e.GUI.open = false
			end
			GUI:End()
		end
	end
	GUI:Separator()
	GUI:Text("Version: " .. DailyHuntAssistantMode.version)
end

-- Initial variables value getting from settings
function DailyHuntAssistantMode:UIInit()
	-- Create tabs for Settings UI
	DailyHuntAssistantMode.Settings.Tabs = GUI_CreateTabs("General,Job Switch,Companion")
	
	local settings = Settings.DailyHuntAssistantMode
	-- It there is no settings yet - initial with default values
	settings.FATELeastPriorityEnabled = settings.FATELeastPriorityEnabled or false
	settings.SpeedHackGroundEnabled = settings.SpeedHackGroundEnabled or false
	settings.SpeedHackFlyEnabled = settings.SpeedHackFlyEnabled or false
	settings.DebugEnabled = false --settings.DebugEnabled or false
	--settings.gChocoStanceString = settings.gChocoStanceString or gChocoStanceString -- get that from Advanced Settings of the bot
	settings.SummonCompanionForFatesEnabled = settings.SummonCompanionForFatesEnabled or false
	-- set 1 by default if settings.SummonCompanionForFatesEnabled nil or false and 2 if settings.SummonCompanionForFatesEnabled is true
	settings.SummonCompanionMode = settings.SummonCompanionMode or not settings.SummonCompanionForFatesEnabled and 1 or settings.SummonCompanionForFatesEnabled and 2
	settings.JobSwitchEnabled = settings.JobSwitchEnabled or false
	settings.JobForFates = settings.JobForFates or settings.JobForFatesName or  13
	settings.JobForNonFatesHigh = settings.JobForNonFatesHigh or settings.JobForNonFatesName or 13
	settings.JobForNonFatesLow = settings.JobForNonFatesLow or 13
	settings.JobSwitchLevelBorder = settings.JobSwitchLevelBorder or 1
	settings.IdleLocation = settings.IdleLocation or 130
	settings.GC = settings.GC or 1
	settings.MoveTimeout = settings.MoveTimeout or 300
	settings.SaveHuntsState = settings.SaveHuntsState or false
	if ( settings.SaveHuntsState ) then
		for i = 1, #DailyHuntAssistantMode.hunts do
			local attribute = "Task" .. tostring(i)
			for ii = 1, #DailyHuntAssistantMode.hunts[i].tasks do
				local task = DailyHuntAssistantMode.hunts[i].tasks[ii]
				local attr = attribute .. "Hunt" .. tostring(ii)
				local a = attr .. "ContentId"
				local contentId = settings[a]
				if ( contentId ) then
					if ( i == 1 ) then 
						task.coordinates = DailyHuntAssistantMode.database.arr[contentId]
					elseif ( i > 1 and i <= 4 ) then
						task.coordinates = DailyHuntAssistantMode.database.hw[contentId]
					elseif ( i > 4 and i <= 7 ) then
						task.coordinates = DailyHuntAssistantMode.database.sb[contentId]
					elseif ( i > 7 and i <= 10 ) then
						task.coordinates = DailyHuntAssistantMode.database.shb[contentId]		
					elseif ( i > 10 and i <= 13 ) then
						task.coordinates = DailyHuntAssistantMode.database.ew[contentId]							
					end
					if ( task.coordinates ) then
						task.coordinates.contentId = contentId
					end
				end
				a = attr .. "IsDone"
				task.isDone = settings[a] or false
				a = attr .. "IsFailed"
				task.isBuggy = settings[a] or false
				a = attr .. "TargetName"
				task.targetName = settings[a] or ""
			end
		end
	end

	-- Copy values from saved settings to current mode settings
	DailyHuntAssistantMode.Settings.FATELeastPriorityEnabled = settings.FATELeastPriorityEnabled
	DailyHuntAssistantMode.Settings.SpeedHackGroundEnabled = settings.SpeedHackGroundEnabled
	DailyHuntAssistantMode.Settings.SpeedHackFlyEnabled = settings.SpeedHackFlyEnabled
	DailyHuntAssistantMode.Settings.DebugEnabled = settings.DebugEnabled
	--gChocoStanceString = settings.gChocoStanceString
	DailyHuntAssistantMode.Settings.SummonCompanionForFatesEnabled = settings.SummonCompanionForFatesEnabled
	DailyHuntAssistantMode.Settings.SummonCompanionMode = settings.SummonCompanionMode
	DailyHuntAssistantMode.Settings.JobSwitchEnabled = settings.JobSwitchEnabled
	DailyHuntAssistantMode.Settings.JobForFates = settings.JobForFates
	DailyHuntAssistantMode.Settings.JobForNonFatesHigh = settings.JobForNonFatesHigh
	DailyHuntAssistantMode.Settings.JobForNonFatesLow = settings.JobForNonFatesLow
	DailyHuntAssistantMode.Settings.JobSwitchLevelBorder = settings.JobSwitchLevelBorder
	DailyHuntAssistantMode.Settings.IdleLocation = settings.IdleLocation
	DailyHuntAssistantMode.Settings.SaveHuntsState = settings.SaveHuntsState
	DailyHuntAssistantMode.Settings.GC = settings.GC
	DailyHuntAssistantMode.Settings.MoveTimeout = settings.MoveTimeout
end

-- Work once on Start (and on restart)
function DailyHuntAssistantMode:Init()
	--[[ As I understand:
		here we make a que of actions with parameters: 
		 - identityName, 
		 - object inherited from ml_cause - should check if action can/should be done
			if returns false - next action
			if returns true - executes object inherted from ml_effect
		 - object inherted from ml_effect - do something...for example add subtask(correct term...inherited from ml_task) to que of current task
		 - priority - higher executes first (I don't know if it matters how big difference is)
	]]--
	
	DailyHuntAssistantMode.HuntBoard = nil
	
	-- 0. Overwatch chat
	local ke_ovchatdham = ml_element:create( "ovchatdham", c_ovchatdham, e_ovchatdham, 40 )
	self:add(ke_ovchatdham,self.overwatch_elements)
	
	-- 00. Overwatch death
	local ke_dead = ml_element:create( "Dead", c_dead, e_dead, 200 )
    self:add(ke_dead, self.overwatch_elements)
	
	-- 000. Overwatch enemies while teleport
	local ke_tpenemiesdham = ml_element:create( "tpenemiesdham", c_tpenemiesdham, e_tpenemiesdham, 150 )
    self:add(ke_tpenemiesdham, self.overwatch_elements)
	
	-- 0000. Teleport if not on mesh more than 30sec
	local ke_tpoffmeshdham = ml_element:create( "tpoffmeshdham", c_tpoffmeshdham, e_tpoffmeshdham, 100 )
    self:add(ke_tpoffmeshdham, self.overwatch_elements)	
	
	-- 00000. Remember level for current hunt target
	local ke_huntleveldham = ml_element:create( "huntleveldham", c_huntleveldham, e_huntleveldham, 90 )
    self:add(ke_huntleveldham, self.overwatch_elements)
	
	-- 000000. Count Deaths
	local ke_deathcountdham = ml_element:create( "deathcountdham", c_deathcountdham, e_deathcountdham, 500 )
    self:add(ke_deathcountdham, self.overwatch_elements)
	
	-- 0000000. Timeout for moving to hunt
	local ke_timeoutdham = ml_element:create( "timeoutdham", c_timeoutdham, e_timeoutdham, 80 )
    self:add(ke_timeoutdham, self.overwatch_elements)
	
	-- 00000000. Hack fly speed
	local ke_flyhackdham = ml_element:create( "flyhackdham", c_flyhackdham, e_flyhackdham, 80 )
    self:add(ke_flyhackdham, self.overwatch_elements)	
	
	-- 000000000. Timeout for moving to target
	local ke_timeouttargetdham = ml_element:create( "timeouttargetdham", c_timeouttargetdham, e_timeouttargetdham, 70 )
    self:add(ke_timeouttargetdham, self.overwatch_elements)
	
	-- 01. Move to hunt board
	local ke_movetohuntdboarddham = ml_element:create( "movetohuntdboard", c_movetohuntdboarddham, e_movetohuntdboarddham, 450 )
    self:add(ke_movetohuntdboarddham, self.process_elements)	
	
	-- 1. Setup
	local ke_setupdham = ml_element:create( "setupsdham", c_setupdham, e_setupdham, 400 )
    self:add(ke_setupdham, self.process_elements)
	
	-- 2. Kill aggro mobs before next hunt
	local ke_killaggrodham = ml_element:create( "killaggrodham", c_killaggrodham, e_killaggrodham, 390 )
    self:add(ke_killaggrodham, self.process_elements)
	
	-- 3. Select next hunt
	local ke_newhuntdham = ml_element:create( "newhuntdham", c_newhuntdham, e_newhuntdham, 370 )
    self:add(ke_newhuntdham, self.process_elements)
	
	-- 4. Teleport to map
	local ke_movetomapdham = ml_element:create( "movetomapdham", c_movetomapdham, e_movetomapdham, 350 )
    self:add(ke_movetomapdham, self.process_elements)
	
	-- 5. Switch job
	local ke_switchjobdham = ml_element:create( "switchjobdham", c_switchjobdham, e_switchjobdham, 300 )
    self:add(ke_switchjobdham, self.process_elements)
	
	-- 6. Move to specified location
	local ke_movetoposdham = ml_element:create( "movetoposdham", c_movetoposdham, e_movetoposdham, 250 )
    self:add(ke_movetoposdham, self.process_elements)
	
	-- 7. Do hunt (grind/fate)
	local ke_dohuntdham = ml_element:create( "dohuntdham", c_dohuntdham, e_dohuntdham, 100 )
    self:add(ke_dohuntdham, self.process_elements)
	
	-- 8. Teleport after all task done
	local ke_movetomapalldonedham = ml_element:create( "movetomapalldonedham", c_movetomapalldonedham, e_movetomapalldonedham, 50 )
    self:add(ke_movetomapalldonedham, self.process_elements)

	---------------
	-- Set global flags
	---------------
	gAvoidAOE = true
	gGrindFatesOnly = false
	gGrindDoFates = false
	gGrindDoHuntlog = false
	gClaimFirst = false
	gFateKillAggro = true
	gGrindDoBossFates = true
	gGrindFatesNoMaxLevel = true
	gGrindFatesNoMinLevel = true
	gGrindAtmaMode = false
	gGrindLuminousMode = false
end

-----------------------
-- 0. Overwatch chat for notification
-- that hunt done 
-- by mask "Hunt mark %targetname% slain! (Count1/Count2)" 
-- where Count1 should be equal to Count2
-----------------------
c_ovchatdham = inheritsFrom( ml_cause )
e_ovchatdham = inheritsFrom( ml_effect )
-- Stop grind (turn off/on...nothing better in mind)
c_ovchatdham.throttle = 500
function c_ovchatdham:evaluate() 
	DailyHuntAssistantMode.Log("c_ovchatdham")
	if DailyHuntAssistantMode.isCurrentHuntDone() and ml_task_hub:CurrentTask().name == "GRIND_COMBAT" then 
		ml_task_hub:CurrentTask().valid = false
		Player:ClearTarget()
		Player:Stop()
	end
	return false
	-- if true - then process_elements stops ( I guess...I don't have time to investigate real behaviour)
	-- well, for flee while battle it should work exactly like that - break process_elements
end
-- not used.
function e_ovchatdham:execute()
	-- not used...
end

------------------------
-- 00. Overwatch death
------------------------
-- from ffxiv_common_cne.lua

------------------------
-- 000. Overwatch enemies while teleport
------------------------
-- Check if bot trying to teleport while has some aggro mobs
c_tpenemiesdham = inheritsFrom( ml_cause )
c_tpenemiesdham.throttle = 200
function c_tpenemiesdham:evaluate() 
	DailyHuntAssistantMode.Log("c_tpenemiesdham")
	return (ml_task_hub:CurrentTask().name == "LT_TELEPORT" or ml_task_hub:CurrentTask().name == "MOVETOMAP" or (ml_task_hub:CurrentTask().name == "MOVETOPOS" and Player:IsMoving() == false and Player.ismounted == false)) and next(EntityList("alive,aggro")) ~= nil
end
e_tpenemiesdham = inheritsFrom( ml_effect )
function e_tpenemiesdham:execute()
	DailyHuntAssistantMode.Log("e_tpenemiesdham")
	local target = next(EntityList("alive,aggro"))
	local newTask = ffxiv_task_grindCombat.Create()
	newTask.targetid = target
	ml_task_hub:Add(newTask, REACTIVE_GOAL, TP_IMMEDIATE)
end

------------------------
-- 0000. Teleport if not on mesh more than 90sec
------------------------
c_tpoffmeshdham = inheritsFrom( ml_cause )
c_tpoffmeshdham.throttle = 1000
c_tpoffmeshdham.offmeshtimes = 0
function c_tpoffmeshdham:evaluate()
	DailyHuntAssistantMode.Log("c_tpoffmeshdham")
	if ( Player.onmesh == false ) then
		c_tpoffmeshdham.offmeshtimes = c_tpoffmeshdham.offmeshtimes + 1
	else
		c_tpoffmeshdham.offmeshtimes = 0
	end
	if ( c_tpoffmeshdham.offmeshtimes >= 90) then
		c_tpoffmeshdham.offmeshtimes = 0
		return true
	end
	return false
end
e_tpoffmeshdham = inheritsFrom( ml_effect )
function e_tpoffmeshdham:execute()
	DailyHuntAssistantMode.Log("e_tpoffmeshdham")
	local task = ffxiv_task_movetomap.Create()
	task.destMapID = DailyHuntAssistantMode.Settings.IdleLocation
	ml_task_hub:Add(task, REACTIVE_GOAL, TP_IMMEDIATE)
end

------------------------
-- 00000. Remember level for current hunt target
------------------------
c_huntleveldham = inheritsFrom( ml_cause )
c_huntleveldham.throttle = 200
function c_huntleveldham:evaluate()
	DailyHuntAssistantMode.Log("c_huntleveldham")
	local currentHunt = DailyHuntAssistantMode.currentTask.currentHunt
	if( currentHunt and currentHunt.level == nil and currentHunt.coordinates and currentHunt.coordinates.mapId == Player.localmapid ) then
		local _,target = next(EntityList("contentid=" .. tostring(currentHunt.coordinates.contentId)))
		if ( target ) then
			currentHunt.level = target.level
			if ( c_switchjobdham:evaluate() ) then
				e_switchjobdham:execute()
			end
		end
	end
	return false
end
e_huntleveldham = inheritsFrom( ml_effect )
function e_huntleveldham:execute()
	-- not used
end

------------------------
-- 000000. Count Deaths
------------------------
c_deathcountdham = inheritsFrom( ml_cause )
c_deathcountdham.alive = 1
function c_deathcountdham:evaluate()
	local state = 0
	if ( Player.alive ) then state = 1 end
	if ( c_deathcountdham.alive ~= state) then
		c_deathcountdham.alive = state
		if ( state == 0 ) then
			local currentHunt = DailyHuntAssistantMode.currentTask.currentHunt
			if ( currentHunt ~= nil) then
				currentHunt.deaths = currentHunt.deaths + 1
				if ( currentHunt.deaths >= 2 ) then
					currentHunt.isBuggy = true 
					DailyHuntAssistantMode.SaveState()
				end
			end
		end
	end
	
	return false
end
e_deathcountdham = inheritsFrom( ml_effect )
function e_deathcountdham:execute()
	-- not used
end

------------------------
-- 0000000. Timeout for moving to hunt
------------------------
c_timeoutdham = inheritsFrom( ml_cause )
c_timeoutdham.throttle = 1000
function c_timeoutdham:evaluate()
	DailyHuntAssistantMode.Log("timeoutdham")
	local currentHunt = DailyHuntAssistantMode.currentTask.currentHunt
	if ( currentHunt.starttime ~= nil and currentHunt.coordinates ~= nil and Player.localmapid == currentHunt.coordinates.mapId ) then
		local seconds = os.difftime(os.time(), currentHunt.starttime)
		if ( seconds > DailyHuntAssistantMode.Settings.MoveTimeout ) then
			currentHunt.starttime = nil
			currentHunt.attempts = currentHunt.attempts + 1
			if ( currentHunt.attempts >= 2) then 
				currentHunt.isBuggy = true
				DailyHuntAssistantMode.SaveState()
			end
			if (Player:IsMoving()) then
				Player:Stop()
			end
			if ( ml_task_hub:CurrentTask().name ~= "DHAM" ) then ml_task_hub:CurrentTask().completed = true end
			e_tpoffmeshdham:execute()
		end
	end
	return false
end
e_timeoutdham = inheritsFrom( ml_effect )
function e_timeoutdham:execute()
	-- not used
end

------------------------
-- 00000000. Hack fly speed
------------------------
c_flyhackdham = inheritsFrom( ml_cause )
c_flyhackdham.throttle = 100
c_flyhackdham.doHack = false
function c_flyhackdham:evaluate()
	local danger = false
	if (next(EntityList("chartype=4,maxdistance=100"))) then
		danger = true
	end
	if ( c_flyhackdham.doHack == true and Player:GetSpeed()["Forward"] ~= 40 and IsFlying() and danger == false) then
		Player:SetSpeed(0,40,40,40)
		DailyHuntAssistantMode.Log("Speed flying. hacked")
	elseif ( (c_flyhackdham.doHack == false or DailyHuntAssistantMode.Settings.SpeedHackFlyEnabled == false or danger == true) and Player:GetSpeed()["Forward"] ~= 20 and IsFlying() ) then
		Player:ResetSpeed(0)
		DailyHuntAssistantMode.Log("Speed flying. Reset")
	end
	return false
end
e_flyhackdham = inheritsFrom( ml_effect )
function e_flyhackdham:execute()
	-- not used
end

------------------------
-- 00000000. Timeout for moving to target
------------------------
c_timeouttargetdham = inheritsFrom( ml_cause )
c_timeouttargetdham.throttle = 30000
c_timeouttargetdham.lasttargetid = 0
function c_timeouttargetdham:evaluate()
	DailyHuntAssistantMode.Log("c_timeouttargetdham")
	local target = Player:GetTarget()
	if ( target ) then
		if ( c_timeouttargetdham.lasttargetid == target.id and target.aggro == false) then
			if (Player:IsMoving()) then
				Player:Stop()
			end
			if ( ml_task_hub:CurrentTask().name ~= "DHAM" ) then ml_task_hub:CurrentTask().completed = true end
			e_tpoffmeshdham:execute()
		else
			c_timeouttargetdham.lasttargetid = target.id or 0
		end
	else
		c_timeouttargetdham.lasttargetid = 0
	end
	return false
end
e_timeouttargetdham = inheritsFrom( ml_effect )
function e_timeouttargetdham:execute()
	-- not used
end

-----------------------
-- 01. Move to Hunt Board
-----------------------
c_movetohuntdboarddham = inheritsFrom( ml_cause )
e_movetohuntdboarddham = inheritsFrom( ml_effect )
-- Checks if mode equals to setup constant
function c_movetohuntdboarddham:evaluate() 
	return DailyHuntAssistantMode.mode == 1 and DailyHuntAssistantMode.HuntBoard ~= nil
end
-- Read name of target from opened Hunt Bill (for next name you manually should press Next on the bill)
-- then takes coordinates for this target from .database.
function e_movetohuntdboarddham:execute()
	local board = DailyHuntAssistantMode.HuntBoard
	local task = nil
	if ( Player.localmapid == board.mapId and math.distance2d(Player.pos,board.pos) <= 1.0) then
		DailyHuntAssistantMode.HuntBoard = nil
	elseif ( Player.localmapid ~= board.mapId ) then
		task = ffxiv_task_movetomap.Create()
		task.destMapID = board.mapId
		task.pos = board.pos		
	else
		task = ffxiv_task_movetopos.Create()
		task.range = 1
		task.pos = board.pos
	end
	if ( task ) then
		DailyHuntAssistantMode.currentTask:AddSubTask(task)
		c_useaethernet.used = true
	end
end


-----------------------
-- 1. Setup
-----------------------
--[[
this is the block of code that uses the tables set up in the beginning of this file, the db_localization, and the huntbase luas. 
it took me a while to figure out how to add shb hunts it seemed everything was right. 
Only issue was SE started spelling out the words one, two, three instead of 1,2,3 where this code was looking for digits.  
Being extrememely n00b at programming i coudlnt figure out how to spit out variables into the console. 
Altho there is a log feature built into this code it never seemeed to do anything other than echo the words in the log () and gave nothing else. 
once i could see values the rest was easy, even for me.
ex: 
DailyHuntAssistantMode.Log("n=" .. n)
DailyHuntAssistantMode.Log("order=" .. order)
DailyHuntAssistantMode.Log("name" .. name)
DailyHuntAssistantMode.Log("stars" .. stars)
DailyHuntAssistantMode.Log("subnumber" .. subnumber)
oh right there isnt a setting for 'debug' in the UI so you have to set it manually 
search for: settings.DebugEnabled
]]--
c_setupdham = inheritsFrom( ml_cause )
e_setupdham = inheritsFrom( ml_effect )
-- Checks if mode equals to setup constant
function c_setupdham:evaluate() 
DailyHuntAssistantMode.Log("c_setupdham")
	return DailyHuntAssistantMode.mode == 1
end
-- Read name of target from opened Hunt Bill (for next name you manually should press Next on the bill)
-- then takes coordinates for this target from .database.
function e_setupdham:execute()
DailyHuntAssistantMode.Log("e_setupdham")
	local dham = DailyHuntAssistantMode.currentTask
	local controls = GetControls()
	for i,c in pairs(controls) do
		if (string.contains(c.name,"Mobhunt")) then
			local n = string.match(c.name,"%d+")
			local strings = c:GetStrings()
			local order = tonumber(string.sub(strings[4],1,1))
			local name = strings[7]
			local stars = strings[3] -- gets level of hunt
			local subnumber = string.match(strings[3],"%d+") -- gets level of hunt
			if ( subnumber == nil ) then
				-- count Stars symbols (for DE)
				local _, count = string.gsub(strings[3], "\x98\x85", "")
				subnumber = tostring(count)
			end
			if ( subnumber == "0" ) then
				-- for ShB				
				if ( stars == "Three-nut Clan Marks") then
					subnumber = "3"
				elseif (stars == "Two-nut Clan Marks") then
					subnumber = "2"
				elseif (stars == "One-nut Clan Marks") then
					subnumber = "1"	
				end					
			end
			if ( subnumber == "0" ) then
				-- for EW				
				if ( stars == "Senior Guildship Marks") then
					subnumber = "3"
				elseif (stars == "Associate Guildship Marks") then
					subnumber = "2"
				elseif (stars == "Junior Guildship Marks") then
					subnumber = "1"	
				end					
			end
			if ( subnumber == "0" ) then
				-- for DT				
				if ( stars == "Advanced Dawn Hunt Marks") then
					subnumber = "3"
				elseif (stars == "Intermediate Dawn Hunt Marks") then
					subnumber = "2"
				elseif (stars == "Beginner Dawn Hunt Marks") then
					subnumber = "1"	
				end					
			end
			if ( subnumber == "0" ) then
				-- for FR/JA/KO
				if ( string.match(strings[3],"avancé") or string.match(strings[3],"上級") or string.match(strings[3],"상급")) then
					subnumber = "3"
				elseif (string.match(strings[3],"intermédiaire") or string.match(strings[3],"中級") or string.match(strings[3],"중급")) then
					subnumber = "2"
				elseif (string.match(strings[3],"débutant") or string.match(strings[3],"初級") or string.match(strings[3],"초급")) then
					subnumber = "1"
				end
			end
			local task = {}
			local language = GetGameLanguage() -- 0 - JA, 1 - EN, 2 - DE, 3 - FR, 6- KO
			local name_param = "unknown"
			if ( language == 0 ) then name_param = "name_ja"
			elseif ( language == 1 ) then name_param = "name_en"
			elseif ( language == 2 ) then name_param = "name_de"
			elseif ( language == 3 ) then name_param = "name_fr"
			elseif ( language == 6 ) then name_param = "name_ko"
			end
			local contentId = 0
			if ( name_param ~= "unknown") then
				for i,e in pairs(DailyHuntAssistantMode.database.localization) do
					local localname = "^" .. string.lower(e[name_param]) .. "$"
					localname = string.gsub(localname,"-","%%-")
					-- if German - we should replace [p]/[t]/[a]
					if ( language == 2 ) then
						localname = string.gsub(localname,"%[[apt]%]",".-")
					end
					if ( string.match(string.lower(name), localname) ) then
						contentId = e.contentId
					end
				end
			end
			local targetChanged = false
			if ( n == nil ) then -- ARR
				task = dham.hunts[1].tasks[order]
				task.coordinates = dham.database.arr[contentId]
			elseif ( n == "2" ) then -- HW
				if ( subnumber == "1" ) then task = dham.hunts[2].tasks[order] end
				if ( subnumber == "2" ) then task = dham.hunts[3].tasks[order] end
				if ( subnumber == "3" ) then task = dham.hunts[4].tasks[order] end
				task.coordinates = dham.database.hw[contentId]
			elseif ( n == "3" ) then -- SB
				if ( subnumber == "1" ) then task = dham.hunts[5].tasks[order] end
				if ( subnumber == "2" ) then task = dham.hunts[6].tasks[order] end
				if ( subnumber == "3" ) then task = dham.hunts[7].tasks[order] end
				task.coordinates = dham.database.sb[contentId]
			elseif ( n == "4" ) then -- SHB
				if ( subnumber == "1" ) then task = dham.hunts[8].tasks[order] end
				if ( subnumber == "2" ) then task = dham.hunts[9].tasks[order] end
				if ( subnumber == "3" ) then task = dham.hunts[10].tasks[order] end
				task.coordinates = dham.database.shb[contentId]	
			elseif ( n == "5" ) then -- EW
				if ( subnumber == "1" ) then task = dham.hunts[11].tasks[order] end
				if ( subnumber == "2" ) then task = dham.hunts[12].tasks[order] end
				if ( subnumber == "3" ) then task = dham.hunts[13].tasks[order] end
				task.coordinates = dham.database.ew[contentId]	
			elseif ( n == "6" ) then -- DT
				if ( subnumber == "1" ) then task = dham.hunts[14].tasks[order] end
				if ( subnumber == "2" ) then task = dham.hunts[15].tasks[order] end
				if ( subnumber == "3" ) then task = dham.hunts[16].tasks[order] end
				task.coordinates = dham.database.dt[contentId]	
			end
			if ( task.coordinates ) then
				task.coordinates.contentId = contentId
				if ( task.targetName == nil or task.targetName ~= name ) then
					task.targetName = name
					DailyHuntAssistantMode.SaveState()
				end
			end
		end
	end
end

-----------------------
-- 2. Kill aggro mobs before next hunt
-----------------------
c_killaggrodham = inheritsFrom( ml_cause )
e_killaggrodham = inheritsFrom( ml_effect )
-- Checks if you casting or there are aggro mobs on you
function c_killaggrodham:evaluate()
DailyHuntAssistantMode.Log("c_killaggrodham")
	local dham = DailyHuntAssistantMode.currentTask
	if ( next(EntityList("alive,aggro")) or IsPlayerCasting()) then
		return true
	end
	return false
end
-- If you casting and no aggro - Jump to prevent cast
-- If there is aggro - kill
function e_killaggrodham:execute()
DailyHuntAssistantMode.Log("e_killaggrodham")
	local target = next(EntityList("alive,aggro"))
	if ( target == nil and IsPlayerCasting() and IsMounting() == false and Player.castinginfo.channelingid ~= 5) then -- 5- teleport
		Player:Jump()
	elseif ( target ) then
		local newTask = ffxiv_task_grindCombat.Create()
		newTask.targetid = target
		ml_task_hub:Add(newTask, REACTIVE_GOAL, TP_IMMEDIATE)
	end
end

-----------------------
-- 3. Select next hunt
-----------------------
c_newhuntdham = inheritsFrom( ml_cause )
e_newhuntdham = inheritsFrom( ml_effect )
-- Checks if need to select new hunt
function c_newhuntdham:evaluate()
DailyHuntAssistantMode.Log("c_newhuntdham")
	local dham = DailyHuntAssistantMode.currentTask
	if(dham.currentHunt.isDone or dham.currentHunt.isBuggy) then
		dham.currentHunt = {}
	end
	if(dham.currentHunt.isDone == nil) then
		for _,h in pairs(DailyHuntAssistantMode.currentTask.hunts) do
			for _, t in pairs(h.tasks) do
				if (not t.isDone and t.targetName ~= "" and t.coordinates and t.isBuggy == false) then
					return true
				end
			end
		end
	end
	return false
end
-- Get one hunt from all not done hunts:
-- Checks if any hunts on current map. If so - select first on current map
-- If there is no hunts on current map - selects first from avaliable
function e_newhuntdham:execute()
DailyHuntAssistantMode.Log("e_newhuntdham")
	-- Get closts hunt for current map
	local hunt = DailyHuntAssistantMode.GetHuntClosestOnCurrentMap()
	-- If no hunt on current map - get any not finished hunt for teleport to new map
	if ( hunt == nil ) then
		hunt = DailyHuntAssistantMode.GetHuntOnAnyMap()
	end
	-- Set hunt if any was found
	if ( hunt ~= nil) then
		DailyHuntAssistantMode.currentTask.currentHunt = hunt
		DailyHuntAssistantMode.targetName = hunt.targetName
	end
end

function DailyHuntAssistantMode.GetHuntClosestOnCurrentMap()
	local hunt = nil
	local minDistance = math.huge
    for _,h in pairs(DailyHuntAssistantMode.currentTask.hunts) do
        for _, t in pairs(h.tasks) do
            if (not t.isDone and t.targetName ~= "" and t.coordinates and Player.localmapid == t.coordinates.mapId and t.isBuggy == false) then
				local distanceToHunt = PDistance3D( Player.pos.x, Player.pos.y, Player.pos.z, t.coordinates.pos.x, t.coordinates.pos.y, t.coordinates.pos.z )
				if ( distanceToHunt < minDistance and t.coordinates.fateId == nil ) then
					-- Priority for non-fate hunt with min distance
					hunt = t
					minDistance = distanceToHunt
				elseif ( GetFateByID(t.coordinates.fateId) ~= nil) then
					-- Most priority for popped-up FATE
					hunt = t
					break
				elseif ( hunt == nil and t.coordinates.fateId ~= nil and DailyHuntAssistantMode.Settings.FATELeastPriorityEnabled == false) then
					-- Least priority for not popped-up FATE
					hunt = t
				end
            end
        end
    end
	DailyHuntAssistantMode.Log("DailyHuntAssistantMode.GetHuntClosestOnCurrentMap -> ['" .. tostring(hunt) .. "']")
	return hunt
end

function DailyHuntAssistantMode.GetHuntOnAnyMap()
	local hunt = nil
	for _,h in pairs(DailyHuntAssistantMode.currentTask.hunts) do
		for _, t in pairs(h.tasks) do
			if (not t.isDone and t.targetName ~= "" and t.coordinates and t.isBuggy == false) then
				hunt = t
				break
			end
		end
	end
	DailyHuntAssistantMode.Log("DailyHuntAssistantMode.GetHuntOnAnyMap -> ['" .. tostring(hunt) .. "']")
	return hunt
end

-----------------------
-- 4. Teleport to map
-----------------------
-- Check current map is wrong
c_movetomapdham = inheritsFrom( ml_cause )
function c_movetomapdham:evaluate()
DailyHuntAssistantMode.Log("c_movetomapdham")
	if(DailyHuntAssistantMode.currentTask.currentHunt.coordinates == nil) then return false end
	local mapID = DailyHuntAssistantMode.currentTask.currentHunt.coordinates.mapId
	if (Player.localmapid ~= mapID) then
		if (CanAccessMap(mapID)) then
			return true
		end
	end

	return false
end
-- If there are no aggro mobs - then
-- add task ffxiv_task_movetomap as subtask with specified mapId and pos
-- else - kill them one by one
e_movetomapdham = inheritsFrom( ml_effect )
function e_movetomapdham:execute()
DailyHuntAssistantMode.Log("e_movetomapdham")
	local coordinates = DailyHuntAssistantMode.currentTask.currentHunt.coordinates
	local mapID = coordinates.mapId
	local pos = coordinates.pos
	local task = ffxiv_task_movetomap.Create()
	task.task_fail_eval = function(task)
		return (not Player.alive or next(EntityList("alive,aggro")))
	end
	task.pos = pos
	task.destMapID = mapID
	DailyHuntAssistantMode.currentTask:AddSubTask(task)
end

-----------------------
-- 5. Switch job
-----------------------
-- Check if our job is not good for current hunt
c_switchjobdham = inheritsFrom( ml_cause )
e_switchjobdham = inheritsFrom( ml_effect )
e_switchjobdham.nextJob = nil
function c_switchjobdham:evaluate()
DailyHuntAssistantMode.Log("c_switchjobdham")
	if (next(EntityList("alive,aggro"))) then return false end
	local currentHunt = DailyHuntAssistantMode.currentTask.currentHunt
	
	if(DailyHuntAssistantMode.Settings.JobSwitchEnabled == false or
		currentHunt.coordinates == nil) then 
		return false 
	end
	
	local fateTypeHunt = currentHunt.coordinates.fateId ~= nil
	local currentJob = Player.job
	local selectedFateJob = FFXIV.JOBS[DailyHuntAssistantMode.Jobs[DailyHuntAssistantMode.Settings.JobForFates]]
	local JobForNonFatesHigh = FFXIV.JOBS[DailyHuntAssistantMode.Jobs[DailyHuntAssistantMode.Settings.JobForNonFatesHigh]]
	local JobForNonFatesLow = FFXIV.JOBS[DailyHuntAssistantMode.Jobs[DailyHuntAssistantMode.Settings.JobForNonFatesLow]]
	local JobSwitchLevelBorder = DailyHuntAssistantMode.Settings.JobSwitchLevelBorder
	
	if (fateTypeHunt and currentJob ~= selectedFateJob) then
		e_switchjobdham.nextJob = selectedFateJob
		return true
	end
	
	if (fateTypeHunt == false and currentJob ~= JobForNonFatesHigh and ( currentHunt.level == nil or currentHunt.level >= JobSwitchLevelBorder ) ) then
		e_switchjobdham.nextJob = JobForNonFatesHigh
		return true
	end
	
	if (fateTypeHunt == false and currentJob ~= JobForNonFatesLow and ( currentHunt.level ~= nil and currentHunt.level < JobSwitchLevelBorder ) ) then
		e_switchjobdham.nextJob = JobForNonFatesLow
		return true
	end
	gAutoEquip = false
	return false
end
-- Adds task to switch job and auto-equip best gear
function e_switchjobdham:execute()
DailyHuntAssistantMode.Log("e_switchjobdham")
	local bag = Inventory:Get(3400)
	local item = nil
	for _,i in pairs(bag:GetList()) do 
		if(i.canequip) then item = i end 
	end
	if (item ~= nil) then
		item:Move(1000,13) -- 1000 = Inventory ID of equipped items. 13 = slot ID for soul crystal.
	else
		local task = ffxiv_misc_switchclass.Create()
		task.class = e_switchjobdham.nextJob
		task.task_complete_eval = function(task)
			local class = task.class
			
			if (Player.job ~= class) then
				d("[SwitchClass]: Need to change class to ["..tostring(class).."]")
				if (Busy() or Player.incombat) then
					d("[SwitchClass]: Cannot swap right now, invalid state.")
					return false
				end
					
				local canSwitch,bestWeapon = CanSwitchToClass(class)
				if (canSwitch) then
					return false
				else
					d("Not allowed to switch, no proper weapon found for ["..tostring(class).."].")
				end	
			end
			
			d("[SwitchClass]: Checking autoequip.")
			if (c_recommendequip:evaluate()) then
				e_recommendequip:execute()
				d("[SwitchClass]: Autoequip had work to do, so don't complete yet.")
				return false
			end
			
			d("[SwitchClass]: Completing task of jobswitch to ["..tostring(class).."].")
			return true
		end
		gAutoEquip = true
		DailyHuntAssistantMode.currentTask:AddSubTask(task)
	end
end


-----------------------
-- 6. Move to specified location
-----------------------
-- Check if distance to location is higher than
-- scanner distance
c_movetoposdham = inheritsFrom( ml_cause )
function c_movetoposdham:evaluate()
DailyHuntAssistantMode.Log("c_movetoposdham")
	if(DailyHuntAssistantMode.currentTask.currentHunt.coordinates == nil) then return false end
	local coordinates = DailyHuntAssistantMode.currentTask.currentHunt.coordinates
	local mapID = coordinates.mapId
	if (Player.localmapid == mapID) then
		local ppos = Player.pos
		local pos = coordinates.pos
		local fateId = coordinates.fateId
		local fate = nil
		if ( fateId ~= nil ) then fate = GetFateByID(fateId) end
		
		local dist = Distance3D(ppos.x, ppos.y, ppos.z, pos.x, pos.y, pos.z)
		-- If distance enough for scanner or if this is fate type hunt
		-- then if fate is not poped up
		if (dist > 120 or ( fateId ~= nil and fate == nil and dist > 20) ) then
			return true
		end
	end
	return false
end
-- Do move to location and applies speed hack
e_movetoposdham = inheritsFrom( ml_effect )
function e_movetoposdham:execute()
DailyHuntAssistantMode.Log("e_movetoposdham")
	-- Check for closest hunt
	e_newhuntdham:execute()
	-- reset speed for hack
	if (DailyHuntAssistantMode.Settings.SpeedHackGroundEnabled) then
		Player:SetSpeed(2,18,18,18) -- mounted
	end
	if (DailyHuntAssistantMode.Settings.SpeedHackFlyEnabled) then
		c_flyhackdham.doHack = true
	end
	DailyHuntAssistantMode.currentTask.currentHunt.starttime = os.time()
	local coordinates = DailyHuntAssistantMode.currentTask.currentHunt.coordinates
	local newTask = ffxiv_task_movetopos.Create()
	newTask.task_fail_eval = function(newTask)
		local _,aggo = next(EntityList("alive,aggro"))
		return (not Player.alive or (aggro ~= nil and aggro.hp.percent < 100))
	end
	newTask.pos = coordinates.pos
	newTask.range = 1
	if ( coordinates.noFly == true ) then
		newTask.noFly = true
	else
		newTask.noFly = false
	end
	newTask.remainMounted = false
	DailyHuntAssistantMode.currentTask:AddSubTask(newTask)
end

-----------------------
-- 7. If hunt is about fate - then move to position
-- then if fate presented - add to subtask
-- If hunt is not about fate - then just grind
-----------------------
c_dohuntdham = inheritsFrom( ml_cause )
e_dohuntdham = inheritsFrom( ml_effect )
-- Checks if we are on the hunt map
function c_dohuntdham:evaluate()
DailyHuntAssistantMode.Log("c_dohuntdham")
	if(DailyHuntAssistantMode.currentTask.currentHunt.coordinates == nil) then return false end
	local currentHunt = DailyHuntAssistantMode.currentTask.currentHunt
	return Player.localmapid == currentHunt.coordinates.mapId
end
-- Creates tasks like Grind for non-fate mobs
-- and ffxiv_task_fate for fate type
function e_dohuntdham:execute()
DailyHuntAssistantMode.Log("e_dohuntdham")
	DailyHuntAssistantMode.currentTask.currentHunt.starttime = nil
	local currentHunt = DailyHuntAssistantMode.currentTask.currentHunt.coordinates
	-- reset speed for hack
	if (DailyHuntAssistantMode.Settings.SpeedHackGroundEnabled) then
		Player:ResetSpeed(2) -- mounted
	end
	if (DailyHuntAssistantMode.Settings.SpeedHackFlyEnabled) then
		c_flyhackdham.doHack = false
	end
	
	if currentHunt.fateId == nil then
		if(Player.ismounted) then
			Dismount()
		end
		-- Create grind task with marker from currentHunt
		local grindTask = ffxiv_task_grind.Create()
		local marker = {
			blacklist = "",
			duration = 0,
			id = 1,
			mapid = currentHunt.mapId,
			maxcontentlevel = 0,
			maxlevel = 80,
			maxradius = 200,
			mincontentlevel = 0,
			minlevel = 1,
			name = "RandomName",
			order = 1,
			pos = currentHunt.pos,
			started = 0,
			type = "Grind",
			whitelist = tostring(currentHunt.contentId),
		}
		ml_marker_mgr.currentMarker = marker
		grindTask.marker = marker
		grindTask.targetFunction = DailyHuntAssistantMode.GetNearestGrindAttackable
		grindTask.task_complete_eval = function(grindTask)
			DailyHuntAssistantMode.Log("grind.task_complete_eval")
			if ( ml_marker_mgr.currentMarker == nil ) then ml_marker_mgr.currentMarker = grindTask.marker end
			if ( Player.localmapid ~= grindTask.marker.mapid ) then grindTask.completed = true end
			-- complete if none mobs in my aggro table and current hunt is done
			return DailyHuntAssistantMode.currentTask.currentHunt.isDone
		end
		DailyHuntAssistantMode.currentTask:AddSubTask(grindTask)
	else
		-- Checks if fate we need is active
		local fate = GetFateByID(currentHunt.fateId)
		-- if not and we have chainedFate for this hunt - select chained fate
		if(fate == nil and currentHunt.chainFateId) then 
			fate = GetFateByID(currentHunt.chainFateId)
		end
		if(fate == nil and currentHunt.chainFateId2) then 
			fate = GetFateByID(currentHunt.chainFateId2)
		end
		-- if we found fate or chained fate on map as active - then we make task
		if(fate) then
			local fateTask = DailyHuntAssistantMode_task_fate.Create()
			fateTask.fateid = fate.id
			fateTask.fatePos = { x = fate.x, y = fate.y, z = fate.z }

			DailyHuntAssistantMode.currentTask:AddSubTask(fateTask)
		else
			e_newhuntdham:execute()
		end
	end
end

-- Function to find nearest hunt target for non-fate hunts
function DailyHuntAssistantMode.GetNearestGrindAttackable()
	local targetContentId = DailyHuntAssistantMode.currentTask.currentHunt.coordinates.contentId
	local aggro = MEntityList("alive,attackable,aggro")
	local target = nil
	if ( aggro ~= nil) then
		-- If there is no our target in aggrolist
		-- we won't fight them
		local noneednewtarget = false
		for _,e in pairs(aggro) do
			if (e.contentid == targetContentId) then noneednewtarget = true end
		end
		-- Also if current hunt is done we need to kill remaining mobs
		local hunt = DailyHuntAssistantMode.currentTask.currentHunt
		if ( noneednewtarget or hunt and hunt.isDone ) then
			local lowestHp = math.huge
			for _,e in pairs(aggro) do
				if ( lowestHp > e.hp.current ) then
					target = e
					lowestHp = e.hp.current
				end
			end
		end
	end
	
	-- If target is empty - we should find new target
	if ( target == nil ) then
		local avaliable = MEntityList("alive,attackable,contentid=" .. tostring(targetContentId))
		if ( avaliable ~= nil ) then
			local nearestDistance = 1000
			-- Searching for nearest
			-- Additionally check if we can reach target
			-- and sometimes after fate finished some mods still have fateid
			-- attribute, but we already can attack them.
			for _,e in pairs(avaliable) do
				if ( nearestDistance > e.distance2d 
					and ( e.fateid == nil or GetFateByID(e.fateid) == nil)
					and NavigationManager:IsReachable(e.pos)
				) then
					nearestDistance = e.distance2d
					target = e
				end
			end
		end
	end
	return target
end

-----------------------
-- 8. Teleport after all task done
-----------------------
-- Check if there is any hunt left.
-- If no hunt and on correct map - just stop the bot.
c_movetomapalldonedham = inheritsFrom( ml_cause )
function c_movetomapalldonedham:evaluate()
DailyHuntAssistantMode.Log("c_movetomapalldonedham")
	if(Player.localmapid == DailyHuntAssistantMode.Settings.IdleLocation and DailyHuntAssistantMode.currentTask.currentHunt.coordinates == nil) then
		ml_global_information:ToggleRun()
	end
	return DailyHuntAssistantMode.currentTask.currentHunt.coordinates == nil
end
-- Add task ffxiv_task_movetomap as subtask with specified mapId and pos
e_movetomapalldonedham = inheritsFrom( ml_effect )
function e_movetomapalldonedham:execute()
DailyHuntAssistantMode.Log("e_movetomapalldonedham")
	local mapID = DailyHuntAssistantMode.Settings.IdleLocation
	local task = ffxiv_task_movetomap.Create()
	task.destMapID = mapID
	DailyHuntAssistantMode.currentTask:AddSubTask(task)
end

-- Shared function for e_dohuntdham and c_ovchatdham
-- checks chat and sets isDone (+ checks if any mobs in my aggrolist that I need to kill before teleport)
-- + If task marked as Done then we search other hunts with same contentId (there is a chance different Hunt Bills give you same target to hunt and gill goes for both of them)
function DailyHuntAssistantMode.isCurrentHuntDone()
	local task = DailyHuntAssistantMode.currentTask.currentHunt
	if ( task and task.isDone == false ) then
		local pattern = ""
		if ( GetGameLanguage() == 0) then -- JA
			pattern = string.lower(".*" .. string.gsub(string.lower(task.targetName),"-","%%-") .. "\xe3\x81\xae\xe8\xa8\x8e\xe4\xbc\x90%s%(*(%d)/(%d)%)*")
		else
			pattern = string.lower(".*%s" .. string.gsub(string.lower(task.targetName),"-","%%-") .. ".*%s%(*(%d)/(%d)%)*")
		end
		local chatLog = GetChatLines()

		for i in pairs(chatLog) do
			local l = chatLog[i].line
			local _,_,a,b = string.find(string.lower(l),pattern)
			if (a == b and a ~= nil) then
				for _,h in pairs(DailyHuntAssistantMode.currentTask.hunts) do
					for _, t in pairs(h.tasks) do
						if (t.coordinates and t.coordinates.contentId == task.coordinates.contentId) then
							t.isDone = true
						end
					end
				end
				task.isDone = true
				DailyHuntAssistantMode.SaveState()
				break
			end
		end
	end
	return task.isDone == true
end

-- Shared function for whole module
-- Logs data if debug is on
function DailyHuntAssistantMode.Log(message)
	if(DailyHuntAssistantMode.Settings.DebugEnabled) then
		d("[DHAM]: " .. message)
	end
end

-- Function for save current state of hunts
function DailyHuntAssistantMode.SaveState()
	if ( DailyHuntAssistantMode.Settings.SaveHuntsState == false ) then return end
	local settings = Settings.DailyHuntAssistantMode
	for i = 1, #DailyHuntAssistantMode.hunts do
		local attribute = "Task" .. tostring(i)
		for ii = 1, #DailyHuntAssistantMode.hunts[i].tasks do
			local task = DailyHuntAssistantMode.hunts[i].tasks[ii]
			local attr = attribute .. "Hunt" .. tostring(ii)
			local a = attr .. "ContentId"
			if ( settings[a] ~= nil and task.coordinates == nil) then
				settings[a] = nil
			elseif ( task.coordinates ~= nil and settings[a] ~= task.coordinates.contentId) then
				settings[a] = task.coordinates.contentId
			end
			
			a = attr .. "IsDone"
			if ( settings[a] ~= task.isDone) then
				settings[a] = task.isDone
			end
			a = attr .. "IsFailed"
			if ( settings[a] ~= task.isBuggy) then
				settings[a] = task.isBuggy
			end
			a = attr .. "TargetName"
			if ( settings[a] ~= task.targetName) then
				settings[a] = task.targetName
			end
		end
	end
end

RegisterEventHandler("Module.Initalize",DailyHuntAssistantMode.ModuleInit)