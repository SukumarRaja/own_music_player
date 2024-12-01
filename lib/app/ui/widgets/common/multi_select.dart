import 'package:flutter/material.dart';

class MultiSelectList extends StatefulWidget {
  final List<dynamic> options;
  final List<dynamic> selectedOptions;
  final ValueChanged<List<dynamic>> onSelectionChanged;

  const MultiSelectList({
    super.key,
    required this.options,
    required this.selectedOptions,
    required this.onSelectionChanged,
  });

  @override
  State<MultiSelectList> createState() => _MultiSelectListState();
}

class _MultiSelectListState extends State<MultiSelectList> {
  late List<dynamic> _selectedOptions;

  @override
  void initState() {
    super.initState();
    _selectedOptions = widget.selectedOptions;
    _selectedOptions = <dynamic>[];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView(
        children: widget.options.map((option) {
          return CheckboxListTile(
            title: Text(option['name']),
            contentPadding: EdgeInsets.zero,
            subtitle: Text(option['phoneNumber']),
            value:
                _selectedOptions.any((e) => e['id'] == option['phoneNumber']),
            onChanged: (bool? selected) {
              setState(() {
                if (selected == true) {
                  _selectedOptions.add({
                    'id': option['phoneNumber'],
                    'name': option['name'],
                    'number': option['phoneNumber'],
                  });
                } else {
                  _selectedOptions
                      .removeWhere((e) => e['id'] == option['phoneNumber']);
                }
                widget.onSelectionChanged(_selectedOptions);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
