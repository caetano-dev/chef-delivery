import SwiftUI

struct ContentView: View {
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                if isLoading{
                    ProgressView()
                }
                else{
                    NavigationBar().padding(.horizontal, 15)
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing:20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
        }
        .onAppear{
            Task{
                await getStores()
            }
            getStoresWithAlamofire()
        }
    }
    
    func getStores() async {
        do{
            let result = try await service.fetchData()
            switch result{
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        } catch{
            print(error.localizedDescription)
            self.isLoading = false
            
        }
        
    }
    
    func getStoresWithAlamofire(){
        service.fetchDataWithAlamofile{ stores, error in
            print(stores)
            
        }
    }
    
}

#Preview {
    ContentView().previewLayout(.sizeThatFits)
}
