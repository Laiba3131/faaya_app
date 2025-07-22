import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinButton extends StatelessWidget {
  final String label;
  final int coins;
  final Color color;
  final Color insideContainerColor;
  const CoinButton(
      {super.key,
      required this.label,
      required this.coins,
      required this.color,
      required this.insideContainerColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          w4,
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: insideContainerColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetPaths.dollarSign,
                ),
               w0P5,
                Text(
                  coins.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
