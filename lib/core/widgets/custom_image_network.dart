import 'package:flutter/material.dart';
import 'package:new_panel/core/constants/constants.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({Key? key , required this.url , this.boxFit}) : super(key: key);
  final String? url;
  final BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return  url != null ?Image.network(
      Constants.cdnBaseUrl+url!,
      cacheWidth: 100,
      cacheHeight: 100,
      fit: boxFit ?? BoxFit.cover,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Center(
          child: Icon(Icons.error_outline),
        );
      },
    ) : const Center(
      child: Icon(Icons.error_outline),
    );
  }
}
