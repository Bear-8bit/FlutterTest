import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/curved_edge/curved_edge_widget.dart';
import 'package:flutter_store/app/config/utils/image_container/circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
        child: SizedBox(
          child: Container(
            color: Colors.red,
             child: Stack(
              children: [
                Positioned(top: -150, right: -250, child: CircularContainer(backgroundColor: Colors.white.withOpacity(0.1))),
                Positioned(top: 100, right: -300, child: CircularContainer(backgroundColor: Colors.white.withOpacity(0.1))),
                child,
              ],
             ),
          ),
      ),
    );
  }
}