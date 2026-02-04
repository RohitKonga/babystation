import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final bool selected;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? Color(0xFF9C278F) : Colors.transparent,
            width: 2,
          ),
          boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selected ? Color(0xFF9C278F) : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget addChildCard() {
  return Container(
    margin: const EdgeInsets.only(right: 12),
    child: Column(
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Center(
            child: Icon(Icons.add, color: Colors.white, size: 28),
          ),
        ),
        const SizedBox(height: 6),
        const Text("Add Child", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}

// 1. Add 'gender' as a parameter to the function
Widget profileCard(String name, String gender, {bool selected = false}) {
  return Container(
    margin: const EdgeInsets.only(right: 12),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? Colors.white : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              // 2. Use a ternary operator to switch images based on gender
              gender == "Girl"
                  ? "assets/images/girl.png"
                  : "assets/images/boy.png",
              height: 58,
              width: 58,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: TextStyle(
            color: selected ? Colors.white : Colors.white70,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

final List<String> banners = [
  "assets/banners/banner1.png",
  "assets/banners/banner2.png",
  "assets/banners/banner3.png",
];

final List<Map<String, String>> categories = [
  {"title": "Kids Toys", "image": "assets/categories/toys.png"},
  {"title": "Teddy Bear", "image": "assets/categories/teddy.png"},
  {"title": "Boys", "image": "assets/categories/boys.png"},
  {"title": "Shoes", "image": "assets/categories/shoes.png"},
  {"title": "Cribs", "image": "assets/categories/cribs.png"},
  {"title": "Moms", "image": "assets/categories/moms.png"},
  {"title": "Baby", "image": "assets/categories/baby.png"},
  {"title": "Health", "image": "assets/categories/health.png"},
];

class ChildProfile {
  final String name;
  final String gender; // "Boy" or "Girl"
  final String dob;

  ChildProfile({required this.name, required this.gender, required this.dob});
}

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String oldPrice;
  final String discount;
  final bool isHot;
  final bool isFavorite;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
    this.isHot = false,
    this.isFavorite = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade200)],
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                  ),
                  if (isHot)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: _buildBadge("HOT", Colors.orange),
                    ),
                  if (isFavorite)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite_border, size: 18),
                      ),
                    ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Takes only needed space
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          price,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        oldPrice,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  _buildBadge(discount, Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

final products = List.generate(4, (index) {
  return {
    "title": "Baby Gift Set 13 Pcs Set (Pink)",
    "image": "assets/products/gift.png",
    "price": "₹16.00",
    "oldPrice": "₹36.00",
    "discount": "50%",
    "isHot": index == 0,
    "isFavorite": index == 1,
  };
});

final List<String> brandLogos = [
  "assets/brands/marni.png",
  "assets/brands/frame.png",
  "assets/brands/philip.png",
  "assets/brands/hayden.png",
  "assets/brands/caranila.png",
];

/////////////////////////// SORT & FILTER ////////////////////////////////////////

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  // Track selections for each section
  Map<String, String> selectedFilters = {
    "Sort By": "Newest",
    "Price Range": "",
    "Age": "New born",
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.70,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // HEADER
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sort & Filters",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => setState(() => selectedFilters.clear()),
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Color(0xFF9C278F), fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SCROLLABLE CONTENT
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildFilterSection("Sort By", [
                  "Newest",
                  "Price: High - Low",
                  "Price: Low - High",
                  "Name: A - Z",
                  "Name: Z - A",
                ]),
                _buildFilterSection("Price Range", [
                  "₹100 - ₹200",
                  "₹200 - ₹400",
                  "₹400 - ₹600",
                  "₹600 - ₹800",
                  "Over ₹1000",
                ]),
                _buildFilterSection("Product Categories", [
                  "Womens",
                  "Boys' Clothing",
                  "Baby Care",
                  "Safety Equipment",
                  "Activity & Gear",
                  "Baby Shoes",
                ]),
                _buildFilterSection("Brand", [
                  "Baby Station",
                  "Carter's",
                  "Mini Berry",
                  "Kicks & crawl",
                  "Ollypop",
                ]),
                _buildFilterSection("Age", [
                  "New born",
                  "0-3 Months",
                  "3-6 Months",
                  "6-9 Months",
                  "9-12 Months",
                ]),
                _buildFilterSection("Discount", [
                  "10% - 20%",
                  "20% - 30%",
                  "30% - 40%",
                  "More than 40%",
                ]),
              ],
            ),
          ),

          // APPLY BUTTON
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9C278F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "APPLY",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionHeader(
          EdgeInsetsGeometry.symmetric(horizontal: 16.0, vertical: 10),
          title,
          Colors.grey.shade300,
        ),
        ...options.map((option) {
          return RadioListTile<String>(
            title: Text(option, style: const TextStyle(fontSize: 16)),
            value: option,
            groupValue: selectedFilters[title],
            activeColor: Color(0xFF9C278F),
            onChanged: (value) {
              setState(() => selectedFilters[title] = value!);
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            dense: true,
            visualDensity: VisualDensity.compact,
          );
        }).toList(),
        const SizedBox(height: 10),
      ],
    );
  }
}

Widget buildSectionHeader(EdgeInsetsGeometry padd, String title, Color color) {
  return Padding(
    padding: padd,
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(child: Divider(color: Colors.grey.shade300, thickness: 1)),
      ],
    ),
  );
}

