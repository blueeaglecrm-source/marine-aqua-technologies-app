import 'package:flutter/material.dart';

void main() => runApp(const MarineAquaApp());

const marineBlue = Color(0xFF0B3B73);
const brightBlue = Color(0xFF0789D8);
const aqua = Color(0xFF19AFC0);
const pageBg = Color(0xFFF4FBFD);
const greenCard = Color(0xFFDDF7E9);
const blueCard = Color(0xFFDDF0FC);
const redCard = Color(0xFFFFE0E0);
const darkText = Color(0xFF0A3D73);

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
        fontFamily: 'Roboto',
      ),
      home: const SplashPage(),
    );
  }
}

// ---------------- SPLASH ----------------

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: -80,
            bottom: -70,
            child: Container(
              width: 390,
              height: 230,
              decoration: const BoxDecoration(
                color: aqua,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(220),
                ),
              ),
            ),
          ),
          Positioned(
            right: -80,
            bottom: -120,
            child: Container(
              width: 470,
              height: 260,
              decoration: const BoxDecoration(
                color: brightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(260),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'marine_logo.png',
                  width: 235,
                  height: 235,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.water_drop,
                    size: 140,
                    color: aqua,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా\nMarine Aqua Technologies',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: darkText,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 95),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- LOGIN ----------------

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mobileController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (mobileController.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 10-digit mobile number')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpPage(mobile: mobileController.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxHeight < 720;
            final horizontal = constraints.maxWidth < 380 ? 24.0 : 34.0;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontal),
              child: Column(
                children: [
                  SizedBox(height: compact ? 14 : 24),
                  Center(
                    child: Image.asset(
                      'marine_logo.png',
                      width: compact ? 190 : 215,
                      height: compact ? 145 : 165,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.water_drop,
                        size: 90,
                        color: aqua,
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: darkText,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Marine Aqua Technologies',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkText,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: compact ? 28 : 38),
                  SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Enter Your Mobile Number',
                        maxLines: 1,
                        style: TextStyle(
                          color: darkText,
                          fontSize: 30,
                          height: 1.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'We will send a 6-digit OTP to verify your mobile number.',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        height: 1.3,
                      ),
                    ),
                  ),
                  SizedBox(height: compact ? 18 : 22),
                  TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Enter 10-digit number',
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 17),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                        borderSide: const BorderSide(
                          color: Color(0xFFB8DCE9),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(26),
                        borderSide: const BorderSide(
                          color: brightBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: FilledButton(
                      onPressed: sendOtp,
                      style: FilledButton.styleFrom(
                        backgroundColor: brightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'Send OTP  →',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: compact ? 22 : 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LoginFeature(icon: Icons.verified_user, title: 'Secure\nLogin'),
                      LoginFeature(icon: Icons.eco, title: 'Trusted by\nAqua Farmers'),
                      LoginFeature(icon: Icons.groups, title: 'Better\nTogether'),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(height: compact ? 8 : 14),
                ],
              ),
            );
          },
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
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: aqua, size: 42),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- OTP ----------------

class OtpPage extends StatefulWidget {
  final String mobile;

  const OtpPage({super.key, required this.mobile});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void verify() {
    if (otpController.text.trim().length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter the 6-digit OTP')),
      );
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainShell()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 55, 30, 20),
        child: Column(
          children: [
            const Icon(Icons.sms_outlined, size: 85, color: brightBlue),
            const SizedBox(height: 25),
            const Text(
              'Verify Your Mobile',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Enter the 6-digit OTP sent to\n+91 ${widget.mobile}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: otpController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                letterSpacing: 9,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: '• • • • • •',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton(
                onPressed: verify,
                style: FilledButton.styleFrom(
                  backgroundColor: brightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Verify OTP  →',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP resent')),
              ),
              child: const Text('Resend OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- MAIN SHELL ----------------

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    ProductsPage(),
    SupportPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: NavigationBar(
        height: 92,
        backgroundColor: const Color(0xFFEAF3F5),
        indicatorColor: const Color(0xFFCFEFF3),
        selectedIndex: index,
        onDestinationSelected: (value) {
          setState(() => index = value);
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

// ---------------- HOME ----------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _header(context)),
            SliverToBoxAdapter(child: _hero(context)),
            SliverToBoxAdapter(child: _quickCards(context)),
            SliverToBoxAdapter(child: _dealer(context)),
            SliverToBoxAdapter(child: _productsSection(context)),
            SliverToBoxAdapter(child: _successStories(context)),
            SliverToBoxAdapter(child: _waterTools(context)),
            SliverToBoxAdapter(child: _growthGuide(context)),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      color: const Color(0xFFF6FCFD),
      padding: const EdgeInsets.fromLTRB(24, 12, 18, 10),
      child: Row(
        children: [
          Image.asset(
            'marine_logo.png',
            width: 105,
            height: 95,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.water_drop, size: 60, color: aqua),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARINE AQUA',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                  ),
                ),
                Text(
                  'TECHNOLOGIES',
                  style: TextStyle(
                    color: darkText,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
                Text(
                  'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా\nMarine Aqua Technologies',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NotificationsPage(),
              ),
            ),
            icon: const Icon(
              Icons.notifications_none,
              size: 32,
              color: darkText,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.translate,
              size: 30,
              color: darkText,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfilePage(),
              ),
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFE1F1FA),
              child: Icon(
                Icons.person,
                size: 30,
                color: brightBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hero(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: Container(
        height: 385,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0B3D76),
              Color(0xFF087FD0),
              Color(0xFF16AFC1),
            ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -15,
              top: 80,
              child: Icon(
                Icons.water,
                size: 200,
                color: Colors.white.withOpacity(.10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 35, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Healthy Ponds\nStronger Shrimp\nHigher Profits',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 39,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Complete Aquaculture Solutions\nfor a Better Tomorrow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      height: 1.35,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: darkText,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Explore Products  →',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  Widget _quickCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 18),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: .95,
        children: [
          HomeInfoCard(
            color: greenCard,
            icon: Icons.lightbulb_outline,
            iconColor: Colors.orange,
            title: 'Tip Of The Day',
            text: 'Maintain proper dissolved oxygen levels for better growth.',
            button: 'Learn More →',
            buttonColor: Colors.orange,
            onTap: () {},
          ),
          HomeInfoCard(
            color: blueCard,
            icon: Icons.menu_book,
            iconColor: brightBlue,
            title: 'Shrimp Culture Guide',
            text: 'Learn setup, management & best practices.',
            button: 'Explore Guide →',
            buttonColor: brightBlue,
            onTap: () {},
          ),
          HomeInfoCard(
            color: greenCard,
            icon: Icons.calculate,
            iconColor: Colors.teal,
            title: 'Biomass Calculator',
            text: 'Get estimated biomass in 3 easy steps.',
            button: 'Calculate Now →',
            buttonColor: Colors.teal,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BiomassPage(),
              ),
            ),
          ),
          HomeInfoCard(
            color: redCard,
            icon: Icons.health_and_safety,
            iconColor: Colors.red,
            title: 'Shrimp Diseases',
            text: 'Identify, prevent & treat common diseases.',
            button: 'View Details →',
            buttonColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _dealer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 25),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFE5F4FE),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFD0E7F3)),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_pin, size: 64, color: Colors.red),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dealers Location',
                    style: TextStyle(
                      color: darkText,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Find our nearest dealers\nacross India.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: brightBlue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Find Nearby →',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productsSection(BuildContext context) {
    return HomeSection(
      icon: Icons.inventory_2,
      iconColor: brightBlue,
      title: 'Our Aquaculture Solutions',
      subtitle: 'Trusted Products for Healthy Shrimp & Better Yields',
      action: 'View All →',
      onAction: () {
        final shell = context.findAncestorStateOfType<_MainShellState>();
        shell?.setState(() => shell.index = 1);
      },
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(width: 14),
          itemBuilder: (_, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }

  Widget _successStories(BuildContext context) {
    return HomeSection(
      icon: Icons.emoji_events,
      iconColor: Colors.amber,
      title: 'Success Stories',
      subtitle: 'Real farmers. Real results.',
      action: 'View All →',
      onAction: () {},
      child: SizedBox(
        height: 220,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: const [
            StoryCard(
              title: '40% Faster Growth',
              location: 'West Godavari, AP',
            ),
            SizedBox(width: 16),
            StoryCard(
              title: 'Better Survival Rate',
              location: 'Krishna, AP',
            ),
            SizedBox(width: 16),
            StoryCard(
              title: 'Healthy Pond',
              location: 'Kakinada, AP',
            ),
          ],
        ),
      ),
    );
  }

  Widget _waterTools(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 5, 24, 28),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
        decoration: BoxDecoration(
          color: const Color(0xFFDDF7EA),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.science, size: 40, color: Colors.teal),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Water Quality Tools',
                      style: TextStyle(
                        color: darkText,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Calculate, monitor and maintain ideal water parameters',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                WaterTool(icon: Icons.water_drop, title: 'pH', subtitle: 'Calculator'),
                WaterTool(icon: Icons.thermostat, title: 'Temperature', subtitle: 'Guide'),
                WaterTool(icon: Icons.science, title: 'Salinity', subtitle: 'Calculator'),
                WaterTool(icon: Icons.bubble_chart, title: 'DO', subtitle: 'Calculator'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _growthGuide(BuildContext context) {
    return HomeSection(
      icon: Icons.menu_book,
      iconColor: brightBlue,
      title: 'Shrimp Growth Guide',
      subtitle: 'Step-by-step guidance from stocking to harvest',
      action: 'View All →',
      onAction: () {},
      child: SizedBox(
        height: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: const [
            GuideCard(
              icon: Icons.water_drop,
              title: 'PL Selection',
              subtitle: 'Choose healthy PL',
            ),
            SizedBox(width: 16),
            GuideCard(
              icon: Icons.waves,
              title: 'Pond Preparation',
              subtitle: 'Get your pond ready',
            ),
            SizedBox(width: 16),
            GuideCard(
              icon: Icons.restaurant,
              title: 'Feeding',
              subtitle: 'Right feed management',
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- PRODUCTS ----------------

class Product {
  final String name;
  final String category;
  final String image;
  final String description;
  final String dosage;

  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.dosage,
  });
}

const products = [
  Product(
    name: 'MARINE-6G',
    category: 'Liquid Minerals',
    image: 'marine 6g.png',
    description:
        'Bio-available macro minerals, chelated trace elements, stabilized ionic complexes, moulting support factors and mineral uptake enhancers with Nano Ion Matrix Technology.',
    dosage: '2–3 L/acre. Feed: 10 ml/kg.',
  ),
  Product(
    name: 'MARINE WHITE SHIELD',
    category: 'Gut Health',
    image: 'matine white shield.png',
    description:
        'Advanced Gut Health Formula with multi-strain probiotics, organic acid salts, phytogenic extracts, beta-glucans, digestive enzymes, toxin binder and prebiotic support.',
    dosage: 'Preventive/Curative: 5–10 ml/kg feed. Standard: 10 ml/kg feed.',
  ),
  Product(
    name: 'MARINE VIBRIO SHIELD',
    category: 'Vibrio Control',
    image: 'vibrio shield.png',
    description:
        'High-efficacy liquid formulation with controlled oxidative activators, marine-grade salts and advanced stabilizing agents.',
    dosage: 'Preventive: 1 L/acre. Curative: 1.5 L/acre. Apply probiotics after 24 hours.',
  ),
  Product(
    name: 'MARINE PROTAB',
    category: 'Probiotic Tablet',
    image: 'protab.png',
    description:
        'Spore-forming marine probiotic blend, nitrifying bacteria complex, purple non-sulfur bacteria, lactic acid bacteria, yeast culture and functional additives.',
    dosage: '250–300 g/acre.',
  ),
  Product(
    name: 'OXY TAB+',
    category: 'Oxygen Support',
    image: 'oxytab.png',
    description:
        'Smart Oxygen Release Technology using oxygen precursors, sodium perborate and sodium percarbonate with stabilizers.',
    dosage: '500 g/acre. Oxygen support up to 8 hours.',
  ),
  Product(
    name: 'MARINE VOLT-X',
    category: 'Growth Booster',
    image: 'volt-x.png',
    description:
        'Advanced growth booster with essential amino acids, hepatopancreas support, beta-glucan immune support and feed assimilation enhancers.',
    dosage: 'Preventive: 5–10 ml/kg feed. Curative: 10 ml/kg feed.',
  ),
  Product(
    name: 'BIO SLUDGE-X',
    category: 'Pond Bottom',
    image: 'bio sludge -x.png',
    description:
        'Beneficial Bacillus species, enzyme mix, Yucca extract, Thiobacillus, nitrifying bacteria and bottom activation carriers.',
    dosage: '250–500 g/acre.',
  ),
  Product(
    name: 'FREE MOULT',
    category: 'Mineral Support',
    image: 'free moult.png',
    description:
        'Chelated minerals, moulting inducers and trace nutrients for moulting and shell support.',
    dosage: '5–10 kg/acre.',
  ),
  Product(
    name: 'STARMIN',
    category: 'Minerals + Probiotics',
    image: 'starmin.png',
    description:
        'Mineral and probiotic support with beneficial Bacillus and lactic acid bacteria strains.',
    dosage: 'Use as directed by technical team.',
  ),
  Product(
    name: 'RED THUNDER-80',
    category: 'Pond Hygiene',
    image: 'red thunder.png',
    description:
        'BKC, Glutaraldehyde and Formaldehyde based pond hygiene formulation.',
    dosage: '1 L/acre.',
  ),
];

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: const Text(
          'Our Aquaculture Solutions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: .72,
        ),
        itemBuilder: (_, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            fullPage: true,
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final bool fullPage;

  const ProductCard({
    super.key,
    required this.product,
    this.fullPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailsPage(product: product),
        ),
      ),
      child: Container(
        width: fullPage ? null : 260,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFD5E6EC)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.inventory_2,
                    size: 80,
                    color: brightBlue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: darkText,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              product.name,
              style: const TextStyle(
                color: darkText,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              product.category,
              style: const TextStyle(
                color: brightBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Product Details',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE2F5F7),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.medication, color: marineBlue),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Recommended Dosage\n${product.dosage}',
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
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

// ---------------- SUPPORT ----------------

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: const Text(
          'Technical Support',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [marineBlue, brightBlue],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.support_agent,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(height: 12),
                Text(
                  'Marine Aqua Technical Support',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Get aquaculture guidance and product support.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SupportTile(
            icon: Icons.phone,
            title: 'Customer Care',
            subtitle: '+91 93902 59830',
          ),
          const SizedBox(height: 10),
          SupportTile(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'marineaquahr@gmail.com',
          ),
          const SizedBox(height: 10),
          SupportTile(
            icon: Icons.menu_book,
            title: 'Shrimp Culture Guide',
            subtitle: 'Setup, management and best practices',
          ),
          const SizedBox(height: 10),
          SupportTile(
            icon: Icons.health_and_safety,
            title: 'Shrimp Diseases',
            subtitle: 'Identify common disease problems',
          ),
        ],
      ),
    );
  }
}

class SupportTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SupportTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE0F3F7),
          child: Icon(icon, color: brightBlue),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: darkText,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 17),
      ),
    );
  }
}

// ---------------- PROFILE ----------------

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [marineBlue, brightBlue],
              ),
              borderRadius: BorderRadius.circular(26),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: brightBlue,
                    size: 55,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Farmer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Marine Aqua Technologies',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          ProfileTile(
            icon: Icons.water,
            title: 'My Ponds',
            subtitle: 'Manage your ponds',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MyPondsPage(),
              ),
            ),
          ),
          ProfileTile(
            icon: Icons.menu_book,
            title: 'Pond Diary',
            subtitle: 'Daily pond records',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PondDiaryPage(),
              ),
            ),
          ),
          ProfileTile(
            icon: Icons.settings,
            title: 'Settings',
            subtitle: 'App preferences',
            onTap: () {},
          ),
          ProfileTile(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా\nMarine Aqua Technologies',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'MARINE AQUA TECHNOLOGIES',
                applicationVersion: '1.0.0',
              );
            },
          ),
          const SizedBox(height: 15),
          OutlinedButton.icon(
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
              (_) => false,
            ),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE0F3F7),
          child: Icon(icon, color: brightBlue),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

