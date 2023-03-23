import SwiftUI

struct NameGeneratorView: View {
    
    @State private var adjectives = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink"]
    @State private var nouns = ["Car", "Apple", "Book", "Tree", "Dog", "Cat", "House"]
    
    @State private var generatedName = ""
    
    @State private var newAdjective = ""
    @State private var newNoun = ""
    
    var body: some View {
        VStack {
            Text(generatedName)
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
            
            HStack {
                VStack {
                    Text("Adjectives")
                        .font(.headline)
                        .padding()
                    
                    List {
                        ForEach(adjectives, id: \.self) { adjective in
                            Text(adjective)
                        }
                        .onDelete(perform: deleteAdjective)
                    }
                    
                    HStack {
                        TextField("New Adjective", text: $newAdjective)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            addAdjective()
                        }) {
                            Text("Add")
                        }
                    }
                    .padding()
                }
                
                VStack {
                    Text("Nouns")
                        .font(.headline)
                        .padding()
                    
                    List {
                        ForEach(nouns, id: \.self) { noun in
                            Text(noun)
                        }
                        .onDelete(perform: deleteNoun)
                    }
                    
                    HStack {
                        TextField("New Noun", text: $newNoun)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            addNoun()
                        }) {
                            Text("Add")
                        }
                    }
                    .padding()
                }
            }
            
            Button(action: {
                // Generate a random name
                let randomAdjective = adjectives.randomElement() ?? ""
                let randomNoun = nouns.randomElement() ?? ""
                generatedName = "\(randomAdjective) \(randomNoun)"
            }) {
                Text("Generate Name")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func deleteAdjective(at offsets: IndexSet) {
        adjectives.remove(atOffsets: offsets)
    }
    
    func addAdjective() {
        adjectives.append(newAdjective)
        newAdjective = ""
    }
    
    func deleteNoun(at offsets: IndexSet) {
        nouns.remove(atOffsets: offsets)
    }
    
    func addNoun() {
        nouns.append(newNoun)
        newNoun = ""
    }
}

struct NameGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        NameGeneratorView()
    }
}

