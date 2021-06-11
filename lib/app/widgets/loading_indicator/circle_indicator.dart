import 'dart:math' as math show sin, pi;
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

/// {@template fading_circle}
/// {@endtemplate}
class FadingCircle extends StatefulWidget {
  /// {@marco fading_circle}
  const FadingCircle({
    Key? key,
    this.color = Colors.white,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  /// Use to set circle color
  final Color color;

  /// Use to set circle size
  final double size;

  /// A child widget
  final IndexedWidgetBuilder? itemBuilder;

  /// A duration of animation
  final Duration duration;

  /// Animation controler
  final AnimationController? controller;

  @override
  _FadingCircleState createState() => _FadingCircleState();
}

class _FadingCircleState extends State<FadingCircle>
    with SingleTickerProviderStateMixin {
  final List<double> delays = [
    .0,
    -1.1,
    -1.0,
    -0.9,
    -0.8,
    -0.7,
    -0.6,
    -0.5,
    -0.4,
    -0.3,
    -0.2,
    -0.1
  ];
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    // ignore: unnecessary_this
    final controller = this._controller;
    if (controller != null) {
      _controller!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(12, (i) {
            final _position = widget.size * .5;
            return Positioned.fill(
              left: _position,
              top: _position,
              child: Transform(
                transform: Matrix4.rotationZ(30.0 * i * 0.0174533),
                child: Align(
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: DelayTween(begin: 0.0, end: 1.0, delay: delays[i])
                        .animate(_controller!),
                    child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(i)),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

/// `DelayTween` an custom interpolaration based on Tween
class DelayTween extends Tween<double> {
  /// Constructor
  DelayTween({double? begin, double? end, required this.delay})
      : super(begin: begin, end: end);

  /// Delay time intervale
  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
