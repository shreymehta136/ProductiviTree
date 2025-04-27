import SwiftUI

// View for creating an educator profile
struct EducatorProfileView: View {
    // State variables for user inputs and UI control
    @State private var name: String = ""
    @State private var experience: String = ""
    @State private var subjectSpecialty: String = ""
    @State private var profileImage: Image? = nil
    @State private var showingImagePicker = false
    @State private var isPosted = false

    // Custom beige background color
    let beigeColor = Color(red: 1.0, green: 0.88, blue: 0.67)

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Title text
                Text("Create Your Educator Profile 🎓")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                // Profile Image Section
                if let profileImage = profileImage {
                    // If an image is selected, display it
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                } else {
                    // Otherwise, show the "Upload Photo" button
                    Button(action: {
                        showingImagePicker = true
                    }) {
                        Text("Upload Photo")
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }

                // Name Input Field
                TextField("Your Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Experience Input Field
                TextField("Years of Experience", text: $experience)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Subject Specialty Input Field
                TextField("Subject Specialty", text: $subjectSpecialty)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Post Profile Button
                Button(action: {
                    postProfile()
                }) {
                    Text(isPosted ? "Profile Posted ✅" : "Post Profile")
                        .font(.title3)
                        .frame(width: 220, height: 50)
                        .background(isPosted ? Color.green : Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .disabled(isPosted) // Disable button after posting

            }
            // Sheet for showing the image picker (currently commented out)
            .sheet(isPresented: $showingImagePicker) {
                // ImagePicker(selectedImage: $profileImage)
            }
        }
        .background(beigeColor) // Set the entire background to beige
    }

    // Function to simulate posting the profile
    func postProfile() {
        // Later, you could save these details to a database
        isPosted = true
    }
}

// Preview provider for SwiftUI Canvas
#Preview {
    EducatorProfileView()
}
