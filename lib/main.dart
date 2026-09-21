import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MarineAquaApp());
}

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MARINE AQUA TECHNOLOGIES',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF4F7F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF005F73),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF005F73),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ==========================================
// 1. SPLASH SCREEN
// ==========================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OtpScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002B36),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/marine_logo.png',
              width: 160,
              height: 160,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.water_drop,
                size: 100,
                color: Colors.cyanAccent,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'MARINE AQUA TECHNOLOGIES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Smart Aquaculture. Better Results.',
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyanAccent),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. OTP SCREEN
// ==========================================
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _otpSent = false;

  void _handleSendOtp() {
    if (_phoneController.text.trim().length >= 10) {
      setState(() {
        _otpSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP sent to your mobile number!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 10-digit number')),
      );
    }
  }

  void _handleVerifyOtp() {
    if (_otpController.text.trim().isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.shield_outlined, size: 80, color: Color(0xFF005F73)),
              const SizedBox(height: 16),
              const Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your phone number to access Marine Aqua Technologies',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              if (_otpSent) ...[
                const SizedBox(height: 16),
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter OTP',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _otpSent ? _handleVerifyOtp : _handleSendOtp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(_otpSent ? 'VERIFY & LOGIN' : 'SEND OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 3. HOME SCREEN & NAVIGATION
// ==========================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardTab(),
    const ProductsTab(),
    const MyPondsTab(),
    const SupportTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MARINE AQUA TECHNOLOGIES'),
        actions: [
          IconButton(
            icon: const Icon(Icons.badge),
            tooltip: 'Employee Portal',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EmployeeLoginPage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF005F73),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.pool), label: 'Ponds'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ==========================================
// 4. DASHBOARD TAB
// ==========================================
class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF005F73), Color(0xFF0A9396)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/marine_logo.png',
                  width: 60,
                  height: 60,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.water, size: 50, color: Colors.white),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marine Aqua Care',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Smart Aquaculture. Better Results.',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Quick Actions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _buildActionCard(
                context,
                title: 'Water Test',
                icon: Icons.science,
                color: Colors.blue,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WaterTestPage()),
                ),
              ),
              _buildActionCard(
                context,
                title: 'Pond Diary',
                icon: Icons.book,
                color: Colors.teal,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PondDiaryPage()),
                ),
              ),
              _buildActionCard(
                context,
                title: 'Dealer Locator',
                icon: Icons.location_on,
                color: Colors.orange,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DealerLocatorPage()),
                ),
              ),
              _buildActionCard(
                context,
                title: 'Tech Support',
                icon: Icons.headset_mic,
                color: Colors.purple,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SupportTab()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, color: color),
              ),
              const SizedBox(height: 12),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 5. PRODUCTS TAB & PRODUCT DETAILS
