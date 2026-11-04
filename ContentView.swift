import SwiftUI

struct ContentView: View {
    @State private var taskCount: Int = 0
    @State private var tasks: [Task] = [
        Task(title: "Learn Swift", isCompleted: true),
        Task(title: "Read book"),
        Task(title: "Complete uni tasks")
    ]
    @State private var newTaskTitle = ""
    var body: some View {
        VStack {
            Text("Task Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            HStack {
                TextField("New Task", text: $newTaskTitle)
                    .textFieldStyle(.roundedBorder)
                Button("Add") {
                    addTask()
                    
                }
                .buttonStyle(.borderedProminent)
                .disabled(newTaskTitle.isEmpty)
            }
            //taskeri listy
            List {
                ForEach(tasks) {
                    task in
                    HStack {
                        Text(task.title)
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circlebadge" )
                    }
                    .onTapGesture {
                        toggleTask(task)
                    }
                    
                }
                .onDelete(perform: deleteTask)
            }
        }
        .padding()
    }
    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask)
        newTaskTitle = ""
    }
    private func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index].isCompleted.toggle()
        }
    }
    //jnjum a by swiping left
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
