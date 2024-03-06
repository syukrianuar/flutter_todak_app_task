import 'package:flutter/material.dart';
import 'package:todak_app_task/model/product.dart';
import 'package:todak_app_task/widget/buy_now_modal_item.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    void _buyNowModal() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (ctx) => BuyNowModalItem(product: product));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          IconButton(
              onPressed: () {},
              icon:
                  //Implicit Animation
                  AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: Tween(begin: 0.7, end: 1.0).animate(animation),
                  child: child,
                ),
                child: Icon(Icons.trolley),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(product.thumbnail),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Descriptions',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            // for (int i = 0; i < 100; i++)
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
            // const SizedBox(
            //   height: 24,
            // ),
            // Text(
            //   'Steps',
            //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //       color: Theme.of(context).colorScheme.primary,
            //       fontWeight: FontWeight.bold),
            // ),
            // for (final step in meal.steps)
            //   Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            //     child: Text(
            //       step,
            //       textAlign: TextAlign.center,
            //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //             color: Theme.of(context).colorScheme.onBackground,
            //           ),
            //     ),
            //   )
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text('Add to Cart')),
        ElevatedButton(
            onPressed: () {
              _buyNowModal();
            },
            child: Text('Buy Now'))
      ],
    );
  }
}
