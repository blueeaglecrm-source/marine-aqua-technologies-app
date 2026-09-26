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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0798D1),
        ),
      ),
      home: const ProductGuidePage(),
    );
  }
}

class Product {
  final String name;
  final String category;
  final String description;
  final String dosage;
  final String application;
  final String note;
  final String? image;

  const Product({
    required this.name,
    required this.category,
    required this.description,
    required this.dosage,
    required this.application,
    required this.note,
    this.image,
  });
}

const List<Product> products = [
  Product(
    name: 'BIO SOIL',
    category: 'Soil Mineral',
    description:
        'చెరువు అడుగు భాగంలోని soil conditionను మెరుగుపరచడానికి ఉపయోగించే soil mineral.',
    dosage: '40 kg / acre',
    application:
        'Pond preparation సమయంలో soil ఎండిన తర్వాత చెరువు అడుగుభాగంలో సమానంగా apply చేయాలి.',
    note: 'Soil condition మరియు soil pHను బట్టి ఉపయోగించాలి.',
    image: 'assets/bio_sludge_x.png',
  ),

  Product(
    name: 'STARMIN',
    category: 'Mineral + Probiotics',
    description:
        'Mineral support మరియు beneficial microbial support కోసం ఉపయోగించే formulation.',
    dosage: '10 kg / acre',
    application:
        '200 L నీటిలో కలిపి చెరువు మొత్తం సమానంగా apply చేయాలి.',
    note:
        'Minerals application సమయంలో aerators ONలో ఉంచడం మంచిది.',
    image: 'assets/starmin.png',
  ),

  Product(
    name: 'MARINE-6G',
    category: 'Liquid Minerals',
    description:
        'రొయ్యల molting, shell formation మరియు mineral balanceకు support అందించే liquid mineral.',
    dosage: '2–3 L / acre',
    application:
        '200 L నీటిలో కలిపి చెరువు మొత్తం సమానంగా apply చేయాలి.',
    note: 'నీటి పరిస్థితిని బట్టి అవసరానికి అనుగుణంగా ఉపయోగించాలి.',
    image: 'assets/marine_6g.png',
  ),

  Product(
    name: 'NUTRIMIN',
    category: 'Chelated Minerals',
    description:
        'Chelated minerals ద్వారా mineral balance మరియు shell formationకు support అందిస్తుంది.',
    dosage: '10 kg / acre',
    application:
        '200 L నీటిలో కలిపి చెరువు మొత్తం సమానంగా apply చేయాలి.',
    note: 'Stocking మరియు culture stageను బట్టి ఉపయోగించాలి.',
    image: null,
  ),

  Product(
    name: 'VIBRIO SHIELD',
    category: 'Vibrio Conditioner',
    description:
        'చెరువులో Vibrio management మరియు bacterial load control కోసం ఉపయోగించే conditioner.',
    dosage: '1 L / acre',
    application:
        '200 L నీటిలో కలిపి ఉదయం 9:00 గంటలకు చెరువు మొత్తం సమానంగా apply చేయాలి.',
    note:
        'Vibrio Shield తర్వాత Probiotic applicationకు 24 గంటల gap ఇవ్వాలి.',
    image: 'assets/vibrio_shield.png',
  ),

  Product(
    name: 'MARINE PRO TAB',
    category: 'Probiotic Tablet',
    description:
        'Beneficial microorganisms support ద్వారా pond microbial balance మరియు organic load managementకు సహాయపడుతుంది.',
    dosage: '500 g / acre',
    application:
        'Vibrio Shield వేసిన 24 గంటల తర్వాత చెరువులో సమానంగా apply చేయాలి.',
    note: 'సాధారణంగా ప్రతి 15 రోజులకు ఒకసారి అవసరాన్ని బట్టి ఉపయోగించవచ్చు.',
    image: 'assets/protab.png',
  ),

  Product(
    name: 'MARINE-C',
    category: 'Immunity Booster',
    description:
        'రొయ్యల immunity మరియు stress resistanceకు nutritional support అందించడానికి ఉపయోగిస్తారు.',
    dosage: '5–10 ml / kg feed',
    application:
        'ఉదయం ఇచ్చే 1st feedలో feedకు సమానంగా కలిపి ఇవ్వాలి.',
    note:
        'Stocking చేసిన 20 రోజుల తర్వాత ఉపయోగించడం మంచిది.',
    image: null,
  ),

  Product(
    name: 'MARINE GUT EXPERT',
    category: 'Gut Health',
    description:
        'Gut health, digestion మరియు nutrient utilizationకు support అందించే formulation.',
    dosage: '5 ml / kg feed',
    application:
        '2nd feedలో కలిపి సుమారు 10 నిమిషాలు ఉంచిన తర్వాత feedగా ఇవ్వాలి.',
    note:
        'White Gut లక్షణాలు ఎక్కువగా కనిపిస్తే 10 ml / kg feedగా ఉపయోగించవచ్చు.',
    image: null,
  ),

  Product(
    name: 'MARINE VOLT-X',
    category: 'Growth Booster',
    description:
        'రొయ్యల growth మరియు feed utilizationకు nutritional support అందిస్తుంది.',
    dosage: '5–10 ml / kg feed',
    application:
        'Feedపై సమానంగా coat అయ్యేలా కలిపి, కొంత సమయం ఆరిన తర్వాత ఇవ్వాలి.',
    note:
        'Stocking చేసిన 30 రోజుల తర్వాత ప్రతి రోజు ఉపయోగించడం మంచిది.',
    image: 'assets/volt-x.png',
  ),

  Product(
    name: 'MARINE OXY TAB',
    category: 'Oxygen Support',
    description:
        'చెరువులో oxygen support కోసం ఉపయోగించే oxygen tablet.',
    dosage: '250–500 g / acre',
    application:
        'చెరువులో అవసరమైన ప్రాంతాల్లో సమానంగా apply చేయాలి.',
    note:
        'Oxygen support సుమారు 7–8 గంటల వరకు ఉండవచ్చు.',
    image: 'assets/oxytab.png',
  ),

  Product(
    name: 'BIO SLUDGE-X',
    category: 'Sludge Tablets',
    description:
        'Pond bottomలో organic sludge మరియు organic load managementకు ఉపయోగిస్తారు.',
    dosage: '500 g / acre',
    application:
        'చెరువు మొత్తం సమానంగా apply చేయాలి.',
    note:
        'Application సమయంలో aeratorsను వెంటనే ON చేయకూడదు.',
    image: 'assets/bio_sludge_x.png',
  ),

  Product(
    name: 'ZEO NEEM',
    category: 'Zeolite',
    description:
        'Organic load మరియు water quality managementకు ఉపయోగించే zeolite product.',
    dosage: '10 kg / acre',
    application:
        'చెరువులో సమానంగా apply చేయాలి.',
    note:
        'Granules లేదా powder రూపంలో source guide ప్రకారం ఉపయోగించవచ్చు.',
    image: null,
  ),

  Product(
    name: 'YUCCA PRO',
    category: 'Yucca',
    description:
        'Sludge management మరియు water quality support కోసం ఉపయోగించే yucca formulation.',
    dosage: '500 g / acre',
    application:
        'చెరువులో సమానంగా apply చేయాలి.',
    note:
        'Sludge management సమయంలో water conditionను గమనించాలి.',
    image: null,
  ),
];

