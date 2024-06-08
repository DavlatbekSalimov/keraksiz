import 'package:flutter/material.dart';
import 'package:pdpasliddin/feauteres/home/home.dart';
import 'package:pdpasliddin/feauteres/profile/profilepage.dart';
import 'package:pdpasliddin/feauteres/statistic/statistic.dart';

class WButtomNawBar extends StatefulWidget {
  const WButtomNawBar({super.key});

  @override
  State<WButtomNawBar> createState() => _WButtomNawBarState();
}

class _WButtomNawBarState extends State<WButtomNawBar> {
  int counterindex =0;
  List<Widget> pages = [
    const HomePage(),
    const StatisticPage(),
    const Profilepage(),
  ];
  void ontapped(index) {
counterindex = index;
setState(() {
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(counterindex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontapped,
        currentIndex:counterindex ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'Statistics'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profiles'),
        ],
      ),
    );
  }
}
