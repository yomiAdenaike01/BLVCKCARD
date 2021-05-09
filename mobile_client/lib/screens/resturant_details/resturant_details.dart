import 'package:flutter/material.dart';

import '../directory/dialogs/redeem/redeem_dialog.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import "../../utils/extensions/string_extensions.dart";

Map<int, String> days = {
  0: 'sunday',
  1: 'monday',
  2: 'tuesday',
  3: 'wednesday',
  4: 'thursday',
  5: 'friday',
  6: 'saturday',
};

class ResturantDetails extends StatelessWidget {
  Future<bool> _viewRedeemDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      transitionBuilder: Helpers.dialogTransition,
      pageBuilder: (_, __, ___) => RedeemDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) => LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.black26,
              ],
            ).createShader(
              rect,
            ),
            blendMode: BlendMode.darken,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rest1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                      icon: Icon(Icons.arrow_left),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: kRoundedWhiteButtonBackground,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.sort),
                          label: Text('Menu'),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: kWhiteBackground,
                        borderRadius: kCircleRadius,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          size: kIconSize,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Spacer(flex: 2),
                    Text(
                      'Akoto',
                      style: TextStyle(
                        fontSize: txtTheme.headline5.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        tag(),
                        tag(),
                        tag(),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding + 5),
                    Text(
                      '30% off full menu',
                      style: TextStyle(
                        fontSize: txtTheme.headline6.fontSize,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text('Mon'),
                        ),
                        Container(
                          child: Text('Mon'),
                        ),
                        Container(
                          child: Text('Mon'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'You must book and quote your membership number to confirm your discount. 30% off the full menu from 12:00am to 11:59pm.',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                        'Akoko is committed to serving classic dishes from across West Africa as well as forward-thinking snacks and desserts with an emphasis on using high quality produce from African and British suppliers. Akoko reflects our creativity and imagination, inspired by the traditions, art and culture of West Africa.'),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        categoryItem(),
                        categoryItem(),
                        categoryItem(),
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text('Redeem'),
                  Icon(
                    Icons.arrow_right,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container categoryItem() {
    return Container(
      child: Text('Halal'),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
          border: Border.all(
            color: Colors.white.withOpacity(.3),
          )),
    );
  }

  Row tag() {
    return Row(
      children: [
        Icon(Icons.restaurant),
        const SizedBox(
          width: kSmallPadding,
        ),
        Text(
          'West african',
          style: TextStyle(
            color: Colors.white.withOpacity(
              .8,
            ),
          ),
        ),
      ],
    );
  }
}
