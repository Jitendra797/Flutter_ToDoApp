import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/helpers/helper_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String newTaskTitle = "";

  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("Todo").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 58,
                    child: TextFormField(
                      onChanged: (text) => setState(() {
                        newTaskTitle = text;
                      }),
                      decoration: InputDecoration(
                        hintText: "Enter Something Here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () => {
                    FirebaseFirestore.instance
                        .collection("Todo")
                        .add({"title": newTaskTitle})
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: StreamBuilder(
                stream: _stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> document =
                            snapshot.data?.docs[index].data()
                                as Map<String, dynamic>;
                        return TaskTile(title: document['title']);
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String title;

  const TaskTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isdark = KHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(
              color: isdark
                  ? Colors.grey
                  : Colors.black, // Set your desired border color here
              width: 0.5, // Set border width (optional)
            ),
          ),
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () => {}, // Add functionality to mark task complete
              ),
              IconButton(
                icon: const Icon(Icons.star_border),
                onPressed: () => {}, // Add functionality to delete task
              ),
            ],
          ),
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
