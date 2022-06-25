import 'package:flutter/material.dart';
import 'package:trackspense/data/data_functions.dart';
import 'package:trackspense/theme/my_theme.dart';

List<String> imageOptions = <String>[
  "assets/images/alpaca.png",
  "assets/images/bat.png",
  "assets/images/bearded-dragon.png",
  "assets/images/beaver.png",
  "assets/images/beetle.png",
  "assets/images/boar.png",
  "assets/images/butterfly.png",
  "assets/images/cat.png",
  "assets/images/catfish.png",
  "assets/images/chameleon.png",
  "assets/images/chicken.png",
  "assets/images/cow.png",
  "assets/images/crocodile.png",
  "assets/images/deer.png",
  "assets/images/dog.png",
  "assets/images/dragonfly.png",
  "assets/images/duck.png",
  "assets/images/elephant.png",
  "assets/images/fox.png",
  "assets/images/frog.png",
  "assets/images/giraffe.png",
  "assets/images/goat.png",
  "assets/images/gorilla.png",
  "assets/images/hippo.png",
  "assets/images/horse.png",
  "assets/images/jellyfish.png",
  "assets/images/kangaroo.png",
  "assets/images/koala.png",
  "assets/images/ladybug.png",
  "assets/images/lion.png",
  "assets/images/monkey.png",
  "assets/images/mouse.png",
  "assets/images/otter.png",
  "assets/images/owl.png",
  "assets/images/panda.png",
  "assets/images/parrot.png",
  "assets/images/penguin.png",
  "assets/images/pig.png",
  "assets/images/pigeon.png",
  "assets/images/rabbit.png",
  "assets/images/raccoon.png",
  "assets/images/ray.png",
  "assets/images/rhino.png",
  "assets/images/sheep.png",
  "assets/images/sloth.png",
  "assets/images/snake.png",
  "assets/images/tiger.png",
  "assets/images/walrus.png",
  "assets/images/wolf.png",
  "assets/images/yak.png",
];

var imageSize = 40.0;

List<Widget> options = <Widget>[
  for (var image in imageOptions) Image.asset(image),
];

class ChangeImageWidget extends StatefulWidget {
  const ChangeImageWidget(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<ChangeImageWidget> createState() => _ChangeImageWidgetState();
}

class _ChangeImageWidgetState extends State<ChangeImageWidget> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      duration: const Duration(seconds: 15),
      elevation: 1,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(15),
      content: Stack(
        children: [
          Container(
              height: 600,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: secondaryLight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Choose preferred icon:",
                        style: TextStyle(color: white),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.close_rounded,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < 10; i++) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int j = 0; j < 5; j++) ...[
                          InkWell(
                            onTap: () async {
                              await changeImageDb(imageOptions[i * 5 + j]);
                              setState(() {
                                userImage = imageOptions[i * 5 + j];
                              });
                              // Navigator.pop(context);
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Image.asset(
                              imageOptions[i * 5 + j],
                              height: imageSize,
                              width: imageSize,
                            ),
                          ),
                        ]
                      ],
                    )
                  ]
                ],
              )),
          Positioned(
              right: 10,
              top: 10,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: Stack(
                  children: const [
                    InkWell(
                      child: SizedBox(),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

changeImageWidget(context) {
  return SnackBar(
    duration: const Duration(seconds: 15),
    elevation: 1,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.all(15),
    content: Stack(
      children: [
        Container(
            height: 600,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: secondaryLight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Choose preferred icon:",
                      style: TextStyle(color: white),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.close_rounded,
                        color: white,
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < 10; i++) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int j = 0; j < 5; j++) ...[
                        InkWell(
                          onTap: () async {
                            await changeImageDb(imageOptions[i * 5 + j]);
                            // Navigator.pop(context);
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: Image.asset(
                            imageOptions[i * 5 + j],
                            height: imageSize,
                            width: imageSize,
                          ),
                        ),
                      ]
                    ],
                  )
                ]
              ],
            )),
        Positioned(
            right: 10,
            top: 10,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: Stack(
                children: const [
                  InkWell(
                    child: SizedBox(),
                  ),
                ],
              ),
            )),
      ],
    ),
  );
}
