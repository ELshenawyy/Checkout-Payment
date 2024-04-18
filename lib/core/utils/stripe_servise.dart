import 'package:checkout_payment1/core/utils/api_servise.dart';
import 'package:checkout_payment1/features/payment/payment_intent_input_model.dart';

class StripeServise
{
  final ApiServise apiServise = ApiServise();

 Future<PaymentIntentInputModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async
 {
    var response = await apiServise.post(body: PaymentIntentInputModel.toJson(), url: "https://api.stripe.com/v1/payment_intents", token: ApiKey.secretKey, ); 
    
    var paymentIntentInputModel = PaymentIntentInputModel.fromJsom(response.data);

    return paymentIntentInputModel;
 }
}