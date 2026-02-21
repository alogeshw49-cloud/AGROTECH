import 'package:flutter/material.dart';

class ConfidenceGauge extends StatelessWidget {
  final double confidence;

  const ConfidenceGauge({
    Key? key,
    required this.confidence,
  }) : super(key: key);

  Color _getColor(double conf) {
    if (conf >= 0.9) return Colors.green;
    if (conf >= 0.7) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final displayPercent = (confidence * 100).toStringAsFixed(1);
    final indicatorColor = _getColor(confidence);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'AI Confidence',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
            Text(
              '$displayPercent%',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: indicatorColor,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: confidence,
            minHeight: 12,
            backgroundColor: indicatorColor.withValues(alpha: 0.2),
            color: indicatorColor,
          ),
        ),
      ],
    );
  }
}
