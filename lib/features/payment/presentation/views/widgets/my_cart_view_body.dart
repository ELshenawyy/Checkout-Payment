import 'package:checkout_payment1/core/widgets/custom_button.dart';
import 'package:checkout_payment1/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:checkout_payment1/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment1/features/payment/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:checkout_payment1/features/payment/presentation/views/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/basket_image.png",
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const MyCardInfoItem(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const MyCardInfoItem(
            title: 'Discount',
            value: r'$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const MyCardInfoItem(
            title: 'Shipping',
            value: r'$8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
            title: "Total",
            value: r"$50.97",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            title: "Complete Payment",
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const PaymentDetailsView(),
              //   ),
              // );
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(
                        CheckoutRepoImpl(),
                      ),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
