import 'package:flutter/material.dart';

class WordFilterTextField extends StatefulWidget {
  @override
  _WordFilterTextFieldState createState() => _WordFilterTextFieldState();
}

class _WordFilterTextFieldState extends State<WordFilterTextField> {
  final TextEditingController _controller = TextEditingController();
  final int maxWords = 70;

  int get currentWordCount {
    return _controller.text
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: _controller,
          maxLines: null,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          onChanged: (_) {
            setState(() {});
          },
          decoration: InputDecoration(
            isCollapsed: true,
            hintText: "Enter the words you want to filter.",
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Text(
            "${currentWordCount}/${maxWords} max.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
