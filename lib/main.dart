import 'package:checkout_payment1/core/utils/api_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'features/payment/presentation/views/checkout_view.dart';

void main() {
  Stripe.publishableKey = ApiKey.publishableKey;
  runApp(const Checkout());
}

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckoutView(),
    );
  }
}
