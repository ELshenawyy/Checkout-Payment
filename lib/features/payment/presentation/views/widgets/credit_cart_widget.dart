import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        width: 305,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: const Color(0xffFFFFFF),
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/images/master_card.svg"),
            const SizedBox(
              width: 12,
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: "Credit Card\n", style: Styles.style18),
                  TextSpan(text: "Mastercard **78", style: Styles.style16),
                ],
              ),
            ),
          ],
        ));
  }
}
