import SwiftUI
struct Reflection: Identifiable {
    let id = UUID()
    let category: String
    let question: String
    var answer: String
}

struct ReflectionView: View {
    @State private var reflections: [Reflection] = [
        Reflection(category: "Cooking", question: "What is a cooking technique you want to learn more about and how will you accomplish that?", answer: ""),
        Reflection(category: "Travel", question: "What kind of emotions were sparked while planning for a dream trip?", answer: ""),
        Reflection(category: "TV/Film", question: "Do you believe you made room for inspiration and growth? Why and what did you explore?", answer: "")
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.customBeige).ignoresSafeArea()

                VStack(spacing: 24) {
                    Text("Reflection")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 20)

                    Text("Choose a topic to answer the question.")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.8))

                    ScrollView {
                        VStack(spacing: 36) {

ForEach($reflections) { $reflection in
ReflectionBlock(reflection: $reflection)
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                    }
    }
    }
        }
    }
}

//KEEP STRUCTS SEPARET ABD APARTT
struct ReflectionBlock: View {
    @Binding var reflection: Reflection
    @State private var isFlipped = false

    private var hasAnswer: Bool {
        !reflection.answer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        VStack(spacing: 16) {
            Text(reflection.category)
                .font(.headline)
                .padding(.horizontal, 40)
                .padding(.vertical, 6)
                .background(Capsule()
                    .fill(Color.white) )
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.35), lineWidth: 1)
        )
   
                .shadow(radius: 1)

            //here is the card!!
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
                    .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (0,1,0))

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
                    .rotation3DEffect(.degrees(isFlipped ? 0 : -180), axis: (0,1,0))
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
                ReflectionDetailView(reflection: $reflection, onComplete: {})
            } label: {
                Text(hasAnswer ? "Edit Answer" : "Answer Question")
                    .font(.subheadline)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.customGreen)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    
            }
           

        }
        .padding()
    }
}

#Preview {
    ReflectionView()
}

#Preview("Reflection Block") {
    @Previewable @State var reflection = Reflection(category: "Travel", question: "Where did you travel that inspired you?", answer: "New York")
    ReflectionBlock(reflection: $reflection)
}
