import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var productQuantity: Int = 1
    
    var body: some View {
        VStack{
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: $productQuantity)
            Spacer()
            ProductDetailButtonView()
        }
    }
}


#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
