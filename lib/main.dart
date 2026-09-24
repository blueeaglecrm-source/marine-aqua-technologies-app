import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
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
        MaterialPageRoute(builder: (_) => const MobileNumberPage()),
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
                    'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
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

// ---------------- MOBILE NUMBER ----------------

class MobileNumberPage extends StatefulWidget {
  const MobileNumberPage({super.key});

  @override
  State<MobileNumberPage> createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends State<MobileNumberPage> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void sendOtp() {
    final phone = phoneController.text.replaceAll(RegExp(r'\D'), '');

    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('10-digit mobile number enter cheyyandi')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpPage(phoneNumber: phone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE9F8FF), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
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
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF082E63),
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 55),
                const Text(
                  'Enter Your Mobile Number',
                  style: TextStyle(
                    color: Color(0xFF082E63),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'We will send a 6-digit OTP to verify your mobile number.',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                const SizedBox(height: 28),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    prefixText: '+91 ',
                    prefixStyle: const TextStyle(
                      color: Color(0xFF0877E8),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Enter 10-digit number',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Color(0xFFBBDDF2)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Color(0xFFBBDDF2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xFF0877E8),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: sendOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0877E8),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Send OTP  →',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpTrust(icon: Icons.verified_user, text: 'Secure\nLogin'),
                    OtpTrust(icon: Icons.eco, text: 'Trusted by\nAqua Farmers'),
                    OtpTrust(icon: Icons.groups, text: 'Better\nTogether'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- OTP ----------------

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({super.key, required this.phoneNumber});

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

  String get formattedPhone {
    final p = widget.phoneNumber;
    if (p.length == 10) {
      return '+91 ${p.substring(0, 5)} ${p.substring(5)}';
    }
    return '+91 $p';
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
                    'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
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
                  Text(
                    formattedPhone,
                    style: const TextStyle(
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFF6FBFD),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 8),
              _hero(),
              const SizedBox(height: 8),
              _dots(),
              const SizedBox(height: 10),
              _quickRows(context),
              const SizedBox(height: 14),
              _dealer(context),
              const SizedBox(height: 18),
              _sectionHeader(Icons.inventory_2_rounded, 'Our Aquaculture Solutions', 'Trusted Products for Healthy Shrimp & Better Yields'),
              const SizedBox(height: 9),
              _products(context),
              const SizedBox(height: 18),
              _sectionHeader(Icons.emoji_events_rounded, 'Success Stories', 'Real farmers. Real results.', iconColor: Colors.amber),
              const SizedBox(height: 9),
              _successStories(),
              const SizedBox(height: 18),
              _waterTools(),
              const SizedBox(height: 18),
              _sectionHeader(Icons.menu_book_rounded, 'Shrimp Growth Guide', 'Step-by-step guidance from stocking to harvest'),
              const SizedBox(height: 9),
              _growthGuide(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 7, 8, 7),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        children: [
          Image.asset(
            'marine_logo.png',
            width: 58,
            height: 58,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(Icons.water_drop, color: marineBlue, size: 46),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MARINE AQUA', style: TextStyle(color: Color(0xFF063B75), fontSize: 18, fontWeight: FontWeight.w800)),
                Text('TECHNOLOGIES', style: TextStyle(color: Color(0xFF063B75), fontSize: 10.5, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                Text('ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా', style: TextStyle(color: Colors.black54, fontSize: 8)),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded, color: Color(0xFF063B75), size: 27)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.translate_rounded, color: Color(0xFF063B75), size: 24)),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(color: Color(0xFFE5F2FF), shape: BoxShape.circle),
            child: const Icon(Icons.person, color: Color(0xFF087ED6), size: 25),
          ),
        ],
      ),
    );
  }

  Widget _hero() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 190,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          gradient: const LinearGradient(colors: [Color(0xFF063B75), Color(0xFF087ED6), Color(0xFF16AFC6)]),
        ),
        child: Stack(
          children: [
            Positioned(right: -10, top: 16, child: Icon(Icons.set_meal, size: 145, color: Colors.white.withOpacity(.18))),
            Positioned(right: 5, bottom: -15, child: Icon(Icons.water, size: 125, color: Colors.white.withOpacity(.13))),
            const Padding(
              padding: EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Healthy Ponds', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                  Text('Stronger Shrimp', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                  Text('Higher Profits', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                  SizedBox(height: 5),
                  Text('Complete Aquaculture Solutions\nfor a Better Tomorrow', style: TextStyle(color: Colors.white, fontSize: 12, height: 1.25)),
                  SizedBox(height: 12),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(9))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      child: Text('Explore Products  →', style: TextStyle(color: Color(0xFF063B75), fontSize: 12.5, fontWeight: FontWeight.bold)),
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

  Widget _dots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) => Container(
        width: i == 0 ? 13 : 7,
        height: 7,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(color: i == 0 ? const Color(0xFF087ED6) : const Color(0xFFC9D8E5), borderRadius: BorderRadius.circular(8)),
      )),
    );
  }

  Widget _quickRows(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(children: [
            Expanded(child: _quickCard(Icons.lightbulb_rounded, Colors.orange, const Color(0xFFDDF8EA), 'Tip Of The Day', 'Maintain proper dissolved oxygen levels for better growth.', 'Learn More  →')),
            const SizedBox(width: 9),
            Expanded(child: _quickCard(Icons.menu_book_rounded, const Color(0xFF087ED6), const Color(0xFFE1F2FF), 'Shrimp Culture Guide', 'Learn setup, management & best practices.', 'Explore Guide  →')),
          ]),
          const SizedBox(height: 9),
          Row(children: [
            Expanded(child: _quickCard(Icons.calculate_rounded, const Color(0xFF008B68), const Color(0xFFD9F7E5), 'Biomass Calculator', 'Get estimated biomass in 3 easy steps.', 'Calculate Now  →')),
            const SizedBox(width: 9),
            Expanded(child: _quickCard(Icons.health_and_safety_rounded, Colors.red, const Color(0xFFFFE2E2), 'Shrimp Diseases', 'Identify, prevent & treat common diseases.', 'View Details  →')),
          ]),
        ],
      ),
    );
  }

  Widget _quickCard(IconData icon, Color iconColor, Color bg, String title, String description, String button) {
    return Container(
      height: 154,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: iconColor, size: 30),
        const SizedBox(height: 4),
        Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF063B75), fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Expanded(child: Text(description, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF34546D), fontSize: 10.5, height: 1.2))),
        Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7), decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(8)), child: Text(button, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
      ]),
    );
  }

  Widget _dealer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(color: const Color(0xFFEAF6FF), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFD4EAF8))),
        child: Row(children: [
          const Icon(Icons.location_on_rounded, color: Colors.red, size: 55),
          const SizedBox(width: 8),
          const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Dealers Location', style: TextStyle(color: Color(0xFF063B75), fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 3),
            Text('Find our nearest dealers\nacross India.', style: TextStyle(color: Color(0xFF34546D), fontSize: 11.5, height: 1.2)),
          ])),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DealerPage())),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF087ED6), foregroundColor: Colors.white, elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: const Text('Find Nearby  →', style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }

  Widget _sectionHeader(IconData icon, String title, String subtitle, {Color iconColor = const Color(0xFF087ED6)}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(children: [
        Icon(icon, color: iconColor, size: 28),
        const SizedBox(width: 7),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(color: Color(0xFF063B75), fontSize: 17, fontWeight: FontWeight.bold)),
          Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black54, fontSize: 9.5)),
        ])),
        const Text('View All  →', style: TextStyle(color: Color(0xFF087ED6), fontSize: 10.5, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _products(BuildContext context) {
    final items = products.take(5).toList();
    return SizedBox(
      height: 174,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (_, i) {
          final product = items[i];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsPage(product: product))),
            child: Container(
              width: 132,
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFDCEAF4))),
              child: Column(children: [
                Expanded(child: Image.asset(product.image, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Icon(Icons.inventory_2_rounded, color: Color(0xFF087ED6), size: 48))),
                Text(product.name, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF063B75), fontSize: 10.5, fontWeight: FontWeight.bold)),
                Text(product.category, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black54, fontSize: 8.5)),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget _successStories() {
    return SizedBox(
      height: 135,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        children: [
          _story(Icons.person, '40% Faster Growth', 'West Godavari, AP'),
          _story(Icons.water, 'Better Survival Rate', 'Krishna, AP'),
          _story(Icons.set_meal, 'Healthy & Active Shrimp', 'Kakinada, AP'),
          _story(Icons.agriculture, 'Higher Yields', 'Eluru, AP'),
        ],
      ),
    );
  }

  Widget _story(IconData icon, String title, String location) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 9),
      decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF087ED6), Color(0xFF063B75)], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(14)),
      child: Stack(children: [
        Center(child: Icon(icon, color: Colors.white.withOpacity(.28), size: 66)),
        const Center(child: CircleAvatar(radius: 19, backgroundColor: Colors.white70, child: Icon(Icons.play_arrow, color: Color(0xFF063B75), size: 23))),
        Positioned(left: 9, right: 9, bottom: 8, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.bold)),
          Text(location, style: const TextStyle(color: Colors.white70, fontSize: 9)),
        ])),
      ]),
    );
  }

  Widget _waterTools() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(9, 11, 9, 9),
        decoration: BoxDecoration(color: const Color(0xFFDDF8EA), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.science_rounded, color: Color(0xFF009B73), size: 28),
            const SizedBox(width: 7),
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Water Quality Tools', style: TextStyle(color: Color(0xFF063B75), fontSize: 17, fontWeight: FontWeight.bold)),
              Text('Calculate, monitor and maintain ideal water parameters', style: TextStyle(color: Colors.black54, fontSize: 9.5)),
            ]),
          ]),
          const SizedBox(height: 9),
          Row(children: [
            _tool(Icons.water_drop, 'pH', 'Calculator'),
            _tool(Icons.thermostat, 'Temperature', 'Guide'),
            _tool(Icons.science, 'Salinity', 'Calculator'),
            _tool(Icons.bubble_chart, 'DO', 'Calculator'),
          ]),
        ]),
      ),
    );
  }

  Widget _tool(IconData icon, String title, String subtitle) {
    return Expanded(child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 3),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
      child: Column(children: [
        Icon(icon, color: const Color(0xFF087ED6), size: 26),
        const SizedBox(height: 3),
        Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF063B75), fontSize: 9.5, fontWeight: FontWeight.bold)),
        Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54, fontSize: 7.5)),
      ]),
    ));
  }

  Widget _growthGuide() {
    return SizedBox(
      height: 145,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        children: [
          _growth(Icons.water_drop, 'PL Selection', 'Choose healthy PL'),
          _growth(Icons.water, 'Pond Preparation', 'Get your pond ready'),
          _growth(Icons.grain, 'Feeding Guide', 'Right feed, faster growth'),
          _growth(Icons.set_meal, 'Moulting Care', 'Stronger shell, better growth'),
        ],
      ),
    );
  }

  Widget _growth(IconData icon, String title, String subtitle) {
    return Container(
      width: 155,
      margin: const EdgeInsets.only(right: 9),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13), border: Border.all(color: const Color(0xFFDCEAF4))),
      child: Column(children: [
        Expanded(child: Container(width: double.infinity, decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFFDDF3FF), Color(0xFFE8F8F0)]), borderRadius: BorderRadius.circular(9)), child: Icon(icon, color: const Color(0xFF087ED6), size: 44))),
        const SizedBox(height: 5),
        Align(alignment: Alignment.centerLeft, child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF063B75), fontSize: 10.5, fontWeight: FontWeight.bold))),
        Align(alignment: Alignment.centerLeft, child: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.black54, fontSize: 8.5))),
      ]),
    );
  }
}

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget page;

  const QuickCard({
    super.key,
    required this.icon,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 44, color: marineTeal),
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

class ProductMiniCard extends StatelessWidget {
  final Product product;

  const ProductMiniCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product),
          ),
        ),
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
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.image_not_supported,
                    size: 50,
                  ),
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