class ProductImageSlider extends StatefulWidget {
  final List<String> images;

  const ProductImageSlider({super.key, required this.images});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int _currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // IMAGE VIEWPORT
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 14.0,
                  right: 14.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                    },
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),

            // SHARE & FAVORITE ICONS
            Positioned(
              top: 15,
              right: 15,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Row(
                  children: [
                    _buildCircleIcon(Icons.favorite_border),
                    const SizedBox(width: 10),
                    _buildCircleIcon(Icons.share_outlined),
                  ],
                ),
              ),
            ),

            // THE DOT INDICATOR (Positioned at bottom center)
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) => _buildDot(index),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // HELPER: BUILD ANIMATED DOT
  Widget _buildDot(int index) {
    bool isActive = _currentIndex == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      // Active dot is wider (pill shaped) like in your image
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF9C278F) : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Icon(icon, size: 20, color: Colors.black),
    );
  }
}

Widget buildAboutProductTab() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          "Detailed Description",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Text(
        "This product is crafted with 100% organic cotton, ensuring the highest level of comfort for your baby's sensitive skin. It features reinforced stitching for durability and easy-snap buttons for quick changes. \n\nOur design team focused on breathability and style, making this gift set a must-have for newborns. The fabric is pre-washed to prevent shrinking and maintains its softness even after multiple machine washes.",
        style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.6),
      ),
      SizedBox(height: 10),
    ],
  );
}

Widget buildColorOption(String img, bool selected) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(2),
    decoration: BoxDecoration(
      border: Border.all(
        color: selected ? Color(0xFF9C278F) : Colors.grey.shade300,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Image.asset(img, width: 50, height: 50),
  );
}

Widget buildDetailsTab() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Estimated Delivery: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "14 July - 18 July",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "SKU : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "kid1232568-UYV",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Categories: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Girls, Dress",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Tag: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "fashion, dress, girls, blue",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildRatingRow(String label, double value, String percentage) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.star, size: 22),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            child: LinearProgressIndicator(
              value: value,
              minHeight: 12,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 35,
          child: Text(
            percentage,
            style: const TextStyle(color: Colors.black87, fontSize: 18),
          ),
        ),
      ],
    ),
  );
}

Widget buildReviewRow(
  String name,
  int rating,
  String date,
  String description,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Row(
        children: [
          ...List.generate(
            5,
            (index) => Icon(
              Icons.star,
              size: 24,
              color: index < rating ? Colors.amber : Colors.grey[300],
            ),
          ),
          SizedBox(width: 10),
          const Text("|", style: TextStyle(color: Colors.grey, fontSize: 24)),
          SizedBox(width: 10),
          Text(date, style: TextStyle(color: Colors.grey, fontSize: 18)),
        ],
      ),
      SizedBox(height: 8),
      Text(description, style: TextStyle(color: Colors.grey, fontSize: 16)),
      SizedBox(height: 20),
    ],
  );
}

Widget buildReviewCard(
  String name,
  String imageUrl,
  double rating,
  String date,
  String comment,
) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(radius: 28, backgroundImage: AssetImage(imageUrl)),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      // Star Rating Logic
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 20,
                          color: index < rating
                              ? Colors.amber
                              : Colors.grey[300],
                        ),
                      ),
                      Text(
                        " | ${date}",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Text(comment, style: TextStyle(color: Colors.black87, height: 1.4)),
        SizedBox(height: 8),
        Text("6 days ago", style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    ),
  );
}

void showDeleteDialog(BuildContext context, int index) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              "Are you sure you want to\nremove the product from the cart?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: const BorderSide(color: Color(0xFF9C278F)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Color(0xFF9C278F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                // REMOVE BUTTON
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9C278F),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "REMOVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Safe area bottom padding
          ],
        ),
      );
    },
  );
}

final List<Map<String, dynamic>> cartItems = [
  {
    "name": "Baby Gift Set 13 Pcs Set (Pink)",
    "size": "S",
    "price": 16.00,
    "qty": 1,
  },
  {
    "name": "Baby Gift Set 13 Pcs Set (Pink)",
    "size": "S",
    "price": 16.00,
    "qty": 1,
  },
  {
    "name": "Baby Gift Set 13 Pcs Set (Pink)",
    "size": "S",
    "price": 16.00,
    "qty": 1,
  },
];

Widget buildCartItem(
  BuildContext context,
  Map<String, dynamic> item,
  int index,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
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
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 120,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset("assets/products/gift.png", fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              spacing: 3,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      width: 30,
                      height: 30,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => showDeleteDialog(context, index),
                        icon: Icon(
                          Icons.delete_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Size: ${item['size']}",
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  "₹${item['price']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                // Quantity Selector
                Container(
                  width: 100,
                  height: 32,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.remove, size: 16),
                      Text(
                        "${item['qty']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.add, size: 16, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildOrderInfo() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /////order & shipping
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Order No : ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: const Text(
                        "S12345678",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Jul 15, 2025 | 10:00:01 AM",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Shipping Address",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Text(
                  "402, Shree Krishna Heights, Near Gangeshwar, Adajan, Surat. 395009",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          /////////Payment & Billing
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Payment Method",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Text(
                  "My E-Wallet",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Billing Address",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Text(
                  "10, Hare Krishna Heights, Near Gangeshwar, Vesu, Surat. 395007",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
    ],
  );
}
