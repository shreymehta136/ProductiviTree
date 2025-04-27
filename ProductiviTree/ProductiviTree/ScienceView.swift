import SwiftUI

// View for Science Learning Module content
struct ScienceView: View {
    var body: some View {
        ZStack {
            // Background gradient (lime tones for freshness and concentration)
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.75, green: 1.0, blue: 0.6), // Soft lime at top
                    Color(red: 0.5, green: 0.9, blue: 0.4)   // Richer lime at bottom
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea() // Fill the entire screen background

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Title
                    Text("🔬 Science Learning Module")
                        .font(.largeTitle)
                        .bold()
                    
                    // Recommended Study Techniques Section
                    Group {
                        Text("Recommended Study Techniques:")
                            .font(.headline)
                            .padding(.top)

                        Text("""
                        • Hands-on experiments
                        • Diagrams and flowcharts for concepts
                        • Group discussions for complex topics
                        • Active recall quizzes and flashcards
                        • Visual aids (models, simulations)
                        • Spaced repetition for memorization
                        """)
                            .padding()
                    }
                    
                    // Music and Color Recommendations
                    Group {
                        Text("🎵 Best Music for Science Studies:")
                            .font(.headline)
                        Text("Nature sounds or deep focus beats to maintain concentration.")
                        
                        Text("🎨 Best Study Color:")
                            .font(.headline)
                        Text("Light green for focus and concentration.")
                    }
                    
                    Divider()
                    
                    // Major Science Study Topics Section
                    Group {
                        Text("🧠 Major Science Study Topics:")
                            .font(.headline)
                        Text("""
                        • Physics (forces, energy, motion)
                        • Chemistry (atoms, reactions, the periodic table)
                        • Biology (cells, genetics, evolution)
                        • Earth Science (geology, climate, ecosystems)
                        • Environmental Science (sustainability, pollution)
                        • Astronomy (solar system, galaxies, space exploration)
                        • Human Anatomy and Physiology
                        • Marine Biology
                        • Scientific Method and Experimentation
                        """)
                    }
                    
                    // Sample Quick Quiz Section
                    Group {
                        Text("📝 Sample Quick Quiz:")
                            .font(.headline)
                        Text("""
                        1. What is Newton's Second Law of Motion?
                        2. What is the chemical formula for water?
                        3. Describe the structure of a plant cell.
                        4. What causes seasons on Earth?
                        5. Explain the process of photosynthesis.
                        """)
                            .padding(.bottom)
                    }
                    
                    Divider()
                    
                    // Best Websites for Science Learning Section
                    Group {
                        Text("🌐 Best Websites for Science Learning:")
                            .font(.headline)
                        Text("""
                        • Khan Academy - www.khanacademy.org (wide range of science topics)
                        • Coursera - www.coursera.org (online courses in various sciences)
                        • NASA - www.nasa.gov (space exploration and astronomy)
                        • Science Daily - www.sciencedaily.com (latest science news)
                        • National Geographic - www.nationalgeographic.com (environmental science)
                        • HHMI Biointeractive - www.biointeractive.org (biology resources)
                        """)
                    }
                    
                    // Free Worksheet Sources Section
                    Group {
                        Text("📚 Free Worksheet Sources:")
                            .font(.headline)
                        Text("""
                        • K12 Reader - www.k12reader.com
                        • Education.com - www.education.com
                        • Teachers Pay Teachers - www.teacherspayteachers.com
                        • Science Worksheets - www.scienceworksheets.com
                        """)
                    }
                    
                    Divider()
                    
                    // Recommended Online Science Tutors Section
                    Group {
                        Text("👩‍🏫 Recommended Online Science Tutors:")
                            .font(.headline)
                        Text("""
                        • Wyzant (private tutors) - www.wyzant.com
                        • Preply (affordable tutors) - www.preply.com
                        • Varsity Tutors - www.varsitytutors.com
                        • Chegg Tutors - www.chegg.com/tutors
                        """)
                    }
                    
                    Divider()
                    
                    // Great YouTube Channels for Science Learning Section
                    Group {
                        Text("🎥 Great YouTube Channels for Science Learning:")
                            .font(.headline)
                        Text("""
                        • CrashCourse - Science series (Biology, Chemistry, Physics)
                        • Veritasium - Educational science videos
                        • SmarterEveryday - Engineering and physics exploration
                        • SciShow - Fun science explanations and concepts
                        • National Geographic - Science documentaries and short videos
                        """)
                    }
                }
                .padding()
            }
            .navigationTitle("Science") // Navigation bar title
        }
    }
}

// SwiftUI Preview Provider
#Preview {
    ScienceView()
}
