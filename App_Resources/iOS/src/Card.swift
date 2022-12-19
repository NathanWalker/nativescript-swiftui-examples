import SwiftUI

class Data: ObservableObject {
    @Published var props: NSMutableDictionary = [:]
    var toggle: ((_ showing: Bool) -> Void)?
}

struct Card : View {
    @State var show = false
    @ObservedObject var data = Data()
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.show.toggle()
                data.toggle!(self.show)
            }
        }) {
            let cardBackgroundColor = data.props.value(forKey: "cardBackgroundColor") as? UIColor
            
            VStack() {
                let titleColor = data.props.value(forKey: "titleColor") as? UIColor
                Text(data.props.value(forKey: "title") as? String ?? "Learn SwiftUI")
                    .foregroundColor((titleColor != nil) ? Color(titleColor!) : .white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.top, show ? 100 : 20)
                
                let descColor = data.props.value(forKey: "descColor") as? UIColor
                Text(data.props.value(forKey: "desc") as? String ?? "with NativeScript")
                    .foregroundColor((descColor != nil) ? Color(descColor!) : Color(hue: 0.567, saturation: 0.158, brightness: 0.943))
                    .lineLimit(-1)
                
                AsyncImage(url: URL(string: "https://electreefrying.gallerycdn.vsassets.io/extensions/electreefrying/nativescript-angular-html-snippets/0.1.4/1595675332745/Microsoft.VisualStudio.Services.Icons.Default")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                        } placeholder: {
                            Color.gray.opacity(0.1)
                        }
                
                Spacer()
                
                let subTitleColor = data.props.value(forKey: "subTitleColor") as? UIColor
                Text(data.props.value(forKey: "subTitle") as? String ?? "Give me a gentle touch")
                    .foregroundColor((subTitleColor != nil) ? Color(subTitleColor!) : Color(hue: 0.498, saturation: 0.609, brightness: 1.0))
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.bottom, show ? 100 : 20)
                }
                .padding()
                .frame(width: show ? 414 : 300, height: show ? 950 : 300)
                .background((cardBackgroundColor != nil) ? Color(cardBackgroundColor!) : .blue)
            }
            .cornerRadius(30)
            .animation(.spring())
            .shadow(radius: 30)
    }
}
