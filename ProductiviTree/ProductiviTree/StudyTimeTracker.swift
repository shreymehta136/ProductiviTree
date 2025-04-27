import Foundation
import Combine

/// A shared study timer that tracks how long a student has been studying.
/// Provides start, pause, reset, and formatted time functionality.
class StudyTimer: ObservableObject {
    
    // MARK: - Singleton Instance
    static let shared = StudyTimer()                           // Shared singleton instance
    
    // MARK: - Published Properties
    @Published var studySeconds: Int = 0                       // Total seconds studied in the current session
    @Published var isRunning: Bool = false                     // Whether the timer is currently running
    @Published var sessionStartDate: Date?                     // The start time of the current session
    @Published var totalSessions: Int = 0                      // Total number of sessions completed
    @Published var cumulativeStudySeconds: Int = 0             // Total seconds studied across all sessions
    
    // MARK: - Private Properties
    private var timer: Timer?                                  // Timer that fires every second
    private var cancellables = Set<AnyCancellable>()           // Set to hold Combine subscriptions
    
    // MARK: - Constants
    private let autoSaveInterval: TimeInterval = 30            // How often (seconds) to auto-save progress

    // MARK: - Initialization
    private init() {
        loadProgress()                                         // Load previous study progress
        
        Timer.publish(every: autoSaveInterval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.saveProgress()                           // Auto-save progress at regular intervals
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Timer Controls
    
    func start() {
        guard !isRunning else { return }                       // Ignore if already running
        timer?.invalidate()                                    // Invalidate any previous timer
        
        sessionStartDate = Date()                              // Set session start date
        isRunning = true                                       // Mark as running
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.studySeconds += 1                            // Increment session time
            self?.cumulativeStudySeconds += 1                  // Increment total time
        }
    }
    
    func pause() {
        guard isRunning else { return }                        // Ignore if already paused
        timer?.invalidate()                                    // Stop the timer
        isRunning = false                                      // Mark as not running
        totalSessions += 1                                     // Count this session
        saveProgress()                                         // Save updated progress
    }
    
    func reset() {
        timer?.invalidate()                                    // Stop the timer
        isRunning = false                                      // Mark as not running
        studySeconds = 0                                       // Reset session time
        sessionStartDate = nil                                 // Clear session start date
    }
    
    func fullReset() {
        timer?.invalidate()                                    // Stop the timer
        isRunning = false                                      // Mark as not running
        studySeconds = 0                                       // Reset session time
        cumulativeStudySeconds = 0                             // Reset cumulative time
        totalSessions = 0                                      // Reset session count
        sessionStartDate = nil                                 // Clear session start date
        saveProgress()                                         // Save cleared progress
    }
    
    // MARK: - Time Formatting Helpers
    
    func timeString() -> String {
        let minutes = studySeconds / 60                        // Calculate minutes
        let seconds = studySeconds % 60                        // Calculate remaining seconds
        return String(format: "%02d:%02d", minutes, seconds)   // Format as MM:SS
    }
    
    func totalTimeString() -> String {
        let hours = cumulativeStudySeconds / 3600              // Calculate total hours
        let minutes = (cumulativeStudySeconds % 3600) / 60      // Calculate remaining minutes
        let seconds = cumulativeStudySeconds % 60              // Calculate remaining seconds
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds) // Format as HH:MM:SS
    }
    
    func averageSessionTime() -> TimeInterval {
        guard totalSessions > 0 else { return 0 }              // Avoid division by zero
        return Double(cumulativeStudySeconds) / Double(totalSessions) // Average seconds
    }
    
    func averageSessionTimeString() -> String {
        let avgSeconds = Int(averageSessionTime())             // Get average in seconds
        let minutes = avgSeconds / 60                          // Calculate minutes
        let seconds = avgSeconds % 60                          // Calculate remaining seconds
        return String(format: "%02d:%02d", minutes, seconds)   // Format as MM:SS
    }
    
    // MARK: - Persistence (UserDefaults)
    
    private func saveProgress() {
        let defaults = UserDefaults.standard
        defaults.set(cumulativeStudySeconds, forKey: "cumulativeStudySeconds") // Save total study time
        defaults.set(totalSessions, forKey: "totalSessions")                   // Save total session count
    }
    
    private func loadProgress() {
        let defaults = UserDefaults.standard
        cumulativeStudySeconds = defaults.integer(forKey: "cumulativeStudySeconds") // Load total study time
        totalSessions = defaults.integer(forKey: "totalSessions")                   // Load total session count
    }
    
    // MARK: - Debugging Helper
    
    func debugPrintStatus() {
        print("""
        ---- Study Timer Status ----
        Is Running: \(isRunning)
        Current Session Seconds: \(studySeconds)
        Cumulative Study Seconds: \(cumulativeStudySeconds)
        Total Sessions: \(totalSessions)
        Session Started At: \(String(describing: sessionStartDate))
        -----------------------------
        """)
    }
}
