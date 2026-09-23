import 'package:flutter/material.dart';

void main() => runApp(const MarineAquaApp());

const marineBlue = Color(0xFF006B78);
const marineTeal = Color(0xFF008C95);
const lightAqua = Color(0xFFE7F7F8);
const pageBg = Color(0xFFF3FBFC);
const darkText = Color(0xFF063B45);

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MARINE AQUA TECHNOLOGIES',
        theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: marineTeal), scaffoldBackgroundColor: pageBg),
        home: const HomePage(),
      );
}

class Product {
  final String name, category, image, description, dosage;
  const Product({required this.name, required this.category, required this.image, required this.description, required this.dosage});
}

const products = <Product>[
  Product(name: 'MARINE-6G', category: 'Liquid Minerals', image: 'marine 6g.png', description: 'Liquid mineral formulation for moulting, shell formation and mineral balance.', dosage: '2–3 L/acre; feed 10 ml/kg'),
  Product(name: 'MARINE WHITE SHIELD', category: 'Gut Health', image: 'white shield.png', description: 'Advanced gut health formula with probiotic and digestive support.', dosage: '5–10 ml/kg feed'),
  Product(name: 'MARINE VIBRIO SHIELD', category: 'Vibrio Control', image: 'vibrio shield.png', description: 'High-efficacy liquid formulation for Vibrio management.', dosage: 'Preventive 1 L/acre; curative 1.5 L/acre'),
  Product(name: 'MARINE PROTAB', category: 'Probiotic Tablet', image: 'protab.png', description: 'Probiotic tablet for biological pond support.', dosage: '250–300 g/acre'),
  Product(name: 'OXY TAB+', category: 'Oxygen Support', image: 'oxytab.png', description: 'Smart Oxygen Release Technology for pond oxygen support.', dosage: '500 g/acre'),
  Product(name: 'MARINE VOLT-X', category: 'Growth Booster', image: 'volt-x.png', description: 'Growth booster with probiotics, enzymes and feed assimilation support.', dosage: '5–10 ml/kg feed'),
  Product(name: 'BIO SLUDGE-X', category: 'Sludge Management', image: 'bio sludge -x.png', description: 'Microbial formulation for organic sludge management.', dosage: '250–500 g/acre'),
  Product(name: 'FREE MOULT', category: 'Moulting Support', image: 'free moult.png', description: 'Chelated mineral and moulting support formulation.', dosage: '5–10 kg/acre'),
  Product(name: 'STARMIN', category: 'Minerals + Probiotics', image: 'starmin.png', description: 'Mineral support combined with probiotic support.', dosage: 'According to product label'),
  Product(name: 'RED THUNDER-80', category: 'Pond Hygiene', image: 'red thunder.png', description: 'Formulation for pond water hygiene and harmful bacterial management.', dosage: '1 L/acre'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;
  final pages = const [FarmerHome(), ProductsPage(), ToolsPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: pages[tab],
        bottomNavigationBar: NavigationBar(
          selectedIndex: tab,
          onDestinationSelected: (v) => setState(() => tab = v),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Products'),
            NavigationDestination(icon: Icon(Icons.build_outlined), selectedIcon: Icon(Icons.build), label: 'Tools'),
            NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      );
}

class FarmerHome extends StatelessWidget {
  const FarmerHome({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView(padding: const EdgeInsets.all(18), children: [
          const SizedBox(height: 8),
          Image.asset('marine_logo.png', height: 72),
          const SizedBox(height: 8),
          const Text('MARINE AQUA TECHNOLOGIES', textAlign: TextAlign.center, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800, color: darkText)),
          const Text('Smart Aquaculture. Better Results.', textAlign: TextAlign.center, style: TextStyle(color: marineTeal, fontWeight: FontWeight.w600)),
          const SizedBox(height: 22),
          Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(gradient: const LinearGradient(colors: [marineBlue, marineTeal]), borderRadius: BorderRadius.circular(24)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.waves, color: Colors.white, size: 42), SizedBox(height: 10), Text('Your Pond. Your Data. Better Decisions.', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('Aquaculture tools made for farmers.', style: TextStyle(color: Colors.white70))])),
          const SizedBox(height: 16),
          _card(context, Icons.water_drop, 'My Ponds', 'Add and manage your ponds', const MyPondsPage()),
          _card(context, Icons.menu_book, 'Pond Diary', 'Record daily pond observations', const PondDiaryPage()),
          _card(context, Icons.science, 'Water Test', 'Record water parameters', const WaterTestPage()),
          _card(context, Icons.calculate, 'Biomass Calculator', 'Estimate shrimp biomass', const BiomassPage()),
          _card(context, Icons.inventory_2, 'Our Products', 'Explore Marine Aqua products', const ProductsPage()),
          _card(context, Icons.support_agent, 'Technical Support', 'Get aquaculture support', const SupportPage()),
        ]),
      );

  Widget _card(BuildContext context, IconData icon, String title, String subtitle, Widget page) => Card(color: Colors.white, child: ListTile(contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), leading: CircleAvatar(backgroundColor: lightAqua, child: Icon(icon, color: marineTeal)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: darkText)), subtitle: Text(subtitle), trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page))));
}

