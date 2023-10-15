import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                StoreDetailHeaderView(store: store)
                StoreDetailsProductView(products: store.products)
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

#Preview {
    StoreDetailView(store: storesMock[0])
}
