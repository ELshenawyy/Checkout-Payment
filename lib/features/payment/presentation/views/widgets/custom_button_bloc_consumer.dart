import 'dart:developer';

import 'package:checkout_payment1/core/utils/api_key.dart';
import 'package:checkout_payment1/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/amount_model/amount_model.dart';
import '../../../data/models/amount_model/details.dart';
import '../../../data/models/item_list_model/item.dart';
import '../../../data/models/item_list_model/item_list_model.dart';
import '../thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              //   PaymentIntentInputModel paymentIntentInputModel =
              //       PaymentIntentInputModel(
              //           amount: '100',
              //           currency: 'USD',
              //           customerId: 'cus_Px7484FL7ADRYV');
              //   BlocProvider.of<PaymentCubit>(context).makePayment(
              //       paymentIntentInputModel: paymentIntentInputModel);
              var transactionsData = getTransctionsData();
              exceutePaypalPayment(context, transactionsData);
            },
            isLoading: state is PaymentLoading ? true : false,
            title: 'Continue');
      },
    );
  }

  void exceutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKey.clientId,
        secretKey: ApiKey.paypalSecretKey,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
    var amount = AmountModel(
        total: "100",
        currency: 'USD',
        details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'));

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "5",
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