class MyPondsPage extends StatefulWidget {
  const MyPondsPage({super.key});
  @override State<MyPondsPage> createState() => _MyPondsPageState();
}
class _MyPondsPageState extends State<MyPondsPage> {
  final ponds = <Map<String,String>>[];
  void addPond() {
    final name = TextEditingController(); final area = TextEditingController();
    showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Add Pond'), content: Column(mainAxisSize: MainAxisSize.min, children: [TextField(controller: name, decoration: const InputDecoration(labelText: 'Pond Name / Number')), TextField(controller: area, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Area (acres)'))]), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')), ElevatedButton(onPressed: () { if (name.text.trim().isNotEmpty) setState(() => ponds.add({'name': name.text.trim(), 'area': area.text.trim()})); Navigator.pop(context); }, child: const Text('SAVE'))]));
  }
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('My Ponds'), actions: [IconButton(onPressed: addPond, icon: const Icon(Icons.add))]), body: ponds.isEmpty ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.water, size: 70, color: marineTeal), const SizedBox(height: 12), const Text('No ponds added yet'), const SizedBox(height: 12), ElevatedButton.icon(onPressed: addPond, icon: const Icon(Icons.add), label: const Text('ADD POND'))])) : ListView.builder(padding: const EdgeInsets.all(14), itemCount: ponds.length, itemBuilder: (_,i) => Card(color: Colors.white, child: ListTile(leading: const CircleAvatar(backgroundColor: lightAqua, child: Icon(Icons.water, color: marineTeal)), title: Text(ponds[i]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('${ponds[i]['area'] ?? ''} acres')))));
}

class PondDiaryPage extends StatefulWidget { const PondDiaryPage({super.key}); @override State<PondDiaryPage> createState()=>_PondDiaryPageState(); }
class _PondDiaryPageState extends State<PondDiaryPage> {
  final note=TextEditingController(); final entries=<String>[];
  @override void dispose(){note.dispose();super.dispose();}
  @override Widget build(BuildContext context)=>Scaffold(appBar: AppBar(title: const Text('Pond Diary')), body: ListView(padding: const EdgeInsets.all(18), children:[TextField(controller:note,maxLines:5,decoration:InputDecoration(labelText:'Today\'s pond observation',alignLabelWithHint:true,filled:true,fillColor:Colors.white,border:OutlineInputBorder(borderRadius:BorderRadius.circular(16),borderSide:BorderSide.none))),const SizedBox(height:12),SizedBox(height:52,child:ElevatedButton(onPressed:(){if(note.text.trim().isNotEmpty){setState(()=>entries.insert(0,note.text.trim()));note.clear();}},child:const Text('SAVE DIARY ENTRY'))),const SizedBox(height:18),...entries.map((e)=>Card(color:Colors.white,child:ListTile(leading:const Icon(Icons.note_alt,color:marineTeal),title:Text(e))))]));
}

