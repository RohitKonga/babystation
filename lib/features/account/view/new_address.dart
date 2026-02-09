import 'package:babystation/features/account/controller/address_controller.dart';
import 'package:babystation/features/account/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddress extends StatefulWidget {
  final AddressModel? address;
  const NewAddress({Key? key, this.address}) : super(key: key);

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  AddressController controller = Get.put(AddressController());
  bool _isChecked = false;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();
  final landmarkController = TextEditingController();

  static const Color primaryColor = Color(0xFF9C278F);
  @override
  void initState() {
    super.initState();
    if (widget.address != null) {
      nameController.text = widget.address!.name;
      phoneController.text = widget.address!.phoneNo;
      address1Controller.text = widget.address!.addressLine1;
      address2Controller.text = widget.address!.addressLine2;
      cityController.text = widget.address!.city;
      pincodeController.text = widget.address!.pincode;
      landmarkController.text = widget.address!.landmark ?? "";
      _isChecked = widget.address!.isDefault == "1";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          "Add new address",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add address",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            /// NAME + MOBILE
            Row(
              children: [
                Expanded(
                  child: _buildField(
                    "Recipient's Full Name*",
                    "Full Name",
                    nameController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildField(
                    "Mobile No*",
                    "Mobile No",
                    phoneController,
                    keyboard: TextInputType.phone,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// HOUSE / FLAT
            _buildField(
              "House No/Flat/Block/Floor*",
              "Flat, House no., Block, Floor",
              address1Controller,
            ),

            const SizedBox(height: 20),

            /// BUILDING / SOCIETY
            _buildField(
              "Building/Society/Street/colony Details*",
              "Building/Society/Street/colony Details",
              address2Controller,
            ),

            const SizedBox(height: 20),

            /// LANDMARK
            _buildField("Landmark", "Landmark", landmarkController),

            const SizedBox(height: 20),

            /// CITY + PINCODE
            Row(
              children: [
                Expanded(child: _buildField("City*", "City", cityController)),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildField(
                    "Pincode*",
                    "Pincode",
                    pincodeController,
                    keyboard: TextInputType.number,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// DEFAULT CHECKBOX
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  activeColor: Color(0xFF9C278F),
                  value: _isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isChecked = newValue ?? false;
                    });
                  },
                ),
                SizedBox(width: 6),
                Text(
                  "Make this my default address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),

      /// SAVE BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {
              controller.addAddress(
                name: nameController.text.trim(),
                phone: phoneController.text.trim(),
                address1: address1Controller.text.trim(),
                address2: address2Controller.text.trim(),
                city: cityController.text.trim(),
                pincode: pincodeController.text.trim(),
                isDefault: _isChecked,
              );
              Get.back(result: true);
            },
            child: const Text(
              "SAVE",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    String hint,
    TextEditingController controller, {
    TextInputType keyboard = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboard,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
