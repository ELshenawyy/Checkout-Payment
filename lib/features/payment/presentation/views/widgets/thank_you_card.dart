import 'package:checkout_payment1/core/utils/styles.dart';
import 'package:checkout_payment1/features/payment/presentation/views/widgets/custom_payment_item_value.dart';
import 'package:checkout_payment1/features/payment/presentation/views/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'credit_cart_widget.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: const Color(0xffEDEDED),
      ),
      child: Padding(
          padding: const EdgeInsets.only(top: 40 + 16, left: 12, right: 11),
          child: Column(
            children: [
              const Text(
                "Thank You",
                textAlign: TextAlign.center,
                style: Styles.style25,
              ),
              Text(
                "Your transaction was successful",
                textAlign: TextAlign.center,
                style: Styles.style20,
              ),
              const SizedBox(
                height: 30,
              ),
              const PaymentItemValue(
                title: 'Date',
                value: '01/24/2023',
              ),
              const SizedBox(
                height: 15,
              ),
              const PaymentItemValue(
                title: 'Time',
                value: '10:15 AM',
              ),
              const SizedBox(
                height: 15,
              ),
              const PaymentItemValue(
                title: 'To',
                value: 'Sam Louis',
              ),
              const Divider(
                thickness: 2,
                height: 30,
              ),
              const TotalPrice(
                title: "Total",
                value: r"$50.97",
              ),
              const SizedBox(
                height: 15,
              ),
              const CreditCardWidget(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.barcode,
                    size: 64,
                  ),
                  Container(
                    width: 113,
                    height: 58,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1.50, color: Color(0xFF34A853)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'PAID',
                        textAlign: TextAlign.center,
                        style: Styles.style24
                            .copyWith(color: const Color(0xff34A853)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
              ),
            ],
          )),
    );
  }
}