class ProductGuidePage extends StatelessWidget {
  const ProductGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0798D1),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Marine Aqua Technologies',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF07549A),
                  Color(0xFF12AFC1),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Products – Complete Guide',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Pond Preparation నుంచి Harvest వరకు',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCard(
                  product: product,
                  number: index + 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int number;

  const ProductCard({
    super.key,
    required this.product,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFD8EEF4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailsPage(
                product: product,
                number: number,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF8FB),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: product.image != null
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          product.image!,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) {
                            return const Icon(
                              Icons.inventory_2_outlined,
                              size: 45,
                              color: Color(0xFF0798D1),
                            );
                          },
                        ),
                      )
                    : const Icon(
                        Icons.inventory_2_outlined,
                        size: 45,
                        color: Color(0xFF0798D1),
                      ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$number. ${product.name}',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF064A7C),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      product.category,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF0798D1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      product.dosage,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Color(0xFF0798D1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final int number;

  const ProductDetailsPage({
    super.key,
    required this.product,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0798D1),
        foregroundColor: Colors.white,
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: product.image != null
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        product.image!,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) {
                          return const Icon(
                            Icons.inventory_2_outlined,
                            size: 90,
                            color: Color(0xFF0798D1),
                          );
                        },
                      ),
                    )
                  : const Icon(
                      Icons.inventory_2_outlined,
                      size: 90,
                      color: Color(0xFF0798D1),
                    ),
            ),

            const SizedBox(height: 20),

            Text(
              '$number. ${product.name}',
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(0xFF064A7C),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              product.category,
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFF0798D1),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 22),

            infoBox(
              icon: Icons.info_outline,
              title: 'Product Description',
              text: product.description,
            ),

            infoBox(
              icon: Icons.scale_outlined,
              title: 'Dosage',
              text: product.dosage,
            ),

            infoBox(
              icon: Icons.water_drop_outlined,
              title: 'Application',
              text: product.application,
            ),

            infoBox(
              icon: Icons.lightbulb_outline,
              title: 'Important Note',
              text: product.note,
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF07549A),
                    Color(0xFF12AFC1),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text(
                    'Marine Aqua Technologies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget infoBox({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFD8EEF4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFE7F7FB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF0798D1),
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF064A7C),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF555555),
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
