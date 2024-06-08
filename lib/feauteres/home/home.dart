import 'package:flutter/material.dart';
import 'package:pdpasliddin/feauteres/darslar/darslar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        child: GridView.builder(
            itemCount: codeLanguageNames.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 6, crossAxisSpacing: 6),
            itemBuilder: (_, index) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const DarslarPage()));
                },
                child: Text(codeLanguageNames.elementAt(index)),
              );
            }),
      ),
    );
  }
}

List<String> codeLanguageNames = [
  'Flutter',
  'Java',
  'Python',
  'JavaScript',
  'C++',
  'C#',
  'Android',
];
