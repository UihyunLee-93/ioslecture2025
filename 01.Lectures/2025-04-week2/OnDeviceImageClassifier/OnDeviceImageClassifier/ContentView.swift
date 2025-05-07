import SwiftUI

struct ContentView: View {
    @State private var isPickerPresented = false
    @State private var selectedImage: UIImage?
    @ObservedObject private var viewModel = ImageClassifierViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 300)
                    .overlay(Text("이미지를 선택하세요"))
            }

            Text(viewModel.resultText)
                .font(.headline)
                .padding()

            Button("사진 선택") {
                isPickerPresented = true
            }
        }
        .padding()
        .sheet(isPresented: $isPickerPresented) {
            ImagePicker(image: $selectedImage)
        }
        .onChange(of: selectedImage) {
            if let image = selectedImage {
                viewModel.classify(image: image)
            }
        }
    }
}

#Preview {
    ContentView()
}
