declare module "src/DreamService.lua" {
    import { ContainerObject } from "src/ContainerClass.lua"; 

    interface DreamService {
        CreateContainer: (dream: Folder) => ContainerObject;
        GetContainer: (dream: ModuleScript) => ContainerObject | undefined;
        DestroyContainer: (dream: ModuleScript) => ContainerObject | undefined;
        CleanupContainers: () => void;
    }
    const DreamService: DreamService;
    export { DreamService };
}