import SwiftUI

struct GeometryReaderBasicsView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 30) {

                // MARK: - Width & Height Info

                Text("Width: \(Int(geo.size.width))")
                    .font(.title2)

                Text("Height: \(Int(geo.size.height))")
                    .font(.title2)

                // MARK: - Responsive Rectangle

                Rectangle()
                    .fill(Color.blue)
                    .frame(
                        width: geo.size.width * 0.7,
                        height: 80
                    )
                    .overlay(
                        Text("70% Width")
                            .foregroundColor(.white)
                            .bold()
                    )

                // MARK: - Centered Circle

                ZStack {
                    Color.gray.opacity(0.15)

                    Circle()
                        .fill(Color.red)
                        .frame(width: 80, height: 80)
                        .position(
                            x: geo.size.width / 2,
                            y: 100
                        )
                }
                .frame(height: 200)
                .cornerRadius(12)

                Spacer()
                
                Text("SwiftUI")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                
//              Circle()
//                    .frame(width: 50)
//                    .foregroundStyle(Color.gray)
//                    .overlay(alignment: .center){
//                        Text("hello")
//                    }
                
//                Circle()
//                    .stroke(Color.blue, lineWidth: 5)
//                    .frame(width: 100, height: 100)
                
            }
            .padding()
        }
        .background(Color.white)
    }
}

struct ContentView3: View {
    var body: some View {
//        GeometryReaderBasicsView()
        
       Triangle()
//            .fill(Color.red)
            .stroke(Color.red , lineWidth : 3)
            .frame(width: 100 , height: 100)
            
        
    }
}

//struct LineShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: 0, y: 0))
//
//        path.addLine(to: CGPoint(x: 200, y: 200))
//
//        return path
//    }
//}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {

        var path = Path()

        // Top center
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))

        // Bottom right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        // Bottom left
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        // Close back to start
        path.closeSubpath()

        return path
    }
}

#Preview {
    ContentView3()
}

