local uis = game:GetService("UserInputService")
local holdingw = false
local holdings = false

local vectorForce
local vectorForce2

for i, v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
    if tostring(v.Name) == game:GetService("Players").LocalPlayer.Name then 
            local attachment = Instance.new("Attachment")
            attachment.CFrame = v.PlateCenter.CFrame
attachment.Parent = v.PlateCenter

vectorForce = Instance.new("VectorForce")
vectorForce.Parent = v.PlateCenter
vectorForce.Force = Vector3.new(0, 0, 0)
vectorForce.RelativeTo = Enum.ActuatorRelativeTo.Attachment0
vectorForce.Attachment0 = attachment
vectorForce.ApplyAtCenterOfMass = true
    end
end

function boost()
	for i, v in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
        if tostring(v.Name) == game:GetService("Players").LocalPlayer.Name then 
            vectorForce.Force = Vector3.new(15000,0,0)
        end
    end
end


uis.InputBegan:Connect(function(inpt)
	if inpt.KeyCode == Enum.KeyCode.W then
		holdingw = true
	end
end)

uis.InputEnded:Connect(function(inpt)
	if inpt.KeyCode == Enum.KeyCode.W then
		holdingw = false
	end
end)

while wait() do 
    print(holdingw)
	if holdingw then
		boost()
	else 
	    vectorForce.Force = Vector3.new(0, 0, 0)
	end
end