class ProductsPage extends StatelessWidget { const ProductsPage({super.key}); @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Our Products')),body:GridView.builder(padding:const EdgeInsets.all(14),itemCount:products.length,gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,crossAxisSpacing:12,mainAxisSpacing:12,childAspectRatio:.72),itemBuilder:(_,i){final p=products[i];return Card(color:Colors.white,clipBehavior:Clip.antiAlias,child:InkWell(onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>ProductDetailsPage(product:p))),child:Padding(padding:const EdgeInsets.all(10),child:Column(children:[Expanded(child:Image.asset(p.image,fit:BoxFit.contain)),const SizedBox(height:6),Text(p.name,textAlign:TextAlign.center,style:const TextStyle(fontWeight:FontWeight.bold,color:darkText)),const SizedBox(height:4),Text(p.category,textAlign:TextAlign.center,style:const TextStyle(fontSize:12,color:marineTeal))]))));}}); }
class ProductDetailsPage extends StatelessWidget { final Product product; const ProductDetailsPage({super.key,required this.product}); @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:Text(product.name)),body:ListView(padding:const EdgeInsets.all(20),children:[Container(height:260,padding:const EdgeInsets.all(20),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(22)),child:Image.asset(product.image)),const SizedBox(height:18),Text(product.name,style:const TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:darkText)),Text(product.category,style:const TextStyle(color:marineTeal,fontWeight:FontWeight.w600)),const SizedBox(height:16),Card(color:Colors.white,child:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('Description',style:TextStyle(fontWeight:FontWeight.bold,color:darkText)),const SizedBox(height:7),Text(product.description),const SizedBox(height:14),const Text('Recommended Dosage',style:TextStyle(fontWeight:FontWeight.bold,color:darkText)),const SizedBox(height:7),Text(product.dosage)]))) ])); }

class ToolsPage extends StatelessWidget { const ToolsPage({super.key}); @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Farmer Tools')),body:ListView(padding:const EdgeInsets.all(16),children:[_t(context,Icons.water_drop,'My Ponds','Manage ponds',const MyPondsPage()),_t(context,Icons.menu_book,'Pond Diary','Daily records',const PondDiaryPage()),_t(context,Icons.science,'Water Test','Water parameters',const WaterTestPage()),_t(context,Icons.calculate,'Biomass Calculator','Shrimp biomass',const BiomassPage()),_t(context,Icons.store,'Dealer Locator','Find dealer locations',const DealerPage())])); }
 Widget _t(BuildContext c,IconData i,String a,String b,Widget p)=>Card(color:Colors.white,child:ListTile(leading:CircleAvatar(backgroundColor:lightAqua,child:Icon(i,color:marineTeal)),title:Text(a,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(b),trailing:const Icon(Icons.chevron_right),onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>p)))); }

