--!nonstrict

-- Main --
local ContainerClass = {}
ContainerClass.__index = ContainerClass

-- Service(s) --
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

-- Folder Declare(s) --
local Storage = ReplicatedStorage.Storage
local ServerConfig = ServerScriptService.Server

local DreamsFolder = Storage.Dreams
local ModulesFolder = ServerConfig.Modules

-- Module Declare(s) --

-- Type Variable(s) --
type Dreams = "Campfire"

--  Other Variable(s) --

-- Function(s) --

function ContainerClass:LoadMap()
	local Map : Model = self.Map
	
	Map.Parent = workspace
	Map:PivotTo(self.Data.CFrame)
end

function ContainerClass:Start()
	
end

function ContainerClass:AddPlayer(Player : Player)
	if not self.Data.CurrentCharacters[Player] then self.Data.CurrentCharacters[Player] = true end
	
	if not Player.Character then return end
	Player.Character:PivotTo(self.Map.Spawn.CFrame)
end

function ContainerClass:RemovePlayer(Player : Player)
	if not self.Data.CurrentCharacters[Player] then return end
	self.Data.CurrentCharacters[Player] = nil
end

function ContainerClass:GetPlayers()
	return self.Data.CurrentCharacters
end


-- Create function to assign characters to a dream

function ContainerClass.New() : ContainerObject
	local self = setmetatable({}, ContainerClass)
	
	self.Data = {
		Private = false,
		CFrame = CFrame.new(),
		CurrentCharacters = {},
	}
	
	self.Map = nil
	
	return self
end

function ContainerClass:Destroy()
	self.Map:Destroy()
	
	for i,v in pairs(self:GetPlayers()) do
		self:RemovePlayer(v)
	end
	
	table.clear(self)
	setmetatable(self, nil)
	table.freeze(self)
end

-- Connection(s) --

---[[ Return ]]---
export type ContainerObject = typeof(ContainerClass.New())
return ContainerClass
