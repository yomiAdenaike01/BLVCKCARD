import 'package:flutter/material.dart';
import 'package:mobile_application/screens/directory/redeem/redeem_dialog.dart';
import 'package:mobile_application/utils/helpers.dart';
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) => LinearGradient(
                colors: [
                  Colors.black12,
                  Colors.black,
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ).createShader(rect),
              blendMode: BlendMode.darken,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/rest1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: PageView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            children: [
                              Text(
                                'Affrito',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .fontSize,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Hello this is the other screen')
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      'Redeem',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: txtTheme.headline6.fontSize,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
