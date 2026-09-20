import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MarineAquaApp());
}

// ============================================================
// APP
// ============================================================

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

// ============================================================
// COLORS
// ============================================================

const Color marineBlue = Color(0xFF006B78);
const Color marineTeal = Color(0xFF008C95);
const Color aqua = Color(0xFF18A9AD);
const Color lightAqua = Color(0xFFE7F7F8);
const Color pageBg = Color(0xFFF3FBFC);
const Color darkText = Color(0xFF063B45);

// ============================================================
// PRODUCT MODEL
// ============================================================

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

// ============================================================
// PRODUCTS
// ============================================================

const List<Product> products = [

  Product(
    name: 'MARINE-6G',
    image: 'marine 6g.png',
    category: 'Liquid Minerals',
    description:
        'రొయ్యల moulting, shell formation మరియు mineral support కోసం రూపొందించిన liquid mineral formulation. Nano Ion Matrix Technology ఆధారంగా mineral support అందిస్తుంది.',
    usage:
        'రొయ్యల culture సమయంలో mineral support మరియు moulting support కోసం ఉపయోగించాలి.',
    dosage:
        'Pond: 2–3 L/acre\nFeed: 10 ml/kg feed',
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
        'Feed ద్వారా preventive లేదా curative gut health support కోసం ఉపయోగించాలి.',
    dosage:
        'Preventive: 5–10 ml/kg feed\nCurative: 10 ml/kg feed',
    composition:
        'Multi-Strain Probiotic Complex, Gut Stabilizing Organic Acid Salts, Natural Phytogenic Extracts, Yeast Beta-Glucans, Digestive Enzyme Complex, Advanced Toxin Binder & Gut Protectant, Prebiotic Support (MOS & FOS), Mineral & Electro Stabilizers.',
  ),

  Product(
    name: 'MARINE VIBRIO SHIELD',
    image: 'vibrio shield.png',
    category: 'Vibrio Control',
    description:
        'Pond లో Vibrio management కోసం రూపొందించిన high-efficacy liquid formulation. Controlled oxidative activators మరియు marine-grade salts ఆధారంగా రూపొందించబడింది.',
    usage:
        'Vibrio management కోసం pond application చేయాలి. Product application తర్వాత probiotics ను 24 గంటల తర్వాత apply చేయాలని product guidance సూచిస్తుంది.',
    dosage:
        'Preventive: 1 L/acre\nCurative: 1.5 L/acre\nProbiotics: 24 hours తర్వాత',
    composition:
        'Proprietary high-efficacy liquid formulation, controlled oxidative activators, marine-grade salts మరియు advanced stabilizing agents.',
  ),

  Product(
    name: 'MARINE PROTAB',
    image: 'protab.png',
    category: 'Probiotic Tablet',
    description:
        'Pond biological support కోసం రూపొందించిన probiotic tablet formulation. Beneficial microbial complex తో pond environment support చేస్తుంది.',
    usage:
        'Pond లో probiotic support కోసం ఉపయోగించాలి. Vibrio Shield application తర్వాత 24 గంటల తర్వాత ఉపయోగించవచ్చు.',
    dosage:
        '250–300 g/acre',
    composition:
        'Spore-Forming Marine Probiotic Blend, Nitrifying Bacteria Complex, Purple Non-Sulfur Bacteria, Lactic Acid Bacteria Shield, Yeast Culture Extract, enzyme system synbiotic & functional additives, MOS, beta glucan, seaweed polysaccharide extract, natural fermentable carbon source మరియు mineral carrier base.',
  ),

  Product(
    name: 'OXY TAB+',
    image: 'oxytab.png',
    category: 'Oxygen Support',
    description:
        'Pond లో oxygen support కోసం రూపొందించిన Smart Oxygen Release Technology formulation.',
    usage:
        'Pond oxygen support అవసరమైనప్పుడు product dosage ప్రకారం apply చేయాలి.',
    dosage:
        '500 g/acre',
    composition:
        'Oxygen precursors, sodium perborate, sodium percarbonate మరియు stabilizers.',
  ),

  Product(
    name: 'MARINE VOLT-X',
    image: 'volt-x.png',
    category: 'Growth Booster',
    description:
        'Shrimp growth support కోసం probiotics, enzymes, amino acids మరియు feed assimilation support components తో రూపొందించిన advanced growth booster.',
    usage:
        'Feed mixing ద్వారా digestion, nutrient utilization, immunity మరియు growth support కోసం ఉపయోగించాలి.',
    dosage:
        'Preventive: 5–10 ml/kg feed\nCurative: 10 ml/kg feed',
    composition:
        'Energy Activator Complex, Stabilized Vitamin Blend, Essential Amino Acids, Hepatopancreas Support Extract, Electrolyte Balance System, Beta-Glucan Immune Support, Chelated Trace Minerals మరియు Feed Assimilation Enhancer.',
  ),

  Product(
    name: 'BIO SLUDGE-X',
    image: 'bio sludge -x.png',
    category: 'Sludge Management',
    description:
        'Pond bottom లో organic sludge management మరియు biological pond cleaning support కోసం రూపొందించిన microbial formulation.',
    usage:
        'Pond bottom management మరియు biological sludge breakdown support కోసం ఉపయోగించాలి.',
    dosage:
        '250–500 g/acre',
    composition:
        'High-density blend of beneficial Bacillus species, enzyme mix, Yucca extract, Thiobacillus spp, nitrifying bacteria, enzyme activation system మరియు bottom activation carriers.',
  ),

  Product(
    name: 'FREE MOULT',
    image: 'free moult.png',
    category: 'Moulting Support',
    description:
        'Shrimp moulting support కోసం chelated minerals మరియు moulting support factors తో రూపొందించిన formulation.',
    usage:
        'Shrimp moulting support కోసం pond application చేయాలి.',
    dosage:
        '5–10 kg/acre',
    composition:
        'Chelated minerals, moulting inducers, selenium, cobalt, iodine, enzymes మరియు supporting nutrients.',
  ),

  Product(
    name: 'STARMIN',
    image: 'starmin.png',
    category: 'Minerals + Probiotics',
    description:
        'Mineral support మరియు probiotic support కలిపిన formulation. Pond biological balance మరియు mineral requirements కు support అందిస్తుంది.',
    usage:
        'Shrimp culture లో mineral మరియు probiotic support కోసం product dosage ప్రకారం ఉపయోగించాలి.',
    dosage:
        'Product label dosage ప్రకారం',
    composition:
        'Bacillus subtilis, Bacillus licheniformis, Bacillus megatherium, Bacillus acidophilus, Lactobacillus acidophilus మరియు Pediococcus probiotics; 6 Billion CFU/g.',
  ),

  Product(
    name: 'RED THUNDER-80',
    image: 'red thunder.png',
    category: 'Pond Hygiene',
    description:
        'Pond water hygiene మరియు harmful bacterial management కోసం BKC, Glutaraldehyde మరియు Formaldehyde ఆధారిత formulation.',
    usage:
        'Pond water hygiene మరియు harmful bacterial management కోసం ఉపయోగించాలి.',
    dosage:
        '1 L/acre',
    composition:
        'BKC, Glutaraldehyde మరియు Formaldehyde.',
  ),
];

