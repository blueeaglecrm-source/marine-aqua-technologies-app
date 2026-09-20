import 'package:flutter/material.dart';

void main() {
  runApp(const MarineAquaApp());
}

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARINE AQUA TECHNOLOGIES',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF008C95),
        ),
      ),
      home: const MainHome(),
    );
  }
}

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProductsPage(),
    PondsPage(),
    SupportPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD9F4F3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.water_outlined),
            selectedIcon: Icon(Icons.water),
            label: 'My Ponds',
          ),
          NavigationDestination(
            icon: Icon(Icons.support_agent_outlined),
            selectedIcon: Icon(Icons.support_agent),
            label: 'Support',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// HOME
// ---------------------------------------------------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HEADER
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF007D88),
                        Color(0xFF00B8B0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.waves,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MARINE AQUA',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF064C55),
                        ),
                      ),
                      Text(
                        'TECHNOLOGIES',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF008C95),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F8F8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Color(0xFF006B75),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // HERO CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF006B78),
                    Color(0xFF00A99D),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF008C95).withOpacity(0.20),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Smart Aquaculture.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Better Results.',
                    style: TextStyle(
                      color: Color(0xFFBDFBF4),
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 13),
                  const Text(
                    'Professional aquaculture solutions\nfor healthier ponds and better results.',
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.45,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF006B78),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: const Text(
                      'Explore Products',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF163D42),
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: QuickCard(
                    icon: Icons.water_drop_outlined,
                    title: 'Water Test',
                    subtitle: 'Check parameters',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: QuickCard(
                    icon: Icons.book_outlined,
                    title: 'Pond Diary',
                    subtitle: 'Daily records',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: QuickCard(
                    icon: Icons.add_location_alt_outlined,
                    title: 'Add Pond',
                    subtitle: 'Manage ponds',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: QuickCard(
                    icon: Icons.support_agent,
                    title: 'Technical Help',
                    subtitle: 'Talk to our team',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Featured Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF163D42),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 235,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ProductMiniCard(
                    name: 'MARINE-6G',
                    image: 'assets/products/marine-6g.jpeg',
                  ),
                  ProductMiniCard(
                    name: 'MARINE VOLT-X',
                    image: 'assets/products/marine volt-x.jpeg',
                  ),
                  ProductMiniCard(
                    name: 'MARINE PROTAB',
                    image: 'assets/products/marine protab.jpeg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// QUICK CARD
// ---------------------------------------------------------

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const QuickCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2EEEE),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 43,
            width: 43,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F7F6),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF008C95),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Color(0xFF173F44),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// PRODUCTS
// ---------------------------------------------------------

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static const products = [
    ProductData(
      name: 'MARINE-6G',
      category: 'Liquid Minerals',
      image: 'assets/products/marine-6g.jpeg',
      description: 'Nano ion Matrix Technology',
    ),
    ProductData(
      name: 'MARINE WHITE SHIELD',
      category: 'Gut Health',
      image: 'assets/products/matine white shield.png',
      description: 'Advanced Gut Health Formula',
    ),
    ProductData(
      name: 'MARINE VIBRIO SHIELD',
      category: 'Vibrio Control',
      image: 'assets/products/marine vibrio shield.jpeg',
      description: 'Works Inside The Vibrio Cell',
    ),
    ProductData(
      name: 'MARINE PROTAB',
      category: 'Probiotic Tablets',
      image: 'assets/products/marine protab.jpeg',
      description: 'Marine Controlled Release Tablet',
    ),
    ProductData(
      name: 'OXY TAB+',
      category: 'Oxygen Support',
      image: 'assets/products/oxytab.png',
      description: 'Smart Oxygen Release Technology',
    ),
    ProductData(
      name: 'MARINE VOLT-X',
      category: 'Growth Booster',
      image: 'assets/products/marine volt-x.jpeg',
      description: 'Advanced Growth Booster',
    ),
    ProductData(
      name: 'BIO SLUDGE-X',
      category: 'Sludge Control',
      image: 'assets/products/bio sludge-x.jpeg',
      description: 'Break the Sludge, Boost the Culture',
    ),
    ProductData(
      name: 'FREE MOULT',
      category: 'Moulting Support',
      image: 'assets/products/free moult.png',
      description: 'Advanced Moulting Inducer',
    ),
    ProductData(
      name: 'STARMIN',
      category: 'Minerals + Probiotics',
      image: 'assets/products/starmin.jpeg',
      description: 'Minerals With Probiotics',
    ),
    ProductData(
      name: 'RED THUNDER-80',
      category: 'Pond Hygiene',
      image: 'assets/products/red thunder.png',
      description: 'BKC based pond hygiene solution',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 18, 14),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Products',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF123F45),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Aquaculture solutions by MARINE',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F7F6),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Color(0xFF007F89),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 25),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 0.69,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailsPage(product: product),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(
                        color: const Color(0xFFE2EEEE),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 9,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5FAFA),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.contain,
                              errorBuilder:
                                  (context, error, stackTrace) {
                                return const Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Colors.grey,
                                  size: 40,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF153F44),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          product.category,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF008C95),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// PRODUCT DETAILS
