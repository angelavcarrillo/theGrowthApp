import SwiftUI

// Model for one reflection topic
struct Reflection: Identifiable {
    let id = UUID()
    let category: String
    let question: String
    var answer: String
}

struct ReflectionView: View {
    @State private var reflections: [Reflection] = [
        Reflection(
            category: "Cooking",
            question: "Did anything help you stay calm during this experience?",
            answer: ""
        ),
        Reflection(
            category: "Travel",
            question: "Did you feel any excitement while planning?",
            answer: ""
        ),
        Reflection(
            category: "Film",
            question: "Do you believe you made room for inspiration and growth?",
            answer: ""
        )
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.customBeige)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 32) {
                        Text("Reflection")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, 24)
                        
                        ForEach($reflections) { $reflection in
                            ReflectionBlock(reflection: $reflection)
                        }
                        
                        Spacer(minLength: 24)
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
    }
}


struct ReflectionBlock: View {
    @Binding var reflection: Reflection
    @State private var isFlipped = false
    
    private var hasAnswer: Bool {
        !reflection.answer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        VStack(spacing: 12) {

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
            
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color.white)
                    .shadow(radius: 3)
                    .overlay(
                        VStack(spacing: 16) {
                            Text(reflection.question)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                            
                            Image(systemName: "arrow.left.arrow.right")
                                .font(.title2)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 24)
                    )
                    .opacity(isFlipped ? 0 : 1)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                
                
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color.white)
                    .shadow(radius: 3)
                    .overlay(
                        VStack(spacing: 16) {
                            Text(hasAnswer ? reflection.answer : "No answer saved yet.")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                            
                            Image(systemName: "arrow.left.arrow.right")
                                .font(.title2)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 24)
                    )
                    .opacity(isFlipped ? 1 : 0)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 0 : -180),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
            .frame(height: 200)
            .onTapGesture {
                if hasAnswer {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        isFlipped.toggle()
                    }
                }
            }
            
            
            NavigationLink {
                ReflectionDetailView(reflection: $reflection)
            } label: {
                Text(hasAnswer ? "Edit Answer" : "Answer Question")
                    .font(.subheadline)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.85))
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
        }
    }
}

#Preview {
    ReflectionView()
}
