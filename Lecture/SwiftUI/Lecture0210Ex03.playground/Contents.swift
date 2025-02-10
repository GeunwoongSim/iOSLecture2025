//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SwiftUI

//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//        
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()


//struct ContentView: View {
//    var body: some View {
//        Text("Hello, World!")
//        Button("Click me") {
//            print("Clicked")
//        }
//    }
//}
//
//PlaygroundPage.current.setLiveView(ContentView())
////PlaygroundPage.current.liveView = ContentView
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI in Playground!")
            .font(.largeTitle)
            .foregroundColor(.green)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

