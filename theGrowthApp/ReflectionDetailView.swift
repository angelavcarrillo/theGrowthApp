import SwiftUI

struct ReflectionDetailView: View {
    @Binding var reflection: Reflection
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(.customBeige)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Reflection")
                        .font(.title2)
                        .bold()
                    
                    // Category pill 
                    Text(reflection.category)
                        .font(.headline)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 6)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.35), lineWidth: 1)
                        )
                        .shadow(radius: 1)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    // Question box
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color.white)
                        .shadow(radius: 3)
                        .overlay(
                            VStack(spacing: 16) {
                                Text(reflection.question)
                                    .font(.title3)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 24)
                                
                                Image(systemName: "arrow.down")
                                    .font(.title2)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 24)
                        )
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                    
                    Text("Type or edit your reflection:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    TextEditor(text: $reflection.answer)
                        .frame(height: 180)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                    
                    Button("Save") {
                        
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customGreen)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    Spacer(minLength: 20)
                }
                .padding(24)
            }
        }
        .navigationTitle("Reflection")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ReflectionDetailView_Previews: PreviewProvider {
    struct Wrapper: View {
        @State private var sample = Reflection(
            category: "Cooking",
            question: "Did anything help you stay calm during this experience?",
            answer: "I stayed calm by taking my time and breathing."
        )
        
        var body: some View {
            NavigationStack {
                ReflectionDetailView(reflection: $sample)
            }
        }
    }
    
    static var previews: some View {
        Wrapper()
    }
}
