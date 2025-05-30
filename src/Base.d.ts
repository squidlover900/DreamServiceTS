declare module "src/Base.lua" {
    interface BaseModule {
        FindOpenPlot: (containers: Record<string, { Data: { Position: Vector3 } }>) => CFrame;
    }

    const Base: BaseModule;
    export = Base;
}