import SwiftUI

struct HomeView: View {
    @StateObject var studyTimer = StudyTimer.shared    // Shared study timer instance
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 1.0, green: 0.88, blue: 0.67) // Beige background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        StudyTreeButtonView()    // Study tree button

                        TimerView()              // Timer display
                        
                        QuickAccessSection()     // Quick access section
                        
                        TutoringSection()        // Tutoring section
                    }
                    .padding()
                }
            }
            .navigationTitle("Student Dashboard")   // Page title
        }
    }
}

// 🌳 Study Tree View as a clickable button
struct StudyTreeButtonView: View {
    var body: some View {
        NavigationLink(destination: TreeDetailView()) {
            VStack {
                Text("🌳 Your Study Tree")
                    .font(.title2)
                    .bold()
                Text("Tree grows as you study!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(red: 0.9, green: 0.8, blue: 0.6)) // Light brown background
            .cornerRadius(12)
        }
    }
}

// 🍃 Tree Detail View
struct TreeDetailView: View {
    @State private var leavesRemaining: Int = 10   // Starting number of leaves

    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.95, blue: 0.8) // Light background
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Image("tree_placeholder")          // Placeholder tree image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                Text("🍃 Leaves Remaining: \(leavesRemaining)")
                    .font(.title)
                    .bold()
                
                // Grow a leaf button
                Button(action: {
                    if leavesRemaining > 0 {
                        leavesRemaining -= 1
                    }
                }) {
                    Text("✨ Grow a Leaf")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Your Tree Progress")
    }
}

// 🕰️ Timer View
struct TimerView: View {
    @State private var timeElapsed: TimeInterval = 0    // Time spent on app
    @State private var timer: Timer?                    // Timer instance

    var body: some View {
        VStack {
            Text("⏳ Time on App")
                .font(.headline)
                .padding(.bottom, 5)

            Text(formattedTime())                      // Display formatted timer
                .font(.system(size: 24, weight: .bold, design: .monospaced))
                .padding(10)
                .background(Color(red: 0.95, green: 0.85, blue: 0.65))
                .cornerRadius(10)
        }
        .onAppear {
            startTimer()                               // Start counting when view appears
        }
        .onDisappear {
            timer?.invalidate()                        // Stop timer when view disappears
        }
    }

    // Start the timer
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timeElapsed += 1
        }
    }

    // Format elapsed time into HH:MM:SS
    func formattedTime() -> String {
        let hours = Int(timeElapsed) / 3600
        let minutes = (Int(timeElapsed) % 3600) / 60
        let seconds = Int(timeElapsed) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

// MARK: - QuickAccessSection and TutoringSection assumed to be implemented elsewhere

#Preview {
    StudentHomeView()    // Preview HomeView (fix: should be HomeView instead of StudentHomeView)
}
