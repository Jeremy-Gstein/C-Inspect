--Checks to ensure target is able to be inspected and if Control Key is depressed.

-- If ctrl is held, your mouseover target will be inspected. This includes party/raid frames from within the same zone you're currently in.
-- This works even if the mouseover is not your target, allowing "invisible inspects".
cInspect = function()
  if(IsControlKeyDown() and UnitIsFriend("player", "mouseover") and CanInspect("mouseover") and not InCombatLockdown()) then
    InspectUnit("mouseover");
  end
end
--Timer that calls the C-Inspect function every 1 Second(s).
local myTicker = C_Timer.NewTicker(1, cInspect);



-- Plans to make function pause the ticker while an inspect window is open
