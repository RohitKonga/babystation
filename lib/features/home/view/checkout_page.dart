import 'package:babystation/features/account/view/manage_address.dart';
import 'package:babystation/features/home/view/payment_method.dart';
import 'package:babystation/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C278F),
        elevation: 0,
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: Color(0xFF9C278F)),
                        const Text(
                          " Delivery to",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9C278F),
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManageAddress(),
                            ),
                          ),
                          icon: Icon(Icons.edit, color: Color(0xFF9C278F)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
                      child: Text(
                        "Home - 402, Shree Krishna Heights, Near Gangeshwar, Adajan, Surat. 395009",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
              child: buildSectionHeader(
                EdgeInsetsGeometry.only(left: 16.0, right: 16.0),
                "3 items",
                Colors.black,
              ),
            ),

            Column(
              children: cartItems.asMap().entries.map((entry) {
                return buildCartItem(context, entry.value, entry.key);
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: buildSectionHeader(
                EdgeInsetsGeometry.only(right: 16.0, left: 16.0),
                "Promo Code",
                Colors.black,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 10.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "APPLY",
                        style: TextStyle(
                          color: Color(0xFF9C278F),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  hint: Text(
                    "Have a promo code?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  prefixIcon: Transform.flip(
                    flipX: true,
                    child: Icon(Icons.sell_outlined, color: Color(0xFF9C278F)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  spacing: 5,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub total",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        Text(
                          "₹ 48.00",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        Text(
                          "₹ 0",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coupon discount",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        Text(
                          "₹ 0",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "₹ 48.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 16.0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9C278F),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentMethod()),
                    );
                  },
                  child: const Text(
                    "CONTINUE TO PAYMENT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
