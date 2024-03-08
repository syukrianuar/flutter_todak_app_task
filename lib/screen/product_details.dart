import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todak_app_task/model/product.dart';
import 'package:todak_app_task/screen/carts.dart';
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
        backgroundColor: Colors.transparent,
        // title: Text(product.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => CartsScreen()));
              },
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(product.thumbnail),
                width: double.infinity,
                fit: BoxFit.cover,
                height: 38.h,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              // textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              product.category,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'RM ${(product.price * ((100 - product.discountPercent) / 100)).toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'RM ${product.price.toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Colors.black.withOpacity(0.3),
                                    decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ),

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
            onPressed: () {
              _buyNowModal();
            },
            style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 1.5.h),
                backgroundColor: Theme.of(context).colorScheme.onBackground),
            child: Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ))
      ],
    );
  }
}
