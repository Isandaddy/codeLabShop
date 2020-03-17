import 'package:cupertino_app/models/app_state_model.dart';
import 'package:cupertino_app/tabs/product_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (BuildContext context, model, Widget child) {
        final products = model.getProducts();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Cupertino Store')
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if(index < products.length){
                      return ProductRowItem(
                        index: index,
                        product: products[index],
                        lastItem: index == products.length - 1,
                      );
                    }
                    return null;
                  }
                )
                ),
            )
          ],
        );
      },
    );
  }
}