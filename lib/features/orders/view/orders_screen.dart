import 'package:babystation/features/home/view/cart_page.dart';
import 'package:babystation/core/widgets/widgets.dart';
import 'package:babystation/features/home/view/write_review.dart';
import 'package:babystation/features/orders/view/order_detail.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final headerColor = const Color(0xFF9C278F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Order",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: headerColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              icon: Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: buildSectionHeader(
              EdgeInsetsGeometry.symmetric(horizontal: 16.0),
              "Your Order",
              Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildOrderCard("Delivery", Colors.blue);
                  }
                  if (index == 1) {
                    return _buildOrderCard("Pending", Colors.orange);
                  }
                  return _buildOrderCard("Completed", Colors.green);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(String status, Color statusColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
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
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          spacing: 5,
          children: [
            Row(
              children: [
                Text("Order Number: "),
                Text(
                  "S12345678",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                _buildbadge(
                  status,
                  statusColor.withValues(alpha: 0.2),
                  statusColor,
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Text(
                  "Jul 15, 2025 | 10:00:01 AM",
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Text("₹32.67", style: TextStyle(color: headerColor)),
                const Text(
                  "●",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text("My E-Wallet"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              spacing: 10,
              children: [
                Icon(Icons.shopping_cart, color: headerColor),
                Text(
                  "Baby Gift Set 13 Pcs Set (Pink)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9C278F),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetail(),
                          ),
                        );
                      },
                      child: const Text(
                        "ORDER DETAIL",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                Flexible(
                  child: SizedBox(
                    height: 40,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF9C278F)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WriteReview(),
                          ),
                        );
                      },
                      child: const Text(
                        "WRITE REVIEW",
                        style: TextStyle(
                          color: Color(0xFF9C278F),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildbadge(String status, Color bgColor, Color statusColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: statusColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
