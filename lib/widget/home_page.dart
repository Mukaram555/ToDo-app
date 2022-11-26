import 'package:flutter/material.dart';
import 'package:todo_app/colors/colors.dart';
import 'package:todo_app/widget/AddTaskScreen.dart';
import 'package:todo_app/widget/all_task.dart';
import 'package:todo_app/widget/completedTaskTab.dart';
import 'package:todo_app/widget/incompleteTask.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsOfApp.appBarColor,
        title: const Text("Todo"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTaskScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(child: Text("All",style: ColorsOfApp.tabBarStyle,),),
            Tab(child: Text("InComplete",style: ColorsOfApp.tabBarStyle,),),
            Tab(child: Text("Complete",style: ColorsOfApp.tabBarStyle,),),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          AllTaskTab(),
          IncompleteTask(),
          CompletedTaskTab(),
        ],
      ),
    );
  }
}
