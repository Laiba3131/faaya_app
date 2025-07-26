import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CoinButton extends StatelessWidget {
  final String label;
  final int coins;
  final Color coinBoxColor;
  final List<Color> mainBoxColors;

  const CoinButton({
    super.key,
    required this.label,
    required this.coins,
    required this.coinBoxColor,
    required this.mainBoxColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: mainBoxColors,
        ),
      ),
      child: Row(
        spacing: 6.0,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: coinBoxColor,
            ),
            child: Row(
              spacing: 8.0,
              children: [
                SvgPicture.asset(
                  AssetPaths.dollarSign,
                ),
                Text(
                  "$coins",
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
