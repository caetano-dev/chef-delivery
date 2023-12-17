import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                NavigationBar().padding(.horizontal, 15)
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing:20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
        .onAppear{
            fetchData()
        }
    }
    
    func fetchData(){
        guard let url = URL(string: "https://private-36f463-pedrocaetano.apiary-mock.com/questions") else{
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as? [[String: Any]]
                    print(json)
                }
                catch{
                    print(error.localizedDescription)
                    
                }
            }
            
        }.resume()
    }
}

#Preview {
    ContentView().previewLayout(.sizeThatFits)
}
