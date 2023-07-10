import 'package:flutter/material.dart';

class ContainerAnimations extends StatefulWidget {
  const ContainerAnimations({super.key});

  @override
  State<ContainerAnimations> createState() => _ContainerAnimationsState();
}

class _ContainerAnimationsState extends State<ContainerAnimations> {
  double width = 0;
  double height = 0;
  Color? color;

  @override
  void initState() {
    super.initState();
    width = 300;
    height = 300;
    color = Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                width = width == 300 ? 200 : 300;
                height = height == 300 ? 200 : 300;
                color = color == Colors.redAccent
                    ? Colors.indigo[300]
                    : Colors.redAccent;
              });
            },
            elevation: 10,
            backgroundColor: Colors.indigo[300],
            child: const Icon(
              Icons.change_circle_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
          body: Stack(
            children: [
              Positioned(
                  left: 10,
                  top: 10,
                  child: InkWell(
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )),
              Align(
                alignment: Alignment.center,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInBack,
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
