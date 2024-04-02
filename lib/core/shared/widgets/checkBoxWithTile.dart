import 'package:flutter/material.dart';

class MyCheckBoxTile extends StatefulWidget {
  MyCheckBoxTile(
      {super.key,
      required this.onChanged,
      this.value = false,
      required this.title});
  final Function onChanged;
  late bool value;
  final Widget title;
  @override
  State<MyCheckBoxTile> createState() => _MyCheckBoxTileState();
}

class _MyCheckBoxTileState extends State<MyCheckBoxTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.value,
      onChanged: (value) {
        widget.onChanged(value);
        setState(() {
          widget.value = !widget.value;
        });
      },
      contentPadding: EdgeInsets.zero,
      checkboxShape: const CircleBorder(),
      title: widget.title,
    );
  }
}
