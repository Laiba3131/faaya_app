import 'package:flutter/material.dart';

class MovingEmojiAvatar extends StatefulWidget {
  final String imagePath;

  const MovingEmojiAvatar({super.key, required this.imagePath});

  @override
  State<MovingEmojiAvatar> createState() => _MovingEmojiAvatarState();
}

class _MovingEmojiAvatarState extends State<MovingEmojiAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _positionAnimation = Tween<Offset>(
      begin: const Offset(0, 0), // Start at center
      end: const Offset(0.8, -0.8), // Move to top-right
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: CircleAvatar(
          radius: 12, // mic size (smaller than main avatar)
          backgroundImage: AssetImage(widget.imagePath),
        ),
      ),
    );
  }
}
