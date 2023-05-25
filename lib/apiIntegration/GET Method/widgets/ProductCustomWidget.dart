import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/product_model.dart';

class ProdutCustom extends StatelessWidget {
  final ProductModel productList;

  ProdutCustom(this.productList);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: CachedNetworkImage(
                    imageUrl: productList.image,
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productList.title!,
              maxLines: 2,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            if (productList.rating != null)
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      productList.rating!.rate.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
