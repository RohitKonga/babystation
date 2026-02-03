import 'package:babystation/features/ui/home%20page%20module/cart_page.dart';
import 'package:babystation/features/ui/home%20page%20module/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headerColor = const Color(0xFF9C278F);

    final String categoryName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: headerColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.tune),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      endDrawer: const FilterDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.center,
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.orange),
                  hintText: "Search for a Category, Brand or Product",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 14.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];

                return ProductCard(
                  title: item["title"] as String,
                  image: item["image"] as String,
                  price: item["price"] as String,
                  oldPrice: item["oldPrice"] as String,
                  discount: item["discount"] as String,
                  isHot: item["isHot"] as bool,
                  isFavorite: item["isFavorite"] as bool,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/product-detail',
                      arguments: item,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
