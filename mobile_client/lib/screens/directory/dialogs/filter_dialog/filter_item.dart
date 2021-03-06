import 'package:flutter/material.dart';
import '../../../../utils/extensions/string_extensions.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key key,
    this.accordionFilterData,
    this.activeAccordions,
    this.currentKey,
    this.onTapAccordion,
    this.onClear,
  }) : super(key: key);

  final Map<String, dynamic> accordionFilterData;
  final Map<String, bool> activeAccordions;
  final String currentKey;
  final Function(String currentKey) onTapAccordion, onClear;

  @override
  Widget build(BuildContext context) {
    bool _isOpen = activeAccordions[currentKey] == true;
    List<dynamic> _selectedItems = accordionFilterData[currentKey]['selected'];
    return ListTile(
      trailing: Visibility(
        visible: _selectedItems.length > 0,
        child: _isOpen
            ? TextButton(
                child: Text(
                  'Clear',
                ),
                onPressed: () {
                  onClear(currentKey);
                },
              )
            : Text(
                '${_selectedItems.length} selected',
              ),
      ),
      tileColor: Color(0xFF121212),
      title: Text(
        currentKey.makePretty,
      ),
      leading: Icon(
        _isOpen ? Icons.remove : Icons.add,
      ),
      onTap: () {
        onTapAccordion(currentKey);
      },
    );
  }
}
