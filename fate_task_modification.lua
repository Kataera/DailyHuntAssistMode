---------------------------
-- Modification for default fate task
---------------------------
-- Copy/paste from ffxiv_task_fate.Create()
-- except DailyHuntAssistantMode.GetBetterTarget
DailyHuntAssistantMode_task_fate = inheritsFrom( ffxiv_task_fate )
function DailyHuntAssistantMode_task_fate.Create()
    local newinst = inheritsFrom(DailyHuntAssistantMode_task_fate)
    
    --ml_task members
    newinst.valid = true
    newinst.completed = false
    newinst.subtask = nil
    newinst.auxiliary = false
    newinst.process_elements = {}
    newinst.overwatch_elements = {}
    
    --ffxiv_task_fate members
    newinst.name = "LT_FATE"
    newinst.fateid = 0
	newinst.targetid = 0
    newinst.targetFunction = DailyHuntAssistantMode.GetBetterTarget
	newinst.killFunction = ffxiv_task_grindCombat
	newinst.waitingForChain = false
	newinst.waitStart = 0
	newinst.nextFate = {}
	newinst.randomDelayCompleted = false
	newinst.specialDelay = 1000
	
    --newinst.fateTimer = 0
	newinst.fateMap = Player.localmapid
    newinst.fateCompletion = 0
    newinst.started = false
    newinst.moving = false
    newinst.fatePos = {}
	ffxiv_task_grind.inFate = false
	c_bettertargetsearch.throttle = 0
	table.insert(tasktracking, newinst)
    
    return newinst
end

function DailyHuntAssistantMode_task_fate:Init()

    --init processoverwatch 
	-- Modified: 
	--  e_endfatedham - removed part with Chained fates
	--  ke_addKillTargetdham - switched function for targeting from GetNearestFateAttackable()
	--                         to DailyHuntAssistantMode.GetFateBetterTarget()
	-- Added:
	--  ke_companion
	--  ke_stance
	-- Removed:
	--  ke_betterFate
	--  ke_teleToFate
	
	local ke_fateEnddham = ml_element:create( "FateEnddham", c_endfate, e_endfatedham, 100)
    self:add( ke_fateEnddham, self.overwatch_elements)
	
	local ke_updateFate = ml_element:create( "UpdateFateDetails", c_updatefate, e_updatefate, 90 )
    self:add( ke_updateFate, self.overwatch_elements)
            
    local ke_syncFate = ml_element:create( "SyncFateLevel", c_syncfatelevel, e_syncfatelevel, 50 )
    self:add( ke_syncFate, self.overwatch_elements)
	
    --init process
	local ke_moveToFateMap = ml_element:create( "MoveToFateMap", c_movetofatemap, e_movetofatemap, 100 )
    self:add( ke_moveToFateMap, self.process_elements)
	
    local ke_rest = ml_element:create( "Rest", c_rest, e_rest, 90 )
    self:add( ke_rest, self.process_elements)
	
	local ke_fateRandomDelay = ml_element:create( "RandomFateDelay", c_faterandomdelay, e_faterandomdelay, 80 )
    self:add( ke_fateRandomDelay, self.process_elements)
    
	-- Summons companion
	local ke_companion = ml_element:create( "Companion", c_companion, e_companion, 75 )
	self:add( ke_companion, self.process_elements)
	
	-- Changes stance for companion. No modification in this
	local ke_stance = ml_element:create( "Stance", c_stance, e_stance, 70 )
	self:add( ke_stance, self.process_elements)
		
    local ke_addKillTargetdham = ml_element:create( "AddFateTargetdham", c_add_fatetargetdham, e_add_fatetargetdham, 60 )
    self:add(ke_addKillTargetdham, self.process_elements)
    
	local ke_moveToFate = ml_element:create( "MoveToFate", c_movetofate, e_movetofate, 50 )
    self:add( ke_moveToFate, self.process_elements)
	
    local ke_moveWithFate = ml_element:create( "MoveWithFate", c_movewithfate, e_movewithfate, 45 )
    self:add( ke_moveWithFate, self.process_elements)
	
	local ke_moveChainFate = ml_element:create( "MoveChainFate", c_movetochainlocation, e_movetochainlocation, 40 )
    self:add( ke_moveChainFate, self.process_elements)
end

