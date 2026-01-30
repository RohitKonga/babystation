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
            color: selected ? Colors.purple : Colors.transparent,
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
                  color: selected ? Colors.purple : Colors.grey,
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

Widget profileCard(String name, {bool selected = false}) {
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
              "assets/images/boy.png",
              height: 58,
              width: 58,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: TextStyle(color: selected ? Colors.white : Colors.white70),
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
  {
    "title": "Kids Toys",
    "image": "assets/categories/toys.png",
    "route": "/toys",
  },
  {
    "title": "Teddy Bear",
    "image": "assets/categories/teddy.png",
    "route": "/teddy",
  },
  {"title": "Boys", "image": "assets/categories/boys.png", "route": "/boys"},
  {"title": "Shoes", "image": "assets/categories/shoes.png", "route": "/shoes"},
  {"title": "Cribs", "image": "assets/categories/cribs.png", "route": "/cribs"},
  {"title": "Moms", "image": "assets/categories/moms.png", "route": "/moms"},
  {"title": "Baby", "image": "assets/categories/baby.png", "route": "/baby"},
  {
    "title": "Health",
    "image": "assets/categories/health.png",
    "route": "/health",
  },
];

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

  // Helper to keep code clean
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
