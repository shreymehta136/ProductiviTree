import SwiftUI

// View for Math Learning Module content
struct MathView: View {
    var body: some View {
        ZStack {
            // Background gradient: warm flaxen tones to energize focus without overwhelming
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.98, green: 0.9, blue: 0.65), // Light flaxen
                    Color(red: 0.96, green: 0.87, blue: 0.58) // Deeper flaxen
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea() // Extend gradient to fill the full screen area, including safe areas

            // Main scrollable vertical container
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Module Title
                    Text("📐 Math Learning Module")
                        .font(.largeTitle)
                        .bold()

                    // --- Recommended Study Techniques Section ---
                    Group {
                        Text("Recommended Study Techniques:")
                            .font(.headline)
                            .padding(.top) // Extra space above this section title

                        // Suggested methods to effectively study mathematics
                        Text("""
                        • Feynman Technique
                        • Practice problem solving
                        • Flashcards for formulas
                        • Active recall quizzes
                        • Teach a concept to someone else
                        • Spaced repetition for memorization
                        • Solve real-world application problems
                        """)
                        .padding() // Padding inside text for cleaner look
                    }

                    // --- Music and Color Recommendations Section ---
                    Group {
                        Text("🎵 Best Music for Math:")
                            .font(.headline)

                        // Audio suggestions: low-frequency sounds help sustained concentration
                        Text("Focus-enhancing frequencies (around 40 Hz) and low-fi study beats.")

                        Text("🎨 Best Study Color:")
                            .font(.headline)

                        // Psychological benefit: yellow boosts mental energy and alertness
                        Text("Light yellow to stimulate focus and mental alertness.")
                    }

                    Divider() // Horizontal line to separate sections visually

                    // --- Major Math Study Topics Section ---
                    Group {
                        Text("🧠 Major Math Study Topics:")
                            .font(.headline)

                        // Core areas of mathematics to master
                        Text("""
                        • Algebra (equations, inequalities, functions)
                        • Geometry (shapes, theorems, proofs)
                        • Trigonometry (sine, cosine, angles)
                        • Calculus (limits, derivatives, integrals)
                        • Statistics (probability, data analysis)
                        • Linear Algebra (vectors, matrices)
                        • Number Theory
                        • Discrete Math
                        • Mathematical Reasoning
                        """)
                    }

                    // --- Sample Quick Quiz Section ---
                    Group {
                        Text("📝 Sample Quick Quiz:")
                            .font(.headline)

                        // Short math quiz to check understanding or for practice
                        Text("""
                        1. Solve: 2x + 5 = 15
                        2. Find the area of a triangle with base 6 and height 4.
                        3. What is sin(30°)?
                        4. Derive f(x) = x².
                        5. What is the probability of rolling a 3 on a standard die?
                        """)
                        .padding(.bottom) // Add extra space at the bottom
                    }

                    Divider()

                    // --- Best Websites for Math Practice Section ---
                    Group {
                        Text("🌐 Best Websites for Math Practice:")
                            .font(.headline)

                        // External resources for free tutorials, courses, and problem solving
                        Text("""
                        • Khan Academy - www.khanacademy.org
                        • Brilliant - www.brilliant.org
                        • PurpleMath - www.purplemath.com
                        • Paul's Online Math Notes - tutorial.math.lamar.edu
                        • Mathway - www.mathway.com (problem solver)
                        • Wolfram Alpha - www.wolframalpha.com
                        • Art of Problem Solving - www.artofproblemsolving.com
                        """)
                    }

                    // --- Free Worksheet Sources Section ---
                    Group {
                        Text("📚 Free Worksheet Sources:")
                            .font(.headline)

                        // Websites to print extra practice problems
                        Text("""
                        • Kuta Software - www.kutasoftware.com
                        • Math-Aids - www.math-aids.com
                        • EdHelper Math Worksheets - www.edhelper.com
                        • CommonCoreSheets - www.commoncoresheets.com
                        """)
                    }

                    Divider()

                    // --- Online Math Tutors Section ---
                    Group {
                        Text("👩‍🏫 Recommended Online Math Tutors:")
                            .font(.headline)

                        // Online platforms where students can book math tutoring help
                        Text("""
                        • Wyzant (private tutors) - www.wyzant.com
                        • Varsity Tutors - www.varsitytutors.com
                        • Skooli (online sessions) - www.skooli.com
                        • Preply (affordable tutors) - www.preply.com
                        """)
                    }

                    Divider()

                    // --- YouTube Channels for Learning Section ---
                    Group {
                        Text("🎥 Great YouTube Channels for Math Learning:")
                            .font(.headline)

                        // Top YouTube channels for different styles of math learning
                        Text("""
                        • 3Blue1Brown — Visualization of concepts
                        • PatrickJMT — Step-by-step tutorials
                        • Professor Leonard — In-depth lectures (Calculus, more)
                        • Math Antics — Fun basic math explanations
                        • Eddie Woo — High school math lessons
                        • Organic Chemistry Tutor — Covers almost everything
                        """)
                    }
                }
                .padding() // Padding around the entire VStack for spacing from screen edges
            }
            .navigationTitle("Math") // Sets the navigation bar title when embedded in a NavigationView
        }
    }
}

// SwiftUI Preview Provider for Xcode Canvas live preview
#Preview {
    MathView()
}
