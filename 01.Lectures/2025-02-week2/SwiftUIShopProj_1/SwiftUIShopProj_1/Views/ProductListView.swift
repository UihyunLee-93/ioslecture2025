import SwiftUI

struct ProductListView: View {
    let products = [
        Product(name: "신선한 사과", price: 1000, imageName: "apple"),
        Product(name: "달콤한 바나나", price: 1500, imageName: "banana"),
        Product(name: "상큼한 오렌지", price: 2000, imageName: "orange")
    ]

    var body: some View {
        List(products) { product in
            ProductRow(product: product)
        }
        .navigationTitle("상품 목록")
    }
}