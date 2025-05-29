--!strict

-- Main --
local Base = {}

-- Service(s) --
local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ServerScriptService = game:GetService("ServerScriptService")

-- Folder Declare(s) --
local ServerConfig = ServerScriptService.Server

-- Module Declare(s) --

-- Type Variable(s) --

--  Other Variable(s) --

-- Function(s) --
function Base.FindOpenPlot(Containers) : CFrame
	local yPos = 10

	repeat task.wait()
		local found = true

		for _, v in pairs(Containers) do
			if v.Data.Position.y == yPos then 
				yPos += 100
				found = false
			end
		end
	until found
	
	return CFrame.new(Vector3.new(0, yPos, 0))
end


-- Connection(s) --

---[[ Return ]]---
return Base
