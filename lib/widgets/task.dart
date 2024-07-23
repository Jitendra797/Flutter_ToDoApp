import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class TaskItem extends StatelessWidget {
  final String task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task),
            Row(
              children: [
                GestureDetector(
                  child: const Image(
                    image: Svg('assets/Icons/check-line.svg'),
                  ),
                  onTap: () {},
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  child: const Image(
                    image: Svg('assets/Icons/star-line.svg'),
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
