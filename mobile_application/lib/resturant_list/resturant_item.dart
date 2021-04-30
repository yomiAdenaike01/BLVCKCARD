import 'package:flutter/material.dart';

class ResturantListItem extends StatelessWidget {
  const ResturantListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            decoration: const BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/rest2.jpg'),
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  const Text(
                    'Akoto',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '30% off full menu',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          buidTag(Icons.kitchen, 'West african'),
                          buidTag(Icons.pin_drop, 'Piccadilly circus'),
                        ],
                      ),
                      Row(
                        children: [
                          buidTag(Icons.kitchen, 'West african'),
                          buidTag(Icons.pin_drop, 'Piccadilly circus'),
                        ],
                      )
                    ],
                  )
                ],
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
    );
  }

  TextButton buidTag(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
