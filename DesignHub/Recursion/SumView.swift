import SwiftUI

struct starView : View {
    
   @State  var emojiArr = ["😛" , "👄" , "🩸" , "🌸"  , "🪷" , "❤️" ]
    @State var cb : String = ""
    
    @State var b = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                
                    List(emojiArr , id : \.self ){ ch in
                         Text(ch)
                            .onTapGesture {
                                cb = ch
                                b.toggle()
                            }
                    }
                
                if b {
                    Text(cb)
                }
                
                
            }
            .navigationTitle("shape creator")
        }
    }
}

#Preview {
    starView()
}
