import 'package:flutter/material.dart';
import 'package:wireless_headphone_store/model/headphone.dart';

class HeadphoneDetails extends StatefulWidget {
  const HeadphoneDetails({super.key, required this.headphone});

  final Headphone headphone;

  @override
  State<HeadphoneDetails> createState() => _HeadphoneDetailsState();
}

class _HeadphoneDetailsState extends State<HeadphoneDetails>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation =
        Tween<double>(begin: 1, end: 1.1).animate(_animationController!);

    TickerFuture? tickerFuture = _animationController?.repeat(reverse: true);

    tickerFuture?.timeout(const Duration(milliseconds: 500 * 4), onTimeout: () {
      _animationController?.forward();
      _animationController?.stop(canceled: true);
    });

    super.initState();
  }

  @override
  dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 32,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            // color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: AnimatedBuilder(
                          animation: _animationController!,
                          builder: (BuildContext context, Widget? child) {
                            return ScaleTransition(
                              scale: _scaleAnimation!,
                              child: child,
                            );
                          },
                          child: Hero(
                            tag: 'headphone-${widget.headphone.id}',
                            child: Image.asset(
                              widget.headphone.image,
                              height: MediaQuery.of(context).size.height * .5,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 300.0, end: 0.0),
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return Transform.translate(
                            offset: Offset(0.0, value),
                            child: child,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  color: Colors.grey,
                                  child: Text(
                                    'LIMITED EDITION'.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: widget.headphone.availableColors
                                      .map<HeadphoneColorItem>(
                                        (e) => HeadphoneColorItem(
                                          color: e,
                                          selected: false,
                                        ),
                                      )
                                      .toList(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.headphone.name,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CheckoutButton(widget: widget)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            child: Image.asset(
              'assets/images/logo-white.png',
              height: 150,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    required this.widget,
  });

  final HeadphoneDetails widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            children: [
              const Icon(
                Icons.shopping_cart,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.headphone.price,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeadphoneColorItem extends StatelessWidget {
  final Color color;
  final bool selected;
  const HeadphoneColorItem({
    super.key,
    required this.color,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        selected
            ? Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: color,
                    width: 2,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