// ---------------- POND PAGES ----------------

class MyPondsPage extends StatefulWidget {
  const MyPondsPage({super.key});

  @override
  State<MyPondsPage> createState() => _MyPondsPageState();
}

class _MyPondsPageState extends State<MyPondsPage> {
  final ponds = <Map<String, String>>[];

  void addPond() {
    final name = TextEditingController();
    final area = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Pond'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: 'Pond Name'),
            ),
            TextField(
              controller: area,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Area (acres)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (name.text.trim().isEmpty) return;
              setState(() {
                ponds.add({
                  'name': name.text.trim(),
                  'area': area.text.trim(),
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Ponds')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addPond,
        backgroundColor: brightBlue,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add Pond'),
      ),
      body: ponds.isEmpty
          ? const Center(
              child: Text(
                'No ponds added yet.\nTap + Add Pond to start.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: ponds.length,
              itemBuilder: (_, index) {
                final pond = ponds[index];
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.water),
                    ),
                    title: Text(pond['name'] ?? ''),
                    subtitle: Text('${pond['area'] ?? '0'} acres'),
                  ),
                );
              },
            ),
    );
  }
}

class PondDiaryPage extends StatefulWidget {
  const PondDiaryPage({super.key});

  @override
  State<PondDiaryPage> createState() => _PondDiaryPageState();
}

