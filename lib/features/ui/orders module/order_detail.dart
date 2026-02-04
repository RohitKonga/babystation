import 'package:babystation/features/ui/helper.dart';
import 'package:babystation/features/ui/orders%20module/view_order.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Detail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF9C278F),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [buildOrderInfo(), _buildStatusCard()]),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionHeader(
            EdgeInsetsGeometry.only(bottom: 30),
            "Order Status",
            Colors.black,
          ),
          _buildStep(
            "Order Placed",
            "on Jul 15, 2025 | 10:00:01 AM",
            isDone: true,
          ),
          _buildStep(
            "Order Confirmed",
            "Usually confirms in 30 mins",
            isDone: true,
          ),
          _buildStep(
            "Out Of Delivery",
            "Will notify when order will out for delivery",
            isDone: true,
          ),
          _buildStep(
            "Completed",
            "Expected delivery in 45 mins",
            isDone: true,
            isLast: true,
            isCurrent: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStep(
    String title,
    String sub, {
    required bool isDone,
    bool isCurrent = false,
    bool isLast = false,
  }) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: isDone
                  ? const Color(0xFF9C278F)
                  : Colors.grey.shade400,
              child: Icon(Icons.check, color: Colors.white, size: 15),
            ),
            if (!isLast)
              Container(
                height: 50,
                width: 2,
                color: isDone ? const Color(0xFF9C278F) : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCurrent
                      ? const Color(0xFF9C278F)
                      : !isDone
                      ? Colors.grey
                      : Colors.black,
                ),
              ),
              Text(sub, style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Total Price", style: TextStyle(color: Colors.grey)),
              Text(
                "₹32.67",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              backgroundColor: const Color(0xFF9C278F),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewOrder()),
              );
            },
            child: const Text(
              "VIEW ORDER",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
