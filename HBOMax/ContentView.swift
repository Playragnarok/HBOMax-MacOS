import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: "https://www.max.com")!)
            .edgesIgnoringSafeArea(.all)
            // 1. นำ .aspectRatio ออก เพื่อปลดล็อคให้ตอน Full Screen สามารถขยายเต็มขอบจอ Mac ได้
            
            // 2. ปรับ minHeight เป็น 630 เพื่อให้สัดส่วนเริ่มต้นเป็น 16:9 พอดีเป๊ะ (1120 / 16 * 9 = 630)
            .frame(minWidth: 1120, minHeight: 630)
            .background(Color.black)
            
            // 3. ใช้ onAppear เพื่อเข้าไประดับระบบปฏิบัติการ (AppKit) และล็อคสัดส่วนที่กรอบหน้าต่าง
            .onAppear {
                DispatchQueue.main.async {
                    // ดึงหน้าต่างปัจจุบันที่แอปแสดงผลอยู่
                    if let window = NSApplication.shared.windows.first {
                        // บังคับให้การจับขอบหน้าต่างย่อ-ขยาย (Windowed Mode) ล็อคสัดส่วนที่ 16:9
                        window.contentAspectRatio = NSSize(width: 16, height: 9)
                    }
                }
            }
    }
}
