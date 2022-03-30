import 'package:flutter/material.dart';

/// A [DropdownButton] with items of type [T]
class DropDownMenu<T> extends StatefulWidget {
  /// DropDownMenu Initializer
  const DropDownMenu({
    required this.items,
    required this.initialItem,
    this.title = '',
    this.onItemSelected,
    Key? key,
  }) : super(key: key);

  /// Title of a widget to show before DropDown menu
  final String title;

  /// List of items
  final List<T> items;

  /// Initial item
  final T initialItem;

  /// Will be called whenever a new item is selected
  final void Function<T>(T item)? onItemSelected;

  @override
  _DropDownMenuState<T> createState() => _DropDownMenuState<T>();
}

class _DropDownMenuState<T> extends State<DropDownMenu<T>> {
  T? _item;

  @override
  void initState() {
    super.initState();

    _item = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Text(
            '${widget.title}: ',
            style: const TextStyle(color: Colors.indigo),
          ),
          const SizedBox(width: 12),
          DropdownButton<T>(
            value: _item,
            icon: const Icon(Icons.keyboard_arrow_down),
            underline: Container(height: 2, color: Colors.grey),
            onChanged: (T? newValue) {
              widget.onItemSelected!(newValue);
              setState(() {
                _item = newValue;
              });
            },
            items: widget.items
                .map<DropdownMenuItem<T>>((T value) => DropdownMenuItem<T>(
                      value: value,
                      child: Text('$value'),
                    ))
                .toList(),
          ),
        ],
      );
}
