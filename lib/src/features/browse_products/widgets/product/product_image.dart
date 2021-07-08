import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    try {
      String url = "https://mixcart.com.tr/storage/${product.images[0].image}";
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => WaitingProductImage(),
        errorWidget: (context, url, error) => ErrorProductImage(),
      );

      // return Image.network(
      //   url,
      //   loadingBuilder: (context, child, loadingProgress) =>
      //       WaitingProductImage(),
      //   errorBuilder: (context, error, stackTrace) => ErrorProductImage(),
      // );
    } catch (e) {
      print('خطأ أثناء جلب صورة المنتج');
      return ErrorProductImage();
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

class ErrorProductImage extends StatelessWidget {
  const ErrorProductImage({
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

class WaitingProductImage extends StatelessWidget {
  const WaitingProductImage({
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
