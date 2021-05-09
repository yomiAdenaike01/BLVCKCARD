import 'package:flutter/material.dart';
import 'package:mobile_application/utils/constants.dart';
import 'dart:async';

class SearchDialog extends StatefulWidget {
  final Function(String search) onSearch;
  final Function(bool displayLoader) onToggleLoader;
  final bool isLoading;
  SearchDialog({this.isLoading, this.onSearch, this.onToggleLoader});
  @override
  _SearchDialogState createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  TextEditingController _controller = TextEditingController();
  Timer _dbounce;
  @override
  void dispose() {
    _controller.dispose();
    if (_dbounce != null) {
      _dbounce.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_dbounce.isActive) {
        _dbounce.cancel();
      } else {
        _dbounce = Timer(Duration(milliseconds: kDebounceDuration), () {
          widget.onSearch(_controller.text.toLowerCase());
          if (widget.isLoading) {
            widget.onToggleLoader(false);
          }
        });
        if (!widget.isLoading) {
          widget.onToggleLoader(true);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextField(
              autofocus: true,
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: kIconSize,
                ),
              ),
            ),
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
