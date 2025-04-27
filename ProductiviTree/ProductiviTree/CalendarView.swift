import SwiftUI

// Model for a calendar event, conforming to Identifiable and Codable
struct CalendarEvent: Identifiable, Codable {
    let id: UUID
    let title: String
    let date: Date
}

// Main view for the Calendar
struct CalendarView: View {
    // State variables to hold events and new event details
    @State private var events: [CalendarEvent] = []
    @State private var newEventTitle: String = ""
    @State private var newEventDate: Date = Date()
    
    // Custom background color
    var beigeColor = Color(red: 1.0, green: 0.88, blue: 0.67)
    
    // Key for saving and loading events from UserDefaults
    let eventsKey = "savedEvents"

    var body: some View {
        NavigationView {
            ZStack {
                // Set full background color
                beigeColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Form for adding a new event
                    Form {
                        Section(header: Text("Add New Assignment / Event")) {
                            TextField("Enter title", text: $newEventTitle)
                            DatePicker("Select Date", selection: $newEventDate, displayedComponents: .date)
                            
                            Button(action: addEvent) {
                                Text("Add Event")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue.opacity(0.7))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden) // Remove form's default background
                    .background(beigeColor) // Match form background to the app background

                    Divider()
                        .padding()

                    // List of upcoming events
                    List {
                        Section(header: Text("Upcoming Events")) {
                            ForEach(events.sorted(by: { $0.date < $1.date })) { event in
                                VStack(alignment: .leading) {
                                    Text(event.title)
                                        .font(.headline)
                                    Text(event.date, style: .date)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .onDelete(perform: deleteEvent) // Enable swipe-to-delete
                        }
                    }
                    .scrollContentBackground(.hidden) // Remove list's default background
                    .background(beigeColor) // Match list background to the app background
                }
                .padding(.top) // Add padding at the top of the VStack
            }
            .navigationTitle("📅 Calendar & Planner") // Set navigation bar title
        }
        .onAppear(perform: loadEvents) // Load saved events when view appears
    }

    // Function to add a new event to the list
    func addEvent() {
        if !newEventTitle.isEmpty {
            let newEvent = CalendarEvent(id: UUID(), title: newEventTitle, date: newEventDate)
            events.append(newEvent)
            saveEvents() // Save updated events
            newEventTitle = "" // Reset title input
            newEventDate = Date() // Reset date input
        }
    }
    
    // Function to delete an event from the list
    func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
        saveEvents() // Save updated events after deletion
    }
    
    // Function to save events array to UserDefaults
    func saveEvents() {
        if let encoded = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(encoded, forKey: eventsKey)
        }
    }
    
    // Function to load events from UserDefaults
    func loadEvents() {
        if let savedData = UserDefaults.standard.data(forKey: eventsKey) {
            if let decoded = try? JSONDecoder().decode([CalendarEvent].self, from: savedData) {
                events = decoded
            }
        }
    }
}

// Preview provider for SwiftUI canvas
#Preview {
    CalendarView()
}
