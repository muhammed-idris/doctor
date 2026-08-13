import 'package:doctor/features/book_appointment/widgets/payment_method.dart';
import 'package:flutter/material.dart';

class StepTwoScreen extends StatefulWidget {
  const StepTwoScreen({
    super.key,
    required this.selectedPayment,
    required this.onPaymentSelected,
  });

  final PaymentSelection selectedPayment;
  final ValueChanged<PaymentSelection> onPaymentSelected;

  @override
  State<StepTwoScreen> createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaymentOptionWidget(
          initialSelection: widget.selectedPayment,
          onChanged: widget.onPaymentSelected,
        )
      ],
    );
  }
}