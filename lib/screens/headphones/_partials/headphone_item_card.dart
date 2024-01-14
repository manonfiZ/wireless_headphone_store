import 'package:flutter/material.dart';
import 'package:wireless_headphone_store/model/headphone.dart';

class HeadphoneItemCard extends StatelessWidget {
  const HeadphoneItemCard({
    super.key,
    required this.headphone,
  });

  final Headphone headphone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      //   height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: 'headphone-${headphone.id}',
              child: Image.asset(
                headphone.image,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            headphone.name,
            maxLines: 3,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            headphone.price,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                color: Colors.grey
                //   fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