-- Modified: removed part with Chained fates (original e_endfate)
e_endfatedham = inheritsFrom( ml_effect )
function e_endfatedham:execute()
	d("Setting FATE to end completely.")
	ffxiv_task_grind.inFate = false
	Player:Stop()
	ml_task_hub:ThisTask().completed = true
	ml_task_hub:ThisTask():DeleteSubTasks()
	ml_global_information.Await(1000)
	ml_global_information.suppressRestTimer = Now() + 10000
end

------------------------
-- Modified part for targeting
-- Modified: instead of GetNearestFateAttackable()
-- I'm using DailyHuntAssistantMode.GetFateBetterTarget()
------------------------
c_add_fatetargetdham = inheritsFrom( ml_cause )
e_add_fatetargetdham = inheritsFrom( ml_effect )
c_add_fatetargetdham.oocCastTimer = 0
c_add_fatetargetdham.throttle = 500
function c_add_fatetargetdham:evaluate()
	if (not Player.incombat) then
		if (SkillMgr.Cast( Player, true)) then
			c_add_fatetarget.oocCastTimer = Now() + 1500
			return false
		end
		
		if (MIsCasting() or Now() < c_add_fatetarget.oocCastTimer) then
			return false
		end
	end
	
	local fate = MGetFateByID(ml_task_hub:CurrentTask().fateid)
	if (table.valid(fate)) then
		if (fate.status == 2) then
			--d("status:"..tostring(fate.status))
			--d("completion:"..tostring(fate.completion))
			--d("name:"..tostring(fate.name))
			
			local myPos = Player.pos
			local fatePos = {x = fate.x, y = fate.y, z = fate.z}
			
			local dist = PDistance3D(myPos.x,myPos.y,myPos.z,fatePos.x,fatePos.y,fatePos.z)
			if (Player.level <= fate.maxlevel or dist < fate.radius) then
				local target = DailyHuntAssistantMode.GetFateBetterTarget()
				if (table.valid(target)) then
					if(target.hp.current > 0 and target.id ~= nil and target.id ~= 0) then
						c_add_fatetarget.targetid = target.id
						return true
					end
				else
					d("no nearest fate attackable")
				end
			end
		end
	end
    
    return false
end
function e_add_fatetargetdham:execute()
	d("Adding a new fate target.")
	if(Player.ismounted and IsCompanionSummoned() == false and 
		DailyHuntAssistantMode.Settings.SummonCompanionMode >= 2) then
		Dismount()
	elseif (IsCompanionSummoned() or DailyHuntAssistantMode.Settings.SummonCompanionMode == 1) then
		local newTask = ffxiv_task_grindCombat.Create()
		newTask.betterTargetFunction = DailyHuntAssistantMode.GetFateBetterTarget
		newTask.targetid = c_add_fatetarget.targetid
		ml_task_hub:CurrentTask():AddSubTask(newTask)
	end
end

-- Returns true if the boss in my aggro list
function DailyHuntAssistantMode.IsBossInAggroList()
	local aggrolist = EntityList("alive,aggro,maxdistance=25")
	for _,e in pairs(aggrolist) do
		local entity = EntityList:Get(e.id)
		-- I just think that if something has HP more than me times 2.2 - is should be fat boss
		-- Why 2.2? Don't know...I like nuber 2.2
		if (Player.hp.max * 2.2 < entity.hp.max) then
			return true
		end
	end
	return false
end

-- If the battle with Boss is not started or aggro enemy is only one 
-- then I use default function for target selection.
-- Else I assume that there is a boss fight and some adds are hitting me - I need to kill lowest HP from aggro list
function DailyHuntAssistantMode.GetFateBetterTarget()
	local aggrolist = EntityList("alive,aggro,maxdistance=25")
	local count = 0
	for _ in pairs(aggrolist) do
		count = count + 1
	end
	local target = nil
	local aggrocount = 0
	local isbossaggro = DailyHuntAssistantMode.IsBossInAggroList()
	
	if(count > 1 and isbossaggro) then
		local minhp = 999999999
		for _,e in pairs(aggrolist) do
			local entity = EntityList:Get(e.id)
			if (minhp > entity.hp.current) then
				minhp = entity.hp.current
				target = e
			end
		end
	else
		target = GetNearestFateAttackable()
	end
	return target
end
