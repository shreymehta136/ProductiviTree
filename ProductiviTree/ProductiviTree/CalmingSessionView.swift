import SwiftUI

// Main view for the Calming Session timer
struct CalmingSessionView: View {
    // State variables to manage timer state
    @State private var timeRemaining = 300  // Initial time: 5 minutes
    @State private var timerRunning = false // Flag to track if timer is running
    @State private var timer: Timer?        // Optional Timer object

    var body: some View {
        VStack(spacing: 30) {
            // Title of the screen
            Text("🌸 Calming Session")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Display the formatted time remaining
            Text(timeString())
                .font(.system(size: 60))
                .fontWeight(.semibold)

            // Start or Pause button depending on timer state
            if timerRunning {
                Button("Pause") {
                    pauseTimer()
                }
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
                .foregroundColor(.white)
            } else {
                Button("Start") {
                    startTimer()
                }
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .foregroundColor(.white)
            }
        }
        .padding() // Add padding around the VStack
    }

    // Function to start the timer
    func startTimer() {
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1 // Decrease time remaining every second
            } else {
                timer?.invalidate() // Stop timer when time runs out
                timerRunning = false
            }
        }
    }

    // Function to pause (invalidate) the timer
    func pauseTimer() {
        timer?.invalidate()
        timerRunning = false
    }

    // Helper function to format timeRemaining as MM:SS string
    func timeString() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

// Preview provider for SwiftUI Canvas
#Preview {
    CalmingSessionView()
}