class _PondDiaryPageState extends State<PondDiaryPage> {
  final controller = TextEditingController();
  final entries = <String>[];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pond Diary')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: controller,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Write today pond observations...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                onPressed: () {
                  if (controller.text.trim().isEmpty) return;
                  setState(() {
                    entries.insert(0, controller.text.trim());
                    controller.clear();
                  });
                },
                child: const Text('SAVE ENTRY'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: entries.isEmpty
                ? const Center(child: Text('No entries yet'))
                : ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: entries.length,
                    itemBuilder: (_, index) => Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.menu_book,
                          color: brightBlue,
                        ),
                        title: Text(entries[index]),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ---------------- TOOLS ----------------

class BiomassPage extends StatefulWidget {
  const BiomassPage({super.key});

  @override
  State<BiomassPage> createState() => _BiomassPageState();
}

class _BiomassPageState extends State<BiomassPage> {
  final count = TextEditingController();
  final weight = TextEditingController();
  String result = '';

  @override
  void dispose() {
    count.dispose();
    weight.dispose();
    super.dispose();
  }

  void calculate() {
    final c = double.tryParse(count.text);
    final w = double.tryParse(weight.text);

    if (c == null || w == null) {
      setState(() => result = 'Enter valid values.');
      return;
    }

    final kg = c * w / 1000;
    setState(() => result = 'Estimated Biomass: ${kg.toStringAsFixed(2)} kg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biomass Calculator')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Shrimp Biomass Calculator',
            style: TextStyle(
              color: darkText,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: count,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Shrimp Count',
              filled: true,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: weight,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Average Weight (grams)',
              filled: true,
            ),
          ),
          const SizedBox(height: 18),
          FilledButton(
            onPressed: calculate,
            child: const Text('CALCULATE'),
          ),
          if (result.isNotEmpty) ...[
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: greenCard,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------- NOTIFICATIONS ----------------

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.notifications),
              ),
              title: Text('Welcome to Marine Aqua Technologies'),
              subtitle: Text(
                'ఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా\nMarine Aqua Technologies',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.inventory_2),
              ),
              title: Text('Product Updates'),
              subtitle: Text(
                'Explore our aquaculture solutions and product information.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- HOME HELPERS ----------------

class HomeInfoCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String text;
  final String button;
  final Color buttonColor;
  final VoidCallback onTap;

  const HomeInfoCard({
    super.key,
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.text,
    required this.button,
    required this.buttonColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 42),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: darkText,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                height: 1.35,
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: onTap,
              style: FilledButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                button,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String action;
  final VoidCallback onAction;
  final Widget child;

  const HomeSection({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.action,
    required this.onAction,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 24, 12),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: darkText,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: onAction,
                child: Text(
                  action,
                  style: const TextStyle(
                    color: brightBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        child,
        const SizedBox(height: 25),
      ],
    );
  }
}

class StoryCard extends StatelessWidget {
  final String title;
  final String location;

  const StoryCard({
    super.key,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF087ACB), Color(0xFF0566B1)],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Color(0x66FFFFFF),
              child: Icon(
                Icons.play_arrow,
                size: 45,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            location,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class WaterTool extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const WaterTool({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(icon, color: brightBlue, size: 38),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: darkText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GuideCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const GuideCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFD6E5EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE2F6FB), Color(0xFFE6F8F1)],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: brightBlue,
                size: 75,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: darkText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
