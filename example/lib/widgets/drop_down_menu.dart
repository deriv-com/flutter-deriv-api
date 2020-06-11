import 'package:flutter/material.dart';

class DropDownMenu<T> extends StatefulWidget {
  const DropDownMenu({
    Key key,
    this.title,
    this.items,
    this.selectedItem,
    this.onItemSelected,
  }) : super(key: key);

  final String title;
  final List<T> items;
  final T selectedItem;
  final void Function<T>(T item) onItemSelected;

  @override
  _DropDownMenuState<T> createState() => _DropDownMenuState<T>();
}

class _DropDownMenuState<T> extends State<DropDownMenu<T>> {

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Text(widget.title),
          const SizedBox(width: 8),
          DropdownButton<T>(
            value: widget.selectedItem,
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (T newValue) {
              setState(() {
                widget.onItemSelected(newValue);
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
