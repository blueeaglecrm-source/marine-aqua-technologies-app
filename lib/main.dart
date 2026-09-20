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
        scaffoldBackgroundColor: const Color(0xFFF3FBFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF008C95),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String category;
  final String description;
  final String usage;
  final String dosage;
  final String composition;

  const Product({
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.usage,
    required this.dosage,
    required this.composition,
  });
}

const List<Product> products = [
  Product(
    name: 'MARINE-6G',
    image: 'marine 6g.png',
    category: 'Liquid Minerals',
    description:
        'రొయ్యల్లో moulting, shell formation మరియు mineral support కోసం రూపొందించిన liquid mineral formulation. Nano Ion Matrix Technology ఆధారంగా రూపొందించబడింది.',
    usage:
        'రొయ్యల culture లో mineral support మరియు moulting support కోసం ఉపయోగించవచ్చు.',
    dosage: 'Pond: 2–3 L/acre\nFeed: 10 ml/kg feed',
    composition:
        'Bio-available macro minerals, chelated trace elements, stabilized ionic complexes, moulting support factors మరియు mineral uptake enhancers.',
  ),

  Product(
    name: 'MARINE WHITE SHIELD',
    image: 'white shield.png',
    category: 'Gut Health',
    description:
        'రొయ్యల gut health, digestion మరియు nutrient utilization కోసం రూపొందించిన Advanced Gut Health Formula.',
    usage:
        'Feed ద్వారా preventive మరియు curative gut health support కోసం ఉపయోగించాలి.',
    dosage: 'Preventive: 5–10 ml/kg feed\nCurative: 10 ml/kg feed',
    composition:
        'Multi-Strain Probiotic Complex, Organic Acid Salts, Phytogenic Extracts, Yeast Beta-Glucans, Digestive Enzyme Complex, Toxin Binder & Gut Protectant, MOS & FOS.',
  ),

  Product(
    name: 'MARINE VIBRIO SHIELD',
    image: 'vibrio shield.png',
    category: 'Vibrio Control',
    description:
        'Shrimp culture systems లో Vibrio control కోసం రూపొందించిన high-efficacy liquid formulation.',
    usage:
        'Pond application ద్వారా Vibrio control support కోసం ఉపయోగించాలి. Application తర్వాత probiotics ను 24 గంటల తర్వాత apply చేయాలని brochure సూచిస్తుంది.',
    dosage: 'Preventive: 1 L/acre\nCurative: 1.5 L/acre',
    composition:
        'Controlled oxidative activators, marine-grade salts మరియు advanced stabilizing agents.',
  ),

  Product(
    name: 'MARINE PROTAB',
    image: 'protab.png',
    category: 'Probiotic Tablet',
    description:
        'Pond microbial balance మరియు bottom management support కోసం రూపొందించిన probiotic tablet formulation.',
    usage:
        'Pond లో tablets ను recommended dosage ప్రకారం apply చేయాలి.',
    dosage: '250–300 g/acre',
    composition:
        'Marine Probiotic Blend, Nitrifying Bacteria Complex, Purple Non-Sulfur Bacteria, Lactic Acid Bacteria, Yeast Culture Extract, MOS, Beta-Glucan మరియు Seaweed Polysaccharide Extract.',
  ),

  Product(
    name: 'OXY TAB+',
    image: 'oxytab.png',
    category: 'Oxygen Support',
    description:
        'Pond లో oxygen support కోసం రూపొందించిన Smart Oxygen Release Technology formulation.',
    usage:
        'Pond oxygen support అవసరమైన సందర్భాల్లో recommended dosage ప్రకారం ఉపయోగించాలి.',
    dosage: '500 g/acre',
    composition:
        'Oxygen Precursors, Sodium Perborate మరియు Sodium Percarbonate with stabilizers.',
  ),

  Product(
    name: 'MARINE VOLT-X',
    image: 'volt-x.png',
    category: 'Growth Booster',
    description:
        'Shrimp growth support కోసం probiotics మరియు enzymes ఆధారంగా రూపొందించిన Advanced Growth Booster.',
    usage:
        'Feed లో కలిపి digestion, nutrient utilization మరియు growth support కోసం ఉపయోగించాలి.',
    dosage: 'Preventive: 5–10 ml/kg feed\nCurative: 10 ml/kg feed',
    composition:
        'Energy Activator Complex, Stabilized Vitamin Blend, Essential Amino Acids, Hepatopancreas Support Extract, Electrolyte Balance System, Beta-Glucan, Chelated Trace Minerals మరియు Feed Assimilation Enhancer.',
  ),

  Product(
    name: 'BIO SLUDGE-X',
    image: 'bio sludge -x.png',
    category: 'Sludge Management',
    description:
        'Pond bottom sludge management మరియు pond cleanliness support కోసం రూపొందించిన high-density microbial formulation.',
    usage:
        'Pond bottom లో sludge management support కోసం recommended dosage ప్రకారం ఉపయోగించాలి.',
    dosage: '250–500 g/acre',
    composition:
        'Beneficial Bacillus species, Enzyme Mix, Yucca Extract, Thiobacillus spp., Nitrifying Bacteria, Enzyme Activation System మరియు Bottom Activation Carriers.',
  ),

  Product(
    name: 'FREE MOULT',
    image: 'free moult.png',
    category: 'Moulting Support',
    description:
        'Shrimp moulting మరియు shell formation support కోసం chelated minerals మరియు moulting-related ingredients తో రూపొందించిన formulation.',
    usage:
        'Shrimp moulting మరియు mineral support కోసం pond application చేయాలి.',
    dosage: '5–10 kg/acre',
    composition:
        'Chelated Minerals, Moulting Inducers, Selenium, Cobalt, Iodine మరియు Enzymes.',
  ),

  Product(
    name: 'STARMIN',
    image: 'starmin.png',
    category: 'Minerals + Probiotics',
    description:
        'Minerals మరియు probiotics కలయికతో రూపొందించిన aquaculture mineral supplement.',
    usage:
        'Aquaculture applications కోసం mineral మరియు probiotic support అందించడానికి ఉపయోగించబడుతుంది.',
    dosage: 'Dosage: Brochure లో స్పష్టంగా పేర్కొనబడలేదు.',
    composition:
        'Calcium, Phosphorus, Magnesium, Potassium, Sodium, Zinc, Sulphur మరియు ఇతర trace minerals తో పాటు Bacillus subtilis, B. licheniformis, B. megatherium, B. acidophilus, Lactobacillus acidophilus మరియు Pediococcus probiotics.',
  ),

  Product(
    name: 'RED THUNDER-80',
    image: 'red thunder.png',
    category: 'Pond Hygiene',
    description:
        'Pond water hygiene మరియు harmful bacteria & Vibrio control కోసం brochure లో వివరించిన formulation.',
    usage:
        'Pond water hygiene మరియు harmful microbial control support కోసం recommended dosage ప్రకారం ఉపయోగించాలి.',
    dosage: '1 L/acre',
    composition:
        'Benzalkonium Chloride (BKC), Glutaraldehyde మరియు Formaldehyde.',
  ),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProductsPage(),
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
        indicatorColor: const Color(0xFFC8EEF0),
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

// ================= HOME =================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              'MARINE AQUA',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006B73),
              ),
            ),

            const Text(
              'TECHNOLOGIES',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF008C95),
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF008C95),
                    Color(0xFF006B73),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Smart Aquaculture',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Better management starts with better information.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173B40),
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _quickCard(
                    icon: Icons.inventory_2_outlined,
                    title: 'Products',
                    subtitle: 'View Products',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _quickCard(
                    icon: Icons.support_agent,
                    title: 'Support',
                    subtitle: 'Technical Help',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              'Our Products',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173B40),
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32,
            color: const Color(0xFF008C95),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
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
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 22, 18, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Products',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173B40),
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Aquaculture solutions for better pond management.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.76,
              ),
              itemBuilder: (context, index) {
                return ProductGridCard(
                  product: products[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ================= PRODUCT CARD =================

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        width: 175,
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
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
                color: Color(0xFF173B40),
              ),
            ),

            const SizedBox(height: 3),

            Text(
              product.category,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF008C95),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductGridCard extends StatelessWidget {
  final Product product;

  const ProductGridCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: product),
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
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
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
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF008C95),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= PRODUCT DETAILS =================

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FBFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF008C95),
        foregroundColor: Colors.white,
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 80,
                    color: Colors.grey,
                  );
                },
              ),
            ),

            const SizedBox(height: 22),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173B40),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              product.category,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF008C95),
              ),
            ),

            const SizedBox(height: 25),

            _section(
              title: 'ఉత్పత్తి వివరణ',
              icon: Icons.info_outline,
              child: Text(
                product.description,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Color(0xFF26383B),
                ),
              ),
            ),

            const SizedBox(height: 16),

            _section(
              title: 'ఎలా ఉపయోగించాలి',
              icon: Icons.water_drop_outlined,
              child: Text(
                product.usage,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Color(0xFF26383B),
                ),
              ),
            ),

            const SizedBox(height: 16),

            _section(
              title: 'Recommended Dosage',
              icon: Icons.medication_outlined,
              child: Text(
                product.dosage,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.7,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF173B40),
                ),
              ),
            ),

            const SizedBox(height: 16),

            _section(
              title: 'Composition / Technology',
              icon: Icons.science_outlined,
              child: Text(
                product.composition,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Color(0xFF26383B),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD8EFF0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF008C95),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF173B40),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          child,
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),

            const Icon(
              Icons.support_agent,
              size: 90,
              color: Color(0xFF008C95),
            ),

            const SizedBox(height: 25),

            const Text(
              'Technical Support',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173B40),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Aquaculture technical support kosam maa team ni contact cheyyandi.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.phone,
                    color: Color(0xFF008C95),
                    size: 30,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '+91 93902 59830',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Icon(
                    Icons.email_outlined,
                    color: Color(0xFF008C95),
                    size: 30,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'marineaquahr@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// ================= PROFILE =================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 25),

            const CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFC8EEF0),
              child: Icon(
                Icons.person,
                size: 55,
                color: Color(0xFF006B73),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'MARINE AQUA TECHNOLOGIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173B40),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                color: Color(0xFF008C95),
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            _profileItem(
              Icons.business_outlined,
              'Company',
              'Marine Aqua Technologies',
            ),

            _profileItem(
              Icons.location_on_outlined,
              'Corporate Office',
              'Madhapur, Hyderabad',
            ),

            _profileItem(
              Icons.email_outlined,
              'Email',
              'marineaquahr@gmail.com',
            ),

            _profileItem(
              Icons.phone_outlined,
              'Customer Care',
              '+91 93902 59830',
            ),

            const SizedBox(height: 25),

            const Text(
              'For Aquaculture Applications Only',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF008C95),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF173B40),
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
