

import SwiftUI

struct CarouselItemView: View {
    let order: OrderType
    
    var body: some View {
        Image(order.image).resizable().scaledToFit()
    }
}

struct CarouselItem_Preview: PreviewProvider{
    static var previews: some View{
        CarouselItemView(order: OrderType(id:1, name:"", image: "barbecue-banner")).previewLayout(.sizeThatFits).previewLayout(.sizeThatFits).padding()
    }
}
