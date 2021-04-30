import 'package:flutter/material.dart';

import './../filter_dialog/filter_dialog.dart';
import 'resturant_item.dart';

class ResturantList extends StatefulWidget {
  @override
  _ResturantListState createState() => _ResturantListState();
}

class _ResturantListState extends State<ResturantList> {
  Future<bool> toggleFilters() {
    return showGeneralDialog(
        context: context,
        pageBuilder: (ctx, anim, anim2) {
          return FilterDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          ListView(
            children: [
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
              const ResturantListItem(),
            ],
          ),
          _buildHeader(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white30,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white24,
                child: IconButton(
                  icon: const Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                  onPressed: toggleFilters,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
