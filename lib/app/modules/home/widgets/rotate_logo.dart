import 'package:flutter/material.dart';

class RotateLogo extends StatefulWidget {
  @override
  _RotateLogoState createState() => _RotateLogoState();
}

class _RotateLogoState extends State<RotateLogo> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
          turns: _animation,
          child: Image.asset(
            "assets/convertio_logo.png",
            height: 80,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Aguarde enquanto atualizamos os dados...",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
