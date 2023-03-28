

local holdingw = false
local holdings = false
local uis = game:GetService("UserInputService")

function getcar()
    for i, v in pairs(game:GetService("Workspace")["_Main"].Vehicles:GetChildren()) do 
        if v.VehicleSeat.Occupant.Parent.Name == game:GetService("Players").LocalPlayer.Name then
            return v
        end
    end
end

function boost()
    if getcar() then 
        getcar().VehicleSeat.BoostForce.Force = Vector3.new(0, 0, -50000)
    end
end

function reverseboost()
    if getcar() then 
        getcar().VehicleSeat.BoostForce.Force = Vector3.new(0, 0, 30000)
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

uis.InputBegan:Connect(function(inpt)
	if inpt.KeyCode == Enum.KeyCode.S then
		holdings = true
	end
end)

uis.InputEnded:Connect(function(inpt)
	if inpt.KeyCode == Enum.KeyCode.S then
		holdings = false
	end
end)

while task.wait() do 
	if holdingw then
		boost()
	else 
	    if holdings then 
	        reverseboost()
	    else
            if getcar() then 
                getcar().VehicleSeat.BoostForce.Force = Vector3.new(0, 0, 0)
            end
	    end
	end
end


