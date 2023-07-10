import 'package:flutter/material.dart';
import 'package:flutter_animations/container_animations_page.dart';
import 'package:flutter_animations/drag_and_drop.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.all(10),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const DragAndDropExample();
                      }));
                    },
                    child: const Text(
                      'Animated Container',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
