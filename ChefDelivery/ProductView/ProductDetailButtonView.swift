import SwiftUI

struct ProductDetailButtonView: View {
    var body: some View{
        
        Button{
            print("click")
            
        } label:{
            
            HStack{
                Image(systemName: "cart")
                Text("Adicionar ao carrinho")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundStyle(Color.white)
            .clipShape(.buttonBorder)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y:8)
        }
    }
}
