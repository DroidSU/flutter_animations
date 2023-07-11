import 'package:flutter/material.dart';

class DragAndDropExample extends StatefulWidget {
  const DragAndDropExample({super.key});

  @override
  State<DragAndDropExample> createState() => _DragAndDropExampleState();
}

class _DragAndDropExampleState extends State<DragAndDropExample> {
  String imageUrl = "";
  List<String> urlList = [
    "https://images.unsplash.com/photo-1628840042765-356cda07504e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVwcGVyb25pJTIwcGl6emF8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",
    "https://cheeseknees.com/wp-content/uploads/2021/12/Cheese-Ravioli-06-1.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12,
            ),
            child: DragTarget<int>(
              builder: (context, candidateItems, rejectedItems) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          height: 200,
                          width: 200,
                          fit: BoxFit.fill,
                        )
                      : null,
                );
              },
              onAccept: (index) {
                print("Received dragged item");
                setState(() {
                  imageUrl = urlList[index];
                });
              },
            ),
          ),
          Container(
            height: 150,
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Draggable<int>(
                    data: index,
                    dragAnchorStrategy: pointerDragAnchorStrategy,
                    feedback: Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          urlList[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          urlList[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          urlList[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 10),
                shrinkWrap: true,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
