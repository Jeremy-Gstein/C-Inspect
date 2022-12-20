-- Checks to ensure target is able to be inspected and if Control Key is depressed.
-- If CTRL + Left Click is used on a friendly target, your target will be inspected.
-- This includes party/raid frames from within the same zone you're currently in.

-- reload UI when player types ' /rl '
SLASH_NEWRELOAD1 = "/rl"
SlashCmdList.NEWRELOAD = ReloadUI


cInspect = function()
  if(IsControlKeyDown() and CanInspect("mouseover") and not InCombatLockdown())then
    InspectUnit("target");       -- Cannot be 'mouseover' or paperdoll fails to fetch gear details.    
  end
end

-- Define an event to pass cInspect too when Event is called. (checking control key change)
local function OnEvent(self, event, ...)
  cInspect();
end

-- Set Frame to Look for Event and Call cInspect
local f = CreateFrame("Frame")
f:RegisterEvent("MODIFIER_STATE_CHANGED")
f:SetScript("OnEvent", OnEvent)

-- ToDo:
-- Remove need to press left click and target when inspecting a player.