import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _edittingEnabled = false;
  Future<bool> _showConfirmDialog({confirm: Function, cancel: Function}) async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Save changes ?'),
              content: Text(
                  'Are you sure you want to leave without saving your changes ?'),
              actions: [
                TextButton(
                    onPressed: () {
                      cancel();
                    },
                    child: Text('No')),
                TextButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    confirm();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                  child: _edittingEnabled
                      ? Stack(
                          children: [
                            Positioned(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.edit),
                              ),
                              bottom: 0,
                              right: 0,
                            )
                          ],
                        )
                      : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tomi Ladi'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.headline6.fontSize,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_edittingEnabled == false)
                  TextButton(
                    child: Text(
                      'Edit account',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _edittingEnabled = true;
                      });
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          _buildPrefTile(
            Icons.mail,
            'adenaikeyomi@gmail.com',
            _edittingEnabled,
          ),
          _buildPrefTile(
            Icons.phone,
            '07464707586',
            _edittingEnabled,
          ),
          Spacer(),
          _buildPrefTile(
            Icons.notifications,
            'Notifications',
            _edittingEnabled,
          ),
          _buildPrefTile(
            Icons.inbox,
            'Invite friends',
            _edittingEnabled,
          ),
          _buildPrefTile(
            Icons.question_answer,
            'FAQs',
            _edittingEnabled,
          ),
          _buildPrefTile(
            Icons.restaurant,
            'Suggest a resturant',
            _edittingEnabled,
          ),
          Spacer(),
          if (_edittingEnabled == false)
            _buildPrefTile(
              Icons.exit_to_app,
              'Sign out',
              _edittingEnabled,
            ),
        ],
      ),
    );
  }

  Widget _buildPrefTile(
    IconData icon,
    String label,
    bool edittingMode,
  ) {
    return edittingMode
        ? SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width / 2,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 50,
              child: Row(
                children: [
                  Icon(icon),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(label),
                ],
              ),
            ),
          );
  }
}
