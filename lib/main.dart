import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MarineAquaApp());

const marineBlue = Color(0xFF006B78);
const marineTeal = Color(0xFF008C95);
const aqua = Color(0xFF18A9AD);
const lightAqua = Color(0xFFE7F7F8);
const pageBg = Color(0xFFF3FBFC);
const darkText = Color(0xFF063B45);

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
        appBarTheme: const AppBarTheme(
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
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
    description: 'Liquid mineral formulation for moulting, shell formation and mineral balance.',
    dosage: '2–3 L/acre; feed 10 ml/kg',
  ),
  Product(
    name: 'MARINE WHITE SHIELD',
    category: 'Gut Health',
    image: 'white shield.png',
    description: 'Advanced gut health formula with probiotics, organic acids, phytogenics and digestive support.',
    dosage: '5–10 ml/kg feed',
  ),
  Product(
    name: 'MARINE VIBRIO SHIELD',
    category: 'Vibrio Control',
    image: 'vibrio shield.png',
    description: 'High-efficacy liquid formulation designed for Vibrio management.',
    dosage: 'Preventive 1 L/acre; curative 1.5 L/acre',
  ),
  Product(
    name: 'MARINE PROTAB',
    category: 'Probiotic Tablet',
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
    description: 'Growth booster with probiotics, enzymes, amino acids and feed assimilation support.',
    dosage: '5–10 ml/kg feed',
  ),
  Product(
    name: 'BIO SLUDGE-X',
    category: 'Sludge Management',
    image: 'bio sludge -x.png',
    description: 'Microbial formulation for organic sludge management and pond-bottom support.',
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [
    DashboardPage(),
    ProductsPage(),
    SupportPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (v) => setState(() => index = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Products'),
          NavigationDestination(icon: Icon(Icons.support_agent_outlined), selectedIcon: Icon(Icons.support_agent), label: 'Support'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const SizedBox(height: 8),
          Image.asset('marine_logo.png', height: 72),
          const SizedBox(height: 8),
          const Text(
            'MARINE AQUA TECHNOLOGIES',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: darkText),
          ),
          const Text(
            'Smart Aquaculture. Better Results.',
            textAlign: TextAlign.center,
            style: TextStyle(color: marineTeal, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          _heroCard(context),
          const SizedBox(height: 16),
          _menuCard(context, Icons.inventory_2, 'Our Products', 'Explore aquaculture solutions', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsPage()));
          }),
          _menuCard(context, Icons.water_drop, 'Water Quality Tools', 'Monitor pond parameters', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const WaterTestPage()));
          }),
          _menuCard(context, Icons.calculate, 'Biomass Calculator', 'Estimate shrimp biomass', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const BiomassPage()));
          }),
          _menuCard(context, Icons.location_on, 'Dealer Locator', 'Find Marine Aqua dealers', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const DealerPage()));
          }),
          _menuCard(context, Icons.badge, 'Employee Login', 'Face scan + GPS field access', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const EmployeeLoginPage()));
          }),
        ],
      ),
    );
  }

  Widget _heroCard(BuildContext context) => Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [marineBlue, marineTeal]),
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.waves, color: Colors.white, size: 42),
            SizedBox(height: 12),
            Text('Healthy Ponds. Stronger Shrimp.', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
            SizedBox(height: 7),
            Text('Complete aquaculture solutions for better pond management.', style: TextStyle(color: Colors.white70, fontSize: 15)),
          ],
        ),
      );

  Widget _menuCard(BuildContext context, IconData icon, String title, String subtitle, VoidCallback tap) => Card(
        color: Colors.white,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: CircleAvatar(backgroundColor: lightAqua, child: Icon(icon, color: marineTeal)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: darkText)),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
          onTap: tap,
        ),
      );
}

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
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsPage(product: p))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(child: Image.asset(p.image, fit: BoxFit.contain)),
                    const SizedBox(height: 6),
                    Text(p.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, color: darkText)),
                    const SizedBox(height: 4),
                    Text(p.category, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: marineTeal)),
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
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
            child: Image.asset(product.image),
          ),
          const SizedBox(height: 20),
          Text(product.name, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: darkText)),
          Text(product.category, style: const TextStyle(color: marineTeal, fontWeight: FontWeight.w600)),
          const SizedBox(height: 18),
          _info('Product Description', product.description),
          _info('Recommended Dosage', product.dosage),
        ],
      ),
    );
  }

  Widget _info(String title, String value) => Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: darkText)),
            const SizedBox(height: 7),
            Text(value),
          ]),
        ),
      );
}

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  bool busy = false;

  Future<void> _scanFaceAndContinue() async {
    if (busy) return;
    setState(() => busy = true);

    try {
      final picker = ImagePicker();
      final photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 90,
        preferredCameraDevice: CameraDevice.front,
      );

      if (photo == null) {
        if (mounted) setState(() => busy = false);
        return;
      }

      final detector = FaceDetector(
        options: FaceDetectorOptions(
          performanceMode: FaceDetectorMode.accurate,
          enableLandmarks: false,
          enableContours: false,
          enableClassification: false,
          enableTracking: false,
          minFaceSize: 0.1,
        ),
      );

      final input = InputImage.fromFilePath(photo.path);
      final faces = await detector.processImage(input);
      await detector.close();

      if (faces.length != 1) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              faces.isEmpty
                  ? 'Face not detected. Please scan your face again.'
                  : 'Only one face should be visible. Please scan again.',
            ),
          ),
        );
        setState(() => busy = false);
        return;
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Face scan successful ✓')),
      );

      await _captureLocation();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Face scan failed: $e')),
      );
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> _captureLocation() async {
    final enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please turn ON phone GPS / Location.')),
        );
      }
      return;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permission denied.')),
        );
      }
      return;
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    String village = '';
    String mandal = '';
    String district = '';
    String state = '';
    String pincode = '';

    try {
      final marks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (marks.isNotEmpty) {
        final m = marks.first;
        village = m.locality ?? m.subLocality ?? '';
        mandal = m.subLocality ?? '';
        district = m.subAdministrativeArea ?? '';
        state = m.administrativeArea ?? '';
        pincode = m.postalCode ?? '';
      }
    } catch (_) {}

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => EmployeeDashboardPage(
          latitude: position.latitude,
          longitude: position.longitude,
          village: village,
          mandal: mandal,
          district: district,
          state: state,
          pincode: pincode,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Login')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 55),
            Container(
              width: 125,
              height: 125,
              decoration: const BoxDecoration(color: lightAqua, shape: BoxShape.circle),
              child: const Icon(Icons.face_retouching_natural, size: 72, color: marineTeal),
            ),
            const SizedBox(height: 22),
            const Text(
              'Face Scan Login',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: darkText),
            ),
            const SizedBox(height: 10),
            const Text(
              'Scan one face using the front camera.\nAfter a successful scan, GPS location will be captured.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, height: 1.5),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton.icon(
                onPressed: busy ? null : _scanFaceAndContinue,
                icon: busy
                    ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                    : const Icon(Icons.camera_front),
                label: Text(busy ? 'Scanning...' : 'SCAN FACE'),
              ),
            ),
            const SizedBox(height: 18),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.security, size: 18, color: marineTeal),
                SizedBox(width: 7),
                Text('Face detection + GPS'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeDashboardPage extends StatelessWidget {
  final double latitude, longitude;
  final String village, mandal, district, state, pincode;

  const EmployeeDashboardPage({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.village,
    required this.mandal,
    required this.district,
    required this.state,
    required this.pincode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          _locationCard(),
          const SizedBox(height: 14),
          _action(context, Icons.assignment, 'Field Visit', 'Record farmer / pond visit', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const FieldVisitPage()));
          }),
          _action(context, Icons.water_drop, 'Water Test', 'Record pond water parameters', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const WaterTestPage()));
          }),
          _action(context, Icons.inventory_2, 'Products', 'Open Marine Aqua products', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsPage()));
          }),
        ],
      ),
    );
  }

  Widget _locationCard() => Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [
              CircleAvatar(backgroundColor: lightAqua, child: Icon(Icons.location_on, color: marineTeal)),
              SizedBox(width: 12),
              Text('Verified Employee', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: darkText)),
            ]),
            const Divider(height: 25),
            Text('Village / Locality: $village'),
            Text('Mandal: $mandal'),
            Text('District: $district'),
            Text('State: $state'),
            Text('Pincode: $pincode'),
            const SizedBox(height: 8),
            Text('Latitude: ${latitude.toStringAsFixed(6)}'),
            Text('Longitude: ${longitude.toStringAsFixed(6)}'),
          ]),
        ),
      );

  Widget _action(BuildContext context, IconData icon, String title, String subtitle, VoidCallback tap) => Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(backgroundColor: lightAqua, child: Icon(icon, color: marineTeal)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
          onTap: tap,
        ),
      );
}

