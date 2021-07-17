import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mix/size_config.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        width: getProportionateScreenWidth(140),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => WaitingItemImage(),
              errorWidget: (context, url, error) => ErrorItemImage(),
            ),
          ),
        ),
      );

      // return Image.network(
      //   url,
      //   loadingBuilder: (context, child, loadingProgress) =>
      //       WaitingItemImage(),
      //   errorBuilder: (context, error, stackTrace) => ErrorItemImage(),
      // );
    } catch (e) {
      print('خطأ أثناء جلب صورة المنتج');
      return ErrorItemImage();
    }

    // return CachedNetworkImage(
    //   imageUrl: url,
    //   progressIndicatorBuilder: (context, url, downloadProgress) =>
    //       CircularProgressIndicator(value: downloadProgress.progress),
    //   errorWidget: (context, url, error) => Icon(Icons.error),
    // );

    // return Image(image: CachedNetworkImageProvider(url));
  }
}

class ErrorItemImage extends StatelessWidget {
  const ErrorItemImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      child: Icon(Icons.error),
    );
  }
}

class WaitingItemImage extends StatelessWidget {
  const WaitingItemImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      color: Colors.black12,
    );
  }
}
