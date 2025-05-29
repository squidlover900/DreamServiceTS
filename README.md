# DreamService
## Creating a Dream
Dreams are folders that contain everything related to that dream. All assets, scripts, and buildings should be organized and setup inside the folder.

The folder should be the title of your dream (AKA: Campfire)

A module script called "Main" should be held inside, with a function called Start() that should run when ContainerObject:Start() is called.

A part called "Spawn" should be inside the map, at the positon that the player should spawn at when ContainerObject:AddPlayer() is called.

Example Folder:
```
📁 Campfire (Folder)
    -📜 Main (ModuleScript)
    -🏢 Map (Model)
        -📦 Spawn (Part)
```

## Documentation
### DreamService:CreateContainer(Dream : Folder) -> ContainerObject
Creates and returns a new ContainerObject for the specified Dream. If there is already a ContainerObject for the specified dream, return that ContainerObject instead.

### DreamService:GetContainer(Dream : Folder) -> ContainerObject
Returns a ContainerObject for the specified Dream. If no container found, returns nil.

### DreamService:DestroyContainer(Dream : Folder)
Destroys container for the specified Dream.

### DreamService:CleanupContainers()
Destroys all containers.

## ContainerObject
Holds all the information and methods for a dream. 
```lua
ContainerObject.Data = {
  Private = false,
  CFrame = CFrame.new(),
}
ContainerObject.Map
```
### ContainerObject:LoadMap()
Loads the map of the dream into the workspace. 

### ContainerObject:Start()
Runs the Start function specified in the dreams "Main" module.

### ContainerObject:AddPlayer(Player : Player)
Adds specified player to the dream

### ContainerObject:RemovePlayer(Player : Player)
Removes specified player from the dream.
