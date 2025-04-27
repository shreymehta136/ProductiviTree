import SwiftUI

// Main view for the student dashboard
struct StudentHomeView: View {
    @StateObject var studyTimer = StudyTimer.shared // Shared study timer instance

    var body: some View {
        NavigationView {
            ZStack {
                // Background color (light beige/orange tone)
                Color(red: 1.0, green: 0.88, blue: 0.67)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        StudyTreeView()        // Displays study progress tree
                        QuickAccessSection()   // Quick navigation links
                        TutoringSection()      // Tutoring section
                    }
                    .padding()
                }
            }
            .navigationTitle("Student Dashboard") // Navigation title
        }
    }
}

// Section with quick access buttons
struct QuickAccessSection: View {
    var body: some View {
        VStack(spacing: 15) {
            NavigationLink(destination: MusicLibraryView()) {
                Text("🎵 Music Library")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.96, green: 0.76, blue: 0.5))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

            NavigationLink(destination: MentalHealthView()) {
                Text("🧠 Mental Health & Stress")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.92, green: 0.6, blue: 0.36))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

            NavigationLink(destination: CalendarView()) {
                Text("📅 Calendar & Planner")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.82, green: 0.54, blue: 0.29))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

            NavigationLink(destination: LearnSubjectsView()) {
                Text("📖 Learn Subjects")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.85, green: 0.65, blue: 0.4))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }

            NavigationLink(destination: MissionView()) {
                Text("🌍 Our Mission")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.75, green: 0.5, blue: 0.25))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
}

// View for learning subjects selection
struct LearnSubjectsView: View {
    var body: some View {
        ZStack {
            // Background gradient (warm tones)
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.98, green: 0.9, blue: 0.65),
                    Color(red: 0.96, green: 0.87, blue: 0.58)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    // Page title
                    Text("📖 Select a Subject to Learn")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    // Navigation links to different subject views
                    NavigationLink(destination: MathView()) {
                        Text("📐 Math")
                            .padding()
                            .background(Color.blue.opacity(0.7))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: EnglishView()) {
                        Text("📚 English")
                            .padding()
                            .background(Color.green.opacity(0.7))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: HistoryView()) {
                        Text("🏺 History")
                            .padding()
                            .background(Color.orange.opacity(0.7))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: ScienceView()) {
                        Text("🔬 Science")
                            .padding()
                            .background(Color.yellow.opacity(0.7))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }

                    NavigationLink(destination: MentalHealthView()) {
                        Text("🧠 Mental Health")
                            .padding()
                            .background(Color.pink.opacity(0.7))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
        }
    }
}

// View for explaining ProductiviTree's mission
struct MissionView: View {
    var body: some View {
        ZStack {
            // Background color
            Color(red: 1.0, green: 0.88, blue: 0.67)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Mission statement title
                    Text("'Rooted in Knowledge, Growing Your Future'")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 10)

                    // Full mission description
                    Text("""
At ProductiviTree, our mission is to directly address United Nations Sustainable Development Goal 4: "Ensure inclusive and equitable quality education and promote lifelong learning opportunities for all." Around 258 million children and youth worldwide are still out of school (UNESCO, 2023), and many more face unequal access to quality education. We built ProductiviTree to help solve this global challenge by making education more accessible, supportive, and equitable for everyone — especially those historically left behind.

ProductiviTree empowers students by providing access to high-quality tutors, flexible scheduling, and personalized academic support — no matter their background or location. At the same time, educators gain new opportunities to share their knowledge and make a global impact. Every connection through ProductiviTree is a step toward building a more educated, equitable world — a true win-win for both students and tutors.

We go beyond academics. Recognizing that mental health is key to educational success, ProductiviTree offers built-in tools for mindfulness, stress management, and emotional resilience. We believe that supporting a student's well-being is just as important as supporting their learning.

By using ProductiviTree, you're not just finding a tutor — you're joining a movement committed to educational equity and empowerment. Together, we can help every learner grow strong roots of knowledge and branch into a brighter, more promising future.

ProductiviTree: Where education grows, and futures flourish.
""")
                        .font(.body)
                        .foregroundColor(.black)
                }
                .padding()
            }
        }
        .navigationTitle("🌍 Our Mission")
    }
}

// Small reusable button style (not used yet, but ready)
struct SubjectButton: View {
    var label: String

    var body: some View {
        Text(label)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.9, green: 0.7, blue: 0.5))
            .cornerRadius(10)
            .foregroundColor(.black)
    }
}

// Section to help students find tutors
struct TutoringSection: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("🧑‍🏫 Find a Tutor")
                .font(.headline)

            NavigationLink(destination: DiscoverTutorView()) {
                Text("🔎 Discover Tutors")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.8, green: 0.5, blue: 0.3))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
}

// Simple display for study tree progress (placeholder for actual tree growing logic)
struct StudyTreeView: View {
    var body: some View {
        VStack {
            Text("🌳 Your Study Tree")
                .font(.title2)
                .bold()
            Text("Tree grows as you study!")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(red: 0.9, green: 0.8, blue: 0.6))
        .cornerRadius(12)
    }
}

// SwiftUI Preview Provider
#Preview {
    StudentHomeView()
}
