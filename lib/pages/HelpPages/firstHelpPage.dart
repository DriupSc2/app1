// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

//class firstHelpPage extends StatefulWidget {
//  const firstHelpPage({Key? key}) : super(key: key);

//  @override
//  _firstHelpPageState createState() => _firstHelpPageState();
//}

//class _firstHelpPageState extends State<firstHelpPage> {

class firstHelpPage extends StatefulWidget {
  const firstHelpPage({Key? key}) : super(key: key);

  @override
  _firstHelpPageState createState() => _firstHelpPageState();
}

class _firstHelpPageState extends State<firstHelpPage> {
  PageController controller = PageController(initialPage: 0);

  int currentPage = 0;

  final pages = List.generate(
    4,
        (index) => Container(
          alignment: Alignment.center,
          color: index.isEven ? Colors.cyanAccent : Colors.yellowAccent,
          child: Column(
            children: [
              if(index == 0){
                Image.asset(
                  'assets/icons/killaImage.png',
                  width: 600.0,
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
              }
              else

              Text(
                "zzzzz"
              )
            ],
          )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller,
          children: [...pages],
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  controller.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                });
              },
              icon: const Icon(Icons.arrow_left),
            ),
            Text(
              "${currentPage + 1}/${pages.length}",
            ),
            IconButton(
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              },
              icon: const Icon(Icons.arrow_right),
            )
          ],
        ));
  }
}