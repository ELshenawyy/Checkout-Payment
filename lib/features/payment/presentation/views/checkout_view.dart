import 'package:checkout_payment1/features/payment/presentation/views/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart"),
      body:  const MyCartViewBody(),
    );
  }

}