import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.headline)
            
            VStack(alignment: .leading, spacing: 30){
                ForEach(storesMock) {
                    mock in StoreItemView(order: mock)
                }
                
            }
            
        }
        .padding(20)
        
    }
}

struct StoresContainer_Preview: PreviewProvider{
    static var previews: some View{
        StoresContainerView().previewLayout(.sizeThatFits)
    }
}