import 'package:flutter/material.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<String> _tasks = [];
  final List<bool> _completedTasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
        _completedTasks.add(false);
        _controller.clear();
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _completedTasks.removeAt(index);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _completedTasks[index] = !_completedTasks[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "To-Do List",
          style: TextStyle(fontFamily: 'Nexa', color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {
                          _toggleTaskCompletion(index);
                        },
                        icon: Icon(
                          _completedTasks[index]
                              ? Icons.done_all_outlined
                              : Icons.done,
                          color: _completedTasks[index] ? Colors.green : null,
                        ),
                      ),
                      title: Text(
                        _tasks[index],
                        style: const TextStyle(
                            fontFamily: 'Nexalight',
                            fontWeight: FontWeight.w900,
                            fontSize: 15),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _deleteTask(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _tasks.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter Task",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: _addTask,
                  child: Icon(Icons.send),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
