import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var productQuantity: Int = 1
    var service = HomeService()
    
    var body: some View {
        VStack{
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: $productQuantity)
            Spacer()
            ProductDetailButtonView{
                Task{
                    await confirmOrder()
                }
            }
        }
    }
    
    func confirmOrder() async {
        do{
            let result = try await service.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        catch{
            print(error.localizedDescription)
            
        }
    }
}


#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
