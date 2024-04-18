import 'package:checkout_payment1/core/widgets/custom_app_bar.dart';
import 'package:checkout_payment1/features/payment/presentation/views/widgets/payment_details_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Payment Details"),
      body: const PaymentDetailsViewBody(),
    );
  }
}
