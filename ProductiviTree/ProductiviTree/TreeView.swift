import SwiftUI

struct TreeView: View {
    @State private var leafCount = 5         // Current number of leaves
    @State private var showAlert = false     // Alert when no leaves are left

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {

                // 🌳 Tree + Leaves Layer
                ZStack {
                    Image(systemName: "tree.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.green)

                    // 🍃 Leaves displayed around the tree
                    ForEach(0..<leafCount, id: \.self) { index in
                        LeafView(index: index)
                    }
                }
            }
            .padding()

            // 🎯 Action Buttons
            HStack(spacing: 40) {
                Button(action: {
                    addLeaf()    // Add a leaf (task completed)
                }) {
                    Text("✅ Complete Task")
                        .padding()
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }

                Button(action: {
                    removeLeaf() // Remove a leaf (off task)
                }) {
                    Text("⚠️ Off Task")
                        .padding()
                        .background(Color.red.opacity(0.7))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
            .padding()

            // 📈 Leaf counter display
            Text("Leaves: \(leafCount)")
                .font(.title2)
                .foregroundColor(.gray)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("🌪️ Oh no!"),
                message: Text("Your tree lost all its leaves! Keep trying!"),
                dismissButton: .default(Text("I will!"))
            )
        }
    }

    // ➕ Logic to add a leaf
    func addLeaf() {
        if leafCount < 100 {
            leafCount += 1
        }
    }

    // ➖ Logic to remove a leaf
    func removeLeaf() {
        if leafCount > 0 {
            leafCount -= 1
        }
        if leafCount == 0 {
            showAlert = true
        }
    }
}

// 🍃 Single Leaf View
struct LeafView: View {
    var index: Int

    var body: some View {
        // Predefined leaf positions
        let offsets: [(CGFloat, CGFloat)] = [
            (-50, -80), (50, -90), (-70, -30), (70, -40), (0, -100),
            (-30, -60), (30, -60), (-60, -20), (60, -20), (0, -70)
        ]

        // Use offset if available, else (0,0)
        let offset = index < offsets.count ? offsets[index] : (0, 0)

        return Circle()
            .fill(Color.green)
            .frame(width: 20, height: 20)
            .offset(x: offset.0, y: offset.1)
    }
}

#Preview {
    StudyTreeView()    // ⚡ (Small note: this preview should be StudyTreeView, not TreeView)
}