// ---------------- PRODUCTS ----------------

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
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
                  childAspectRatio: .72,
                ),
                itemBuilder: (_, i) => ProductCard(product: products[i]),
              ),
            ),
          ],
        ),
      );
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailsPage(product: product),
        ),
      ),
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.image_not_supported, size: 50),
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
              style: const TextStyle(color: marineTeal, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) => Scaffold(
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
                child: Image.asset(product.image, fit: BoxFit.contain),
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
                title: 'Usage',
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
            ],
          ),
        ),
      );
}

class InfoSection extends StatelessWidget {
  final String title, text;
  final IconData icon;

  const InfoSection({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: lightAqua,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: marineTeal),
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
              style: const TextStyle(fontSize: 16, height: 1.55),
            ),
          ],
        ),
      );
}

// ---------------- SUPPORT / PROFILE ----------------

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 70),
              const Icon(Icons.support_agent, size: 80, color: marineTeal),
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
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 35),
              ListTile(
                leading: const Icon(Icons.phone, color: marineTeal),
                title: const Text('Customer Care'),
                subtitle: const Text('+91 93902 59830'),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: const Icon(Icons.email, color: marineTeal),
                title: const Text('Email'),
                subtitle: const Text('marineaquahr@gmail.com'),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ],
          ),
        ),
      );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 25),
            const CircleAvatar(
              radius: 48,
              backgroundColor: lightAqua,
              child: Icon(Icons.person, size: 55, color: marineTeal),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'MARINE AQUA TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ProfileMenu(
              icon: Icons.badge_outlined,
              title: 'Employee Login',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EmployeeLoginPage(),
                ),
              ),
            ),
            ProfileMenu(
              icon: Icons.location_on_outlined,
              title: 'Employee Field Visit',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EmployeeVisitPage(),
                ),
              ),
            ),
            ProfileMenu(
              icon: Icons.info_outline,
              title: 'About Marine Aqua Technologies',
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'MARINE AQUA TECHNOLOGIES',
                applicationLegalese: 'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
              ),
            ),
          ],
        ),
      );
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
  Widget build(BuildContext context) => Card(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: Icon(icon, color: marineTeal),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      );
}

