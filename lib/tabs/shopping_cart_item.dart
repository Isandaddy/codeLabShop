import 'package:cupertino_app/models/product.dart';
import 'package:cupertino_app/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    @required this.product,
    @required this.lastItem,
    @required this.index,
    @required this.quantity,
    @required this.formatter,
  });
  final Product product;
  final int index;
  final bool lastItem;
  final int quantity;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
     final row = SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 8,
          top: 8,
          bottom: 8
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.cover,
                width: 40,
                height: 40
              ),
              ),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 12),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text(
                           product.name,
                           style: Styles.productRowItemName,
                         )
                       ],
                       ),
                       const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${quantity > 1 ? '$quantity x ' : ''}'
                      '${formatter.format(product.price)}',
                      style: Styles.productRowItemPrice,
                    ),
                   ],
                 ),
                 )
               ) 
          ],
        ),
      )
      );
      return row;
  }
}