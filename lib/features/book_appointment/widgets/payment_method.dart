import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/custom_container.dart';

class PaymentSelection {
  const PaymentSelection({required this.method, this.cardId});

  final String method;
  final String? cardId;

  @override
  String toString() => 'PaymentSelection(method: $method, cardId: $cardId)';
}

class PaymentOptionWidget extends StatefulWidget {
  const PaymentOptionWidget({
    super.key,
    this.initialSelection,
    this.onChanged,
  });

  final PaymentSelection? initialSelection;

  final ValueChanged<PaymentSelection>? onChanged;

  @override
  State<PaymentOptionWidget> createState() => _PaymentOptionWidgetState();
}

class _PaymentOptionWidgetState extends State<PaymentOptionWidget> {
  late String selectedPayment = widget.initialSelection?.method ?? 'credit_card';
  late String? selectedCardId =
      widget.initialSelection?.cardId ?? (cards.isNotEmpty ? cards.first.id : null);

  final List<_PaymentMethod> cards = const [
    _PaymentMethod(
      id: 'master_card',
      title: 'Master Card',
      assetPath: 'assets/icons/mastercard (1).png',
    ),
    _PaymentMethod(
      id: 'visa_card',
      title: 'Visa Card',
      assetPath: 'assets/icons/visa (1).png',
    ),
  ];

  void _emitChange() {
    widget.onChanged?.call(
      PaymentSelection(
        method: selectedPayment,
        cardId: selectedPayment == 'credit_card' ? selectedCardId : null,
      ),
    );
  }

  void _selectMethod(String value) {
    setState(() => selectedPayment = value);
    _emitChange();
  }

  void _selectCard(String cardId) {
    setState(() {
      selectedPayment = 'credit_card';
      selectedCardId = cardId;
    });
    _emitChange();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return CustomGlassCard(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.045,
        vertical: height * 0.018,
      ),
      borderRadius: 20,
      blur: 20,
      borderWidth: 1,
      borderColors: glass.borderColors,
      backgroundColor: glass.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Option',
            style: TextStyles.body.copyWith(
              fontWeight: FontWeight.w600,
              color: glass.hintText,
            ),
          ),

          SizedBox(height: height * 0.008),

          // Credit Card
          _PaymentRadioTile(
            title: 'Credit Card',
            value: 'credit_card',
            groupValue: selectedPayment,
            onChanged: _selectMethod,
            glass: glass,
          ),


          if (selectedPayment == 'credit_card')
            Padding(
              padding: EdgeInsets.only(left: width * 0.055),
              child: Column(
                children: List.generate(cards.length, (index) {
                  final card = cards[index];
                  final isSelected = card.id == selectedCardId;

                  return InkWell(
                    onTap: () => _selectCard(card.id),
                    child: Container(
                      height: height * 0.052,
                      decoration: BoxDecoration(
                        border: index == cards.length - 1
                            ? null
                            : Border(
                          bottom: BorderSide(
                            color: glass.hintText,
                            width: 0.6,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.06,
                            height: width * 0.06,
                            child: Radio<String>(
                              value: card.id,
                              groupValue: selectedCardId,
                              onChanged: (value) {
                                if (value != null) _selectCard(value);
                              },
                              activeColor: glass.primaryBlue,
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),

                          SizedBox(width: width * 0.015),

                          Container(
                            width: width * 0.065,
                            height: width * 0.065,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(5),
                              border: isSelected
                                  ? Border.all(color: glass.primaryBlue, width: 1)
                                  : null,
                            ),
                            child: Image.asset(
                              card.assetPath,
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(width: width * 0.025),

                          Expanded(
                            child: Text(
                              card.title,
                              style: TextStyles.bodySmall.copyWith(
                                color: glass.textPrimary,
                                fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),

          SizedBox(height: height * 0.006),

          // Bank Transfer
          _PaymentRadioTile(
            title: 'Bank Transfer',
            value: 'bank_transfer',
            groupValue: selectedPayment,
            onChanged: _selectMethod,
            glass: glass,
          ),

          // Paypal
          _PaymentRadioTile(
            title: 'Paypal',
            value: 'paypal',
            groupValue: selectedPayment,
            onChanged: _selectMethod,
            glass: glass,
          ),
        ],
      ),
    );
  }
}

class _PaymentRadioTile extends StatelessWidget {
  const _PaymentRadioTile({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.glass,
  });

  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;
  final GlassTheme glass;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => onChanged(value),
      child: SizedBox(
        height: 42,
        child: Row(
          children: [
            SizedBox(
              width: width * 0.06,
              height: width * 0.06,
              child: Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                },
                activeColor: glass.primaryBlue,
                materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),

            const SizedBox(width: 5),

            Text(
              title,
              style: TextStyles.bodySmall.copyWith(
                color: glass.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentMethod {
  final String id;
  final String title;
  final String assetPath;

  const _PaymentMethod({
    required this.id,
    required this.title,
    required this.assetPath,
  });
}