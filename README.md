# DreamService
## Creating a Dream (Setup)
Dreams are folders that contain everything related to that dream. All assets, scripts, and buildings should be organized and setup inside the folder.

The folder should be the title of your dream *(AKA: Campfire)*

A module script called "Main" should be inside the folder, with a function, Main.Start(), that runs at the start of the dream.

A BoolValue called "Private" should be inside the folder, specifying whether the dream is private *(other players cannot enter)*, or not private *(other players can enter)*

A part called "Spawn" should be inside the map in the positon that the player will spawn at when they enter the dream.

Example Folder:
```
📁 Campfire (Folder)
    - 📜 Main (ModuleScript)
    - ☑️ Private (BoolValue)
    - 🏢 Map (Model)
        - 📦 Spawn (Part)
        - Rest of map below -
```

## Creating a Dream (Script)

After creating the folder for the dream, you can now create a **Container** for the dream using the DreamService. In a ServerScript, call **DreamService:CreateContainer(DreamFolder)**

Example:
```lua
local Services = ServerConfig.Services
local DreamsFolder = Storage.Dreams

local DreamService = require(Services.DreamService)

local Dream = DreamService.CreateContainer(DreamsFolder.Campfire)
```

You just created a new **Container** called Dream. First thing you want to do is load the map. You can do this by caling **Dream:LoadMap()**

Example:
```lua
local Dream = DreamService.CreateContainer(DreamsFolder.Campfire)

Dream:LoadMap()
```

Calling :LoadMap() simply loads the map into the workspace. Now that the map is loaded, you need to add players to this dream. To do this, use **Dream:AddPlayer()**

Example:
```lua
local Dream = DreamService.CreateContainer(DreamsFolder.Campfire)

Dream:AddPlayer(Player)
```

Finally, in order to start the dream, use **Dream:Start()**, this will run whatever the Start() function is inside of the "Main" module script. Dreams don't need a specified start however, such as a dream could just be a beach with no specified start or end.

Example:
```lua
local Dream = DreamService.CreateContainer(DreamsFolder.Campfire)

Dream:Start()
```

When it's time for a dream to end, use **Dream:End()**, this will handle all cleaning up of the dream, and wake up all players currently in that dream.

Example:
```lua
local Dream = DreamService.CreateContainer(DreamsFolder.Campfire)

Dream:End()
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
  CurrentCharacters = {}
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
