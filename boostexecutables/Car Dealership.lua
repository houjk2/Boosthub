

local gearSpeeds = {
  [-1] = -50,
  [1] = 200,
  [2] = 230,
  [3] = 300,
  [4] = 370,
  [5] = 400,
  [6] = 3000
}

local gearTorques = {
  [-1] = 9635,
  [1] = 999999,
  [2] = 5850,
  [3] = 3000,
  [4] = 3000,
  [5] = 5000,
  [6] = 5000
}

local gearAccels = {
  [-1] = 200,
  [1] = 500,
  [2] = 500,
  [3] = 200,
  [4] = 200,
  [5] = 200,
  [6] = 400
}

local shiftTime = 0.001
local brakePower = 20000
local startTime = 0.5
local maxSteeringAngle = 35
local turnSpeed = 10

local car

for i, v in pairs(game:GetService("Workspace").Cars:GetChildren()) do 
    if v.Stats.Owner.Value == game:GetService("Players").LocalPlayer.Name then 
        car = v
    end
end

local statsModule = require(car.StatsModule)

statsModule.GearSpeeds = gearSpeeds
statsModule.GearTorques = gearTorques
statsModule.GearAccels = gearAccels
statsModule.ShiftTime = shiftTime
statsModule.BrakePower = brakePower
statsModule.StartTime = startTime
statsModule.MaxSteeringAngle = maxSteeringAngle
statsModule.TurnSpeed = turnSpeed


