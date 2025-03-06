import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class Maincontainer extends StatefulWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deletefunction;
  const Maincontainer(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      this.onChanged,
      required this.deletefunction});

  @override
  State<Maincontainer> createState() => _MaincontainerState();
}

class _MaincontainerState extends State<Maincontainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: widget.deletefunction,
            icon: Icons.delete,
            backgroundColor: Colors.purple,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 3,
                    offset: Offset(1, 2))
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.taskname,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: widget.taskcompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.white,
                      decorationStyle: TextDecorationStyle.wavy),
                ),
                Checkbox(
                  value: widget.taskcompleted,
                  onChanged: widget.onChanged,
                  checkColor: Colors.red,
                  activeColor: Colors.white,
                  side: BorderSide(color: Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