// ---------------------------------------------------------

class ProductDetailsPage extends StatelessWidget {
  final ProductData product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFA),
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 330,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 70,
                    color: Colors.grey,
                  );
                },
              ),
            ),

            const SizedBox(height: 22),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: Color(0xFF123F45),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              product.category,
              style: const TextStyle(
                color: Color(0xFF008C95),
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F8F7),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF14565D),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Product Information',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Color(0xFF163F44),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Detailed product information, dosage and application guidance will be available here.',
              style: TextStyle(
                height: 1.5,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// PONDS
// ---------------------------------------------------------

class PondsPage extends StatelessWidget {
  const PondsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Ponds',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF123F45),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Manage your farms and pond records',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 22),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF007F8A),
                    Color(0xFF00A99D),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.water,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'No ponds added yet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Add your first pond to start tracking farm performance.',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text(
                  'Add New Pond',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF008C95),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// SUPPORT
// ---------------------------------------------------------

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Technical Support',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: Color(0xFF123F45),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Get technical assistance for your farm',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),

            SupportCard(
              icon: Icons.phone,
              title: 'Call Technical Team',
              subtitle: '+91 93902 59830',
            ),

            const SizedBox(height: 14),

            const SupportCard(
              icon: Icons.chat_outlined,
              title: 'WhatsApp Support',
              subtitle: 'Chat with our technical team',
            ),

            const SizedBox(height: 14),

            const SupportCard(
              icon: Icons.location_on_outlined,
              title: 'Find Dealer',
              subtitle: 'Locate nearby dealers',
            ),
          ],
        ),
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE0EEEE),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE2F7F5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF008C95),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF173F44),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// PROFILE
// ---------------------------------------------------------

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(height: 25),

            Container(
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF007F89),
                    Color(0xFF00B8AA),
                  ],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 45,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Farmer',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: Color(0xFF163F44),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'MARINE AQUA TECHNOLOGIES',
              style: TextStyle(
                color: Color(0xFF008C95),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            ProfileOption(
              icon: Icons.person_outline,
              title: 'My Profile',
            ),

            ProfileOption(
              icon: Icons.notifications_none,
              title: 'Notifications',
            ),

            ProfileOption(
              icon: Icons.settings_outlined,
              title: 'Settings',
            ),

            ProfileOption(
              icon: Icons.info_outline,
              title: 'About MARINE AQUA TECHNOLOGIES',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 3),
      leading: Container(
        height: 43,
        width: 43,
        decoration: BoxDecoration(
          color: const Color(0xFFE5F7F6),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF008C95),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }
}

// ---------------------------------------------------------
// MINI PRODUCT CARD
// ---------------------------------------------------------

class ProductMiniCard extends StatelessWidget {
  final String name;
  final String image;

  const ProductMiniCard({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2EEEE),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_outlined,
                  size: 45,
                  color: Colors.grey,
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 13,
              color: Color(0xFF163F44),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// PRODUCT MODEL
// ---------------------------------------------------------

class ProductData {
  final String name;
  final String category;
  final String image;
  final String description;

  const ProductData({
    required this.name,
    required this.category,
    required this.image,
    required this.description,
  });
}
