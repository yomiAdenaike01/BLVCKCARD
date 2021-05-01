import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './../filter_dialog/filter_dialog.dart';
import 'resturant_item.dart';

enum DirectoryView { list, map }

class ResturantList extends StatefulWidget {
  @override
  _ResturantListState createState() => _ResturantListState();
}

class _ResturantListState extends State<ResturantList> {
  Map<String, dynamic> _activeFilters = {};
  Set<Marker> _markers = {};
  DirectoryView _currentView = DirectoryView.list;
  void _onSubmitFilters(filters) {
    setState(
      () {
        _activeFilters = filters;
      },
    );
  }

  Future<bool> toggleFilters() {
    return showGeneralDialog(
      context: context,
      pageBuilder: (ctx, anim, anim2) {
        return FilterDialog(
          onSubmitFilters: _onSubmitFilters,
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapStyle.styleJSON);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(
            22.5448131,
            88.3403691,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentView == DirectoryView.map) {
          setState(() {
            _currentView = DirectoryView.list;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            _currentView == DirectoryView.list
                ? ListView(
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
                  )
                : GoogleMap(
                    onMapCreated: _onMapCreated,
                    markers: _markers,
                    initialCameraPosition: CameraPosition(
                      zoom: 15,
                      target: LatLng(
                        22.5448131,
                        88.3403691,
                      ),
                    ),
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
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    if (_currentView == DirectoryView.list) {
                      _currentView = DirectoryView.map;
                    } else {
                      _currentView = DirectoryView.list;
                    }
                  });
                },
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
                  size: 15,
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

class MapStyle {
  static String styleJSON = ''' 
  [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]
  ''';
}
