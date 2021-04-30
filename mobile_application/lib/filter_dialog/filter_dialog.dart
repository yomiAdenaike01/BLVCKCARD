import 'package:flutter/material.dart';

import 'filter_item.dart';
import './../utils/extensions/string_extensions.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String _currentSortBy = 'discount';
  List<Map<String, dynamic>> sortByList = [
    {
      'label': 'Discount',
      'icon': Icon(Icons.perm_device_information),
    },
    {
      'label': 'Nearest',
      'icon': Icon(Icons.near_me),
    },
    {
      'label': 'Most popular',
      'icon': Icon(Icons.fire_hydrant),
    }
  ];
  Map<String, bool> _activeAccordions = {
    'day': false,
    'location': false,
    'price_range': false,
    'dietry': false,
    'cuisine': false
  };
  Map<String, dynamic> _accordionFilterData = {
    'day': {
      'toSelect': [
        'Mon',
        'Tue',
        'Wed',
        'Thurs',
        'Fri',
        'Sat',
        'Sun',
      ],
      'selected': []
    },
    'location': {
      'toSelect': [
        'North',
        'East',
        'South',
        'West',
      ],
      'selected': []
    },
    'price_range': {
      'toSelect': [
        '£',
        '££',
        '£££',
        '££££',
      ],
      'selected': []
    },
    'dietry': {
      'toSelect': [
        'vegetarian',
        'vegan',
        'gluten-free',
        'halal',
        'allergy_friendly',
        'kosher'
      ],
      'selected': []
    },
    'cuisine': {
      'toSelect': [
        'american',
        'african',
        'british',
        'french',
        'latin_american',
        'n_african',
        'w_african',
        'carribean',
      ],
      'selected': []
    }
  };
  void _onTapAccordion(String e) {
    setState(
      () {
        _activeAccordions.update(e, (value) => !value);
        _activeAccordions.keys.map(
          (x) {
            if (x != e) {
              _activeAccordions.update(x, (value) => false);
            }
          },
        );
      },
    );
  }

  void _onClearSelectedFilter(String key) {
    setState(() {
      _accordionFilterData[key]['selected'] = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...sortByList.map(
              (x) => _buildUpperFilterItem(x),
            ),
            SizedBox(height: 30),
            ..._activeAccordions.keys.map(
              (e) => Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    FilterItem(
                      onClear: _onClearSelectedFilter,
                      onTapAccordion: _onTapAccordion,
                      accordionFilterData: _accordionFilterData,
                      activeAccordions: _activeAccordions,
                      currentKey: e,
                    ),
                    Visibility(
                      child: _buildDropDown(e),
                      visible: _activeAccordions[e] == true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CheckboxListTile _buildUpperFilterItem(Map<String, dynamic> x) {
    return CheckboxListTile(
      title: Text(
        x['label'],
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      value: _currentSortBy == x['label'],
      onChanged: (val) {
        setState(() {
          if (_currentSortBy == x['label']) {
            _currentSortBy = '';
          } else {
            _currentSortBy = x['label'];
          }
        });
      },
    );
  }

  Widget _buildDropDown(String key) {
    var _filterSelection = _accordionFilterData[key]['toSelect'];
    var _filterSelectedItems = _accordionFilterData[key]['selected'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Wrap(
            children: [
              ..._filterSelection.map(
                (filterItem) => _buildMiniCheckboxItem(
                  filterItem,
                  _filterSelectedItems,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  CheckboxListTile _buildMiniCheckboxItem(filterItem, _filterSelectedItems) {
    return CheckboxListTile(
      title: Text(
        filterItem.toString().makePretty,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      value: _filterSelectedItems.indexOf(filterItem) > -1,
      onChanged: (e) {
        setState(() {
          int _index = _filterSelectedItems.indexOf(filterItem);
          if (_index == -1) {
            _filterSelectedItems.add(filterItem);
          } else {
            _filterSelectedItems.removeAt(_index);
          }
        });
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF3333),
      title: Text('Sort and filter'),
      centerTitle: true,
      leading: InkWell(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
