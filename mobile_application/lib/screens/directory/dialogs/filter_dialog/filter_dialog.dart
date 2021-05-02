import 'package:flutter/material.dart';

import 'filter_item.dart';
import '../../../../utils/extensions/string_extensions.dart';

class FilterDialog extends StatefulWidget {
  final Function(Map<String, dynamic> filters) onSubmitFilters;
  const FilterDialog({
    Key key,
    @required this.onSubmitFilters,
  }) : super(key: key);
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String _currentSortBy = 'discount';
  List<Map<String, dynamic>> sortByList = [
    {
      'label': 'Discount',
      'icon': Icons.perm_device_information,
    },
    {
      'label': 'Nearest',
      'icon': Icons.near_me,
    },
    {
      'label': 'Most popular',
      'icon': Icons.fire_hydrant,
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

  void _onClearAll() {
    setState(
      () {
        _accordionFilterData.keys.map(
          (e) {
            _accordionFilterData[e]['selected'] = [];
          },
        );
      },
    );
  }

  bool _hasAFilterBeenSelected() {
    return [..._accordionFilterData.keys].indexWhere(
          (element) {
            return _accordionFilterData[element]['selected'].length > 0;
          },
        ) >
        -1;
  }

  void _submitFilters() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        title: const Text('Sort and filter'),
        centerTitle: true,
        actions: [
          Visibility(
            child: TextButton.icon(
              icon: const Text(
                'Clear all',
              ),
              label: const Icon(
                Icons.close,
              ),
              onPressed: _onClearAll,
            ),
            visible: _hasAFilterBeenSelected(),
          )
        ],
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: const Text(
                'Sort by',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Column(
                children: [
                  ...sortByList.map(
                    (x) => _buildUpperFilterItem(x),
                  ),
                ],
              ),
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
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _submitFilters,
                    child: const Text(
                      'APPLY',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpperFilterItem(Map<String, dynamic> x) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_currentSortBy == x['label']) {
            _currentSortBy = '';
          } else {
            _currentSortBy = x['label'];
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 10,
        ),
        child: Container(
          height: 22,
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Row(
            children: [
              Icon(
                x['icon'],
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                x['label'],
              ),
              const Spacer(),
              Visibility(
                child: Icon(
                  Icons.check,
                ),
                visible: _currentSortBy == x['label'],
              )
            ],
          ),
        ),
      ),
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
            spacing: 10,
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

  Widget _buildMiniCheckboxItem(filterItem, _filterSelectedItems) {
    int _index = _filterSelectedItems.indexOf(filterItem);
    bool _isSelected = _index > -1;
    return TextButton.icon(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
        _isSelected ? Colors.brown : Colors.transparent,
      )),
      onPressed: () {
        setState(
          () {
            if (!_isSelected) {
              _filterSelectedItems.add(filterItem);
            } else {
              _filterSelectedItems.removeAt(_index);
            }
          },
        );
      },
      icon: Icon(
        _isSelected ? Icons.check : Icons.add,
        size: 16,
      ),
      label: Text(
        filterItem.toString().makePretty,
      ),
    );
  }
}
