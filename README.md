# DreamService
## Documentation
### DreamService:CreateContainer(Dream : Folder) -> ContainerObject
Creates and returns a new ContainerObject for the specified Dream. If there is already a ContainerObject for the specified dream, return that ContainerObject instead.

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

### ContainerObject:Start()

### ContainerObject:End()

### ContainerObject:AddPlayer()

### ContainerObject:RemovePlayer()
