import SwiftUI

struct ContentView: View {
    @State private var colorSequence: [Color] = []
    @State private var playerSequence: [Color] = []
    @State private var isGameActive = false
    @State private var showColorSelection = false
    @State private var correctCount = 0

    let fixedColors: [Color] = [.red, .blue, .green, .yellow]

    var body: some View {
        NavigationView {
            VStack {
                Text("Memory Game")
                    .font(.largeTitle)
                    .padding()

                if isGameActive {
                    ColorSequenceView(colors: colorSequence)
                        .padding()

                    NavigationLink(destination: ColorSelectionView(colors: fixedColors, didSelectColor: didSelectColor, submitAction: {
                        submitColors()
                        showColorSelection = false // Dismiss the ColorSelectionView
                    }), isActive: $showColorSelection) {
                        EmptyView()
                    }
                    .hidden()

                    Button("Select Colors") {
                        showColorSelection = true // Show the ColorSelectionView
                    }
                    .padding()
                
                } else {
                    Button("Start Game") {
                        startGame()
                    }
                    .padding()
                }
            }
            .navigationTitle("Memory Game")
        }
        .alert(isPresented: .constant(correctCount == 3)) {
            Alert(title: Text("Congratulations!"), message: Text("You completed the task 3 times. Let's continue!"), dismissButton: .default(Text("Continue")) {
                startGame()
            })
        }
    }

    func startGame() {
        colorSequence = generateRandomColorSequence()
        playerSequence = []
        isGameActive = true
        correctCount = 0
    }

    func generateRandomColorSequence() -> [Color] {
        return (0..<5).map { _ in fixedColors.randomElement()! }
    }

    func didSelectColor(_ selectedColor: Color) {
        playerSequence.append(selectedColor)

        // Limit the number of displayed colors to 5
        if playerSequence.count > 5 {
            playerSequence.removeFirst()
        }
    }

    func submitColors() {
        if colorSequence == playerSequence {
            correctCount += 1
            print("Correct sequence!")
        } else {
            print("Wrong sequence. Game over!")
        }

        if correctCount == 3 {
            isGameActive = false
        }
        colorSequence = generateRandomColorSequence()
    }
}

struct ColorSelectionView: View {
    let colors: [Color]
    let didSelectColor: (Color) -> Void
    let submitAction: () -> Void

    var body: some View {
        VStack {
            Text("Select Colors")
                .font(.largeTitle)
                .padding()

            ColorSelectionRow(colors: colors, didSelectColor: didSelectColor)
                .padding()

            Button("Submit") {
                submitAction()
            }
            .padding()
        }
        .navigationTitle("Memory Game")
    }
}

struct ColorSelectionRow: View {
    let colors: [Color]
    let didSelectColor: (Color) -> Void

    var body: some View {
        HStack(spacing: 16) {
            ForEach(colors, id: \.self) { color in
                Button(action: {
                    didSelectColor(color)
                }) {
                    Circle()
                        .fill(color)
                        .frame(width: 50, height: 50)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                }
            }
        }
        .padding()
    }
}

struct ColorSequenceView: View {
    let colors: [Color]

    var body: some View {
        HStack(spacing: 16) {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .fill(color)
                    .frame(width: 50, height: 50)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
            }
        }
        .padding()
    }
}
