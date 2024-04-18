import 'package:checkout_payment1/core/errors/failures.dart';
import 'package:checkout_payment1/core/utils/stripe_service.dart';
import 'package:checkout_payment1/features/payment/data/repos/checkout_repo.dart';
import 'package:checkout_payment1/features/payment/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
