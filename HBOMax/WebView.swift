import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL

    func makeNSView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        
        // เปิดการอนุญาต Full Screen ระดับ HTML5
        if #available(macOS 12.0, *) {
            preferences.isElementFullscreenEnabled = true
        }
        
        let config = WKWebViewConfiguration()
        config.preferences = preferences
        config.allowsAirPlayForMediaPlayback = true
        
        let webView = WKWebView(frame: .zero, configuration: config)
        
        // ตั้งค่า User Agent เพื่อกันเว็บมองว่าเป็นเบราว์เซอร์เถื่อน
        webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Safari/605.1.15"
        
        // ตั้งค่าพื้นหลัง WebView เป็นสีดำ เพื่อให้ดูกลมกลืนเวลาโหลดหน้าเว็บ
        webView.setValue(false, forKey: "drawsBackground")
        webView.underPageBackgroundColor = NSColor.black
        
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        nsView.load(request)
    }
}
