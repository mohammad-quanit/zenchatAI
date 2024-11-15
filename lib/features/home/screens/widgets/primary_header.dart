import 'package:flutter/material.dart';
import 'package:zenchatai/common/widgets/containers/circular_container.dart';
import 'package:zenchatai/common/widgets/containers/curved_edges_container.dart';
import 'package:zenchatai/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Calculate 40% of the screen height
    final double containerHeight = MediaQuery.of(context).size.height * 0.4;

    return CurvedEdgesContainer(
      child: Container(
        color: ZColors.primary,
        child: SizedBox(
          height: containerHeight,
          child: Stack(children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: ZColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: ZColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ]),
        ),
      ),
    );
  }
}
