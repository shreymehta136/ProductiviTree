import SwiftUI

// Main view for discovering tutors
struct DiscoverTutorView: View {
    // Sample list of educators to display
    @State private var educators: [EducatorProfile] = [
        EducatorProfile(name: "John Doe", subject: "Math", experience: "5 years", imageName: "person.fill"),
        EducatorProfile(name: "Jane Smith", subject: "Science", experience: "8 years", imageName: "person.fill"),
        EducatorProfile(name: "Emily Johnson", subject: "History", experience: "3 years", imageName: "person.fill")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Full beige background
                Color(red: 1.0, green: 0.88, blue: 0.67)
                    .edgesIgnoringSafeArea(.all)
                
                // Scrollable list of tutor cards
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(educators) { educator in
                            TutorCard(educator: educator)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Discover Tutors") // Title at the top
        }
    }
}

// View for displaying an individual tutor card
struct TutorCard: View {
    var educator: EducatorProfile
    @State private var rating: Int = 0 // User-selected rating (1 to 5 stars)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 20) {
                // Profile image
                Image(systemName: educator.imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(Circle())
                
                // Educator's details
                VStack(alignment: .leading, spacing: 5) {
                    Text(educator.name)
                        .font(.headline)
                    Text("Subject: \(educator.subject)")
                        .font(.subheadline)
                    Text("Experience: \(educator.experience)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            // Star rating system
            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            rating = index // Update rating when a star is tapped
                        }
                }
            }
        }
        .padding()
        .background(Color(red: 0.98, green: 0.96, blue: 0.92)) // Light beige background for the card
        .cornerRadius(12) // Rounded corners for the card
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2) // Soft shadow for lift effect
    }
}

// Model for an educator's profile
struct EducatorProfile: Identifiable {
    let id = UUID() // Unique identifier for each educator
    var name: String
    var subject: String
    var experience: String
    var imageName: String
}

// Preview provider for SwiftUI Canvas
#Preview {
    DiscoverTutorView()
}