// ============================================================
// MAIN SCREEN
// ============================================================

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
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD0F1F3),
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

// ============================================================
// HOME
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 24),
              color: marineBlue,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MARINE AQUA TECHNOLOGIES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Smart Aquaculture. Better Results.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF008C95),
                          Color(0xFF12B0B0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'MARINE AQUA\nTECHNOLOGIES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Smart Aquaculture. Better Results.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Quick Access',
                    style: TextStyle(
                      color: darkText,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: QuickCard(
                          icon: Icons.water_drop,
                          title: 'Water Test',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const WaterTestPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: QuickCard(
                          icon: Icons.waves,
                          title: 'My Ponds',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MyPondsPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      Expanded(
                        child: QuickCard(
                          icon: Icons.menu_book,
                          title: 'Pond Diary',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const PondDiaryPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: QuickCard(
                          icon: Icons.location_on,
                          title: 'Dealer Locator',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const DealerPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Featured Products',
                    style: TextStyle(
                      color: darkText,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 245,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        return ProductMiniCard(
                          product: products[index],
                        );
                      },
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
}

// ============================================================
// QUICK CARD
// ============================================================

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const QuickCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 44,
              color: marineTeal,
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCT MINI CARD
// ============================================================

class ProductMiniCard extends StatelessWidget {
  final Product product;

  const ProductMiniCard({
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
            builder: (_) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCTS PAGE
// ============================================================

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            color: marineBlue,
            child: const Text(
              'Our Products',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
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

// ============================================================
// PRODUCT CARD
// ============================================================

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
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
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 50,
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
                color: darkText,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.category,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: marineTeal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// PRODUCT DETAILS
// ============================================================

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 330,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 80,
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            Text(
              product.name,
              style: const TextStyle(
                color: darkText,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              product.category,
              style: const TextStyle(
                color: marineTeal,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            InfoSection(
              title: 'Product Description',
              icon: Icons.info_outline,
              text: product.description,
            ),

            InfoSection(
              title: 'Telugu Usage',
              icon: Icons.science_outlined,
              text: product.usage,
            ),

            InfoSection(
              title: 'Recommended Dosage',
              icon: Icons.medication_outlined,
              text: product.dosage,
            ),

            InfoSection(
              title: 'Composition',
              icon: Icons.biotech_outlined,
              text: product.composition,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// INFO SECTION
// ============================================================

class InfoSection extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;

  const InfoSection({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F7F8),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: marineTeal,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: darkText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SUPPORT
// ============================================================

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 80),

            const Icon(
              Icons.support_agent,
              size: 80,
              color: marineTeal,
            ),

            const SizedBox(height: 20),

            const Text(
              'Technical Support',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Marine Aqua Technologies technical team support',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 40),

            SupportTile(
              icon: Icons.phone,
              title: 'Customer Care',
              subtitle: '+91 93902 59830',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.email,
              title: 'Email Support',
              subtitle: 'marineaquahr@gmail.com',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.location_city,
              title: 'Corporate Office',
              subtitle: 'Madhapur, Hyderabad - 500081',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SupportTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SupportTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: lightAqua,
          child: Icon(
            icon,
            color: marineTeal,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

// ============================================================
// PROFILE
// ============================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 35),

            const CircleAvatar(
              radius: 48,
              backgroundColor: lightAqua,
              child: Icon(
                Icons.person,
                size: 55,
                color: marineTeal,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'MARINE AQUA TECHNOLOGIES',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 35),

            ProfileMenu(
              icon: Icons.person_outline,
              title: 'Farmer Profile',
              onTap: () {
                showMessage(
                  context,
                  'Farmer Profile coming soon',
                );
              },
            ),

            ProfileMenu(
              icon: Icons.badge_outlined,
              title: 'Employee Login',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EmployeeLoginPage(),
                  ),
                );
              },
            ),

            ProfileMenu(
              icon: Icons.location_on_outlined,
              title: 'Employee Field Visit',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EmployeeVisitPage(),
                  ),
                );
              },
            ),

            ProfileMenu(
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () {
                showMessage(
                  context,
                  'Notifications coming soon',
                );
              },
            ),

            ProfileMenu(
              icon: Icons.info_outline,
              title: 'About Marine Aqua Technologies',
              onTap: () {
                showAbout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: marineTeal,
          size: 28,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}

// ============================================================
// EMPLOYEE LOGIN
// ============================================================

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() =>
      _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  final employeeController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    employeeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (employeeController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      showMessage(
        context,
        'Employee ID and Password enter cheyyandi',
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const EmployeeDashboardPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
        title: const Text('Employee Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            const SizedBox(height: 40),

            const Icon(
              Icons.badge,
              size: 75,
              color: marineTeal,
            ),

            const SizedBox(height: 25),

            TextField(
              controller: employeeController,
              decoration: inputDecoration(
                'Employee ID',
                Icons.person,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: inputDecoration(
                'Password',
                Icons.lock,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: marineTeal,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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

// ============================================================
// EMPLOYEE DASHBOARD
// ============================================================

class EmployeeDashboardPage extends StatelessWidget {
  const EmployeeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
        title: const Text('Employee Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            DashboardCard(
              icon: Icons.location_on,
              title: 'Add Field Visit',
              subtitle:
                  'GPS location + date/time + farmer + pond + photo',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EmployeeVisitPage(),
                  ),
                );
              },
            ),

            DashboardCard(
              icon: Icons.history,
              title: 'Visit History',
              subtitle: 'View submitted field visits',
              onTap: () {
                showMessage(
                  context,
                  'Visit history coming soon',
                );
              },
            ),

            DashboardCard(
              icon: Icons.map,
              title: 'Visit Map',
              subtitle: 'View field visit locations',
              onTap: () {
                showMessage(
                  context,
                  'Map dashboard coming soon',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 27,
          backgroundColor: lightAqua,
          child: Icon(
            icon,
            color: marineTeal,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

// ============================================================
// EMPLOYEE FIELD VISIT + GPS
// ============================================================

class EmployeeVisitPage extends StatefulWidget {
  const EmployeeVisitPage({super.key});

  @override
  State<EmployeeVisitPage> createState() =>
      _EmployeeVisitPageState();
}

class _EmployeeVisitPageState extends State<EmployeeVisitPage> {

  final farmerController = TextEditingController();
  final pondController = TextEditingController();
  final remarksController = TextEditingController();

  Position? currentPosition;
  XFile? visitPhoto;

  bool loadingLocation = false;

  Future<void> captureLocation() async {
    setState(() {
      loadingLocation = true;
    });

    try {
      bool serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        showMessage(
          context,
          'Phone Location/GPS ON cheyyandi',
        );
        return;
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission =
            await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        showMessage(
          context,
          'Location permission denied',
        );
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        showMessage(
          context,
          'Location permission Settings lo enable cheyyandi',
        );
        return;
      }

      final position =
          await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      setState(() {
        currentPosition = position;
      });

      showMessage(
        context,
        'Current GPS location captured',
      );
    } catch (e) {
      showMessage(
        context,
        'Location capture failed',
      );
    } finally {
      if (mounted) {
        setState(() {
          loadingLocation = false;
        });
      }
    }
  }

  Future<void> capturePhoto() async {
    final picker = ImagePicker();

    final photo = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (photo != null) {
      setState(() {
        visitPhoto = photo;
      });
    }
  }

  void submitVisit() {
    if (farmerController.text.trim().isEmpty) {
      showMessage(
        context,
        'Farmer name enter cheyyandi',
      );
      return;
    }

    if (pondController.text.trim().isEmpty) {
      showMessage(
        context,
        'Pond name/number enter cheyyandi',
      );
      return;
    }

    if (currentPosition == null) {
      showMessage(
        context,
        'First GPS location capture cheyyandi',
      );
      return;
    }

    if (visitPhoto == null) {
      showMessage(
        context,
        'Visit photo capture cheyyandi',
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Visit Submitted'),
        content: Text(
          'Farmer: ${farmerController.text}\n'
          'Pond: ${pondController.text}\n\n'
          'Latitude: ${currentPosition!.latitude}\n'
          'Longitude: ${currentPosition!.longitude}\n\n'
          'GPS + Date/Time + Photo captured.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    farmerController.dispose();
    pondController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
        title: const Text('Field Visit'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Visit Details',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: farmerController,
              decoration: inputDecoration(
                'Farmer Name',
                Icons.person,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: pondController,
              decoration: inputDecoration(
                'Pond Name / Pond Number',
                Icons.water,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: remarksController,
              maxLines: 4,
              decoration: inputDecoration(
                'Visit Remarks',
                Icons.notes,
              ),
            ),

            const SizedBox(height: 22),

            // GPS
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: marineTeal,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'GPS Location',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  if (currentPosition != null)
                    Text(
                      'Latitude: ${currentPosition!.latitude}\n'
                      'Longitude: ${currentPosition!.longitude}',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    )
                  else
                    const Text(
                      'Location not captured',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed:
                          loadingLocation ? null : captureLocation,
                      icon: const Icon(Icons.my_location),
                      label: Text(
                        loadingLocation
                            ? 'Capturing...'
                            : 'CAPTURE CURRENT LOCATION',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: marineTeal,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // PHOTO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: marineTeal,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Visit Photo',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  if (visitPhoto != null)
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade100,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          visitPhoto!.path,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return const Center(
                              child: Icon(
                                Icons.photo,
                                size: 60,
                                color: marineTeal,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: capturePhoto,
                      icon: const Icon(Icons.camera_alt),
                      label: Text(
                        visitPhoto == null
                            ? 'CAPTURE VISIT PHOTO'
                            : 'RETAKE PHOTO',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: submitVisit,
                icon: const Icon(Icons.send),
                label: const Text(
                  'SUBMIT FIELD VISIT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: marineBlue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// WATER TEST
// ============================================================

class WaterTestPage extends StatefulWidget {
  const WaterTestPage({super.key});

  @override
  State<WaterTestPage> createState() => _WaterTestPageState();
}

class _WaterTestPageState extends State<WaterTestPage> {

  final phController = TextEditingController();
  final salinityController = TextEditingController();
  final oxygenController = TextEditingController();
  final temperatureController = TextEditingController();

  @override
  void dispose() {
    phController.dispose();
    salinityController.dispose();
    oxygenController.dispose();
    temperatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
        title: const Text('Water Test'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            WaterInput(
              controller: phController,
              label: 'pH',
              icon: Icons.science,
            ),

            WaterInput(
              controller: salinityController,
              label: 'Salinity',
              icon: Icons.water,
            ),

            WaterInput(
              controller: oxygenController,
              label: 'Dissolved Oxygen',
              icon: Icons.air,
            ),

            WaterInput(
              controller: temperatureController,
              label: 'Temperature',
              icon: Icons.thermostat,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  showMessage(
                    context,
                    'Water test saved successfully',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: marineTeal,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'SAVE WATER TEST',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaterInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  const WaterInput({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
        decoration: inputDecoration(label, icon),
      ),
    );
  }
}

// ============================================================
// MY PONDS
// ============================================================

class MyPondsPage extends StatelessWidget {
  const MyPondsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
        title: const Text('My Ponds'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: marineTeal,
        foregroundColor: Colors.white,
        onPressed: () {
          showMessage(
            context,
            'Add Pond feature coming soon',
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [

          PondCard(
            pondName: 'Pond 01',
            area: '5 Acres',
            status: 'Active',
          ),

          PondCard(
            pondName: 'Pond 02',
            area: '3 Acres',
            status: 'Active',
          ),
        ],
      ),
    );
  }
}

class PondCard extends StatelessWidget {
  final String pondName;
  final String area;
  final String status;

  const PondCard({
    super.key,
    required this.pondName,
    required this.area,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: lightAqua,
            child: Icon(
              Icons.waves,
              color: marineTeal,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  pondName,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(area),
                const SizedBox(height: 5),
                Text(
                  status,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
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

// ============================================================
// POND DIARY
// ============================================================

class PondDiaryPage extends StatefulWidget {
  const PondDiaryPage({super.key});

  @override
  State<PondDiaryPage> createState() =>
      _PondDiaryPageState();
}

class _PondDiaryPageState extends State<PondDiaryPage> {

  final noteController = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
        title: const Text('Pond Diary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: noteController,
              maxLines: 7,
              decoration: inputDecoration(
                'Today Pond Notes',
                Icons.book,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  if (noteController.text.trim().isEmpty) {
                    showMessage(
                      context,
                      'Note enter cheyyandi',
                    );
                    return;
                  }

                  showMessage(
                    context,
                    'Pond diary saved',
                  );

                  noteController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: marineTeal,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'SAVE ENTRY',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DEALER LOCATOR
// ============================================================

class DealerPage extends StatelessWidget {
  const DealerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
        title: const Text('Dealer Locator'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [

          DealerCard(
            name: 'Marine Aqua Technologies',
            location: 'Hyderabad',
          ),

          DealerCard(
            name: 'Marine Aqua Technologies',
            location: 'Kakinada',
          ),

          DealerCard(
            name: 'Marine Aqua Technologies',
            location: 'Vizag',
          ),
        ],
      ),
    );
  }
}

class DealerCard extends StatelessWidget {
  final String name;
  final String location;

  const DealerCard({
    super.key,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: marineTeal,
            size: 35,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5),
                Text(location),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HELPERS
// ============================================================

InputDecoration inputDecoration(
  String label,
  IconData icon,
) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      icon,
      color: marineTeal,
    ),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: marineTeal,
        width: 2,
      ),
    ),
  );
}

void showMessage(
  BuildContext context,
  String message,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

void showAbout(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text(
        'MARINE AQUA TECHNOLOGIES',
      ),
      content: const Text(
        'Smart Aquaculture. Better Results.\n\n'
        'Marine Aqua Technologies provides aquaculture products '
        'and technical support for shrimp and fish farming.\n\n'
        'Corporate Office:\n'
        'Madhapur, Hyderabad - 500081\n\n'
        'Customer Care:\n'
        '+91 93902 59830\n\n'
        'Email:\n'
        'marineaquahr@gmail.com',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CLOSE'),
        ),
      ],
    ),
  );
}
