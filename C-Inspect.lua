-- Checks to ensure target is able to be inspected and if Control Key is depressed.
-- If CTRL + Left Click is used on a friendly target, your mouseover target will be inspected.
-- This includes party/raid frames from within the same zone you're currently in.

-- reload UI when player types ' /rl '
SLASH_NEWRELOAD1 = "/rl"
SlashCmdList.NEWRELOAD = ReloadUI

-- Keeps track of last player inspected.
lastInspectTargetName = "" 

cInspect = function()
  if(IsControlKeyDown() and CanInspect("mouseover") and not InCombatLockdown())then
    inspectTargetName = UnitName("target");
    if(inspectTargetName ~= lastInspectTargetName)then
      InspectUnit("target");
      lastInspectTargetName = inspectTargetName
    end
  end
end


-- Timer that calls the C-Inspect function every 1 Second(s).
local myTicker = C_Timer.NewTicker(1, cInspect);

-- Notes:
-- InspectUnit(target); -- Cannot be mouseover or paperdoll fails to fetch gear details.
-- ToDo:
-- 1. allow mouseover target to be inspected.
