from pathlib import Path
from PIL import Image

# Create a clean logo asset from the logo image already provided in the conversation.
src = Path("/mnt/data/ChatGPT Image Sep 8, 2026, 11_39_28 AM.png")
logo = Image.open(src).convert("RGB")
logo = logo.resize((900, 900))
logo.save("/mnt/data/marine_logo.png", "PNG")

main_code = r'''import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MarineAquaApp());
}

const Color marineBlue = Color(0xFF006B78);
const Color marineTeal = Color(0xFF008C95);
const Color aqua = Color(0xFF18A9AD);
const Color lightAqua = Color(0xFFE7F7F8);
const Color pageBg = Color(0xFFF3FBFC);
const Color darkText = Color(0xFF063B45);

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
        colorScheme: ColorScheme.fromSeed(seedColor: marineTeal),
      ),
      home: const SplashScreen(),
    );
  }
}

// ---------------- SPLASH ----------------

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OtpPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 240,
                width: double.infinity,
                child: CustomPaint(painter: WaterPainter()),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'marine_logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.water,
                        size: 120,
                        color: aqua,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Smart Aquaculture. Better Results.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF082E63),
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 70),
                  const SizedBox(
                    width: 54,
                    height: 54,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
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

class WaterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFB9F1FF), Color(0xFF18A9AD), Color(0xFF0087D8)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, size.height * .35)
      ..quadraticBezierTo(
        size.width * .22,
        size.height * .05,
        size.width * .48,
        size.height * .35,
      )
      ..quadraticBezierTo(
        size.width * .72,
        size.height * .68,
        size.width,
        size.height * .22,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ---------------- OTP ----------------

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> otp =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> focus =
      List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in otp) {
      c.dispose();
    }
    for (final f in focus) {
      f.dispose();
    }
    super.dispose();
  }

  void verify() {
    final code = otp.map((e) => e.text).join();
    if (code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('6-digit OTP enter cheyyandi')),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFE9F8FF), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 25, 22, 30),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 145,
                    child: Image.asset(
                      'marine_logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.water,
                        size: 100,
                        color: aqua,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Smart Aquaculture. Better Results.',
                    style: TextStyle(
                      color: Color(0xFF082E63),
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 45),
                  const Text(
                    'Verify Your Mobile Number',
                    style: TextStyle(
                      color: Color(0xFF082E63),
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'We have sent a 6-digit OTP to',
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '+91 98765 43210',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (i) {
                      return SizedBox(
                        width: 48,
                        height: 58,
                        child: TextField(
                          controller: otp[i],
                          focusNode: focus[i],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: Color(0xFFBBDDF2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: Color(0xFFBBDDF2),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && i < 5) {
                              focus[i + 1].requestFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Didn't receive OTP?  Resend OTP (00:28)",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: verify,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0877E8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Verify & Continue  →',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpTrust(icon: Icons.verified_user, text: 'Secure\nLogin'),
                      OtpTrust(icon: Icons.eco, text: 'Trusted by\nAqua Farmers'),
                      OtpTrust(icon: Icons.groups, text: 'Better\nTogether'),
                    ],
                  ),
                  const SizedBox(height: 90),
                  const Text(
                    'For a Healthier Aquaculture Tomorrow',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
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

class OtpTrust extends StatelessWidget {
  final IconData icon;
  final String text;

  const OtpTrust({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: marineTeal, size: 34),
        const SizedBox(height: 7),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

// ---------------- PRODUCTS ----------------

class Product {
  final String name, image, category, description, usage, dosage, composition;

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

const products = <Product>[
  Product(
    name: 'MARINE-6G',
    image: 'marine 6g.png',
    category: 'Liquid Minerals',
    description: 'రొయ్యల moulting, shell formation మరియు mineral support కోసం రూపొందించిన liquid mineral formulation.',
    usage: 'రొయ్యల culture సమయంలో mineral support మరియు moulting support కోసం ఉపయోగించాలి.',
    dosage: 'Pond: 2–3 L/acre\nFeed: 10 ml/kg feed',
    composition: 'Bio-available macro minerals, chelated trace elements, stabilized ionic complexes, moulting support factors మరియు mineral uptake enhancers.',
  ),
  Product(
    name: 'MARINE WHITE SHIELD',
    image: 'white shield.png',
    category: 'Gut Health',
    description: 'రొయ్యల gut health, digestion మరియు nutrient utilization కోసం రూపొందించిన Advanced Gut Health Formula.',
    usage: 'Feed ద్వారా preventive లేదా curative gut health support కోసం ఉపయోగించాలి.',
    dosage: 'Preventive: 5–10 ml/kg feed\nCurative: 10 ml/kg feed',
    composition: 'Multi-Strain Probiotic Complex, Gut Stabilizing Organic Acid Salts, Natural Phytogenic Extracts, Yeast Beta-Glucans, Digestive Enzyme Complex, Toxin Binder & Gut Protectant, MOS & FOS.',
  ),
  Product(
    name: 'MARINE VIBRIO SHIELD',
    image: 'vibrio shield.png',
    category: 'Vibrio Control',
    description: 'Pond లో Vibrio management కోసం రూపొందించిన high-efficacy liquid formulation.',
    usage: 'Vibrio management కోసం pond application చేయాలి. Probiotics ను 24 గంటల తర్వాత apply చేయాలని product guidance సూచిస్తుంది.',
    dosage: 'Preventive: 1 L/acre\nCurative: 1.5 L/acre\nProbiotics: 24 hours తర్వాత',
    composition: 'Proprietary high-efficacy liquid formulation, controlled oxidative activators, marine-grade salts మరియు advanced stabilizing agents.',
  ),
  Product(
    name: 'MARINE PROTAB',
    image: 'protab.png',
    category: 'Probiotic Tablet',
    description: 'Pond biological support కోసం రూపొందించిన probiotic tablet formulation.',
    usage: 'Pond లో probiotic support కోసం ఉపయోగించాలి.',
    dosage: '250–300 g/acre',
    composition: 'Spore-Forming Marine Probiotic Blend, Nitrifying Bacteria Complex, Purple Non-Sulfur Bacteria, Lactic Acid Bacteria, Yeast Culture Extract, MOS, beta glucan మరియు seaweed polysaccharide extract.',
  ),
  Product(
    name: 'OXY TAB+',
    image: 'oxytab.png',
    category: 'Oxygen Support',
    description: 'Pond లో oxygen support కోసం రూపొందించిన Smart Oxygen Release Technology formulation.',
    usage: 'Pond oxygen support అవసరమైనప్పుడు product dosage ప్రకారం apply చేయాలి.',
    dosage: '500 g/acre',
    composition: 'Oxygen precursors, sodium perborate, sodium percarbonate మరియు stabilizers.',
  ),
  Product(
    name: 'MARINE VOLT-X',
    image: 'volt-x.png',
    category: 'Growth Booster',
    description: 'Shrimp growth support కోసం probiotics, enzymes, amino acids మరియు feed assimilation support components తో రూపొందించిన advanced growth booster.',
    usage: 'Feed mixing ద్వారా digestion, nutrient utilization, immunity మరియు growth support కోసం ఉపయోగించాలి.',
    dosage: 'Preventive: 5–10 ml/kg feed\nCurative: 10 ml/kg feed',
    composition: 'Energy Activator Complex, Stabilized Vitamin Blend, Essential Amino Acids, Hepatopancreas Support Extract, Electrolyte Balance System, Beta-Glucan Immune Support, Chelated Trace Minerals మరియు Feed Assimilation Enhancer.',
  ),
  Product(
    name: 'BIO SLUDGE-X',
    image: 'bio sludge -x.png',
    category: 'Sludge Management',
    description: 'Pond bottom లో organic sludge management మరియు biological pond cleaning support కోసం రూపొందించిన microbial formulation.',
    usage: 'Pond bottom management మరియు biological sludge breakdown support కోసం ఉపయోగించాలి.',
    dosage: '250–500 g/acre',
    composition: 'Beneficial Bacillus species, enzyme mix, Yucca extract, Thiobacillus spp, nitrifying bacteria, enzyme activation system మరియు bottom activation carriers.',
  ),
  Product(
    name: 'FREE MOULT',
    image: 'free moult.png',
    category: 'Moulting Support',
    description: 'Shrimp moulting support కోసం chelated minerals మరియు moulting support factors తో రూపొందించిన formulation.',
    usage: 'Shrimp moulting support కోసం pond application చేయాలి.',
    dosage: '5–10 kg/acre',
    composition: 'Chelated minerals, moulting inducers, selenium, cobalt, iodine, enzymes మరియు supporting nutrients.',
  ),
  Product(
    name: 'STARMIN',
    image: 'starmin.png',
    category: 'Minerals + Probiotics',
    description: 'Mineral support మరియు probiotic support కలిపిన formulation.',
    usage: 'Shrimp culture లో mineral మరియు probiotic support కోసం product dosage ప్రకారం ఉపయోగించాలి.',
    dosage: 'Product label dosage ప్రకారం',
    composition: 'Bacillus subtilis, B. licheniformis, B. megatherium, B. acidophilus, Lactobacillus acidophilus మరియు Pediococcus; 6 Billion CFU/g.',
  ),
  Product(
    name: 'RED THUNDER-80',
    image: 'red thunder.png',
    category: 'Pond Hygiene',
    description: 'Pond water hygiene మరియు harmful bacterial management కోసం formulation.',
    usage: 'Pond water hygiene మరియు harmful bacterial management కోసం ఉపయోగించాలి.',
    dosage: '1 L/acre',
    composition: 'BKC, Glutaraldehyde మరియు Formaldehyde.',
  ),
];

// ---------------- MAIN / HOME ----------------

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  final pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: pages[index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (v) => setState(() => index = v),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
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
                      style: TextStyle(color: Colors.white70, fontSize: 16),
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
                          colors: [marineTeal, aqua],
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
                            page: WaterTestPage(),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: QuickCard(
                            icon: Icons.waves,
                            title: 'My Ponds',
                            page: MyPondsPage(),
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