// ---------------- EMPLOYEE ----------------

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  final id = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Employee Login'),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 35),
              const Icon(Icons.badge, size: 75, color: marineTeal),
              const SizedBox(height: 25),
              TextField(
                controller: id,
                decoration: inputDecoration('Employee ID', Icons.person),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: inputDecoration('Password', Icons.lock),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EmployeeDashboardPage(),
                    ),
                  ),
                  child: const Text('LOGIN'),
                ),
              ),
            ],
          ),
        ),
      );
}

class EmployeeDashboardPage extends StatelessWidget {
  const EmployeeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Employee Dashboard'),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            dashboardTile(
              context,
              Icons.location_on,
              'Field Visit',
              const EmployeeVisitPage(),
            ),
            dashboardTile(
              context,
              Icons.water_drop,
              'Water Test',
              const WaterTestPage(),
            ),
            dashboardTile(
              context,
              Icons.waves,
              'My Ponds',
              const MyPondsPage(),
            ),
            dashboardTile(
              context,
              Icons.store,
              'Dealer Locator',
              const DealerPage(),
            ),
          ],
        ),
      );
}

Widget dashboardTile(
  BuildContext context,
  IconData icon,
  String title,
  Widget page,
) =>
    Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: marineTeal),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
      ),
    );

// ---------------- FIELD VISIT ----------------

