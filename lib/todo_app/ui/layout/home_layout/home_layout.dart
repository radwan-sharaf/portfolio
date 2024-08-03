import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_t_app/todo_app/domain/task_ctrl.dart';
import 'package:todo_t_app/todo_app/services/theme_service.dart';
import '../../../data/db_helper.dart';
import '../../pages/done_page/done_page.dart';
import '../../pages/home_page/home_page.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  ThemeServices themeCtrl = Get.find<ThemeServices>();
  TaskCtrl ctrl = Get.put(TaskCtrl());
  int selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    DonePage(),
  ];

  List<String> title = ['Home', 'Done'];

  @override
  void initState() {
    // TODO: implement initState

    DBHelper.createDatabase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        iconSize: 30,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        // backgroundColor: ,
        elevation: 10,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.donut_large,
              ),
              label: 'Done'),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          themeCtrl.icon,
          color: Colors.grey,
          size: 24,
        ),
        onPressed: () async {
          themeCtrl.switchTheme();
        },
      ),
      actions: [
        IconButton(
          onPressed: () async {
            ctrl.deleteAllTasks();
          },
          icon: const Icon(
            Icons.delete_forever,
            size: 35,
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
