import 'package:babystation/features/account/controller/address_controller.dart';
import 'package:babystation/features/account/model/address_model.dart';
import 'package:babystation/features/account/view/new_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({super.key});

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  final AddressController controller = Get.find<AddressController>();

  @override
  void initState() {
    super.initState();
    controller.fetchAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C278F),
        elevation: 0,
        title: const Text(
          "Manage Address",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.addressList.isEmpty) {
          return const Center(child: Text("No Address Found"));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.addressList.length,
          itemBuilder: (context, index) {
            final address = controller.addressList[index];
            return _buildAddressCard(address, index);
          },
        );
      }),
      bottomNavigationBar: _buildBottomActionButtons(),
    );
  }

  Widget _buildAddressCard(AddressModel address, int index) {
    return Obx(() {
      final isSelected = controller.selectedAddressId.value == address.id;
      return GestureDetector(
        onTap: () => controller.selectAddress(address.id),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? const Color(0xFF9C278F) : Colors.transparent,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFF9C278F)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "${address.addressLine1}, ${address.addressLine2}, ${address.city} - ${address.pincode}",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Radio<int>(
                value: address.id,
                groupValue: controller.selectedAddressId.value,
                activeColor: Color(0xFF9C278F),
                onChanged: (value) =>
                    controller.selectedAddressId.value = value!,
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Color(0xFF9C278F)),
                onPressed: () {
                  Get.to(() => NewAddress(address: address));
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildBottomActionButtons() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF9C278F)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                final result = await Get.to(() => const NewAddress());

                if (result == true) {
                  controller.fetchAddress();
                }
              },
              child: const Text(
                "ADD NEW ADDRESS",
                style: TextStyle(
                  color: Color(0xFF9C278F),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9C278F),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                controller.applySelectedAddress();
              },
              child: const Text(
                "APPLY",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
