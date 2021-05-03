import 'package:flutter/material.dart';
import 'package:mobile_application/utils/constants.dart';

class Invite extends StatefulWidget {
  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  TextEditingController _controller = TextEditingController();
  void initState() {
    super.initState();
    _controller.addListener(() {
      debugPrint(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDeepBlack,
        centerTitle: true,
        title: Text('Invite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: '2 ',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: 'friends have joined Blackboard',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    invitedFriend(invited: true),
                    invitedFriend(invited: true),
                    invitedFriend(),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Invite friends',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  hintText: 'Find friends to invite...',
                ),
              ),
            ),
            inviteUser(),
            inviteUser(),
            inviteUser(),
            inviteUser(),
            inviteUser(),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }

  Widget invitedFriend({bool invited = false, name = 'Yomi adenaike'}) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: kCircleRadius,
                border: Border.all(
                  color: invited ? Colors.green : Colors.transparent,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pravatar.cc/150',
                  ),
                ),
              ),
            ),
            Visibility(
              visible: invited,
              child: Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: kCircleRadius, color: Colors.green),
                  child: Icon(
                    Icons.check,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 6,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(.7),
            ),
          ),
        )
      ],
    );
  }

  Row inviteUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150',
              ),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Text(
              'Richard mobile',
              style: TextStyle(
                color: Colors.white.withOpacity(.7),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text('Invite'),
        )
      ],
    );
  }
}
