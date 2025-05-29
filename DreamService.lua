-- Main --
local DreamService = {}

-- Data --
local Containers = {}
local RegisteredPlayers = {}

-- Service(s) --
local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

-- Folder Declare(s) --

-- Module Declare(s) --
local ContainerClass = require(script.ContainerClass)
local Base = require(script.Base)

-- Type Variable(s) --
type ContainerObject = ContainerClass.ContainerObject

--  Other Variable(s) --

-- Function(s) --

local function Debug(...)
	print(`[Dream Service] (Debug) : {...}`)
end

local function Warn(...)
	warn(`[Dream Service] (Warning) : {...}`)
end

function DreamService.CreateContainer(Dream : Folder) : ContainerObject
	local container = Containers[Dream]
	
	if container then return container end
	
	local newContainer = ContainerClass.New()
	
	newContainer.Data.Private = Dream:GetAttribute("Private")
	newContainer.Map = Dream.Map
	
	newContainer.Data.CFrame = Base.FindOpenPlot(Containers)

	Containers[Dream] = newContainer
	return newContainer
end

function DreamService.GetContainer(Dream : ModuleScript) : ContainerObject
	local container = Containers[Dream]
	if not container then Warn("No container found for "..Dream.Name) return end
	
	return container
end

function DreamService.DestroyContainer(character : Model)
	local container = Containers[character]
	if not container then return end
	
	container:Destroy()

	return container
end

function DreamService.CleanupContainers()
	for character, container in Containers do
		container:Destroy()
		Containers[character] = nil
	end
end

-- Connection(s) --
Players.PlayerAdded:Connect(function(player : Player)
	if RegisteredPlayers[player] then return end
	RegisteredPlayers[player] = true
	Debug("Registered Player "..player.Name)
end)

Players.PlayerRemoving:Connect(function(player: Player) 
	if not RegisteredPlayers[player] then return end
	RegisteredPlayers[player] = nil
	Debug("Unregistered Player "..player.Name)
end)

---[[ Return ]]---
return DreamService
