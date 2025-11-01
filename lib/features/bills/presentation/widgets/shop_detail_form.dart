import 'package:flutter/material.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';

class ShopDetailsForm extends StatefulWidget {
  const ShopDetailsForm({super.key});

  @override
  State<ShopDetailsForm> createState() => _ShopDetailsFormState();
}

class _ShopDetailsFormState extends State<ShopDetailsForm> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController shopNameController;
  late final TextEditingController locationController;
  late final TextEditingController contactController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    shopNameController = TextEditingController();
    locationController = TextEditingController();
    contactController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    shopNameController.dispose();
    locationController.dispose();
    contactController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _fieldLabel('Shop Name'),
          CustomTextField(
            controller: shopNameController,
            hintText: 'Enter Shop Name',
            maxLines: 1,
          ),
          _fieldLabel('Location'),
          CustomTextField(
            controller: locationController,
            hintText: 'Enter Shop Location',
          ),
          _fieldLabel('Contact'),
          CustomTextField(
            controller: contactController,
            hintText: 'Enter Contact Name',
            maxLines: 1,
          ),
          _fieldLabel('Phone'),
          CustomTextField(
            controller: phoneController,
            hintText: 'Enter Phone Number',
            keyboardType: TextInputType.phone,
            maxLines: 1,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: NasteaText.body(
                '+91 ',
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldLabel(String label, [double size = 14]) {
    return NasteaText.body(label, fontSize: size, fontWeight: FontWeight.w600);
  }
}