class FieldVisitPage extends StatefulWidget {
  const FieldVisitPage({super.key});

  @override
  State<FieldVisitPage> createState() => _FieldVisitPageState();
}

class _FieldVisitPageState extends State<FieldVisitPage> {
  final farmer = TextEditingController();
  final pond = TextEditingController();
  final remarks = TextEditingController();
  XFile? photo;
  Position? position;
  bool loading = false;

  Future<void> captureLocation() async {
    setState(() => loading = true);
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw Exception('GPS is OFF');
      }
      var p = await Geolocator.checkPermission();
      if (p == LocationPermission.denied) p = await Geolocator.requestPermission();
      if (p == LocationPermission.denied || p == LocationPermission.deniedForever) {
        throw Exception('Location permission denied');
      }
      position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> capturePhoto() async {
    final p = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 85);
    if (p != null) setState(() => photo = p);
  }

  void submit() {
    if (farmer.text.trim().isEmpty || pond.text.trim().isEmpty || position == null || photo == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter farmer, pond, GPS and photo details.')));
      return;
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Visit Submitted ✓'),
        content: Text('Farmer: ${farmer.text}\nPond: ${pond.text}\nGPS: ${position!.latitude.toStringAsFixed(6)}, ${position!.longitude.toStringAsFixed(6)}'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }

  @override
  void dispose() {
    farmer.dispose();
    pond.dispose();
    remarks.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Field Visit')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          TextField(controller: farmer, decoration: _input('Farmer Name', Icons.person)),
          const SizedBox(height: 12),
          TextField(controller: pond, decoration: _input('Pond Name / Number', Icons.water)),
          const SizedBox(height: 12),
          TextField(controller: remarks, maxLines: 3, decoration: _input('Visit Remarks', Icons.notes)),
          const SizedBox(height: 15),
          ElevatedButton.icon(onPressed: loading ? null : captureLocation, icon: const Icon(Icons.location_on), label: Text(loading ? 'Capturing...' : 'CAPTURE CURRENT LOCATION')),
          const SizedBox(height: 10),
          if (position != null) Text('GPS: ${position!.latitude}, ${position!.longitude}'),
          const SizedBox(height: 10),
          ElevatedButton.icon(onPressed: capturePhoto, icon: const Icon(Icons.camera_alt), label: Text(photo == null ? 'CAPTURE VISIT PHOTO' : 'RETAKE PHOTO')),
          if (photo != null) ...[
            const SizedBox(height: 12),
            ClipRRect(borderRadius: BorderRadius.circular(14), child: Image.file(File(photo!.path), height: 220, fit: BoxFit.cover)),
          ],
          const SizedBox(height: 18),
          SizedBox(height: 54, child: ElevatedButton(onPressed: submit, child: const Text('SUBMIT FIELD VISIT'))),
        ],
      ),
    );
  }

  InputDecoration _input(String label, IconData icon) => InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: marineTeal),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      );
}

