import 'package:flutter/material.dart';
import 'package:flutter_animations/container_animations_page.dart';

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
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const ContainerAnimations();
                        }));
                      },
                      child: const Text(
                        'Animated Container',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ));
                },
                itemCount: 1,
                padding: const EdgeInsets.all(8),
              shrinkWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
