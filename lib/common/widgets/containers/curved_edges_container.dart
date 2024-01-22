import 'package:flutter/material.dart';
import 'package:zenchatai/common/styles/curved_edges.dart';

class CurvedEdgesContainer extends StatelessWidget {
  const CurvedEdgesContainer({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CurvedEdges(), child: child);
  }
}
