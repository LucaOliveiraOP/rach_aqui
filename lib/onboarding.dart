import 'package:flutter/material.dart';
import 'package:rach_aqui_project/bordingwidget.dart';
// import 'package:rach_aqui_project/intro_screens/intro_page_1.dart';
// import 'package:rach_aqui_project/intro_screens/intro_page_2.dart';
// import 'package:rach_aqui_project/intro_screens/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          children: [
            ImageOverlayWidget(
                backgroundImage: 'assets/images/fundo1.svg',
                overlayImage: 'assets/images/Group1.png'),
            Container(
              color: Colors.red,
              child: const Center(
                child: Text('123'),
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text('123'),
              ),
            ),
            Container(
              color: Colors.green,
              child: const Center(
                child: Text('123'),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 279,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => _controller.jumpToPage(2),
                  child: const Text('SKIP')),
              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
              ),
              TextButton(
                  onPressed: () => _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
                  child: const Text('NEXT')),
            ],
          ),
        ),
      ),
    );
  }
}
