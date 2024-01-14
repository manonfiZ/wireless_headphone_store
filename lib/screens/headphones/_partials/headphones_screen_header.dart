import 'package:flutter/material.dart';

class HeadphonesScreenHeader extends StatefulWidget {
  const HeadphonesScreenHeader({
    super.key,
  });

  @override
  State<HeadphonesScreenHeader> createState() => _HeadphonesScreenHeaderState();
}

class _HeadphonesScreenHeaderState extends State<HeadphonesScreenHeader>
    with TickerProviderStateMixin {
//   Animation<Offset>? offsetOne;
//   AnimationController _controller;

  @override
  void initState() {
    // _controller = AnimationController(vsync: this);
    // offsetOne = Tween<Offset>(
    //         begin: const Offset(-100.0, 0.0), end: const Offset(0.0, 0.0))
    //     .animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: -100.0, end: 0.0),
          duration: const Duration(milliseconds: 300),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform(
              transform: Matrix4.identity()..translate(value),
              child: child,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wireless',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Headphones',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 100.0, end: 0.0),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.translate(
              //   transform: Matrix4.identity()..translate(value),
              offset: Offset(value, 0.0),
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/logo-dark.png',
            height: 100,
            width: 25,
          ),
        ),
      ],
    );
  }
}
