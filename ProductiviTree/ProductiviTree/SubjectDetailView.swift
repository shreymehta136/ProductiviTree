import SwiftUI

struct SubjectDetailView: View {
    var subject: String                     // The subject to display details for

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // Subject Title
                Text(subject)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Divider()                   // Divider line

                // Study Technique Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("🧠 Best Study Method:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(bestStudyMethod(for: subject))
                        .font(.body)
                }

                // Study Tips Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("📋 Tips and Tricks:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ForEach(studyTips(for: subject), id: \.self) { tip in
                        Text("- \(tip)")
                    }
                }

                // Brain Color Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("🎨 Best Brain Color:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(brainColor(for: subject))
                        .font(.body)
                }

                // Music Recommendations Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("🎵 Recommended Music:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ForEach(musicRecommendations(for: subject), id: \.self) { music in
                        Text("- \(music)")
                    }
                }

                // Helpful Websites Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("🌐 Helpful Websites:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ForEach(websiteRecommendations(for: subject), id: \.self) { site in
                        Link(site, destination: URL(string: site)!)
                            .foregroundColor(.blue)
                    }
                }

            }
            .padding()                      // Add padding around all content
        }
        .navigationTitle(subject)            // Set navigation bar title
    }

    // MARK: - Helper Functions

    func bestStudyMethod(for subject: String) -> String {
        // Returns best study method based on subject
        switch subject {
        case "Math", "Science":
            return "Use the Feynman Technique: Teach the concept out loud in simple words."
        case "English":
            return "Practice active reading, note-taking, and summarization."
        case "History":
            return "Create timelines, flashcards, and use storytelling methods."
        default:
            return "Use active recall and spaced repetition!"
        }
    }

    func studyTips(for subject: String) -> [String] {
        // Returns a list of study tips based on subject
        switch subject {
        case "Math":
            return ["Practice problems daily", "Understand concepts before memorizing", "Review mistakes carefully"]
        case "Science":
            return ["Conduct mini-experiments", "Create mind maps", "Link concepts together"]
        case "English":
            return ["Annotate readings", "Summarize chapters", "Use vocabulary lists"]
        case "History":
            return ["Make timelines", "Memorize key dates", "Understand cause-effect relationships"]
        default:
            return ["Stay organized", "Review regularly", "Take effective notes"]
        }
    }

    func brainColor(for subject: String) -> String {
        // Returns the best brain color for the subject
        switch subject {
        case "Math":
            return "Blue - boosts focus and analytical thinking."
        case "Science":
            return "Green - stimulates innovation and creativity."
        case "English":
            return "Yellow - enhances memory and comprehension."
        case "History":
            return "Brown - builds stability and memory structure."
        default:
            return "Light colors help retain information!"
        }
    }

    func musicRecommendations(for subject: String) -> [String] {
        // Returns recommended music/frequencies for the subject
        switch subject {
        case "Math":
            return ["Alpha wave music", "Instrumental Lo-Fi beats"]
        case "Science":
            return ["Nature sounds", "Binaural beats"]
        case "English":
            return ["Soft classical music", "Ambient focus music"]
        case "History":
            return ["Historical-themed instrumentals", "Calm background scores"]
        default:
            return ["Focus playlists", "Lo-Fi music"]
        }
    }

    func websiteRecommendations(for subject: String) -> [String] {
        // Returns helpful websites for the subject
        switch subject {
        case "Math":
            return ["https://www.khanacademy.org/math", "https://www.brilliant.org"]
        case "Science":
            return ["https://www.nationalgeographic.com", "https://www.sciencedaily.com"]
        case "English":
            return ["https://www.grammarly.com", "https://www.sparknotes.com"]
        case "History":
            return ["https://www.history.com", "https://www.khanacademy.org/humanities/world-history"]
        default:
            return ["https://www.wikipedia.org"]
        }
    }
}

// MARK: - Preview

#Preview {
    SubjectDetailView(subject: "Math")
}