// ==========================================
class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Marine Voltx',
      'image': 'assets/marine_voltx.png',
      'category': 'Probiotic',
      'description': 'Advanced water and soil probiotic for shrimp ponds.'
    },
    {
      'name': 'HP 360 AMBER',
      'image': 'assets/hp360_amber.png',
      'category': 'Health Promoter',
      'description': 'EHP Shield & Gut immunity enhancer.'
    },
    {
      'name': 'Marine-6G',
      'image': 'assets/marine_6g.png',
      'category': 'Gas Reducer',
      'description': 'Absorbs toxic gases like Ammonia and Hydrogen Sulfide.'
    },
    {
      'name': 'BLUMIN ULTRA',
      'image': 'assets/blumin_ultra.png',
      'category': 'Mineral Mix',
      'description': 'Essential minerals for rapid molting and shell hardness.'
    },
    {
      'name': 'Vibrio Shield',
      'image': 'assets/vibrio_shield.png',
      'category': 'Bactericide',
      'description': 'Effective solution against Vibrio pathogens.'
    },
    {
      'name': 'Marine Protab',
      'image': 'assets/marine_protab.png',
      'category': 'Oxygen Granules',
      'description': 'Instant dissolved oxygen tablet for pond bottom.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Image.asset(
              item['image']!,
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.inventory_2, size: 40, color: Colors.teal),
            ),
            title: Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${item['category']} - ${item['description']}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(product: item),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product['image']!,
                height: 180,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.inventory_2, size: 100, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product['name']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Category: ${product['category']}',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const Divider(height: 30),
            const Text(
              'Description & Benefits:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(product['description']!, style: const TextStyle(fontSize: 15)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Inquiry submitted to Marine Aqua team!')),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('INQUIRE NOW'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 6. MY PONDS & ADD/EDIT POND
// ==========================================
class MyPondsTab extends StatefulWidget {
  const MyPondsTab({super.key});

  @override
  State<MyPondsTab> createState() => _MyPondsTabState();
}

class _MyPondsTabState extends State<MyPondsTab> {
  List<Map<String, String>> ponds = [
    {'name': 'Pond 1', 'size': '2.5 Acres', 'species': 'Vannamei'},
    {'name': 'Pond 2', 'size': '1.8 Acres', 'species': 'Monodon'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: ponds.length,
        itemBuilder: (context, index) {
          final p = ponds[index];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.water)),
              title: Text(p['name']!),
              subtitle: Text('Area: ${p['size']} | Species: ${p['species']}'),
              trailing: IconButton(
                icon: const Icon(Icons.edit, color: Colors.grey),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF005F73),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddPondPage()),
          );
        },
      ),
    );
  }
}

class AddPondPage extends StatelessWidget {
  const AddPondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Pond')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Pond Name/Number')),
            const SizedBox(height: 12),
            const TextField(decoration: InputDecoration(labelText: 'Area (in Acres)')),
            const SizedBox(height: 12),
            const TextField(decoration: InputDecoration(labelText: 'Shrimp Species')),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('SAVE POND'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 7. WATER TEST, POND DIARY, DEALER LOCATOR
// ==========================================
class WaterTestPage extends StatelessWidget {
  const WaterTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Quality Testing')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'pH Level')),
            const TextField(decoration: InputDecoration(labelText: 'Salinity (ppt)')),
            const TextField(decoration: InputDecoration(labelText: 'Dissolved Oxygen (ppm)')),
            const TextField(decoration: InputDecoration(labelText: 'Ammonia (NH3)')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Water test report saved.')),
                );
                Navigator.pop(context);
              },
              child: const Text('SUBMIT TEST REPORT'),
            ),
          ],
        ),
      ),
    );
  }
}

class PondDiaryPage extends StatelessWidget {
  const PondDiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pond Daily Diary')),
      body: const Center(
        child: Text('Track daily feed, check tray observations & mortality records here.'),
      ),
    );
  }
}

