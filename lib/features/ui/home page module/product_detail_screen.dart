import 'package:babystation/features/ui/home%20page%20module/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<String> _options = <String>[
    'New born',
    '0-3 Months',
    '3-6 Months',
    '6-9 Months',
  ];
  String? _selectedChoice = '0-3 Months';
  int _activeTabIndex = 0; // 0 for Details, 1 for Reviews

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF9C278F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Inside your ProductDetailScreen children list:
                ProductImageSlider(
                  images: [
                    product['image'],
                    'assets/products/gift.png',
                    'assets/products/gift.png',
                  ],
                ),
              ],
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 10,
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
                      offset: const Offset(0, 4), // shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE
                    Text(
                      product['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    /// RATING & REVIEWS
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "(1,200 Reviews)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// PRICE SECTION
                    Row(
                      children: [
                        const Text(
                          "Total Price: ",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          product['price'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          product['oldPrice'],
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "${product['discount']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    /// DESCRIPTION
                    const Text(
                      '''It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control.''',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Divider(height: 32, thickness: 1),

                    /// COLOR SELECTION
                    const Text(
                      "Color : Pink",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _buildColorOption(product['image'], true),
                        _buildColorOption(product['image'], false),
                        _buildColorOption(product['image'], false),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// AGE SELECTION (Placeholder based on your image)
                    const Text(
                      "Age",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: _options.map((String choice) {
                        bool isSelected = _selectedChoice == choice;

                        return ChoiceChip(
                          label: Text(choice),
                          selected: isSelected,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedChoice = selected ? choice : null;
                            });
                          },
                          selectedColor: const Color(0xFF9C27B0),
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                          elevation: 0,
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    /// ADD TO CART BUTTON
                    SizedBox(
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
                        onPressed: () {},
                        child: const Text(
                          "ADD TO CART",
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
              ),
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 10,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // TAB BAR UI
                    DefaultTabController(
                      length: 2,
                      child: TabBar(
                        onTap: (index) =>
                            setState(() => _activeTabIndex = index),
                        labelColor: const Color(0xFF9C278F),
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: const Color(0xFF9C278F),
                        tabs: const [
                          Tab(text: "Details"),
                          Tab(text: "About this product"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    _activeTabIndex == 0
                        ? buildDetailsTab()
                        : buildAboutProductTab(),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 10,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Customer Review",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // LARGE RATING NUMBER
                        const Text(
                          "4.6",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // STAR RATING AND COUNT
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "(1968 Rating)",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // RATING PROGRESS BARS
                    buildRatingRow("5", 0.5, "50%"),
                    buildRatingRow("4", 0.2, "20%"),
                    buildRatingRow("3", 0.1, "10%"),
                    buildRatingRow("2", 0.1, "10%"),
                    buildRatingRow("1", 0.1, "10%"),
                  ],
                ),
              ),
            ),
            /////////////////////////////////////////
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(String img, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? Colors.purple : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(img, width: 50, height: 50),
    );
  }
}
