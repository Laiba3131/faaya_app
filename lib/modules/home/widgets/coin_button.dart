import 'package:flutter/material.dart';

class CoinButton extends StatelessWidget {
  final String label;
  final int coins;
  final Color color;
  const CoinButton(
      {super.key, required this.label, required this.coins, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 6),
          Icon(Icons.monetization_on, color: Colors.yellowAccent, size: 20),
          const SizedBox(width: 2),
          Text(
            coins.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
