import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String? label;
  final IconData? icon;
  final Function(String)? onChanged;

  const CustomInput({
    Key? key,
    this.label,
    this.icon,
    this.onChanged,
  }): super(key: key);


  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),
      ),
    );
  }

}