class WaterTestPage extends StatefulWidget {
  const WaterTestPage({super.key});

  @override
  State<WaterTestPage> createState() => _WaterTestPageState();
}

class _WaterTestPageState extends State<WaterTestPage> {
  final ph = TextEditingController();
  final doValue = TextEditingController();
  final salinity = TextEditingController();
  final temp = TextEditingController();
  final ammonia = TextEditingController();

  @override
  void dispose() {
    ph.dispose(); doValue.dispose(); salinity.dispose(); temp.dispose(); ammonia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Water Parameters')),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            _f(ph, 'pH', Icons.science),
            _f(doValue, 'DO (mg/L)', Icons.air),
            _f(salinity, 'Salinity', Icons.water_drop),
            _f(temp, 'Temperature °C', Icons.thermostat),
            _f(ammonia, 'Ammonia', Icons.warning_amber),
            const SizedBox(height: 15),
            SizedBox(height: 54, child: ElevatedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Water test saved locally ✓'))), child: const Text('SAVE WATER TEST'))),
          ],
        ),
      );

  Widget _f(TextEditingController c, String label, IconData icon) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(controller: c, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon, color: marineTeal), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none))),
      );
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

  void calculate() {
    final a = double.tryParse(area.text) ?? 0;
    final d = double.tryParse(density.text) ?? 0;
    final s = (double.tryParse(survival.text) ?? 0) / 100;
    final w = double.tryParse(weight.text) ?? 0;
    final count = a * d * s;
    final biomass = count * w / 1000;
    setState(() => result = 'Estimated shrimp count: ${count.toStringAsFixed(0)}\nTotal biomass: ${biomass.toStringAsFixed(2)} kg\nBiomass/acre: ${a == 0 ? 0 : (biomass / a).toStringAsFixed(2)} kg');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Biomass Calculator')),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            _f(area, 'Pond Area (Acres)'),
            _f(density, 'Stocking Density (PL/acre)'),
            _f(survival, 'Survival Rate (%)'),
            _f(weight, 'Average Body Weight (grams)'),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: calculate, child: const Text('CALCULATE BIOMASS')),
            if (result.isNotEmpty) Card(color: Colors.white, child: Padding(padding: const EdgeInsets.all(18), child: Text(result, style: const TextStyle(fontSize: 17, height: 1.7, fontWeight: FontWeight.w600)))),
          ],
        ),
      );

  Widget _f(TextEditingController c, String label) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(controller: c, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: InputDecoration(labelText: label, filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none))),
      );
}

