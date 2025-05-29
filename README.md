# DreamService
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

### ContainerObject:End()
Removes all players from the dream, and destroys the dream aswell.

### ContainerObject:AddPlayer(Player : Player)
Adds specified player to the dream

### ContainerObject:RemovePlayer(Player : Player)
Removes specified player from the dream.
