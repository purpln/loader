import Architecture

@main
struct App: Application {
    var scenes: [any Scene] { [
        Service()
    ] }
}

struct Test: Scene {
    func execute() async throws {
        
    }
}
