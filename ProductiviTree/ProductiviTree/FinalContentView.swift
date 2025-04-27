import SwiftUI

// Entry view for the app where users choose if they are a student or educator
struct FinalContentView: View {
    // State variables to control navigation
    @State private var navigateToStudentHome = false
    @State private var navigateToEducatorProfile = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background color (light beige-orange)
                Color(red: 1.0, green: 0.88, blue: 0.67) // Light beige-orange
                    .ignoresSafeArea()

                VStack(spacing: 40) {
                    // Logo image at the top
                    Image("Logo") // Make sure "Logo" image is added to your Assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.top, 40)

                    // Main welcome message
                    Text("Welcome to ProductiviTree")
                        .font(.custom("Avenir Next", size: 24))
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity) // Center the text horizontally

                    // Question prompting the user
                    Text("Are you a student or an educator?")
                        .font(.title2)
                        .frame(maxWidth: .infinity) // Center the text horizontally

                    // Buttons for choosing Student or Educator
                    VStack(spacing: 20) {
                        // Button for students
                        Button(action: {
                            navigateToStudentHome = true // Navigate to Student Home
                        }) {
                            Text("I am a Student 🌱")
                                .font(.title2)
                                .frame(width: 250, height: 60)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }

                        // Button for educators
                        Button(action: {
                            navigateToEducatorProfile = true // Navigate to Educator Profile
                        }) {
                            Text("I am an Educator 🎓")
                                .font(.title2)
                                .frame(width: 250, height: 60)
                                .background(Color.brown)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }

                    // Hidden navigation links triggered by the buttons above
                    NavigationLink(destination: StudentHomeView(), isActive: $navigateToStudentHome) {
                        EmptyView()
                    }

                    NavigationLink(destination: EducatorProfileView(), isActive: $navigateToEducatorProfile) {
                        EmptyView()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Center the VStack in the ZStack
            }
        }
    }
}

// Preview provider for SwiftUI Canvas
#Preview {
    FinalContentView()
}
