import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_assets.dart';

Widget buildNetworkImage(String? url,
    {BoxFit fit = BoxFit.cover, double? width, double? height}) {
  return Image.network(
    url ?? "https://via.placeholder.com/300",
    fit: fit,
    width: width,
    height: height,
    errorBuilder: (context, error, stackTrace) {
      return Image.asset(
        AppAssets.emptyListIcon,
        fit: fit,
        width: width,
        height: height,
      );
    },
  );
}
