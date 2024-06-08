import 'package:flutter/material.dart';

class SavollarPage extends StatefulWidget {
  const SavollarPage({super.key});

  @override
  State<SavollarPage> createState() => _SavollarPageState();
}

class _SavollarPageState extends State<SavollarPage> {
  final PageController _pageController = PageController();
  List<Map<String, dynamic>> savollarlisti = [
    {
      'savol': 'Dart haqida',
      'variant': [
        {'A': "Function", 'javob': false},
        {'B': "Coding Language", 'javob': true},
        {'C': "Keyword", 'javob': false},
      ],
    },
    {
      'savol': 'if else ishlash jarayoni',
      'variant': [
        {
          'A': " if va else shartlari faqat bir xil qiymatlarni tekshirish uchun ishlatiladi.",
          'javob': false
        },
        {'B': "if sharti bajarilganda, else sharti har doim bajariladi", 'javob': false},
        {
          'C': "if va else shartlari biror shartning bajarilishi yoki bajarilmasligini tekshirish uchun ishlatiladi",
          'javob': true
        },
      ],
    },
    {
      'savol': 'For haqida',
      'variant': [
        {'A': "for sikli faqat sonlarni sanash uchun ishlatiladi.", 'javob': false},
        {
          'B': "for sikli biror amalni berilgan shartlar asosida takrorlash uchun ishlatiladi.",
          'javob': true
        },
        {'C': "for sikli cheksiz marta takrorlanadi.", 'javob': false},
      ],
    },
  ];

  void _nextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _checkAnswer(bool isCorrect) {
    // Displaying a snackbar to show if the answer is correct or not
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? 'To\'g\'ri javob!' : 'Noto\'g\'ri javob!'),
        duration: const Duration(seconds: 1),
      ),
    );
    if (isCorrect) {
      _nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savollar'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: savollarlisti.length,
          itemBuilder: (_, index) {
            final question = savollarlisti[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.greenAccent,
                      ),
                      child: Center(
                        child: Text(
                          question['savol'],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                ...question['variant'].map<Widget>((variant) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _checkAnswer(variant['javob']);
                      },
                      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 40)),
                      child: Text(variant.keys.first + '. ' + variant.values.first),
                    ),
                  );
                }).toList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
