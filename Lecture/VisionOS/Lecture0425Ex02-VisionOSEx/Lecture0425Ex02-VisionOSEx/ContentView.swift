//import SwiftUI
//import RealityKit
//import RealityKitContent
//import Vision
//import UIKit
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var selectedImage: UIImage?
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            if let selectedImage = selectedImage {
//                Image(uiImage: selectedImage)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 300)
//                    .onTapGesture {
//                        print("🖼 이미지 클릭됨!")
//                        VisionManager.recognizeText(from: selectedImage)
//                    }
//            } else {
//                Text("이미지를 선택해주세요")
//                    .foregroundColor(.gray)
//            }
//            
//            Button("사진 선택") {
//                selectedImage = UIImage(named: "sample_image")
//                if selectedImage == nil {
//                    print("⚠️ 이미지 로드 실패: sample_image")
//                } else {
//                    print("✅ 이미지 로드 성공!")
//                }
//            }
//            .padding(30)
//            .background(.blue)
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//            .zIndex(1) // 레이어 우선 순위 높이기
//        }
//        .padding()
//    }
//}

import SwiftUI

struct ContentView: View {
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker = false
    
    var body: some View {
        VStack(spacing: 20) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                Button("텍스트 인식") {
                    VisionManager.recognizeText(from: image)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            Button("사진 선택") {
                showImagePicker = true
            }
        }
        .sheet(isPresented: $showImagePicker) {
            VisionImagePicker(image: $selectedImage)
        }
        .padding()
    }
}
