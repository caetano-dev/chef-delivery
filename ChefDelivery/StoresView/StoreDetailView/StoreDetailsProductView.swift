import SwiftUI

struct StoreDetailsProductView: View {
    
    let products: [ProductType]
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
            ForEach(products){ product in
                Button{
                    selectedProduct = product
                } label:{
                   StoreDetailProductItemView(product: product)
                }
                .sheet(item: $selectedProduct){
                    product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

#Preview {
    StoreDetailsProductView(products: storesMock[0].products)
}
