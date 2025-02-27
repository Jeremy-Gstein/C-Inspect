-- Checks to ensure target is able to be inspected and if Control Key is depressed.
-- If CTRL + Left Click is used on a friendly target, your target will be inspected.
-- This includes party/raid frames from within the same zone you're currently in.

-- Reload UI when player types ' /rl '
SLASH_NEWRELOAD1 = "/rl"
SlashCmdList.NEWRELOAD = ReloadUI
-- Function to inspect the target
local function cInspect()
    local success, err = pcall(function()
        if IsControlKeyDown() and CanInspect("mouseover") and not InCombatLockdown() then
            InspectUnit("target") -- Cannot be 'mouseover' or paperdoll fails to fetch gear details.
        end
    end)

    if not success then
        print("cInspect Error: " .. err)
    end
end
-- Event handler for modifier key changes
local function OnEvent(self, event, ...)
    local success, err = pcall(function()
        cInspect() -- Call cInspect safely
    end)

    if not success then
        print("OnEvent Error: " .. err)
    end
end
-- Create a frame to listen for events
local f = CreateFrame("Frame")
local success, err = pcall(function()
    f:RegisterEvent("MODIFIER_STATE_CHANGED")
    f:SetScript("OnEvent", OnEvent)
end)

if not success then
    print("Frame Creation Error: " .. err)
end
-- ToDo:
-- Remove need to press left click and target when inspecting a player.
