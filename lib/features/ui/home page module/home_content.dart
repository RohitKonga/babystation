import 'package:flutter/material.dart';
import 'package:babystation/features/ui/home page module/widgets/category_widget.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  bool expanded = false;
  final headerColor = const Color(0xFF9C278F);

  void toggle() {
    setState(() => expanded = !expanded);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: [
          /// ================= HEADER =================
          SliverToBoxAdapter(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              // Use constraints instead of fixed height to prevent RenderFlex overflow
              constraints: BoxConstraints(minHeight: expanded ? 220 : 180),
              padding: const EdgeInsets.only(top: 60, bottom: 10),
              decoration: BoxDecoration(color: headerColor),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// TOP ROW
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/images/boy.png"),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Shop For",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                GestureDetector(
                                  onTap: toggle,
                                  child: Icon(
                                    expanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "All",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        if (!expanded)
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        if (expanded)
                          GestureDetector(
                            onTap: toggle,
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: const BoxDecoration(
                                color: Colors.white24,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// EXPANDED CHILD SELECTOR
                  if (expanded)
                    AnimatedOpacity(
                      opacity: expanded ? 1 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: SizedBox(
                        height: 100,
                        child: ListView(
                          padding: const EdgeInsets.only(left: 16),
                          scrollDirection: Axis.horizontal,
                          children: [
                            addChildCard(),
                            profileCard("Rocky", selected: false),
                            profileCard("All", selected: true),
                            profileCard("Boy", selected: false),
                            profileCard("Girl", selected: false),
                          ],
                        ),
                      ),
                    ),

                  /// SEARCH BAR
                  if (!expanded)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
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
                ],
              ),
            ),
          ),

          /// ================= BODY =================
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: 1380 / 1380,
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index % banners.length);
                      },
                      itemBuilder: (context, index) {
                        final realIndex = index % banners.length;
                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            banners[realIndex],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.purple
                              : Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shop by Category",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  right: 14.0,
                  left: 14.0,
                  bottom: 14.0,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final item = categories[index];

                    return CategoryCard(
                      title: item["title"]!,
                      imagePath: item["image"]!,
                      onTap: () {
                        Navigator.pushNamed(context, item["route"]!);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 25),
              Image.asset("assets/banners/banner4.png", width: double.infinity),
              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trending Product",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
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
                      onTap: () {},
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 320,
                      height: 160,
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                "assets/banners/img.png",
                                fit: BoxFit.cover,
                              ),
                              Container(color: Colors.black.withOpacity(0.45)),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Cute Baby Fashion",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Shop Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 25),
              Image.asset("assets/banners/banner5.png", width: double.infinity),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shop by Category",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 10,
                        children: [
                          Image.asset("assets/categories/baby1.png"),
                          Text(
                            "0 TO 6 MONTHS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 10,

                        children: [
                          Image.asset("assets/categories/baby2.png"),
                          Text(
                            "6 TO 12 MONTHS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 10,

                        children: [
                          Image.asset("assets/categories/baby3.png"),
                          Text(
                            "1 YEAR+",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Best Sale",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Determine how many columns based on screen width
                    int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        // Adjust aspect ratio based on width to prevent "squishing"
                        childAspectRatio:
                            (constraints.maxWidth / crossAxisCount) / 280,
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
                          onTap: () {},
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 14.0, left: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Brands",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              SizedBox(
                // 1. Increase height to accommodate the shadow (70 + 20px extra)
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // 2. Add vertical padding so the shadow has space to render inside the scroll area
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  itemCount: brandLogos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 90,
                      // Remove vertical margin if you use padding in the ListView instead
                      margin: const EdgeInsets.only(right: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 1,
                            color: Colors.black.withOpacity(0.08),
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ), // Give the logo some breathing room
                        child: Image.asset(
                          brandLogos[index],
                          width: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 15),

              /////////////////////////////////////////////////////////////////////////////////////////
            ]),
          ),
        ],
      ),
    );
  }
}
