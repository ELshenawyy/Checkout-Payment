import 'package:checkout_payment1/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment1/features/payment/presentation/views/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ThankYouCard(),
            ),
          );
        }
        if (state is PaymentFailure) {
          SnackBar snackBar = SnackBar(
            content: Text(state.errMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }
}
