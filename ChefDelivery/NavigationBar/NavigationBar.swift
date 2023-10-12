import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Spacer()
            Button("R. Vergueiro, 3185") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            Spacer()
            Button(action: {}){
                Image(systemName: "bell.badge")
                .font(.title3)
                .foregroundStyle(.red)
            }
                
            
            }
    }
}

struct NavigationBar_Preview: PreviewProvider{
    static var previews: some View{
        
        NavigationBar().previewLayout(.sizeThatFits).padding()
    }
}
