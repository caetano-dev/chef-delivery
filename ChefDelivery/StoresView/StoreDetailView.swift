import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()
                HStack{
                    Text(store.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    
                    Image(store.logoImage)
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                
                HStack{
                    Text(store.location)
                    
                    ForEach(1...store.stars, id: \.self){ _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.yellow)
                            .font(.caption)
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
                
                ForEach(store.products){ product in
                    Button{
                        selectedProduct = product
                        
                    } label:{
                        HStack(spacing: 8){
                            VStack(alignment: .leading, spacing: 8){
                                Text(product.name)
                                    .bold()
                                Text(product.description)
                                    .foregroundStyle(Color.black.opacity(0.5))
                                    .multilineTextAlignment(.leading)
                                Text(product.formattedPrice)
                                
                            }
                            Spacer()
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(.buttonBorder)
                                .frame(width: 120, height: 120)
                                .shadow(color: .black.opacity(0.3), radius: 20, x:6, y:8)
                        }
                        .padding()
                        .foregroundStyle(Color.black)
                    }
                    .sheet(item: $selectedProduct){
                        product in
                        ProductDetailView(product: product)
                    }
                    
                }
            }
            .navigationTitle(store.name)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 4){
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                        .foregroundStyle(Color("ColorRed"))
                    }
                    
                }
            }
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
