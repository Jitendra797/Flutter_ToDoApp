import 'package:flutter/material.dart';
import 'package:todo_app/widgets/tasklist.dart';

class TextBar extends StatefulWidget {
  const TextBar({super.key});

  @override
  State<TextBar> createState() => _TextBarState();
}

class _TextBarState extends State<TextBar> {
  final List<String> _tasks = [];
  String enteredText = '';

  void _addTask() {
    setState(() {
      _tasks.add(enteredText);
      enteredText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height * 0.06,
              width: width * 0.7,
              child: TextField(
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Enter Something Here",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onChanged: (String newText) {
                  enteredText = newText;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                _addTask;
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 245, 243, 243)),
              ),
              child: const Text("Add"),
            ),
          ],
        ),
        const SizedBox(height: 32),
        TaskList(tasks: _tasks),
      ],
    );
  }
}
