import SwiftUI

struct CharacterView: View {
    let character: Char
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Image(show.lowercased()
                    .replacingOccurrences(of: " ", with: ""))
                .resizable()
                .scaledToFit()
                
                ScrollView() {
                    AsyncImage(url: character.images[0]) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
                    .clipShape(.rect(cornerRadius: 25))
                    .padding(.top, 60)
                    
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.largeTitle)
                        
                        Text("Portrayed By: \(character.portrayedBy)")
                            .font(.subheadline)
                        
                        Divider()
                        
                        Text("인물정보")
                            .font(.title2)
                        
                        Text("출생 : \(character.birthday)")
                        Divider()
                        
                        Text("활동 이력")
                        ForEach(character.occupations, id: \.self){
                            occupation in Text("-\(occupation)")
                                .font(.subheadline)
                        }
                        Divider()
                        
                        Text("별명:")
                        
                        if character.aliases.count > 0 {
                            ForEach(character.aliases, id: \.self){
                                Text("-\($0)")
                                    .font(.subheadline)
                            }
                        } else {
                            Text("None")
                                .font(.subheadline)
                        }
                        Divider()
                        
                        DisclosureGroup("상태(스포일러 주의!)") {
                            VStack(alignment: .leading){
                                Text(character.status)
                                    .font(.title2)
                                
                                if let death = character.death {
                                    AsyncImage(url: death.image) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(.rect(cornerRadius: 15))
                                    } placeholder: {
                                        ProgressView()
                                        
                                    }
                                    Text("사망사유: \(death.details)")
                                        .padding(.bottom, 7)
                                    
                                    Text("마지막 말: \"\(death.lastWords)\"")
                                    
                                }
                                
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                        }
                        .tint(.primary)
                        
                        
                    }
                    .frame(width: geo.size.width/1.25,alignment:.leading)
                }
                .scrollIndicators(.hidden)
                
                
                
            }
            
        }
        .ignoresSafeArea()
    }
}
#Preview {
    CharacterView(character: ViewModel().charcter, show: "Breaking Bad")
}