class EmployeeVisitPage extends StatefulWidget {
  const EmployeeVisitPage({super.key});

  @override
  State<EmployeeVisitPage> createState() => _EmployeeVisitPageState();
}

class _EmployeeVisitPageState extends State<EmployeeVisitPage> {
  final farmerController = TextEditingController();
  final pondController = TextEditingController();
  final remarksController = TextEditingController();

  Position? currentPosition;
  XFile? visitPhoto;
  bool loadingLocation = false;

  String village = '';
  String mandal = '';
  String district = '';
  String state = '';
  String pincode = '';

  Future<void> captureLocation() async {
    setState(() => loadingLocation = true);

    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        _message('Phone Location/GPS ON cheyyandi');
        return;
      }

      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        _message('Location permission denied');
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        _message('Location permission Settings lo enable cheyyandi');
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      String v = '';
      String m = '';
      String d = '';
      String s = '';
      String p = '';

      try {
        final marks = await geo.placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (marks.isNotEmpty) {
          final x = marks.first;
          v = x.subLocality?.trim().isNotEmpty == true
              ? x.subLocality!.trim()
              : (x.locality?.trim() ?? '');
          m = x.locality?.trim() ?? '';
          d = x.subAdministrativeArea?.trim() ?? '';
          s = x.administrativeArea?.trim() ?? '';
          p = x.postalCode?.trim() ?? '';
        }
      } catch (_) {}

      if (!mounted) return;

      setState(() {
        currentPosition = position;
        village = v;
        mandal = m;
        district = d;
        state = s;
        pincode = p;
      });