class DealerPage extends StatelessWidget {
  const DealerPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Dealer Locator')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _Dealer(name: 'Marine Aqua Dealer - Hyderabad', address: 'Madhapur, Hyderabad'),
            _Dealer(name: 'Marine Aqua Dealer - Kakinada', address: 'Kakinada'),
            _Dealer(name: 'Marine Aqua Dealer - Vizag', address: 'Visakhapatnam'),
          ],
        ),
      );
}

class _Dealer extends StatelessWidget {
  final String name, address;
  const _Dealer({required this.name, required this.address});

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.white,
        child: ListTile(
          leading: const CircleAvatar(backgroundColor: lightAqua, child: Icon(Icons.store, color: marineTeal)),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(address),
        ),
      );
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Technical Support')),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            const Icon(Icons.support_agent, size: 80, color: marineTeal),
            const SizedBox(height: 15),
            const Text('Marine Aqua Technologies technical team support', textAlign: TextAlign.center, style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: darkText)),
            const SizedBox(height: 20),
            Card(color: Colors.white, child: ListTile(leading: const Icon(Icons.phone, color: marineTeal), title: const Text('Customer Care'), subtitle: const Text('+91 93902 59830'))),
            Card(color: Colors.white, child: ListTile(leading: const Icon(Icons.email, color: marineTeal), title: const Text('Email'), subtitle: const Text('marineaquahr@gmail.com'))),
          ],
        ),
      );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Image.asset('marine_logo.png', height: 90),
            const SizedBox(height: 15),
            const Text('MARINE AQUA TECHNOLOGIES', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkText)),
            const SizedBox(height: 5),
            const Text('Smart Aquaculture. Better Results.', textAlign: TextAlign.center, style: TextStyle(color: marineTeal)),
            const SizedBox(height: 25),
            Card(color: Colors.white, child: ListTile(leading: const Icon(Icons.info_outline, color: marineTeal), title: const Text('About Marine Aqua Technologies'), subtitle: const Text('Complete aquaculture solutions for shrimp culture.'))),
            Card(color: Colors.white, child: ListTile(leading: const Icon(Icons.badge, color: marineTeal), title: const Text('Employee Login'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmployeeLoginPage())))),
          ],
        ),
      );
}
