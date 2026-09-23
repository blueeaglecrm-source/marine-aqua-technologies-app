import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MarineAquaApp());

const marineBlue = Color(0xFF06457A);
const brightBlue = Color(0xFF0A8ED8);
const marineTeal = Color(0xFF12A9B8);
const pageBg = Color(0xFFF4FBFD);
const darkText = Color(0xFF063B72);

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARINE AQUA TECHNOLOGIES',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBg,
        colorScheme: ColorScheme.fromSeed(seedColor: brightBlue),
        fontFamily: 'Arial',
      ),
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1300), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Image.asset('marine_logo.png', width: 190, height: 190),
            const SizedBox(height: 22),
            const Text(
              'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: darkText,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Marine Aqua Technologies',
              style: TextStyle(
                color: darkText,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              height: 150,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [marineTeal, brightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(120)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mobile = TextEditingController();

  @override
  void dispose() {
    mobile.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (mobile.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 10-digit mobile number')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const OtpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36, 24, 36, 18),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Image.asset('marine_logo.png', width: 145, height: 145),
              const SizedBox(height: 6),
              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(color: darkText, fontSize: 16),
              ),
              const SizedBox(height: 44),
              const Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Enter Your Mobile Number',
                    maxLines: 1,
                    style: TextStyle(
                      color: darkText,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'We will send a 6-digit OTP to verify your mobile number.',
                  style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.35),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: mobile,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter 10-digit number',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide:
                        const BorderSide(color: Color(0xFFB9DFEA), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide:
                        const BorderSide(color: brightBlue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: sendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Send OTP  →',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _LoginBadge(icon: Icons.verified_user, text: 'Secure\nLogin'),
                  _LoginBadge(icon: Icons.eco, text: 'Trusted by\nAqua Farmers'),
                  _LoginBadge(icon: Icons.groups, text: 'Better\nTogether'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  const _LoginBadge({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: marineTeal, size: 38),
        const SizedBox(height: 7),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final otp = TextEditingController();

  void verify() {
    if (otp.text.trim().length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter the 6-digit OTP')),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(34, 26, 34, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 28),
              ),
              const SizedBox(height: 12),
              Center(
                child: Image.asset('marine_logo.png', width: 115, height: 115),
              ),
              const SizedBox(height: 14),
              const Center(
                child: Text(
                  'Verify OTP',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Enter the 6-digit OTP sent to your mobile number.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: otp,
                maxLength: 6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter 6-digit OTP',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide:
                        const BorderSide(color: Color(0xFFB9DFEA), width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: verify,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Verify OTP  →',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              const Center(
                child: Text(
                  'Resend OTP',
                  style: TextStyle(
                    color: brightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const FarmerHome(),
      const ProductsPage(),
      const SupportPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: tab,
        indicatorColor: const Color(0xFFD5F4F8),
        onDestinationSelected: (value) => setState(() => tab = value),
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

class FarmerHome extends StatelessWidget {
  const FarmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        children: [
          _header(),
          const SizedBox(height: 12),
          _hero(),
          const SizedBox(height: 12),
          _waterQuality(context),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _featureCard(
                  context,
                  Icons.menu_book_rounded,
                  'Shrimp Culture Guide',
                  'Pond Preparation to Harvest',
                  const GuidePage(),
                  const Color(0xFFE6F4FF),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _featureCard(
                  context,
                  Icons.calculate_rounded,
                  'Biomass Calculator',
                  'Estimate Your Shrimp Stock',
                  const BiomassPage(),
                  const Color(0xFFE8F8EE),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _featureCard(
                  context,
                  Icons.health_and_safety_rounded,
                  'Shrimp Diseases',
                  'Identify • Prevent • Manage',
                  const DiseasePage(),
                  const Color(0xFFFFE9EA),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _sectionTitle('Our Aquaculture Solutions', 'View All Products →'),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => _productCard(context, products[i]),
            ),
          ),
          const SizedBox(height: 20),
          _sectionTitle('Success Stories', 'View All Stories →'),
          const SizedBox(height: 10),
          SizedBox(
            height: 145,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => _successCard(i),
            ),
          ),
          const SizedBox(height: 18),
          _bottomBanner(),
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        const Icon(Icons.menu, color: darkText, size: 30),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            children: [
              Image.asset('marine_logo.png', height: 52),
              const Text(
                'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkText,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                'Marine Aqua Technologies',
                style: TextStyle(color: darkText, fontSize: 12),
              ),
            ],
          ),
        ),
        const Icon(Icons.notifications_none, color: darkText, size: 27),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFDCEEFF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.language, color: darkText, size: 20),
              SizedBox(width: 4),
              Text(
                'EN',
                style: TextStyle(
                  color: darkText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: darkText, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _hero() {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF064A86), Color(0xFF11AFC0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          const Positioned(
            right: -4,
            bottom: 8,
            child: Icon(
              Icons.set_meal_rounded,
              size: 125,
              color: Color(0x3377E2EA),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Healthy Ponds\nStronger Shrimp\nHigher Profits',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  height: 1.08,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 14),
              Text(
                'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
              Spacer(),
              Text(
                'Explore Products  →',
                style: TextStyle(
                  color: darkText,
                  backgroundColor: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _waterQuality(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE2F8F0),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.water_drop, color: marineTeal, size: 30),
              const SizedBox(width: 8),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Water Quality Parameters',
                      style: TextStyle(
                        color: darkText,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Maintain Optimal Water Conditions for Healthy Shrimp',
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WaterQualityPage(),
                  ),
                ),
                child: const Text(
                  'View All →',
                  style: TextStyle(
                    color: brightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _metric('🌡️', 'Temperature', '28°C – 30°C'),
              _metric('pH', 'pH', '7.5 – 8.5'),
              _metric('O₂', 'Dissolved Oxygen', '> 4 / > 6 ppm'),
              _metric('〰', 'Salinity', '0 – 30 ppt'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metric(String icon, String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD2EAF0)),
        ),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: darkText,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: darkText,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Widget page,
    Color color,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      ),
      child: Container(
        height: 145,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: brightBlue, size: 34),
            const Spacer(),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: darkText,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, String action) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: darkText,
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            color: brightBlue,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _productCard(BuildContext context, Product product) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailsPage(product: product),
        ),
      ),
      child: Container(
        width: 145,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFD5E7EC)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(product.image, fit: BoxFit.contain),
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: darkText,
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
            Text(
              product.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _successCard(int index) {
    final data = [
      ['Better growth and healthy shrimp', 'West Godavari, AP'],
      ['Water quality improved and survival rate increased', 'Eluru, AP'],
      ['Harvest size and farm results improved', 'Kakinada, AP'],
    ];
    return Container(
      width: 285,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFD5E7EC)),
      ),
      child: Row(
        children: [
          Container(
            width: 82,
            height: 108,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0A6FB8), Color(0xFF20A9C0)],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.agriculture,
              color: Colors.white,
              size: 42,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '“${data[index][0]}”',
                  style: const TextStyle(
                    color: darkText,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data[index][1],
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBanner() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB9EAF2), Color(0xFF54BBD0)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          'Healthy Water… Healthy Shrimp…\nProsperous Farmers…',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: darkText,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name, category, image, description, dosage;
  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.dosage,
  });
}

const products = <Product>[
  Product(
    name: 'MARINE-6G',
    category: 'Liquid Minerals',
    image: 'marine 6g.png',
    description:
        'Bio-available macro minerals, chelated trace elements, stabilized ionic complexes, moulting support factors and mineral uptake enhancers with Nano Ion Matrix Technology.',
    dosage: '2–3 L/acre; feed 10 ml/kg',
  ),
  Product(
    name: 'MARINE WHITE SHIELD',
    category: 'Gut Health',
    image: 'white shield.png',
    description: 'Advanced gut health formula with probiotic and digestive support.',
    dosage: '5–10 ml/kg feed',
  ),
  Product(
    name: 'MARINE VIBRIO SHIELD',
    category: 'Vibrio Control',
    image: 'vibrio shield.png',
    description: 'High-efficacy liquid formulation for Vibrio management.',
    dosage: 'Preventive 1 L/acre; curative 1.5 L/acre',
  ),
  Product(
    name: 'MARINE PROTAB',
    category: 'Probiotic Tablets',
    image: 'protab.png',
    description: 'Probiotic tablet for biological pond support.',
    dosage: '250–300 g/acre',
  ),
  Product(
    name: 'OXY TAB+',
    category: 'Oxygen Support',
    image: 'oxytab.png',
    description: 'Smart Oxygen Release Technology for pond oxygen support.',
    dosage: '500 g/acre',
  ),
  Product(
    name: 'MARINE VOLT-X',
    category: 'Growth Booster',
    image: 'volt-x.png',
    description: 'Growth booster with probiotics, enzymes and feed assimilation support.',
    dosage: '5–10 ml/kg feed',
  ),
  Product(
    name: 'BIO SLUDGE-X',
    category: 'Sludge Management',
    image: 'bio sludge -x.png',
    description: 'Microbial formulation for organic sludge management.',
    dosage: '250–500 g/acre',
  ),
  Product(
    name: 'FREE MOULT',
    category: 'Moulting Support',
    image: 'free moult.png',
    description: 'Chelated mineral and moulting support formulation.',
    dosage: '5–10 kg/acre',
  ),
  Product(
    name: 'STARMIN',
    category: 'Minerals + Probiotics',
    image: 'starmin.png',
    description: 'Mineral support combined with probiotic support.',
    dosage: 'According to product label',
  ),
  Product(
    name: 'RED THUNDER-80',
    category: 'Pond Hygiene',
    image: 'red thunder.png',
    description: 'Formulation for pond water hygiene and harmful bacterial management.',
    dosage: '1 L/acre',
  ),
];

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Products')),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: .72,
        ),
        itemBuilder: (_, i) {
          final p = products[i];
          return Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(product: p),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(child: Image.asset(p.image, fit: BoxFit.contain)),
                    Text(
                      p.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      p.category,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: marineTeal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 260,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Image.asset(product.image),
          ),
          const SizedBox(height: 18),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          Text(
            product.category,
            style: const TextStyle(
              color: brightBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Product Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkText,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(product.description),
                  const SizedBox(height: 16),
                  const Text(
                    'Recommended Dosage',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(product.dosage),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaterQualityPage extends StatelessWidget {
  const WaterQualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    const rows = [
      ['Temperature', '28°C to 30°C'],
      ['pH', '7.5 to 8.5; daily fluctuation < 0.5'],
      ['Dissolved Oxygen (DO)', 'Above 4 ppm morning; above 6 ppm daytime'],
      ['Salinity', '0 to 30 ppt'],
      ['Total Alkalinity', '≥ 80 ppm'],
      ['Transparency', '30 to 40 cm'],
      ['Free Ammonia (NH₃)', '≤ 0.01 ppm'],
      ['TAN', '≤ 2 ppm'],
      ['Nitrite (NO₂)', '< 1 mg/L'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Water Quality Parameters')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: rows.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, i) => Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFE0F6F8),
              child: Icon(
                i == 0
                    ? Icons.thermostat
                    : i == 1
                        ? Icons.science
                        : i == 2
                            ? Icons.air
                            : Icons.water_drop,
                color: brightBlue,
              ),
            ),
            title: Text(
              rows[i][0],
              style: const TextStyle(
                color: darkText,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(rows[i][1]),
          ),
        ),
      ),
    );
  }
}

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    const sections = [
      'Pond Preparation',
      'Water Filling & Minerals',
      'Vibrio Control – Stocking',
      'Immunity Boosters',
      'Probiotics Management',
      'Growth Management',
      'Chloride Management',
      'White Gut Management',
      'Oxygen Management',
      'Sludge & Organic Load Management',
      'Final Aqua Management Guidance',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Shrimp Culture Guide')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        itemBuilder: (_, i) => Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFE4F4FF),
              child: Text(
                '${i + 1}',
                style: const TextStyle(
                  color: darkText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              sections[i],
              style: const TextStyle(
                color: darkText,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}

class BiomassPage extends StatefulWidget {
  const BiomassPage({super.key});
  @override
  State<BiomassPage> createState() => _BiomassPageState();
}

class _BiomassPageState extends State<BiomassPage> {
  final area = TextEditingController();
  final density = TextEditingController();
  final survival = TextEditingController(text: '80');
  final weight = TextEditingController();
  String result = '';

  void calc() {
    final a = double.tryParse(area.text) ?? 0;
    final d = double.tryParse(density.text) ?? 0;
    final s = (double.tryParse(survival.text) ?? 0) / 100;
    final w = double.tryParse(weight.text) ?? 0;
    final count = a * d * s;
    final biomass = count * w / 1000;
    setState(() {
      result =
          'Estimated shrimp count: ${count.toStringAsFixed(0)}\n'
          'Total biomass: ${biomass.toStringAsFixed(2)} kg\n'
          'Biomass/acre: ${a == 0 ? 0 : (biomass / a).toStringAsFixed(2)} kg';
    });
  }

  @override
  void dispose() {
    area.dispose();
    density.dispose();
    survival.dispose();
    weight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biomass Calculator')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          _field(area, 'Pond Area (Acres)'),
          _field(density, 'Stocking Density (PL/acre)'),
          _field(survival, 'Survival Rate (%)'),
          _field(weight, 'Average Body Weight (grams)'),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: calc,
              child: const Text('CALCULATE BIOMASS'),
            ),
          ),
          if (result.isNotEmpty)
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.7,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _field(TextEditingController c, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: c,
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class DiseasePage extends StatelessWidget {
  const DiseasePage({super.key});

  @override
  Widget build(BuildContext context) {
    const diseases = [
      'White Gut',
      'Vibrio-related problems',
      'Stress & weak growth',
      'Poor moulting / shell weakness',
      'Oxygen stress',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Shrimp Diseases')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: diseases
            .map(
              (d) => Card(
                color: Colors.white,
                child: ListTile(
                  leading: const Icon(
                    Icons.health_and_safety,
                    color: brightBlue,
                  ),
                  title: Text(
                    d,
                    style: const TextStyle(
                      color: darkText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Technical Support')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: const [
          SizedBox(height: 20),
          Icon(Icons.support_agent, size: 80, color: brightBlue),
          SizedBox(height: 14),
          Text(
            'Marine Aqua Technical Support',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkText,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.phone, color: brightBlue),
              title: Text('Customer Care'),
              subtitle: Text('+91 93902 59830'),
            ),
          ),
          Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.email, color: brightBlue),
              title: Text('Email'),
              subtitle: Text('marineaquahr@gmail.com'),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Image.asset('marine_logo.png', height: 100),
          const SizedBox(height: 16),
          const Text(
            'MARINE AQUA TECHNOLOGIES',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkText,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
            textAlign: TextAlign.center,
            style: TextStyle(color: marineTeal, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          const Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.agriculture, color: brightBlue),
              title: Text('Farmer App'),
              subtitle: Text(
                'Pond management, products and aquaculture tools.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
