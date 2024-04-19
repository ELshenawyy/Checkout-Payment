import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:checkout_payment1/features/payment/data/repos/checkout_repo.dart';
import 'package:checkout_payment1/features/payment/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());

  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
      (l) => emit(
        PaymentFailure(l.errMessage),
      ),
      (r) => emit(
        PaymentSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
