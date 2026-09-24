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
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF4FBFD),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF129CCB),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

/* =========================================================
   COLORS
========================================================= */

const Color marineBlue = Color(0xFF0B4A7F);
const Color marineCyan = Color(0xFF12A8C5);
const Color lightBlue = Color(0xFFE5F4FF);
const Color lightGreen = Color(0xFFE5F7EF);
const Color lightPink = Color(0xFFFFE9ED);
const Color white = Colors.white;

/* =========================================================
   SPLASH SCREEN
========================================================= */

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MobileLoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            Image.asset(
              'assets/logo.png',
              width: 180,
              height: 180,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.water,
                  size: 120,
                  color: marineCyan,
                );
              },
            ),

            const SizedBox(height: 30),

            const Text(
              'ఆక్వా సాగులో ప్రతి దశలో... మీకు\nతోడుగా',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: marineBlue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 1.35,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Marine Aqua Technologies',
              style: TextStyle(
                color: marineBlue,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),

            const Spacer(),

            Container(
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF12A8C5),
                    Color(0xFF078FD2),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                  topRight: Radius.circular(90),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================================================
   MOBILE LOGIN
========================================================= */

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final TextEditingController mobileController =
      TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (mobileController.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10-digit mobile number'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const OtpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              children: [
                const SizedBox(height: 35),

                Image.asset(
                  'assets/logo.png',
                  width: 155,
                  height: 155,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.water,
                      size: 100,
                      color: marineCyan,
                    );
                  },
                ),

                const SizedBox(height: 18),

                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు\nతోడుగా',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Marine Aqua Technologies',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 19,
                  ),
                ),

                const SizedBox(height: 80),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Your Mobile Number',
                    style: TextStyle(
                      color: marineBlue,
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'We will send a 6-digit OTP to verify\nyour mobile number.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Enter 10-digit number',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 19,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 24,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(
                        color: Color(0xFFB5E0E9),
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: const BorderSide(
                        color: marineCyan,
                        width: 3,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: double.infinity,
                  height: 62,
                  child: ElevatedButton(
                    onPressed: sendOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1099D2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Send OTP  →',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 75),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LoginFeature(
                      icon: Icons.verified_user,
                      title: 'Secure\nLogin',
                    ),
                    LoginFeature(
                      icon: Icons.eco,
                      title: 'Trusted by\nAqua Farmers',
                    ),
                    LoginFeature(
                      icon: Icons.groups,
                      title: 'Better\nTogether',
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFeature extends StatelessWidget {
  final IconData icon;
  final String title;

  const LoginFeature({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: marineCyan,
          size: 45,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

/* =========================================================
   OTP SCREEN
========================================================= */

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController =
      TextEditingController();

  void verifyOtp() {
    if (otpController.text.trim().length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter 6-digit OTP'),
        ),
      );
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigation(),
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              const SizedBox(height: 25),

              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 35,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.water,
                    size: 100,
                    color: marineCyan,
                  );
                },
              ),

              const SizedBox(height: 30),

              const Text(
                'Verify OTP',
                style: TextStyle(
                  color: marineBlue,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Enter the 6-digit OTP sent to your\nmobile number.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 19,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 45),

              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 5,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Enter 6-digit OTP',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1099D2),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Text(
                    'Verify OTP  →',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              const Text(
                'Resend OTP',
                style: TextStyle(
                  color: Color(0xFF128FBE),
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

/* =========================================================
   MAIN NAVIGATION
========================================================= */

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ProductsScreen(),
    SupportScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 85,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFD5F4F7),
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

/* =========================================================
   HOME
========================================================= */

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            const SizedBox(height: 8),

            _buildHeader(context),

            const SizedBox(height: 15),

            _buildHero(),

            const SizedBox(height: 18),

            _buildWaterQuality(),

            const SizedBox(height: 18),

            _buildQuickCards(),

            const SizedBox(height: 28),

            _buildProductsSection(),

            const SizedBox(height: 28),

            _buildSuccessStories(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          const Icon(
            Icons.menu,
            size: 38,
            color: marineBlue,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 62,
                  height: 62,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.water,
                      size: 50,
                      color: marineCyan,
                    );
                  },
                ),
                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో...',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'మీకు తోడుగా',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Marine Aqua Technologies',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.notifications_none,
            color: marineBlue,
            size: 34,
          ),

          const SizedBox(width: 10),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFDCEEFF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.language,
                  color: marineBlue,
                ),
                SizedBox(width: 5),
                Text(
                  'EN',
                  style: TextStyle(
                    color: marineBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: marineBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(28),
      height: 220,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0A4E89),
            Color(0xFF16AFC1),
          ],
        ),
        borderRadius: BorderRadius.circular(38),
      ),
      child: Stack(
        children: [
          const Positioned(
            right: -25,
            bottom: -20,
            child: Icon(
              Icons.water,
              size: 150,
              color: Color(0x301FFFFFF),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Healthy Ponds\nStronger Shrimp\nHigher Profits',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  height: 1.05,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  height: 1.35,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Explore Products  →',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWaterQuality() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFE4F8F1),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.water_drop,
                color: marineCyan,
                size: 42,
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Water Quality\nParameters',
                      style: TextStyle(
                        color: marineBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Maintain Optimal Water Conditions for Healthy Shrimp',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'View All →',
                style: TextStyle(
                  color: Color(0xFF178FC5),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Row(
            children: [
              ParameterCard(
                icon: '🌡️',
                title: 'Temperature',
                value: '28°C –\n30°C',
              ),
              ParameterCard(
                icon: 'pH',
                title: 'pH',
                value: '7.5 – 8.5',
              ),
              ParameterCard(
                icon: 'O₂',
                title: 'Dissolved\nOxygen',
                value: '> 4 / > 6\nppm',
              ),
              ParameterCard(
                icon: '〰',
                title: 'Salinity',
                value: '0 – 30 ppt',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: const [
          QuickCard(
            icon: Icons.menu_book,
            title: 'Shrimp\nCulture Guide',
            subtitle: 'Pond Preparation...',
            color: lightBlue,
          ),
          QuickCard(
            icon: Icons.calculate,
            title: 'Biomass\nCalculator',
            subtitle: 'Estimate Your\nShrimp Stock',
            color: lightGreen,
          ),
          QuickCard(
            icon: Icons.health_and_safety,
            title: 'Shrimp\nDiseases',
            subtitle: 'Identify • Prevent • Manage',
            color: lightPink,
          ),
        ],
      ),
    );
  }

  Widget _buildProductsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Our Aquaculture\nSolutions',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'View All Products →',
                style: TextStyle(
                  color: Color(0xFF178FC5),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: const [
              ProductCard(
                image: 'assets/marine_6g.png',
                name: 'MARINE-6G',
                category: 'Liquid Minerals',
              ),
              ProductCard(
                image: 'assets/white_shield.png',
                name: 'MARINE WHITE SHIELD',
                category: 'Gut Health',
              ),
              ProductCard(
                image: 'assets/vibrio_shield.png',
                name: 'VIBRIO SHIELD',
                category: 'Vibrio Control',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessStories() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Success Stories',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'View All Stories →',
                style: TextStyle(
                  color: Color(0xFF178FC5),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 18),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: const Color(0xFFDDE6E9),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF078FCE),
                      Color(0xFF15A8B7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(
                  Icons.agriculture,
                  size: 65,
                  color: Colors.white,
                ),
              ),

              const SizedBox(width: 20),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"Better growth and healthy shrimp"',
                      style: TextStyle(
                        color: marineBlue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'West Godavari, AP',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/* =========================================================
   PARAMETER CARD
========================================================= */

class ParameterCard extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  const ParameterCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 4,
        ),
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFD5E5E9),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: marineBlue,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: marineBlue,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* =========================================================
   QUICK CARD
========================================================= */

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const QuickCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      height: 145,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF1098D0),
            size: 42,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: marineBlue,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   PRODUCT CARD
========================================================= */

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String category;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 340,
      margin: const EdgeInsets.only(right: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFD6E2E6),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.image_not_supported,
                  size: 70,
                  color: Colors.grey,
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: marineBlue,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 5),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              category,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   PRODUCTS SCREEN
========================================================= */

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      ['assets/marine_6g.png', 'MARINE-6G', 'Liquid Minerals'],
      ['assets/white_shield.png', 'MARINE WHITE SHIELD', 'Gut Health'],
      ['assets/vibrio_shield.png', 'VIBRIO SHIELD', 'Vibrio Control'],
      ['assets/protab.png', 'MARINE PROTAB', 'Probiotic'],
      ['assets/volt-x.png', 'MARINE VOLT-X', 'Growth Support'],
      ['assets/oxytab.png', 'OXYTAB+', 'Oxygen Support'],
      ['assets/bio_sludge_x.png', 'BIO SLUDGE-X', 'Sludge Management'],
    ];

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 25),

          const Text(
            'Our Products',
            style: TextStyle(
              color: marineBlue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: products.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: .72,
              ),
              itemBuilder: (_, index) {
                return ProductCard(
                  image: products[index][0],
                  name: products[index][1],
                  category: products[index][2],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* =========================================================
   SUPPORT
========================================================= */

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              'Support',
              style: TextStyle(
                color: marineBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            SupportTile(
              icon: Icons.phone,
              title: 'Call Support',
              subtitle: 'Talk to our aquaculture support team',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.chat,
              title: 'WhatsApp Support',
              subtitle: 'Get assistance from Marine Aqua Team',
              onTap: () {},
            ),

            SupportTile(
              icon: Icons.menu_book,
              title: 'MAT Guide',
              subtitle: 'Aquaculture technical guide',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'mat_guide.pdf is available in app assets.',
                    ),
                  ),
                );
              },
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
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFFE0F6FA),
          child: Icon(
            icon,
            color: marineCyan,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: marineBlue,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}

/* =========================================================
   PROFILE
========================================================= */

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 25),

            Image.asset(
              'assets/logo.png',
              width: 120,
              height: 120,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.person,
                  size: 100,
                  color: marineCyan,
                );
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'Marine Aqua Technologies',
              style: TextStyle(
                color: marineBlue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 35),

            ProfileTile(
              icon: Icons.person_outline,
              title: 'My Profile',
            ),

            ProfileTile(
              icon: Icons.language,
              title: 'Language',
            ),

            ProfileTile(
              icon: Icons.info_outline,
              title: 'About Marine Aqua Technologies',
            ),

            ProfileTile(
              icon: Icons.description_outlined,
              title: 'Terms & Conditions',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: marineCyan,
          size: 28,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: marineBlue,
            fontSize: 17,
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
