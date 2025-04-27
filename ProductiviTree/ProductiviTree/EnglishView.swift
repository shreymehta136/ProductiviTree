import SwiftUI

// Main view for the English Learning Module
struct EnglishView: View {
    var body: some View {
        ZStack {
            // Background gradient from light blue to deeper blue
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.69, green: 0.87, blue: 0.90), // Powder Blue
                    Color(red: 0.57, green: 0.73, blue: 0.80)  // Deeper Blue
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea() // Extend background to entire screen
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Main title
                    Text("📖 English Learning Module")
                        .font(.largeTitle)
                        .bold()
                    
                    // Study techniques section
                    Group {
                        Text("Recommended Study Techniques:")
                            .font(.headline)
                            .padding(.top)

                        Text("""
                        • Active Reading (summarize each paragraph)
                        • Flashcards for Vocabulary
                        • Weekly Essay Practice
                        • Literature Analysis Charts
                        • Essay Feedback & Revision
                        • Teach Writing Techniques to Others
                        • Spaced Repetition for Vocabulary
                        """)
                            .padding()
                    }
                    
                    // Music and color suggestions for studying
                    Group {
                        Text("🎵 Best Music for English:")
                            .font(.headline)
                        Text("Calm instrumental background to enhance focus and creativity.")
                        
                        Text("🎨 Best Study Color:")
                            .font(.headline)
                        Text("Soft Blue for reading comfort and to boost creativity.")
                    }
                    
                    Divider() // Visual separator
                    
                    // Major English study topics
                    Group {
                        Text("🧠 Major English Study Topics:")
                            .font(.headline)
                        Text("""
                        • Grammar (tenses, subject-verb agreement, punctuation)
                        • Vocabulary (synonyms, antonyms, idioms)
                        • Writing Techniques (essay structure, thesis statements)
                        • Literature (themes, character analysis, literary devices)
                        • Poetry (form, rhythm, metaphor)
                        • Reading Comprehension (main ideas, details, inferences)
                        • Public Speaking (articulation, persuasion)
                        • Creative Writing (fiction, short stories, storytelling)
                        """)
                    }
                    
                    // Quick sample quiz for practice
                    Group {
                        Text("📝 Sample Quick Quiz:")
                            .font(.headline)
                        Text("""
                        1. Choose the correct sentence: “She **go** to school every day.” or “She **goes** to school every day.”
                        2. What is the metaphor in the sentence: “The world is a stage”?
                        3. Write a 5-sentence summary of a book you have read recently.
                        4. Define the literary device: "Foreshadowing."
                        5. Identify the main idea in the passage: "The sun was setting, and the sky turned an array of vibrant colors."
                        """)
                            .padding(.bottom)
                    }
                    
                    Divider()
                    
                    // Recommended websites for English practice
                    Group {
                        Text("🌐 Best Websites for English Practice:")
                            .font(.headline)
                        Text("""
                        • Grammarly - www.grammarly.com (grammar and writing assistance)
                        • Merriam-Webster - www.merriam-webster.com (dictionary)
                        • Vocabulary.com - www.vocabulary.com (vocabulary building)
                        • Purdue OWL - owl.purdue.edu (writing resources)
                        • BBC Learning English - www.bbc.co.uk/learningenglish
                        • Writing Center - writingcenter.unc.edu
                        """)
                    }
                    
                    // Sources for free English worksheets
                    Group {
                        Text("📚 Free Worksheet Sources:")
                            .font(.headline)
                        Text("""
                        • EnglishClub - www.englishclub.com
                        • K12 Reader - www.k12reader.com
                        • Education.com - www.education.com
                        • CommonCoreSheets - www.commoncoresheets.com
                        """)
                    }
                    
                    Divider()
                    
                    // Recommended platforms for finding English tutors
                    Group {
                        Text("👩‍🏫 Recommended Online English Tutors:")
                            .font(.headline)
                        Text("""
                        • Wyzant (private tutors) - www.wyzant.com
                        • Preply (affordable tutors) - www.preply.com
                        • Skooli (online sessions) - www.skooli.com
                        • Varsity Tutors - www.varsitytutors.com
                        """)
                    }
                    
                    Divider()
                    
                    // Recommended YouTube channels for English learning
                    Group {
                        Text("🎥 Great YouTube Channels for English Learning:")
                            .font(.headline)
                        Text("""
                        • BBC Learning English — English lessons for all levels
                        • English with Lucy — Vocabulary and grammar lessons
                        • Speak English With Vanessa — Focus on conversational English
                        • Rachel's English — Pronunciation and accent improvement
                        • Learn English with Emma — Tips for writing and speaking
                        • EngVid — Comprehensive English lessons for all topics
                        """)
                    }
                }
                .padding() // Padding around all content
            }
            .navigationTitle("English") // Set navigation title
        }
    }
}

// Preview provider for SwiftUI Canvas
#Preview {
    EnglishView()
}
