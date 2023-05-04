import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///hive initialization
  await Hive.initFlutter();
  await Hive.openBox('task_box');

  runApp(MaterialApp(
    home: MyTODo(),
  ));
}

class MyTODo extends StatefulWidget {
  @override
  State<MyTODo> createState() => _MyTODoState();
}

class _MyTODoState extends State<MyTODo> {
  ///to store task from hive db
  List<Map<String, dynamic>> task = [];

  ///object creation of hive
  final tbox = Hive.box('task_box');

  @override
  void initState() {
    super.initState();
    loadTask();
  }

  Future<void> createTask(Map<String, dynamic> task) async {
    await tbox.add(task);
    loadTask();
  }

  void loadTask() {
    final data = tbox.keys.map((id) {
      final value = tbox.get(id);
      return {'key': id, 'name': value['name'], 'details': value['details']};
    }).toList();

    setState(() {
      task = data.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: task.isEmpty
          ? const Center(
              child: Text(
                "NO DATA",
                style: TextStyle(fontSize: 40),
              ),
            )
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.pink,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(task[index]['name']),
                    subtitle: Text(task[index]['details']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit_calendar)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  final TextEditingController name_controller = TextEditingController();
  final TextEditingController details_controller = TextEditingController();

  void showForm(BuildContext context, int? id) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              top: 15,
              left: 15,
              right: 15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: name_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Task Name"),
                ),
                TextField(
                  controller: details_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Task Details"),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        createTask({
                          'name': name_controller.text,
                          'details': details_controller.text
                        });
                      }
                      if (id != null) {
                        //updateTask(id ,{'name' :name_controller.text, 'details' :details_controller.text});
                      }

                      name_controller.text = "";
                      details_controller.text = "";
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? "Create Task" : "Update Task"))
              ],
            ),
          );
        });
  }
}
