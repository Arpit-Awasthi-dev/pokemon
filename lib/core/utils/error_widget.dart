import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;

  const CustomErrorWidget({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.playlist_remove,
            size: 60,
            color: context.textTheme.labelMedium!.color,
          ),
          const SizedBox(height: 12),
          Text(
            error,
            style: context.textTheme.labelMedium!.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
