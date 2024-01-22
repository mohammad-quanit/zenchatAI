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
    return CurvedEdgesContainer(
      child: Container(
        color: ZColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
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
