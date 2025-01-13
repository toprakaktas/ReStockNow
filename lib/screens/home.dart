import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restocknow/main.dart';
import 'package:restocknow/screens/stepper_widget.dart';
import 'package:restocknow/services/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [];
  final TextEditingController _controller = TextEditingController();
  final ItemService _itemService = ItemService();

  Future<void> addItem() async {
    await _itemService.addItem(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReStockNow'),
        actions: [
          IconButton(
            icon: Icon(MainApp.themeNotifier.value == ThemeMode.light
                ? CupertinoIcons.moon_fill
                : CupertinoIcons.sun_max),
            onPressed: () {
              setState(() {
                MainApp.themeNotifier.value =
                MainApp.themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
              });
            },
          ),
        ],
      ),
      body: const StepperWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
            label: 'Add Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.orange[200],
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }
}
