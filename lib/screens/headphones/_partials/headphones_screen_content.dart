import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wireless_headphone_store/model/headphone.dart';
import 'package:wireless_headphone_store/screens/headphones/_partials/headphone_item_card.dart';
import 'package:wireless_headphone_store/screens/headphones/headphones_details.dart';

class HeadphonesScreenContent extends StatefulWidget {
  const HeadphonesScreenContent({super.key});

  @override
  State<HeadphonesScreenContent> createState() =>
      _HeadphonesScreenContentState();
}

class _HeadphonesScreenContentState extends State<HeadphonesScreenContent>
    with TickerProviderStateMixin {
  _goToScreen(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => widget),
    );
  }

  AnimationController? _animationController;
  Animation<double>? _firstTranslateAnimation;
  Animation<double>? _secondTranslateAnimation;
  Animation<double>? _rotationAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _firstTranslateAnimation =
        Tween<double>(begin: -200.0, end: 0.0).animate(_animationController!);

    _secondTranslateAnimation =
        Tween<double>(begin: 200.0, end: 0.0).animate(_animationController!);

    _rotationAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController!);

    Timer(const Duration(milliseconds: 1000), () {
      _animationController?.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _animationController!,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    alignment: Alignment.bottomLeft,
                    transform: Matrix4.identity()
                      ..translate(_firstTranslateAnimation?.value ?? 0.0)
                      ..rotateZ(-_rotationAnimation!.value * pi / 6),
                    child: child,
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    _goToScreen(
                      context,
                      HeadphoneDetails(
                        headphone: headphones[0],
                      ),
                    );
                  },
                  child: HeadphoneItemCard(
                    headphone: headphones[0],
                  ),
                ),
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _animationController!,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    alignment: Alignment.bottomRight,
                    transform: Matrix4.identity()
                      ..translate(_secondTranslateAnimation?.value ?? 0.0)
                      ..rotateZ(_rotationAnimation!.value * pi / 6),
                    child: child,
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    _goToScreen(
                      context,
                      HeadphoneDetails(
                        headphone: headphones[1],
                      ),
                    );
                  },
                  child: HeadphoneItemCard(
                    headphone: headphones[1],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _animationController!,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    alignment: Alignment.bottomLeft,
                    transform: Matrix4.identity()
                      ..translate(_firstTranslateAnimation?.value ?? 0.0)
                      ..rotateZ(-_rotationAnimation!.value * pi / 6),
                    child: child,
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    _goToScreen(
                      context,
                      HeadphoneDetails(
                        headphone: headphones[2],
                      ),
                    );
                  },
                  child: HeadphoneItemCard(
                    headphone: headphones[2],
                  ),
                ),
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _animationController!,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    alignment: Alignment.bottomRight,
                    transform: Matrix4.identity()
                      ..translate(_secondTranslateAnimation?.value ?? 0.0)
                      ..rotateZ(_rotationAnimation!.value * pi / 6),
                    child: child,
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    _goToScreen(
                      context,
                      HeadphoneDetails(
                        headphone: headphones[3],
                      ),
                    );
                  },
                  child: HeadphoneItemCard(
                    headphone: headphones[3],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
