import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:career/core/const/app_const.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.url,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
  });
  final String url;
  final Widget? errorWidget;
  final BoxFit? fit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      imageUrl: "${url.contains("http") ? "" : baseUrl}$url",
      placeholder: (context, url) {
        return BlurHash(
          hash: 'LKO2:N%2Tw=w]~RBVZRi};RPxuwH',
          imageFit: fit ?? BoxFit.fill,
        );
      },
      errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
    );
  }
}
