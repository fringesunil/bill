import 'dart:async';

import 'package:billapp/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _highlightedIndex = 0;
  final List<String> words = [
    "Goal-setting",
    "Dedication",
    "Workflow",
    "Efficiency",
    "Concentration",
    "Discipline",
    "Balance",
    "Productivity",
    "Time Manager",
    "Performance",
    "Focus"
  ];

  @override
  void initState() {
    super.initState();
    _startHighlighting();
  }

  void _startHighlighting() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _highlightedIndex = (_highlightedIndex + 1) % words.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0XFFF77564),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < words.length; i++)
                  AnimatedOpacity(
                    opacity: _highlightedIndex == i ? 1.0 : 0.3,
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      children: [
                        Text(
                          words[i],
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                width: size.width,
                height: size.height * 0.10,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Get Started",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
