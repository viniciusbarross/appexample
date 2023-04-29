import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  height: 18.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 14.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey[300]!,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
