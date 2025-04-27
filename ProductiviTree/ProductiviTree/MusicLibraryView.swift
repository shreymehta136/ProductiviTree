import SwiftUI

// View for Music Library Section (Focus, Relaxation, Motivation)
struct MusicLibraryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background color: Soft beige for warmth and comfort
                Color(red: 1.0, green: 0.88, blue: 0.67)
                    .ignoresSafeArea() // Fill entire screen, including under safe areas

                // List of curated music and sound resources
                List {
                    // --- Focus Music Section ---
                    Section(header: Text("Focus Music")) {
                        // Link to Alpha Wave Music (good for deep focus and brainwave entrainment)
                        Link("Alpha Wave Music", destination: URL(string: "https://www.youtube.com/watch?v=WPni755-Krg")!)

                        // Link to Lo-Fi Beats (popular for studying and gentle concentration)
                        Link("Lo-Fi Beats for Studying", destination: URL(string: "https://www.youtube.com/watch?v=jfKfPfyJRdk")!)
                    }

                    // --- Relaxation Sounds Section ---
                    Section(header: Text("Relaxation Sounds")) {
                        // Link to Nature Sounds (helps with relaxation, mindfulness)
                        Link("Nature Sounds", destination: URL(string: "https://www.youtube.com/watch?v=OdIJ2x3nxzQ")!)

                        // Link to Binaural Beats (brainwave stimulation for relaxation and focus)
                        Link("Binaural Beats", destination: URL(string: "https://www.youtube.com/watch?v=32atfyKzQhA")!)
                    }

                    // --- Motivational Playlists Section ---
                    Section(header: Text("Motivational Playlists")) {
                        // Link to a Spotify playlist designed for study motivation and positivity
                        Link("Study Motivation Playlist", destination: URL(string: "https://open.spotify.com/playlist/37i9dQZF1DX8Uebhn9wzrS")!)
                    }
                }
                .scrollContentBackground(.hidden) // Hide default List background to show custom beige background
            }
            .navigationTitle("Music Library") // Navigation bar title
        }
    }
}

// SwiftUI Preview Provider for live canvas preview in Xcode
#Preview {
    MusicLibraryView()
}
