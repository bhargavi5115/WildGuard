import 'package:flutter/material.dart';
import '../models/species.dart';

/// A reusable badge widget that displays the IUCN Red List conservation status
/// with standard color coding and clear typography.
class ConservationStatusBadge extends StatelessWidget {
  final ConservationStatus status;
  final bool compact;

  const ConservationStatusBadge({
    super.key,
    required this.status,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = status.color;
    final bgColor = status.backgroundColor;

    return Semantics(
      label: 'Conservation Status: ${status.displayName}',
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 7 : 10,
          vertical: compact ? 3 : 5,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: statusColor.withValues(alpha: 0.35),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              compact ? status.code : '${status.code} • ${status.displayName}',
              style: TextStyle(
                color: statusColor,
                fontSize: compact ? 11 : 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
