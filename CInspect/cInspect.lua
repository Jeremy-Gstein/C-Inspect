
cInspect = function()
  if(IsControlKeyDown() and UnitIsFriend("player","target") and CanInspect("target") and not InCombatLockdown()) then
    InspectUnit("target") ;
  end
end
local myTicker = C_Timer.NewTicker(1, cInspect);