      _message('Current GPS location captured');
    } catch (_) {
      _message('Location capture failed');
    } finally {
      if (mounted) {
        setState(() => loadingLocation = false);
      }
    }
  }

  Future<void> capturePhoto() async {
    final photo = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (photo != null && mounted) {
      setState(() => visitPhoto = photo);
    }
  }

  void submitVisit() {
    if (farmerController.text.trim().isEmpty) {
      _message('Farmer name enter cheyyandi');
      return;
    }

    if (pondController.text.trim().isEmpty) {
      _message('Pond name/number enter cheyyandi');
      return;
    }

    if (currentPosition == null) {
      _message('First GPS location capture cheyyandi');
      return;
    }

    if (visitPhoto == null) {
      _message('Visit photo capture cheyyandi');
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Visit Submitted'),
        content: Text(
          'Farmer: ${farmerController.text}\n'
          'Pond: ${pondController.text}\n\n'
          'Village: $village\n'
          'Mandal: $mandal\n'
          'District: $district\n'
          'State: $state\n'
          'Pincode: $pincode\n\n'
          'Latitude: ${currentPosition!.latitude}\n'
          'Longitude: ${currentPosition!.longitude}\n\n'
          'Date/Time: ${DateTime.now()}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _message(String text) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)),
      );
    }
  }

  @override
  void dispose() {
    farmerController.dispose();
    pondController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Field Visit'),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Visit Details',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
              const SizedBox(height: 22),
              TextField(
                controller: farmerController,
                decoration: inputDecoration('Farmer Name', Icons.person),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: pondController,
                decoration: inputDecoration(
                  'Pond Name / Pond Number',
                  Icons.waves,
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
              _gpsCard(),
              const SizedBox(height: 18),
              _photoCard(),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: submitVisit,
                  icon: const Icon(Icons.send),
                  label: const Text(
                    'SUBMIT FIELD VISIT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineBlue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      );

  Widget _gpsCard() => Container(
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
                Icon(Icons.location_on, color: marineTeal),
                SizedBox(width: 10),
                Text(
                  'GPS Location',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            if (currentPosition == null)
              const Text(
                'Location not captured',
                style: TextStyle(color: Colors.grey),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Latitude: ${currentPosition!.latitude}'),
                  Text('Longitude: ${currentPosition!.longitude}'),
                  const SizedBox(height: 15),
                  if (village.isNotEmpty)
                    locationRow(
                      Icons.home,
                      'Village / Locality',
                      village,
                    ),
                  if (mandal.isNotEmpty)
                    locationRow(
                      Icons.location_city,
                      'Mandal',
                      mandal,
                    ),
                  if (district.isNotEmpty)
                    locationRow(Icons.map, 'District', district),
                  if (state.isNotEmpty)
                    locationRow(Icons.public, 'State', state),
                  if (pincode.isNotEmpty)
                    locationRow(
                      Icons.markunread_mailbox,
                      'Pincode',
                      pincode,
                    ),
                ],
              ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: loadingLocation ? null : captureLocation,
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
      );

  Widget locationRow(
    IconData icon,
    String title,
    String value,
  ) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: marineTeal),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                '$title: $value',
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      );

  Widget _photoCard() => Container(
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
                Icon(Icons.camera_alt, color: marineTeal),
                SizedBox(width: 10),
                Text(
                  'Visit Photo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            if (visitPhoto != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  File(visitPhoto!.path),
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
      );
}

// ---------------- WATER TEST / PONDS / DIARY / DEALER ----------------

class WaterTestPage extends StatefulWidget {
  const WaterTestPage({super.key});

  @override
  State<WaterTestPage> createState() => _WaterTestPageState();
}

class _WaterTestPageState extends State<WaterTestPage> {
  final pH = TextEditingController();
  final doC = TextEditingController();
  final sal = TextEditingController();
  final ammonia = TextEditingController();
  final temp = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Water Test'),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Water Parameters',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 20),
            field(pH, 'pH', Icons.science),
            field(doC, 'DO (mg/L)', Icons.air),
            field(sal, 'Salinity', Icons.water),
            field(ammonia, 'Ammonia', Icons.warning_amber),
            field(temp, 'Temperature °C', Icons.thermostat),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Water test saved locally'),
                ),
              ),
              child: const Text('SAVE WATER TEST'),
            ),
          ],
        ),
      );

  Widget field(
    TextEditingController c,
    String label,
    IconData i,
  ) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: TextField(
          controller: c,
          keyboardType: TextInputType.number,
          decoration: inputDecoration(label, i),
        ),
      );
}

