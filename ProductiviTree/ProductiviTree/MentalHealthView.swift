import SwiftUI

// View for Mental Health & Calming Content
struct MentalHealthView: View {
    var body: some View {
        ZStack {
            // Background color: Baker-Miller Pink for emotional calmness and positivity
            Color(red: 1.0, green: 0.57, blue: 0.69)
                .ignoresSafeArea() // Fill the entire screen, including safe areas

            // Main scrollable container for all sections
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // --- Start Calming Session Section ---
                    Group {
                        Text("🌸 Start a Calming Session")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top) // Space above the title

                        // Introduction text encouraging short mindful breaks
                        Text("Sometimes, a few minutes of relaxation can go a long way. Start a calming session to recharge.")
                            .padding(.top)

                        // Navigation link to calming session view (e.g., guided breathing or meditation)
                        NavigationLink(destination: CalmingSessionView()) {
                            Text("🌸 Start a Calming Session")
                                .padding()
                                .background(Color.purple.opacity(0.7)) // Soft purple background for button
                                .cornerRadius(10) // Rounded corners
                                .foregroundColor(.white) // White text
                        }
                        .padding(.top, 30) // Extra space before the button
                    }
                    
                    Divider() // Horizontal line to separate sections visually

                    // --- Mental Health & Stress Awareness Section ---
                    Group {
                        Text("🧠 Mental Health & Stress Awareness")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        // Introduction to stress management and mental health self-care
                        Text("Taking care of your mental health is just as important as studying. Here are some tips:")

                        // Bullet-pointed actionable mental health tips
                        VStack(alignment: .leading, spacing: 10) {
                            Text("- Take short breaks every 45 minutes.")
                            Text("- Practice deep breathing when feeling stressed.")
                            Text("- Keep a regular sleep schedule.")
                            Text("- Avoid multitasking; focus on one task at a time.")
                            Text("- Stay hydrated and eat healthy snacks.")
                            Text("- Talk to someone if you're feeling overwhelmed.")
                        }
                        .padding(.top)
                    }

                    Divider()

                    // --- Motivational Quotes Section ---
                    Group {
                        Text("💡 Motivational Quotes:")
                            .font(.headline)

                        // Uplifting and reassuring quotes to boost mood and motivation
                        Text("""
                        • "Your mental health is a priority. Your happiness is essential." – Unknown
                        • "You are enough just as you are." – Meghan Markle
                        • "The only journey is the journey within." – Rainer Maria Rilke
                        • "It's okay to not be okay as long as you are not giving up." – Karen Salmansohn
                        • "Mental health is just as important as physical health." – Unknown
                        """)
                    }
                    .padding(.top)

                    Divider()

                    // --- Mental Health Statistics Section ---
                    Group {
                        Text("📊 Mental Health Statistics:")
                            .font(.headline)

                        // Important mental health awareness facts and figures
                        Text("""
                        • 1 in 5 adults in the U.S. experience mental illness each year. (National Institute of Mental Health)
                        • Suicide is the second leading cause of death among people aged 10-34. (CDC)
                        • Mental health disorders affect 10-20% of children and adolescents worldwide. (WHO)
                        • 54% of individuals with mental illness do not seek treatment. (Mental Health America)
                        • Anxiety disorders affect 18.1% of the U.S. population. (NIMH)
                        """)
                    }
                    .padding(.top)

                    Divider()

                    // --- Find a Therapist Section ---
                    Group {
                        Text("👩‍⚕️ Find a Therapist or Mental Health Professional:")
                            .font(.headline)

                        // Reliable platforms and directories for finding mental health support
                        Text("""
                        • BetterHelp - www.betterhelp.com (online therapy)
                        • Talkspace - www.talkspace.com (online therapy)
                        • Psychology Today - www.psychologytoday.com (find a therapist by location)
                        • TherapyRoute - www.therapyroute.com (directory by area)
                        • 7 Cups - www.7cups.com (online emotional support)
                        """)
                    }
                    .padding(.top)
                }
                .padding() // Padding around the VStack for spacing away from screen edges
            }
        }
    }
}

// SwiftUI Preview Provider for Xcode Canvas live preview
#Preview {
    MentalHealthView()
}
