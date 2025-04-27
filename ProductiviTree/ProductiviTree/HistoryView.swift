import SwiftUI

// View for History Learning Module content
struct HistoryView: View {
    var body: some View {
        ZStack {
            // Background gradient: gives an old parchment-like feel
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.82, blue: 0.62), // Light parchment beige
                    Color(red: 0.8, green: 0.45, blue: 0.2)    // Faded burnt orange
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea() // Makes sure gradient covers the whole screen, including safe areas

            // Main content in a scrollable vertical layout
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Main title for the History module
                    Text("🏺 History Learning Module")
                        .font(.largeTitle)
                        .bold()

                    // --- Recommended Study Techniques Section ---
                    Group {
                        Text("Recommended Study Techniques:")
                            .font(.headline)
                            .padding(.top) // Extra padding above the section title

                        // List of recommended history study methods
                        Text("""
                        • Timelines of events
                        • Mind maps for historical connections
                        • Flashcards for important dates and figures
                        • Compare and contrast historical periods
                        • Active recall quizzes
                        • Annotating historical texts
                        • Group study discussions for historical events
                        """)
                        .padding() // Padding inside the text box
                    }

                    // --- Music and Color Suggestions Section ---
                    Group {
                        Text("🎵 Best Music for History Studies:")
                            .font(.headline)

                        // Short note on type of music that helps history studying
                        Text("Classical music for focus and cognitive function.")

                        Text("🎨 Best Study Color:")
                            .font(.headline)

                        // Ideal study color based on psychological effects
                        Text("Beige for memory recall and creating a calm study atmosphere.")
                    }

                    Divider() // Visual separator line

                    // --- Major History Topics Section ---
                    Group {
                        Text("🧠 Major History Study Topics:")
                            .font(.headline)

                        // A categorized list of important eras/events students should focus on
                        Text("""
                        • Ancient Civilizations (Mesopotamia, Egypt, Greece, Rome)
                        • Medieval History (Feudalism, the Crusades, the Black Death)
                        • The Renaissance and Reformation
                        • The Age of Exploration
                        • The American Revolution
                        • World War I & II
                        • Cold War History
                        • The Civil Rights Movement
                        • Modern History (Post-WWII to Present)
                        """)
                    }

                    // --- Sample Quiz Section ---
                    Group {
                        Text("📝 Sample Quick Quiz:")
                            .font(.headline)

                        // Quick self-test questions to reinforce learning
                        Text("""
                        1. Who was the first Emperor of Rome?
                        2. What year did the American Revolution start?
                        3. Which battle is considered the turning point in the American Civil War?
                        4. What was the significance of the Berlin Wall during the Cold War?
                        5. Identify one major invention during the Industrial Revolution.
                        """)
                        .padding(.bottom) // Adds extra space before the next section
                    }

                    Divider()

                    // --- Helpful Websites Section ---
                    Group {
                        Text("🌐 Best Websites for History Learning:")
                            .font(.headline)

                        // Curated list of educational websites for deepening history knowledge
                        Text("""
                        • History.com - www.history.com (general history topics)
                        • Khan Academy - www.khanacademy.org (free courses)
                        • BBC History - www.bbc.co.uk/history
                        • World History Project - www.worldhistoryproject.org
                        • Smithsonian History - www.si.edu/history
                        • The History Channel - www.historychannel.com
                        """)
                    }

                    // --- Free Worksheet Sources Section ---
                    Group {
                        Text("📚 Free Worksheet Sources:")
                            .font(.headline)

                        // Resources for printable worksheets
                        Text("""
                        • K12 Reader - www.k12reader.com
                        • Education.com - www.education.com
                        • Teachers Pay Teachers - www.teacherspayteachers.com
                        • CommonCoreSheets - www.commoncoresheets.com
                        """)
                    }

                    Divider()

                    // --- Recommended Online Tutors Section ---
                    Group {
                        Text("👩‍🏫 Recommended Online History Tutors:")
                            .font(.headline)

                        // Options for getting 1-on-1 help with history
                        Text("""
                        • Wyzant (private tutors) - www.wyzant.com
                        • Varsity Tutors - www.varsitytutors.com
                        • Preply (affordable tutors) - www.preply.com
                        • Chegg Tutors - www.chegg.com/tutors
                        """)
                    }

                    Divider()

                    // --- YouTube Channels Section ---
                    Group {
                        Text("🎥 Great YouTube Channels for History Learning:")
                            .font(.headline)

                        // Suggested video resources for visual/auditory learners
                        Text("""
                        • CrashCourse - World History series
                        • History Channel - Documentaries and educational videos
                        • The Great War - In-depth series on World War I
                        • OverSimplified - Simplified history lessons
                        • Extra Credits - Educational history videos with an engaging style
                        """)
                    }
                }
                .padding() // Adds padding inside the main VStack
            }
            .navigationTitle("History") // Sets navigation bar title if inside NavigationView
        }
    }
}

// SwiftUI Preview provider for canvas rendering in Xcode
#Preview {
    HistoryView()
}
