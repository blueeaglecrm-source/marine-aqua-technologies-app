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
        scaffoldBackgroundColor: const Color(0xFFF5FAFB),
      ),
      home: const HomePage(),
    );
  }
}

// ================= PRODUCT DATA =================

class Product {
  final String name;
  final String image;
  final String category;
  final String description;

  const Product({
    required this.name,
    required this.image,
    required this.category,
    required this.description,
  });
}

const products = [
  Product(
    name: 'MARINE-6G',
    image: 'assets/products/marine-6g.jpeg',
    category: 'Minerals',
    description: 'Nano Ion Matrix Technology for better moulting and shell support.',
  ),
  Product(
    name: 'MARINE WHITE SHIELD',
    image: 'assets/products/marine white shield.png',
    category: 'Gut Health',
    description: 'Advanced Gut Health Formula for shrimp.',
  ),
  Product(
    name: 'MARINE VIBRIO SHIELD',
    image: 'assets/products/marine vibrio shield.jpeg',
    category: 'Vibrio Control',
    description: 'Advanced liquid formulation for Vibrio control.',
  ),
  Product(
    name: 'MARINE PROTAB',
    image: 'assets/products/marine protab.jpeg',
    category: 'Probiotics',
    description: 'Marine probiotic tablets with controlled release technology.',
  ),
  Product(
    name: 'OXYTAB+',
    image: 'assets/products/oxytab.png',
    category: 'Oxygen Support',
    description: 'Smart Oxygen Release Technology.',
  ),
  Product(
    name: 'MARINE VOLT-X',
    image: 'assets/products/marine volt-x.jpeg',
    category: 'Growth Booster',
    description: 'Advanced growth booster for shrimp.',
  ),
  Product(
    name: 'BIO SLUDGE-X',
    image: 'assets/products/bio sludge-x.jpeg',
    category: 'Pond Care',
    description: 'Bottom-level sludge management solution.',
  ),
  Product(
    name: 'FREE MOULT',
    image: 'assets/products/free moult.png',
    category: 'Moulting',
    description: 'Advanced moulting inducer for Vannamei shrimp.',
  ),
  Product(
    name: 'RED THUNDER-80',
    image: 'assets/products/red thunder.png',
    category: 'Pond Hygiene',
    description: 'Pond water hygiene and microbial control product.',
  ),
  Product(
    name: 'STARMIN',
    image: 'assets/products/starmin.jpeg',
    category: 'Minerals',
    description: 'Minerals with probiotics.',
  ),
];

// ================= HOME =================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final pages = const [
    HomeDashboard(),
    ProductsPage(),
    PondsPage(),
    SupportPage(),
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
        ],
      ),
    );
  }
}

// ================= HOME DASHBOARD =================

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF006D77),
                    Color(0xFF0097A7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.waves,
                          color: Color(0xFF007C89),
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'MARINE AQUA\nTECHNOLOGIES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            height: 1.15,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Smart Aquaculture.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Better Results.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(18),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  'Quick Actions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF173A40),
                  ),
                ),
                const SizedBox(height: 14),

                Row(
                  children: [
                    Expanded(
                      child: _actionCard(
                        context,
                        Icons.water_drop,
                        'Water Test',
                        const Color(0xFF008C95),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _actionCard(
                        context,
                        Icons.edit_note,
                        'Pond Diary',
                        const Color(0xFF2E7D70),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: _actionCard(
                        context,
                        Icons.inventory_2,
                        'Products',
                        const Color(0xFF006D77),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _actionCard(
                        context,
                        Icons.support_agent,
                        'Technical Support',
                        const Color(0xFF1976A8),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                const Text(
                  'Featured Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF173A40),
                  ),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return Container(
                        width: 155,
                        margin: const EdgeInsets.only(right: 14),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.contain,
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 55,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE4F5F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Color(0xFF007C89),
                        size: 35,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          'Manage your pond smarter with MARINE AQUA TECHNOLOGIES.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF174B50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionCard(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title coming soon'),
          ),
        );
      },
      child: Container(
        height: 115,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 9,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= PRODUCTS =================

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _appBar('Products'),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: .72,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(18),
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
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.contain,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return const Icon(
                                Icons.image_not_supported_outlined,
                                size: 55,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.category,
                          style: const TextStyle(
                            color: Color(0xFF008C95),
                            fontSize: 12,
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

// ================= PRODUCT DETAILS =================

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: const Color(0xFF006D77),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 330,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 80,
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF174B50),
                ),
              ),
            ),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDDF3F4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  product.category,
                  style: const TextStyle(
                    color: Color(0xFF007C89),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Product Overview',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= PONDS =================

class PondsPage extends StatelessWidget {
  const PondsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _appBar('My Ponds'),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.water_outlined,
                    size: 75,
                    color: Color(0xFF008C95),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'No ponds added yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Add your first pond to start tracking.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Add Pond'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= SUPPORT =================

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _appBar('Technical Support'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(18),
              children: [
                _supportCard(
                  Icons.call,
                  'Customer Care',
                  '+91 93902 59830',
                ),
                _supportCard(
                  Icons.email_outlined,
                  'Email',
                  'marineaquahr@gmail.com',
                ),
                _supportCard(
                  Icons.location_on_outlined,
                  'Corporate Office',
                  'Madhapur, Hyderabad',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _supportCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE1F4F5),
            child: Icon(
              icon,
              color: const Color(0xFF007C89),
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
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= COMMON =================

Widget _appBar(String title) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
    decoration: const BoxDecoration(
      color: Color(0xFF006D77),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(22),
        bottomRight: Radius.circular(22),
      ),
    ),
    child: Row(
      children: [
        const Icon(
          Icons.waves,
          color: Colors.white,
          size: 28,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
