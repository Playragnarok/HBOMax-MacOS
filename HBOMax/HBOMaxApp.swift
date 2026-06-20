import SwiftUI

@main
struct HBOMax: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // นำการซ่อน Title Bar ออก เพื่อให้สามารถลากหน้าต่างและใช้งานปุ่มย่อ/ขยายได้ปกติ
        .defaultSize(width: 1280, height: 720)
        .windowResizability(.contentSize)
    }
}
