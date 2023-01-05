import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:mix/mix.dart";
import 'package:pokedex/app/core/assets.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    this.show = false,
    required this.child,
  }) : super(key: key);

  final bool show;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget component = Stack(
      children: [
        child,
        if (show) _buildBackdrop(),
      ],
    );

    return component;
  }

  Widget _buildBackdrop() {
    final style = Mix(bgColor(Colors.black54));
    return Box(mix: style, child: _buildAlertLoading());
  }

  Widget _buildAlertLoading() {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SizedBox(
        height: 300,
        width: 300,
        child: GestureDetector(
          onDoubleTap: () {},
          onVerticalDragUpdate: (update) {},
          onHorizontalDragUpdate: (update) {},
          child: Lottie.asset(
            Assets.animationLoadingPokebola,
          ),
        ),
      ),
    );
  }
}
