local TARGET_SPEED = 100 
local function setSpeed(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.WalkSpeed = TARGET_SPEED
        
        humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if humanoid.WalkSpeed ~= TARGET_SPEED then
                humanoid.WalkSpeed = TARGET_SPEED
            end
        end)
    end
end
local player = game:GetService("Players").LocalPlayer
if player.Character then
    setSpeed(player.Character)
end
