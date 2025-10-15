import 'package:flutter/material.dart';
import 'package:nastea_billing/core/extensions/nastea_text_styles.dart';

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
              child: Text(
                '+91 ',
                style: NasteaTextStyles.body(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldLabel(String label, [double size = 14]) {
    return Text(
      label,
      style: NasteaTextStyles.body(fontSize: size, fontWeight: FontWeight.w600),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? prefixIcon;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.maxLines,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12), // Add margin here
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          hintText: hintText,
          hintStyle: NasteaTextStyles.body(fontSize: 14, color: Colors.black54),
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 24),
          fillColor: Color(0xFFF6F8FA),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFD8DADC), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFD8DADC), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFD8DADC), width: 1),
          ),
        ),
      ),
    );
  }
}
