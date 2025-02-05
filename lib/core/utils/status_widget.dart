import 'package:flutter/material.dart';
import 'package:pokemon/core/utils/api_status.dart';
import 'package:pokemon/core/utils/custom_loader.dart';

import 'error_widget.dart';

class StatusWidget extends StatelessWidget {
  final ApiStatus status;
  final String error;

  const StatusWidget({
    required this.status,
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ApiStatus.loading:
        return const CustomLoader();

      case ApiStatus.error:
        return CustomErrorWidget(error: error);

      default:
        return const SizedBox();
    }
  }
}
