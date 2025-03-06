import 'package:flutter/material.dart';
import 'package:mytodos/utils/maincontainer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List todolist = [
    ["Learn Flutter", false],
    ["Drink Coffee", true],
    ["Do exercise", true]
  ];

  void checkboxchanged(int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void savedtask() {
    setState(() {
      todolist.add([mycontroller.text, false]);
      mycontroller.clear();
    });
  }

  void deletetask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  TextEditingController mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "MY TO DOs",
          style: const TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 26),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 30),
            child: TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                  hintText: "Add todo items",
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.amber[100],
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.amber))),
            ),
          )),
          FloatingActionButton(
            elevation: 10,
            backgroundColor: Colors.amber,
            onPressed: savedtask,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (BuildContext context, index) {
            return Maincontainer(
              deletefunction: (context) => deletetask(index),
              taskname: todolist[index][0],
              taskcompleted: todolist[index][1],
              onChanged: (value) => checkboxchanged(index),
            );
          }),
    );
  }
}
