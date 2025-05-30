declare module "src/ContainerClass.lua" {
    export interface ContainerObject {
        Map: Model | null;
        Data: {
            Private: boolean;
            CFrame: CFrame;
            CurrentCharacters: Player
        };
        LoadMap: () => void;
        Start: () => void;
        AddPlayer: (player: Player) => void;
        RemovePlayer: (player: Player) => void;
        GetPlayers: () => Player
        Destroy: () => void;
    }
    interface ContainerClassModule {
        New: () => ContainerObject;
    }

    const ContainerClass: ContainerClassModule;
    export { ContainerClass };
}