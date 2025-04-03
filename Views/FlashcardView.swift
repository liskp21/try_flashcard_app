import SwiftUI

struct FlashcardView: View {
    let flashcard: Flashcard
    @State private var flipped = false
    
    var body: some View {
        VStack {
            if flipped {
                Text(flashcard.answer)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.systemBackground).opacity(0.1))
                    .cornerRadius(10)
                    .rotation3DEffect(
                        .degrees(flipped ? 180 : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
            } else {
                Text(flashcard.question)
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.systemBackground).opacity(0.1))
                    .cornerRadius(10)
                    .rotation3DEffect(
                        .degrees(flipped ? 180 : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
            }
        }
        .rotation3DEffect(
            .degrees(flipped ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .animation(.easeInOut(duration: 0.3), value: flipped)
        .onTapGesture {
            flipped.toggle()
        }
    }
} 