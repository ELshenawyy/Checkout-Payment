import 'package:bloc/bloc.dart';
import 'package:checkout_payment1/features/payment/data/repos/checkout_repo.dart';
import 'package:checkout_payment1/features/payment/payment_intent_input_model.dart';
import 'package:meta/meta.dart';

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
}
