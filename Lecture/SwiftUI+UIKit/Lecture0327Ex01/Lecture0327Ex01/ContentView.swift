//
//  ContentView.swift
//  Lecture0327Ex01
//
//  Created by 심근웅 on 3/27/25.
//

import SwiftUI
import Photos

struct ContentView: View {
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
//                    .frame(height: 300)
            } else {
                Text("선택된 이미지가 없다!")
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            
            Text("Hello, world!")
            
            Button("이미지 선택") {
                checkPhotoLibraryPermission()
            }
            .padding()
        }
        .sheet(isPresented: $showImagePicker) {
            // UIImagePicker를 사용할 객체 호출
            ImagePickerView(selectedImage: $selectedImage)
        }
        .padding()
    }
    
    func checkPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        switch status {
        case .authorized, .limited: print("권한 있음")
            showImagePicker = true
        case .notDetermined: print("권한 요청 필요")
            PHPhotoLibrary.requestAuthorization(for: .readWrite) {
                newStatus in
                DispatchQueue.main.async {
                    if newStatus == .authorized || newStatus == .limited {
                        print("✅ 권한 허용됨")
                        showImagePicker = true
                    } else {
                        presentSettingsAlert()
                    }
                }
            }
            
        case .denied, .restricted: print("권한 거부됨")
            presentSettingsAlert()
        @unknown default: print("etc ...")
        }
    }
    private func presentSettingsAlert() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = scene.windows.first?.rootViewController else {
            return
        }
        let alert = UIAlertController(
            title: "사진 접근 권한이 필요해요",
            message: "설정에서 사진 접근 권한을 허용해주세요.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })
        rootVC.present(alert, animated: true)
    }
}

#Preview {
    ContentView()
}