class WaterTestPage extends StatefulWidget { const WaterTestPage({super.key}); @override State<WaterTestPage> createState()=>_WaterTestPageState(); }
class _WaterTestPageState extends State<WaterTestPage>{final ph=TextEditingController(),doV=TextEditingController(),sal=TextEditingController(),temp=TextEditingController(),amm=TextEditingController();@override void dispose(){ph.dispose();doV.dispose();sal.dispose();temp.dispose();amm.dispose();super.dispose();}@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Water Parameters')),body:ListView(padding:const EdgeInsets.all(18),children:[_f(ph,'pH',Icons.science),_f(doV,'DO (mg/L)',Icons.air),_f(sal,'Salinity',Icons.water_drop),_f(temp,'Temperature °C',Icons.thermostat),_f(amm,'Ammonia',Icons.warning_amber),const SizedBox(height:8),SizedBox(height:52,child:ElevatedButton(onPressed:()=>ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content:Text('Water test saved locally ✓'))),child:const Text('SAVE WATER TEST')))]));Widget _f(TextEditingController x,String l,IconData i)=>Padding(padding:const EdgeInsets.only(bottom:12),child:TextField(controller:x,keyboardType:const TextInputType.numberWithOptions(decimal:true),decoration:InputDecoration(labelText:l,prefixIcon:Icon(i,color:marineTeal),filled:true,fillColor:Colors.white,border:OutlineInputBorder(borderRadius:BorderRadius.circular(16),borderSide:BorderSide.none))));}

class BiomassPage extends StatefulWidget { const BiomassPage({super.key}); @override State<BiomassPage> createState()=>_BiomassPageState(); }
class _BiomassPageState extends State<BiomassPage>{final area=TextEditingController(),density=TextEditingController(),survival=TextEditingController(text:'80'),weight=TextEditingController();String result='';void calc(){final a=double.tryParse(area.text)??0,d=double.tryParse(density.text)??0,s=(double.tryParse(survival.text)??0)/100,w=double.tryParse(weight.text)??0,count=a*d*s,b=count*w/1000;setState(()=>result='Estimated shrimp count: ${count.toStringAsFixed(0)}\nTotal biomass: ${b.toStringAsFixed(2)} kg\nBiomass/acre: ${a==0?0:(b/a).toStringAsFixed(2)} kg');}@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Biomass Calculator')),body:ListView(padding:const EdgeInsets.all(18),children:[_f(area,'Pond Area (Acres)'),_f(density,'Stocking Density (PL/acre)'),_f(survival,'Survival Rate (%)'),_f(weight,'Average Body Weight (grams)'),ElevatedButton(onPressed:calc,child:const Text('CALCULATE BIOMASS')),if(result.isNotEmpty)Card(color:Colors.white,child:Padding(padding:const EdgeInsets.all(18),child:Text(result,style:const TextStyle(fontSize:17,height:1.7,fontWeight:FontWeight.w600))))]));Widget _f(TextEditingController x,String l)=>Padding(padding:const EdgeInsets.only(bottom:12),child:TextField(controller:x,keyboardType:const TextInputType.numberWithOptions(decimal:true),decoration:InputDecoration(labelText:l,filled:true,fillColor:Colors.white,border:OutlineInputBorder(borderRadius:BorderRadius.circular(16),borderSide:BorderSide.none))));}

class DealerPage extends StatelessWidget { const DealerPage({super.key}); @override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Dealer Locator')),body:ListView(padding:const EdgeInsets.all(16),children:const[_Dealer('Marine Aqua Dealer - Hyderabad','Madhapur, Hyderabad'),_Dealer('Marine Aqua Dealer - Kakinada','Kakinada'),_Dealer('Marine Aqua Dealer - Vizag','Visakhapatnam')]);}
}
class _Dealer extends StatelessWidget{final String name,address;const _Dealer(this.name,this.address);@override Widget build(BuildContext c)=>Card(color:Colors.white,child:ListTile(leading:const CircleAvatar(backgroundColor:lightAqua,child:Icon(Icons.store,color:marineTeal)),title:Text(name,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(address)));}

class SupportPage extends StatelessWidget { const SupportPage({super.key}); @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Technical Support')),body:ListView(padding:const EdgeInsets.all(18),children:const[Icon(Icons.support_agent,size:80,color:marineTeal),SizedBox(height:15),Text('Marine Aqua Technologies technical team support',textAlign:TextAlign.center,style:TextStyle(fontSize:21,fontWeight:FontWeight.bold,color:darkText)),SizedBox(height:20),Card(color:Colors.white,child:ListTile(leading:Icon(Icons.phone,color:marineTeal),title:Text('Customer Care'),subtitle:Text('+91 93902 59830'))),Card(color:Colors.white,child:ListTile(leading:Icon(Icons.email,color:marineTeal),title:Text('Email'),subtitle:Text('marineaquahr@gmail.com')))]));}

class ProfilePage extends StatelessWidget { const ProfilePage({super.key}); @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Profile')),body:ListView(padding:const EdgeInsets.all(18),children:const[Image(image:AssetImage('marine_logo.png'),height:90),SizedBox(height:15),Text('MARINE AQUA TECHNOLOGIES',textAlign:TextAlign.center,style:TextStyle(fontSize:22,fontWeight:FontWeight.bold,color:darkText)),SizedBox(height:5),Text('Smart Aquaculture. Better Results.',textAlign:TextAlign.center,style:TextStyle(color:marineTeal)),SizedBox(height:25),Card(color:Colors.white,child:ListTile(leading:Icon(Icons.agriculture,color:marineTeal),title:Text('Farmer App'),subtitle:Text('Pond management, products and aquaculture tools.')))]));}