class MyPondsPage extends StatefulWidget {
  const MyPondsPage({super.key});

  @override
  State<MyPondsPage> createState() => _MyPondsPageState();
}

class _MyPondsPageState extends State<MyPondsPage> {
  final List<String> ponds = [];
  final c = TextEditingController();

  void add() {
    if (c.text.trim().isNotEmpty) {
      setState(() {
        ponds.add(c.text.trim());
        c.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('My Ponds'),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Add Pond'),
              content: TextField(
                controller: c,
                decoration: const InputDecoration(
                  hintText: 'Pond name / number',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    add();
                    Navigator.pop(context);
                  },
                  child: const Text('SAVE'),
                ),
              ],
            ),
          ),
          child: const Icon(Icons.add),
        ),
        body: ponds.isEmpty
            ? const Center(child: Text('No ponds added yet'))
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: ponds.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.waves,
                      color: marineTeal,
                    ),
                    title: Text(ponds[i]),
                  ),
                ),
              ),
      );
}

class PondDiaryPage extends StatefulWidget {
  const PondDiaryPage({super.key});

  @override
  State<PondDiaryPage> createState() => _PondDiaryPageState();
}

class _PondDiaryPageState extends State<PondDiaryPage> {
  final c = TextEditingController();
  final entries = <String>[];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Pond Diary'),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: c,
                maxLines: 4,
                decoration: inputDecoration(
                  "Today's pond observation",
                  Icons.menu_book,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (c.text.trim().isNotEmpty) {
                      setState(() {
                        entries.insert(0, c.text.trim());
                        c.clear();
                      });
                    }
                  },
                  child: const Text('ADD ENTRY'),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (_, i) => Card(
                    child: ListTile(
                      title: Text(entries[i]),
                      subtitle: Text(
                        DateTime.now().toString().substring(0, 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class DealerPage extends StatefulWidget {
  const DealerPage({super.key});

  @override
  State<DealerPage> createState() => _DealerPageState();
}

class _DealerPageState extends State<DealerPage> {
  final dealers = <Map<String, String>>[
    {
      'name': 'Marine Aqua Dealer - Hyderabad',
      'city': 'Hyderabad',
      'address': 'Madhapur',
      'phone': '',
    },
    {
      'name': 'Marine Aqua Dealer - Kakinada',
      'city': 'Kakinada',
      'address': 'Kakinada',
      'phone': '',
    },
    {
      'name': 'Marine Aqua Dealer - Vizag',
      'city': 'Vizag',
      'address': 'Visakhapatnam',
      'phone': '',
    },
  ];

  final n = TextEditingController();
  final city = TextEditingController();
  final addr = TextEditingController();
  final phone = TextEditingController();

  void addDealer() {
    if (n.text.trim().isEmpty) return;

    setState(() {
      dealers.add({
        'name': n.text.trim(),
        'city': city.text.trim(),
        'address': addr.text.trim(),
        'phone': phone.text.trim(),
      });
    });

    n.clear();
    city.clear();
    addr.clear();
    phone.clear();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Dealer Locator'),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Add Dealer'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: n,
                      decoration:
                          const InputDecoration(labelText: 'Dealer Name'),
                    ),
                    TextField(
                      controller: city,
                      decoration:
                          const InputDecoration(labelText: 'City'),
                    ),
                    TextField(
                      controller: addr,
                      decoration:
                          const InputDecoration(labelText: 'Address'),
                    ),
                    TextField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration:
                          const InputDecoration(labelText: 'Phone'),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    addDealer();
                    Navigator.pop(context);
                  },
                  child: const Text('SAVE'),
                ),
              ],
            ),
          ),
          label: const Text('Add Dealer'),
          icon: const Icon(Icons.add),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: dealers.length,
          itemBuilder: (_, i) {
            final d = dealers[i];
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: lightAqua,
                  child: Icon(Icons.store, color: marineTeal),
                ),
                title: Text(
                  d['name'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${d['city']}\n'
                  '${d['address']}'
                  '${(d['phone'] ?? '').isEmpty ? '' : '\n${d['phone']}'}',
                ),
              ),
            );
          },
        ),
      );
}

// ---------------- HELPERS ----------------

InputDecoration inputDecoration(
  String label,
  IconData icon,
) =>
    InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: marineTeal),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 17,
      ),
    );