class DealerLocatorPage extends StatelessWidget {
  const DealerLocatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dealer Locator')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          Card(
            child: ListTile(
              title: Text('Aqua World Traders'),
              subtitle: Text('Bhimavaram, Andhra Pradesh - Ph: 9876543210'),
              leading: Icon(Icons.store, color: Colors.teal),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Coastal Aqua Supplies'),
              subtitle: Text('Nellore, Andhra Pradesh - Ph: 9123456789'),
              leading: Icon(Icons.store, color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 8. SUPPORT & PROFILE TABS
// ==========================================
class SupportTab extends StatelessWidget {
  const SupportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Technical Support', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text('Helpline: +91 1800-123-4567'),
          Text('Email: support@marineaquatech.com'),
          SizedBox(height: 20),
          Text('Our technical experts are available 24/7 for pond diagnostics.'),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
          const SizedBox(height: 12),
          const Text('Aqua Farmer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Text('+91 9876543210', style: TextStyle(color: Colors.grey)),
          const Divider(height: 40),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const OtpScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 9. EMPLOYEE LOGIN & DASHBOARD
// ==========================================
class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  final _empCodeController = TextEditingController();
  final _passController = TextEditingController();

  void _login() {
    if (_empCodeController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const EmployeeDashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _empCodeController,
              decoration: const InputDecoration(labelText: 'Employee ID'),
            ),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: const Text('LOGIN TO PORTAL'),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeDashboardPage extends StatelessWidget {
  const EmployeeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Field Officer Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.add_location_alt, color: Colors.teal, size: 36),
                title: const Text('New Field Visit'),
                subtitle: const Text('Capture farmer details, GPS location & pond image'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmployeeVisitPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 10. EMPLOYEE FIELD VISIT (FIXED GEOCODING API)
// ==========================================
class EmployeeVisitPage extends StatefulWidget {
  const EmployeeVisitPage({super.key});

  @override
  State<EmployeeVisitPage> createState() => _EmployeeVisitPageState();
}

class _EmployeeVisitPageState extends State<EmployeeVisitPage> {
  // Instance created for geocoding ^5.0.0 compatibility
  final Geocoding geocoding = Geocoding();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController farmerNameController = TextEditingController();
  final TextEditingController pondNameController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  final TextEditingController villageController = TextEditingController();
  final TextEditingController mandalController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  double? latitude;
  double? longitude;
  bool isLoadingLocation = false;
  File? capturedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        capturedImage = File(photo.path);
      });
    }
  }

  Future<void> _getCurrentLocationAndAddress() async {
    setState(() {
      isLoadingLocation = true;
    });

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => isLoadingLocation = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('GPS service is disabled. Enable GPS.')),
        );
      }
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => isLoadingLocation = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied.')),
          );
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => isLoadingLocation = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location permissions are permanently denied.'),
          ),
        );
      }
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // FIXED: Using geocoding instance for package version ^5.0.0
      final List<Placemark> marks =
          await geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (marks.isNotEmpty) {
        final Placemark place = marks.first;

        setState(() {
          latitude = position.latitude;
          longitude = position.longitude;

          villageController.text =
              (place.subLocality != null && place.subLocality!.isNotEmpty)
                  ? place.subLocality!
                  : (place.locality ?? '');

          mandalController.text = place.locality ?? '';
          districtController.text = place.subAdministrativeArea ?? '';
          stateController.text = place.administrativeArea ?? '';
          pincodeController.text = place.postalCode ?? '';
        });
      }
    } catch (e) {
      debugPrint('Geocoding error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Geocoding Error: $e')),
        );
      }
    } finally {
      setState(() {
        isLoadingLocation = false;
      });
    }
  }

  void _submitVisit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Field visit record submitted successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Field Visit')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: farmerNameController,
                decoration: const InputDecoration(
                  labelText: 'Farmer Name',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? 'Enter Farmer Name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: pondNameController,
                decoration: const InputDecoration(
                  labelText: 'Pond Name / Number',
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val == null || val.isEmpty ? 'Enter Pond Name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: remarksController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Remarks / Observations',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'GPS Location',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton.icon(
                            onPressed: isLoadingLocation ? null : _getCurrentLocationAndAddress,
                            icon: isLoadingLocation
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.my_location),
                            label: const Text('FETCH GPS'),
                          ),
                        ],
                      ),
                      if (latitude != null && longitude != null) ...[
                        const SizedBox(height: 8),
                        Text('Lat: $latitude | Long: $longitude'),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: villageController,
                decoration: const InputDecoration(labelText: 'Village / Locality'),
              ),
              TextFormField(
                controller: mandalController,
                decoration: const InputDecoration(labelText: 'Mandal'),
              ),
              TextFormField(
                controller: districtController,
                decoration: const InputDecoration(labelText: 'District'),
              ),
              TextFormField(
                controller: stateController,
                decoration: const InputDecoration(labelText: 'State'),
              ),
              TextFormField(
                controller: pincodeController,
                decoration: const InputDecoration(labelText: 'Pincode'),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('CAPTURE POND PHOTO'),
                  ),
                  if (capturedImage != null) ...[
                    const SizedBox(height: 12),
                    Image.file(capturedImage!, height: 150, fit: BoxFit.cover),
                  ],
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitVisit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: const Color(0xFF005F73),
                ),
                child: const Text('SUBMIT VISIT REPORT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
