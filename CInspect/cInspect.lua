--Checks to ensure target is able to be inspected and if Control Key is depressed. 
cInspect = function()
  if(IsControlKeyDown() and UnitIsFriend("player","target") and CanInspect("target") and not InCombatLockdown()) then
    InspectUnit("target") ;
  end
end
--Timer that calls the C-Inspect function every 1 Second.
local myTicker = C_Timer.NewTicker(1, cInspect);
