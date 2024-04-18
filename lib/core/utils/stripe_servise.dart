import 'package:checkout_payment1/core/utils/api_service.dart';
import 'package:checkout_payment1/features/payment/payment_intent_input_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'api_key.dart';

class StripeService {
  final ApiServise apiService = ApiServise();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKey.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet({required String customerEphemeralKeySecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerEphemeralKeySecret: customerEphemeralKeySecret,
        merchantDisplayName: "Elshnawy",
      ),
    );
  }
}
