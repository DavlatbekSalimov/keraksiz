import 'package:flutter/material.dart';
import 'package:pdpasliddin/feauteres/savollar/savollar_page.dart';

class DarslarPage extends StatefulWidget {
  const DarslarPage({super.key});

  @override
  State<DarslarPage> createState() => _DarslarPageState();
}

class _DarslarPageState extends State<DarslarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Darslar'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            // width: 100,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(onPressed: () {}, child: Text('${index + 1}-modul')),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(itemBuilder: (_, index) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (contex) => const SavollarPage()));
                    },
                    child: Text('${index + 1}-modul darslari'));
              }),
            ),
          )
        ],
      ),
    );
  }
}
