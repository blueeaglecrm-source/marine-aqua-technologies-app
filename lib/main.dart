import 'package:flutter/material.dart';

void main() {
  runApp(const MarineAquaApp());
}

class MarineAquaApp extends StatefulWidget {
  const MarineAquaApp({super.key});

  @override
  State<MarineAquaApp> createState() => _MarineAquaAppState();
}

class _MarineAquaAppState extends State<MarineAquaApp> {
  bool isTelugu = false;

  void changeLanguage(bool telugu) {
    setState(() {
      isTelugu = telugu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006B67),
        ),
      ),
      home: HomePage(
        isTelugu: isTelugu,
        onLanguageChanged: changeLanguage,
      ),
    );
  }
}

// ------------------------------------------------------------
// HOME PAGE
// ------------------------------------------------------------

class HomePage extends StatefulWidget {
  final bool isTelugu;
  final Function(bool) onLanguageChanged;

  const HomePage({
    super.key,
    required this.isTelugu,
    required this.onLanguageChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeContent(
        isTelugu: widget.isTelugu,
        onLanguageChanged: widget.onLanguageChanged,
      ),
      ProductsPage(isTelugu: widget.isTelugu),
      ProfilePage(isTelugu: widget.isTelugu),
      SupportPage(isTelugu: widget.isTelugu),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: widget.isTelugu ? 'హోమ్' : 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.inventory_2_outlined),
            selectedIcon: const Icon(Icons.inventory_2),
            label: widget.isTelugu ? 'ప్రొడక్ట్స్' : 'Products',
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: widget.isTelugu ? 'ప్రొఫైల్' : 'Profile',
          ),
          NavigationDestination(
            icon: const Icon(Icons.support_agent_outlined),
            selectedIcon: const Icon(Icons.support_agent),
            label: widget.isTelugu ? 'సపోర్ట్' : 'Support',
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// HOME CONTENT
// ------------------------------------------------------------

class HomeContent extends StatelessWidget {
  final bool isTelugu;
  final Function(bool) onLanguageChanged;

  const HomeContent({
    super.key,
    required this.isTelugu,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF004F4B),
                    Color(0xFF008C83),
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            _languageButton(
                              context,
                              'EN',
                              !isTelugu,
                              false,
                              onLanguageChanged,
                            ),
                            _languageButton(
                              context,
                              'తెలుగు',
                              isTelugu,
                              true,
                              onLanguageChanged,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // MARINE LOGO
                  Image.asset(
                    'marine_logo.png',
                    height: 85,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.water_drop,
                        color: Colors.white,
                        size: 70,
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'MARINE AQUA TECHNOLOGIES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'ప్రయత్నం మీది... ఫలితం మాది.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // WELCOME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  isTelugu
                      ? 'ఆక్వా సాగుకు మీ పూర్తి సపోర్ట్'
                      : 'Your Complete Support for Aquaculture',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004F4B),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // INFO CARDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  InfoCard(
                    icon: Icons.water,
                    title: isTelugu
                        ? 'నీటి నాణ్యత'
                        : 'Water Quality',
                    description: isTelugu
                        ? 'Pond water quality management కోసం సరైన ఉత్పత్తులు మరియు మార్గదర్శకాలు.'
                        : 'Products and guidance for better pond water quality management.',
                  ),
                  InfoCard(
                    icon: Icons.health_and_safety,
                    title: isTelugu
                        ? 'రొయ్యల ఆరోగ్యం'
                        : 'Shrimp Health',
                    description: isTelugu
                        ? 'రొయ్యల ఆరోగ్యం, ఇమ్యూనిటీ మరియు మంచి కల్చర్ కోసం సరైన సపోర్ట్.'
                        : 'Right support for shrimp health, immunity and better culture.',
                  ),
                  InfoCard(
                    icon: Icons.trending_up,
                    title: isTelugu
                        ? 'గ్రోత్ మేనేజ్‌మెంట్'
                        : 'Growth Management',
                    description: isTelugu
                        ? 'మంచి feed utilization మరియు growth కోసం Marine products.'
                        : 'Marine products for better feed utilization and growth.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // PRODUCT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductsPage(isTelugu: isTelugu),
                      ),
                    );
                  },
                  icon: const Icon(Icons.inventory_2),
                  label: Text(
                    isTelugu
                        ? 'మా ప్రొడక్ట్స్ చూడండి'
                        : 'View Our Products',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006B67),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _languageButton(
    BuildContext context,
    String text,
    bool selected,
    bool telugu,
    Function(bool) callback,
  ) {
    return GestureDetector(
      onTap: () {
        callback(telugu);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected
                ? const Color(0xFF006B67)
                : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// INFO CARD
// ------------------------------------------------------------

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.07),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F5F3),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF006B67),
              size: 27,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                    height: 1.4,
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

// ------------------------------------------------------------
// PRODUCTS PAGE
// ------------------------------------------------------------

class ProductsPage extends StatelessWidget {
  final bool isTelugu;

  const ProductsPage({
    super.key,
    required this.isTelugu,
  });

  @override
  Widget build(BuildContext context) {
    final products = [
      ProductData(
        name: 'MARINE 6G',
        image: 'marine 6g.png',
        telugu:
            'Liquid Minerals – Shell Formation & Moulting Support',
        english:
            'Liquid minerals for shell formation and moulting support.',
      ),
      ProductData(
        name: 'MARINE VIBRIO SHIELD',
        image: 'vibrio shield.png',
        telugu:
            'Vibrio Management కోసం రూపొందించిన ప్రత్యేక ఫార్ములా.',
        english:
            'Special formulation for Vibrio management.',
      ),
      ProductData(
        name: 'MARINE PROTAB',
        image: 'protab.png',
        telugu:
            'Probiotic support – Pond microbial management కోసం.',
        english:
            'Probiotic support for pond microbial management.',
      ),
      ProductData(
        name: 'MARINE VOLT-X',
        image: 'volt-x.png',
        telugu:
            'Growth & Energy support కోసం.',
        english:
            'Advanced growth and energy support.',
      ),
      ProductData(
        name: 'BIO SLUDGE-X',
        image: 'bio sludge -x.png',
        telugu:
            'Organic sludge management మరియు microbial activity కోసం.',
        english:
            'For organic sludge management and microbial activity.',
      ),
      ProductData(
        name: 'OXYTAB',
        image: 'oxytab.png',
        telugu:
            'Pond oxygen support కోసం.',
        english:
            'Oxygen support for aquaculture ponds.',
      ),
      ProductData(
        name: 'FREE MOULT',
        image: 'free moult.png',
        telugu:
            'Smooth moulting support కోసం.',
        english:
            'Support for smooth moulting.',
      ),
      ProductData(
        name: 'WHITE SHIELD',
        image: 'white shield.png',
        telugu:
            'Shrimp health support కోసం.',
        english:
            'Shrimp health support.',
      ),
      ProductData(
        name: 'RED THUNDER',
        image: 'red thunder.png',
        telugu:
            'Aquaculture performance support.',
        english:
            'Aquaculture performance support.',
      ),
      ProductData(
        name: 'STARMIN',
        image: 'starmin.png',
        telugu:
            'Mineral support కోసం.',
        english:
            'Mineral support for aquaculture.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isTelugu ? 'మా ప్రొడక్ట్స్' : 'Our Products',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF006B67),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            isTelugu: isTelugu,
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// PRODUCT MODEL
// ------------------------------------------------------------

class ProductData {
  final String name;
  final String image;
  final String telugu;
  final String english;

  ProductData({
    required this.name,
    required this.image,
    required this.telugu,
    required this.english,
  });
}

// ------------------------------------------------------------
// PRODUCT CARD
// ------------------------------------------------------------

class ProductCard extends StatelessWidget {
  final ProductData product;
  final bool isTelugu;

  const ProductCard({
    super.key,
    required this.product,
    required this.isTelugu,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 55,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            const SizedBox(height: 7),
            Text(
              product.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006B67),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              isTelugu ? product.telugu : product.english,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.5,
                color: Colors.grey.shade700,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// PROFILE PAGE
// ------------------------------------------------------------

class ProfilePage extends StatelessWidget {
  final bool isTelugu;

  const ProfilePage({
    super.key,
    required this.isTelugu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isTelugu ? 'ప్రొఫైల్' : 'Profile',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF006B67),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Center(
            child: Image.asset(
              'marine_logo.png',
              height: 110,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.water_drop,
                  size: 90,
                  color: Color(0xFF006B67),
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          const Center(
            child: Text(
              'MARINE AQUA TECHNOLOGIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006B67),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'ప్రయత్నం మీది... ఫలితం మాది.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 30),
          _profileTile(
            Icons.business,
            isTelugu ? 'కంపెనీ' : 'Company',
            'Marine Aqua Technologies',
          ),
          _profileTile(
            Icons.water_drop,
            isTelugu ? 'విభాగం' : 'Industry',
            isTelugu
                ? 'Aquaculture & Shrimp Farming'
                : 'Aquaculture & Shrimp Farming',
          ),
          _profileTile(
            Icons.language,
            isTelugu ? 'భాష' : 'Language',
            isTelugu ? 'తెలుగు' : 'English',
          ),
        ],
      ),
    );
  }

  Widget _profileTile(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF006B67),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}

// ------------------------------------------------------------
// SUPPORT PAGE
// ------------------------------------------------------------

class SupportPage extends StatelessWidget {
  final bool isTelugu;

  const SupportPage({
    super.key,
    required this.isTelugu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isTelugu ? 'సపోర్ట్' : 'Support',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF006B67),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Image.asset(
              'marine_logo.png',
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.support_agent,
                  size: 90,
                  color: Color(0xFF006B67),
                );
              },
            ),

            const SizedBox(height: 18),

            Text(
              isTelugu
                  ? 'Marine Aqua Technologies'
                  : 'Marine Aqua Technologies',
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF006B67),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              isTelugu
                  ? 'మీ ఆక్వా సాగుకు మా పూర్తి సపోర్ట్.'
                  : 'Complete support for your aquaculture journey.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 25),

            _supportCard(
              Icons.phone,
              isTelugu ? 'సంప్రదించండి' : 'Contact Us',
              isTelugu
                  ? 'మా టీమ్‌ను సంప్రదించడానికి'
                  : 'Contact our team for assistance',
            ),

            _supportCard(
              Icons.menu_book,
              isTelugu ? 'ఉత్పత్తుల సమాచారం' : 'Product Information',
              isTelugu
                  ? 'ప్రొడక్ట్స్ మరియు వాటి ఉపయోగాల గురించి తెలుసుకోండి.'
                  : 'Learn about our products and their applications.',
            ),

            _supportCard(
              Icons.help_outline,
              isTelugu ? 'సహాయం' : 'Help',
              isTelugu
                  ? 'మీకు అవసరమైన సహాయం కోసం మమ్మల్ని సంప్రదించండి.'
                  : 'Contact us whenever you need assistance.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _supportCard(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.07),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFFE3F5F3),
            child: Icon(
              icon,
              color: const Color(0xFF006B67),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
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
