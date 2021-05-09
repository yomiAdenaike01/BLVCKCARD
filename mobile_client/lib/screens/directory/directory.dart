import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_application/screens/directory/directory_resturant.dart';
import 'package:mobile_application/screens/resturant_details/resturant_details.dart';
import 'package:mobile_application/utils/constants.dart';
import 'package:mobile_application/utils/helpers.dart';

import 'dialogs/filter_dialog/filter_dialog.dart';
import 'dialogs/search/search.dart';
import 'directory_resturant.dart';

enum DirectoryView { list, map }

class ResturantDirectory extends StatefulWidget {
  @override
  _ResturantDirectoryState createState() => _ResturantDirectoryState();
}

class _ResturantDirectoryState extends State<ResturantDirectory> {
  Map<String, dynamic> _activeFilters = {};
  Set<Marker> _markers = {};
  DirectoryView _currentView = DirectoryView.list;
  String _resturantToViewId = '';
  bool _enabledSearch = false;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void _onSubmitFilters(filters) {
    setState(
      () {
        _activeFilters = filters;
      },
    );
  }

  Future<bool> _onViewDetails() {
    return showGeneralDialog(
      context: context,
      transitionBuilder: Helpers.dialogTransition,
      pageBuilder: (ctx, anim1, anim2) => ResturantDetails(),
    );
  }

  Future<bool> _onStartSearch() {
    return showGeneralDialog(
      context: context,
      pageBuilder: (ctx, _, __) => SearchDialog(),
    );
  }

  Future<bool> toggleFilters() {
    return showGeneralDialog(
      context: context,
      transitionBuilder: Helpers.dialogTransition,
      pageBuilder: (ctx, anim, anim2) {
        return FilterDialog(
          onSubmitFilters: _onSubmitFilters,
        );
      },
    );
  }

  void _changeView() {
    setState(() {
      if (_currentView == DirectoryView.list) {
        _currentView = DirectoryView.map;
      } else {
        _currentView = DirectoryView.list;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool res = false;
        if (_resturantToViewId.isNotEmpty) {
          setState(() {
            _resturantToViewId = '';
          });
        } else if (_currentView == DirectoryView.map) {
          setState(() {
            _currentView = DirectoryView.list;
          });
        } else if (_enabledSearch == true) {
          setState(() {
            _enabledSearch = false;
          });
        } else {
          res = true;
        }
        return res;
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            _currentView == DirectoryView.list
                ? ListView(
                    children: [
                      DirectoryResturant(
                        onViewDetails: () {
                          setState(() {
                            _resturantToViewId = '1';
                          });
                        },
                      ),
                      DirectoryResturant(
                        onViewDetails: _onViewDetails,
                      ),
                      DirectoryResturant(
                        onViewDetails: _onViewDetails,
                      ),
                      DirectoryResturant(
                        onViewDetails: _onViewDetails,
                      ),
                      DirectoryResturant(
                        onViewDetails: _onViewDetails,
                      ),
                      DirectoryResturant(
                        onViewDetails: _onViewDetails,
                      ),
                      DirectoryResturant(
                        onViewDetails: _onViewDetails,
                      ),
                      DirectoryResturant(
                        onViewDetails: _onViewDetails,
                      ),
                    ],
                  )
                : GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      controller.setMapStyle(Helpers.gMapsStyle);
                      if (!_controller.isCompleted) {
                        _controller.complete(controller);
                      }
                    },
                  ),
            _buildHeader(),
          ],
        ),
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
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kWhiteBackground),
                ),
                onPressed: () {
                  setState(() {
                    _enabledSearch = true;
                    _onStartSearch();
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.search),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text('Search'),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              TextButton.icon(
                onPressed: _changeView,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white24,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                  ),
                ),
                icon: Icon(
                  _currentView == DirectoryView.list
                      ? Icons.location_pin
                      : Icons.list,
                  size: kIconSize,
                ),
                label:
                    Text(_currentView == DirectoryView.list ? 'Map' : 'List'),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.white24,
                child: IconButton(
                  icon: const Icon(
                    Icons.sort,
                    size: kIconSize,
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
