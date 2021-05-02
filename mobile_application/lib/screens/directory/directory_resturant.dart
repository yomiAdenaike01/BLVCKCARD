import 'package:flutter/material.dart';
import 'dart:math';

class DirectoryResturant extends StatelessWidget {
  final Function onViewDetails;
  DirectoryResturant({
    this.onViewDetails,
    Key key,
  }) : super(key: key);

  final int _randInt = new Random().nextInt(10) + 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onViewDetails();
      },
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) => LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.black26],
            ).createShader(rect),
            blendMode: BlendMode.darken,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.3,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/rest$_randInt.jpg'),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 9, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Akoto',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(
                                '30% off full menu',
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                buidTag(Icons.restaurant, 'West african'),
                                buidTag(Icons.pin_drop, 'Piccadilly circus'),
                              ],
                            ),
                            Row(
                              children: [
                                buidTag(Icons.restaurant, 'West african'),
                                buidTag(Icons.pin_drop, 'Piccadilly circus'),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white24,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buidTag(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Container(
        height: 20,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 6,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
