import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/curved_edge/curvved_edge.dart';

class TCurveEdgeWidget extends StatelessWidget {
  const TCurveEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}