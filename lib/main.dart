import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MarineAquaApp());
}

const Color marineBlue = Color(0xFF006B78);
const Color marineTeal = Color(0xFF008C95);
const Color aqua = Color(0xFF18A9AD);
const Color lightAqua = Color(0xFFE7F7F8);
const Color pageBg = Color(0xFFF3FBFC);
const Color darkText = Color(0xFF063B45);

// App language selection
final ValueNotifier<String> selectedLanguage = ValueNotifier<String>('English');


String tr(String text) {
  final language = selectedLanguage.value;
  if (language == 'English') return text;
  return _translations[language]?[text] ?? text;
}

final Map<String, Map<String, String>> _translations = {
  'తెలుగు': {
    'Smart Aquaculture. Better Results.': 'స్మార్ట్ ఆక్వాకల్చర్. మెరుగైన ఫలితాలు.',
    'Loading...': 'లోడ్ అవుతోంది...',
    '10-digit mobile number enter cheyyandi': '10 అంకెల మొబైల్ నంబర్ నమోదు చేయండి',
    'Enter Your Mobile Number': 'మీ మొబైల్ నంబర్ నమోదు చేయండి',
    'We will send a 6-digit OTP to verify your mobile number.': 'మీ మొబైల్ నంబర్‌ను ధృవీకరించడానికి 6 అంకెల OTP పంపిస్తాము.',
    'Enter 10-digit number': '10 అంకెల నంబర్ నమోదు చేయండి',
    'Send OTP  →': 'OTP పంపండి  →',
    'Secure\nLogin': 'సురక్షిత\nలాగిన్',
    'Trusted by\nAqua Farmers': 'ఆక్వా రైతుల\nవిశ్వాసం',
    'Better\nTogether': 'కలిసి\nమెరుగైన ఫలితాలు',
    '6-digit OTP enter cheyyandi': '6 అంకెల OTP నమోదు చేయండి',
    'Verify Your Mobile Number': 'మీ మొబైల్ నంబర్‌ను ధృవీకరించండి',
    'We have sent a 6-digit OTP to': '6 అంకెల OTP పంపించాము:',
    "Didn't receive OTP?  Resend OTP (00:28)": 'OTP రాలేదా?  మళ్లీ పంపండి (00:28)',
    'Verify & Continue  →': 'ధృవీకరించి కొనసాగండి  →',
    'For a Healthier Aquaculture Tomorrow': 'ఆరోగ్యకరమైన ఆక్వాకల్చర్ రేపటి కోసం',
    'Tip Of The Day': 'ఈ రోజు చిట్కా',
    "Today's Pond Tip": 'ఈ రోజు చెరువు చిట్కా',
    'Small checks can make a big difference in shrimp culture.': 'చిన్న పరిశీలనలు రొయ్యల పెంపకంలో పెద్ద మార్పు తీసుకురాగలవు.',
    'Maintain Dissolved Oxygen': 'కరిగిన ఆక్సిజన్‌ను నిర్వహించండి',
    'Monitor dissolved oxygen regularly, especially during early morning hours and after weather changes. Stable oxygen supports shrimp activity and feeding.': 'కరిగిన ఆక్సిజన్‌ను క్రమం తప్పకుండా పరిశీలించండి, ముఖ్యంగా తెల్లవారుజామున మరియు వాతావరణ మార్పుల తర్వాత. స్థిరమైన ఆక్సిజన్ రొయ్యల చలనం మరియు ఫీడింగ్‌కు సహాయపడుతుంది.',
    'Observe Feed Response': 'ఫీడ్ స్పందనను గమనించండి',
    'Check feeding trays and shrimp activity. Sudden changes in feed response can be an early signal that pond conditions need attention.': 'ఫీడింగ్ ట్రేలు మరియు రొయ్యల చలనాన్ని గమనించండి. ఫీడ్ స్పందనలో ఆకస్మిక మార్పులు చెరువు పరిస్థితులను పరిశీలించాల్సిన సంకేతం కావచ్చు.',
    'Watch Pond Bottom': 'చెరువు అడుగుభాగాన్ని గమనించండి',
    'Regularly observe sludge accumulation, water colour and unusual odour. Early pond-bottom management can help maintain a healthier culture environment.': 'స్లడ్జ్ పేరుకుపోవడం, నీటి రంగు మరియు అసాధారణ వాసనను క్రమం తప్పకుండా గమనించండి. ముందస్తు అడుగుభాగ నిర్వహణ ఆరోగ్యకరమైన పెంపక వాతావరణాన్ని కొనసాగించడంలో సహాయపడుతుంది.',
    'Shrimp Culture Guide': 'రొయ్యల పెంపక గైడ్',
    'Pond Preparation': 'చెరువు సిద్ధం',
    'Prepare and condition the pond, check water quality and ensure the pond bottom is ready before stocking.': 'చెరువును సిద్ధం చేసి కండిషన్ చేయండి, నీటి నాణ్యతను పరిశీలించి స్టాకింగ్‌కు ముందు అడుగుభాగం సిద్ధంగా ఉందని నిర్ధారించండి.',
    'Seed Stocking': 'సీడ్ స్టాకింగ్',
    'Use healthy seed and follow the farm stocking plan. Record stocking date, quantity and pond details.': 'ఆరోగ్యకరమైన సీడ్‌ను ఉపయోగించి ఫారం స్టాకింగ్ ప్లాన్‌ను అనుసరించండి. స్టాకింగ్ తేదీ, పరిమాణం మరియు చెరువు వివరాలను నమోదు చేయండి.',
    'Water Management': 'నీటి నిర్వహణ',
    'Regularly monitor pH, dissolved oxygen, salinity, temperature and ammonia. Record results in the app.': 'pH, కరిగిన ఆక్సిజన్, సాలినిటీ, ఉష్ణోగ్రత మరియు అమోనియాను క్రమం తప్పకుండా పరిశీలించండి. ఫలితాలను యాప్‌లో నమోదు చేయండి.',
    'Feed Management': 'ఫీడ్ నిర్వహణ',
    'Adjust feeding based on shrimp growth, feeding response, water conditions and biomass observations.': 'రొయ్యల పెరుగుదల, ఫీడ్ స్పందన, నీటి పరిస్థితులు మరియు బయోమాస్ ఆధారంగా ఫీడింగ్‌ను సర్దుబాటు చేయండి.',
    'Health Monitoring': 'ఆరోగ్య పర్యవేక్షణ',
    'Observe shrimp behaviour, gut appearance, moulting, growth and pond-bottom condition regularly.': 'రొయ్యల ప్రవర్తన, గట్ రూపం, మౌల్టింగ్, పెరుగుదల మరియు చెరువు అడుగుభాగ పరిస్థితిని క్రమం తప్పకుండా గమనించండి.',
    'Growth & Harvest': 'పెరుగుదల & హార్వెస్ట్',
    'Track biomass and growth, maintain stable pond conditions and plan harvest based on farm targets.': 'బయోమాస్ మరియు పెరుగుదలను ట్రాక్ చేసి, స్థిరమైన చెరువు పరిస్థితులను కొనసాగించి, ఫారం లక్ష్యాల ఆధారంగా హార్వెస్ట్‌ను ప్లాన్ చేయండి.',
    'Biomass Calculator': 'బయోమాస్ కాలిక్యులేటర్',
    'Shrimp Biomass Calculator': 'రొయ్యల బయోమాస్ కాలిక్యులేటర్',
    'Estimate pond biomass using area, stocking, survival and average body weight.': 'విస్తీర్ణం, స్టాకింగ్, సర్వైవల్ మరియు సగటు శరీర బరువుతో చెరువు బయోమాస్‌ను అంచనా వేయండి.',
    'Pond Area (Acres)': 'చెరువు విస్తీర్ణం (ఎకరాలు)',
    'Stocking Density (PL/acre)': 'స్టాకింగ్ డెన్సిటీ (PL/ఎకరం)',
    'Survival Rate (%)': 'సర్వైవల్ రేట్ (%)',
    'Average Body Weight (grams)': 'సగటు శరీర బరువు (గ్రాములు)',
    'CALCULATE BIOMASS': 'బయోమాస్ లెక్కించండి',
    'CLEAR': 'క్లియర్',
    'Calculation Result': 'లెక్కింపు ఫలితం',
    'Estimated Shrimp Count': 'అంచనా రొయ్యల సంఖ్య',
    'Total Biomass': 'మొత్తం బయోమాస్',
    'Biomass Per Acre': 'ఎకరానికి బయోమాస్',
    'Formula: Estimated shrimp count × average body weight (g) ÷ 1000.': 'సూత్రం: అంచనా రొయ్యల సంఖ్య × సగటు శరీర బరువు (g) ÷ 1000.',
    'Shrimp Diseases': 'రొయ్యల వ్యాధులు',
    'White Gut / Gut Health Issues': 'వైట్ గట్ / గట్ ఆరోగ్య సమస్యలు',
    'Vibrio-Related Problems': 'విబ్రియో సంబంధిత సమస్యలు',
    'Moulting Stress': 'మౌల్టింగ్ ఒత్తిడి',
    'Stress & Poor Growth': 'స్ట్రెస్ & తక్కువ పెరుగుదల',
    'Common warning signs to observe. Confirm diagnosis with a qualified aquaculture technical professional.': 'గమనించాల్సిన సాధారణ హెచ్చరిక సంకేతాలు. నిర్ధారణను అర్హత కలిగిన ఆక్వాకల్చర్ టెక్నికల్ ప్రొఫెషనల్‌తో నిర్ధారించండి.',
    'Select Language': 'భాషను ఎంచుకోండి',
    'Choose your language': 'మీ భాషను ఎంచుకోండి',
    'Select the language you want to use in the app.': 'యాప్‌లో మీరు ఉపయోగించాలనుకునే భాషను ఎంచుకోండి.',
    'Language applied across the app.': 'భాష యాప్ మొత్తం వర్తించబడింది.',
    'Home': 'హోమ్',
    'Products': 'ఉత్పత్తులు',
    'Support': 'సపోర్ట్',
    'Profile': 'ప్రొఫైల్',
    'Our Aquaculture Solutions': 'మా ఆక్వాకల్చర్ సొల్యూషన్స్',
    'Trusted Products for Healthy Shrimp & Better Yields': 'ఆరోగ్యకరమైన రొయ్యలు & మెరుగైన దిగుబడుల కోసం నమ్మకమైన ఉత్పత్తులు',
    'Success Stories': 'విజయ గాథలు',
    'Real farmers. Real results.': 'నిజమైన రైతులు. నిజమైన ఫలితాలు.',
    'Shrimp Growth Guide': 'రొయ్యల పెరుగుదల గైడ్',
    'Step-by-step guidance from stocking to harvest': 'స్టాకింగ్ నుంచి హార్వెస్ట్ వరకు దశలవారీ మార్గదర్శకం',
    'Language': 'భాష',
    'Healthy Ponds': 'ఆరోగ్యకరమైన చెరువులు',
    'Stronger Shrimp': 'బలమైన రొయ్యలు',
    'Higher Profits': 'అధిక లాభాలు',
    'Complete Aquaculture Solutions\nfor a Better Tomorrow': 'మెరుగైన రేపటి కోసం\nసంపూర్ణ ఆక్వాకల్చర్ సొల్యూషన్స్',
    'Explore Products  →': 'ఉత్పత్తులను చూడండి  →',
    'Tip Of The Day': 'ఈ రోజు చిట్కా',
    'Maintain proper dissolved oxygen levels for better growth.': 'మెరుగైన పెరుగుదల కోసం సరైన కరిగిన ఆక్సిజన్ స్థాయిలను నిర్వహించండి.',
    'Learn More  →': 'మరింత తెలుసుకోండి  →',
    'Learn setup, management & best practices.': 'సెటప్, నిర్వహణ & ఉత్తమ పద్ధతులను తెలుసుకోండి.',
    'Explore Guide  →': 'గైడ్ చూడండి  →',
    'Get estimated biomass in 3 easy steps.': '3 సులభమైన దశల్లో బయోమాస్‌ను అంచనా వేయండి.',
    'Calculate Now  →': 'ఇప్పుడే లెక్కించండి  →',
    'Identify, prevent & treat common diseases.': 'సాధారణ వ్యాధులను గుర్తించి, నివారించి & నిర్వహించండి.',
    'View Details  →': 'వివరాలు చూడండి  →',
    'Dealers Location': 'డీలర్ లొకేషన్',
    'Find our nearest dealers\nacross India.': 'భారతదేశం అంతటా\nమీకు సమీపంలోని డీలర్లను కనుగొనండి.',
    'Find Nearby  →': 'సమీపంలో కనుగొనండి  →',
    'View All  →': 'అన్నీ చూడండి  →',
    'Water Quality Tools': 'నీటి నాణ్యత టూల్స్',
    'Calculate, monitor and maintain ideal water parameters': 'ఆదర్శ నీటి పరామితులను లెక్కించి, పర్యవేక్షించి, నిర్వహించండి',
    'Calculator': 'కాలిక్యులేటర్',
    'Temperature': 'ఉష్ణోగ్రత',
    'Guide': 'గైడ్',
    'Salinity': 'సాలినిటీ',
    'DO': 'DO',
    'PL Selection': 'PL ఎంపిక',
    'Choose healthy PL': 'ఆరోగ్యకరమైన PL ఎంచుకోండి',
    'Get your pond ready': 'మీ చెరువును సిద్ధం చేయండి',
    'Feeding Guide': 'ఫీడింగ్ గైడ్',
    'Right feed, faster growth': 'సరైన ఫీడ్, వేగవంతమైన పెరుగుదల',
    'Moulting Care': 'మౌల్టింగ్ కేర్',
    'Stronger shell, better growth': 'బలమైన షెల్, మెరుగైన పెరుగుదల',
    'Our Products': 'మా ఉత్పత్తులు',
    'Product Description': 'ఉత్పత్తి వివరణ',
    'Usage': 'వినియోగం',
    'Recommended Dosage': 'సిఫార్సు చేసిన మోతాదు',
    'Composition': 'కూర్పు',
    'Technical Support': 'టెక్నికల్ సపోర్ట్',
    'Marine Aqua Technologies technical team support': 'Marine Aqua Technologies టెక్నికల్ టీమ్ సపోర్ట్',
    'Customer Care': 'కస్టమర్ కేర్',
    'Email': 'ఈమెయిల్',
    'Employee Login': 'ఎంప్లాయీ లాగిన్',
    'Employee Field Visit': 'ఎంప్లాయీ ఫీల్డ్ విజిట్',
    'About Marine Aqua Technologies': 'Marine Aqua Technologies గురించి',
    'Employee ID': 'ఎంప్లాయీ ID',
    'Password': 'పాస్‌వర్డ్',
    'LOGIN': 'లాగిన్',
    'Employee Dashboard': 'ఎంప్లాయీ డాష్‌బోర్డ్',
    'Field Visit': 'ఫీల్డ్ విజిట్',
    'Water Test': 'వాటర్ టెస్ట్',
    'My Ponds': 'నా చెరువులు',
    'Dealer Locator': 'డీలర్ లొకేటర్',
    'Phone Location/GPS ON cheyyandi': 'ఫోన్ లొకేషన్/GPS ఆన్ చేయండి',
    'Location permission denied': 'లొకేషన్ అనుమతి నిరాకరించబడింది',
    'Location permission Settings lo enable cheyyandi': 'సెట్టింగ్స్‌లో లొకేషన్ అనుమతిని ఎనేబుల్ చేయండి',
    'Current GPS location captured': 'ప్రస్తుత GPS లొకేషన్ క్యాప్చర్ అయింది',
    'Location capture failed': 'లొకేషన్ క్యాప్చర్ విఫలమైంది',
    'Farmer name enter cheyyandi': 'రైతు పేరు నమోదు చేయండి',
    'Pond name/number enter cheyyandi': 'చెరువు పేరు/నంబర్ నమోదు చేయండి',
    'First GPS location capture cheyyandi': 'ముందుగా GPS లొకేషన్ క్యాప్చర్ చేయండి',
    'Visit photo capture cheyyandi': 'విజిట్ ఫోటో క్యాప్చర్ చేయండి',
    'Visit Submitted': 'విజిట్ సమర్పించబడింది',
    'OK': 'సరే',
    'Visit Details': 'విజిట్ వివరాలు',
    'Farmer Name': 'రైతు పేరు',
    'Pond Name / Pond Number': 'చెరువు పేరు / చెరువు నంబర్',
    'Visit Remarks': 'విజిట్ వ్యాఖ్యలు',
    'SUBMIT FIELD VISIT': 'ఫీల్డ్ విజిట్ సమర్పించండి',
    'GPS Location': 'GPS లొకేషన్',
    'Location not captured': 'లొకేషన్ క్యాప్చర్ కాలేదు',
    'Village / Locality': 'గ్రామం / ప్రాంతం',
    'Mandal': 'మండలం',
    'District': 'జిల్లా',
    'State': 'రాష్ట్రం',
    'Pincode': 'పిన్‌కోడ్',
    'Latitude': 'అక్షాంశం',
    'Longitude': 'రేఖాంశం',
    'Capturing...': 'క్యాప్చర్ అవుతోంది...',
    'CAPTURE CURRENT LOCATION': 'ప్రస్తుత లొకేషన్ క్యాప్చర్ చేయండి',
    'Visit Photo': 'విజిట్ ఫోటో',
    'CAPTURE VISIT PHOTO': 'విజిట్ ఫోటో క్యాప్చర్ చేయండి',
    'RETAKE PHOTO': 'ఫోటో మళ్లీ తీయండి',
    'Water Parameters': 'నీటి పరామితులు',
    'DO (mg/L)': 'DO (mg/L)',
    'Ammonia': 'అమోనియా',
    'Water test saved locally': 'వాటర్ టెస్ట్ స్థానికంగా సేవ్ అయింది',
    'SAVE WATER TEST': 'వాటర్ టెస్ట్ సేవ్ చేయండి',
    'Add Pond': 'చెరువు జోడించండి',
    'Pond name / number': 'చెరువు పేరు / నంబర్',
    'SAVE': 'సేవ్',
    'No ponds added yet': 'ఇంకా చెరువులు జోడించలేదు',
    'Pond Diary': 'చెరువు డైరీ',
    'ADD ENTRY': 'ఎంట్రీ జోడించండి',
    'Add Dealer': 'డీలర్ జోడించండి',
    'Dealer Name': 'డీలర్ పేరు',
    'City': 'నగరం',
    'Address': 'చిరునామా',
    'Phone': 'ఫోన్',
    'MARINE-6G': 'MARINE-6G',
    'Liquid Minerals': 'లిక్విడ్ మినరల్స్',
    'Gut Health': 'గట్ హెల్త్',
    'Vibrio Control': 'విబ్రియో కంట్రోల్',
    'Probiotic Tablet': 'ప్రోబయోటిక్ టాబ్లెట్',
    'Oxygen Support': 'ఆక్సిజన్ సపోర్ట్',
    'Growth Booster': 'గ్రోత్ బూస్టర్',
    'Sludge Management': 'స్లడ్జ్ మేనేజ్‌మెంట్',
    'Moulting Support': 'మౌల్టింగ్ సపోర్ట్',
    'Minerals + Probiotics': 'మినరల్స్ + ప్రోబయోటిక్స్',
    'Pond Hygiene': 'చెరువు హైజీన్',
    'Healthy & Active Shrimp': 'ఆరోగ్యకరమైన & చురుకైన రొయ్యలు',
    'Higher Yields': 'అధిక దిగుబడులు',
    'Better Survival Rate': 'మెరుగైన సర్వైవల్ రేట్',
    '40% Faster Growth': '40% వేగవంతమైన పెరుగుదల',

    'A liquid mineral formulation designed to support shrimp moulting, shell formation and mineral balance.': 'రొయ్యల మౌల్టింగ్, షెల్ ఫార్మేషన్ మరియు మినరల్ బ్యాలెన్స్\u200cకు సహాయపడే లిక్విడ్ మినరల్ ఫార్ములేషన్.',
    'Use during shrimp culture for mineral and moulting support.': 'రొయ్యల పెంపకంలో మినరల్ మరియు మౌల్టింగ్ సపోర్ట్ కోసం ఉపయోగించండి.',
    'An Advanced Gut Health Formula designed to support shrimp gut health, digestion and nutrient utilization.': 'రొయ్యల గట్ హెల్త్, జీర్ణక్రియ మరియు పోషకాల వినియోగానికి సహాయపడే అడ్వాన్స్\u200cడ్ గట్ హెల్త్ ఫార్ములా.',
    'Use through feed for preventive or curative gut health support.': 'ప్రివెంటివ్ లేదా క్యూరేటివ్ గట్ హెల్త్ సపోర్ట్ కోసం ఫీడ్ ద్వారా ఉపయోగించండి.',
    'A high-efficacy liquid formulation designed for Vibrio management in the pond.': 'చెరువులో విబ్రియో మేనేజ్\u200cమెంట్ కోసం రూపొందించిన అధిక సామర్థ్య లిక్విడ్ ఫార్ములేషన్.',
    'Apply in the pond for Vibrio management. Product guidance recommends applying probiotics after 24 hours.': 'విబ్రియో మేనేజ్\u200cమెంట్ కోసం చెరువులో అప్లై చేయండి. ప్రోడక్ట్ గైడెన్స్ ప్రకారం 24 గంటల తర్వాత ప్రోబయోటిక్స్ అప్లై చేయాలి.',
    'A probiotic tablet formulation designed for biological pond support.': 'చెరువు బయోలాజికల్ సపోర్ట్ కోసం రూపొందించిన ప్రోబయోటిక్ టాబ్లెట్ ఫార్ములేషన్.',
    'Use for probiotic support in the pond.': 'చెరువులో ప్రోబయోటిక్ సపోర్ట్ కోసం ఉపయోగించండి.',
    'A Smart Oxygen Release Technology formulation designed for oxygen support in the pond.': 'చెరువులో ఆక్సిజన్ సపోర్ట్ కోసం రూపొందించిన స్మార్ట్ ఆక్సిజన్ రిలీజ్ టెక్నాలజీ ఫార్ములేషన్.',
    'Apply according to the product dosage when pond oxygen support is required.': 'చెరువులో ఆక్సిజన్ సపోర్ట్ అవసరమైనప్పుడు ప్రోడక్ట్ డోసేజ్ ప్రకారం అప్లై చేయండి.',
    'An advanced growth booster formulated with probiotics, enzymes, amino acids and feed assimilation support components for shrimp growth.': 'రొయ్యల పెరుగుదల కోసం ప్రోబయోటిక్స్, ఎంజైమ్స్, అమినో యాసిడ్స్ మరియు ఫీడ్ అసిమిలేషన్ సపోర్ట్ కాంపోనెంట్స్\u200cతో రూపొందించిన అడ్వాన్స్\u200cడ్ గ్రోత్ బూస్టర్.',
    'Use through feed mixing to support digestion, nutrient utilization, immunity and growth.': 'జీర్ణక్రియ, పోషకాల వినియోగం, ఇమ్యూనిటీ మరియు పెరుగుదలకు సపోర్ట్ కోసం ఫీడ్ మిక్సింగ్ ద్వారా ఉపయోగించండి.',
    'A microbial formulation designed for organic sludge management and biological pond cleaning support at the pond bottom.': 'చెరువు అడుగుభాగంలో ఆర్గానిక్ స్లడ్జ్ మేనేజ్\u200cమెంట్ మరియు బయోలాజికల్ పాండ్ క్లీనింగ్ సపోర్ట్ కోసం రూపొందించిన మైక్రోబయల్ ఫార్ములేషన్.',
    'Use for pond-bottom management and biological sludge breakdown support.': 'చెరువు అడుగుభాగ నిర్వహణ మరియు బయోలాజికల్ స్లడ్జ్ బ్రేక్\u200cడౌన్ సపోర్ట్ కోసం ఉపయోగించండి.',
    'A formulation with chelated minerals and moulting support factors for shrimp moulting support.': 'రొయ్యల మౌల్టింగ్ సపోర్ట్ కోసం చీలేటెడ్ మినరల్స్ మరియు మౌల్టింగ్ సపోర్ట్ ఫ్యాక్టర్స్\u200cతో రూపొందించిన ఫార్ములేషన్.',
    'Apply in the pond for shrimp moulting support.': 'రొయ్యల మౌల్టింగ్ సపోర్ట్ కోసం చెరువులో అప్లై చేయండి.',
    'A formulation combining mineral support and probiotic support.': 'మినరల్ సపోర్ట్ మరియు ప్రోబయోటిక్ సపోర్ట్ కలిపిన ఫార్ములేషన్.',
    'Use according to the product dosage for mineral and probiotic support in shrimp culture.': 'రొయ్యల పెంపకంలో మినరల్ మరియు ప్రోబయోటిక్ సపోర్ట్ కోసం ప్రోడక్ట్ డోసేజ్ ప్రకారం ఉపయోగించండి.',
    'According to product label dosage': 'ప్రోడక్ట్ లేబుల్ డోసేజ్ ప్రకారం',
    'A formulation for pond water hygiene and harmful bacterial management.': 'చెరువు నీటి హైజీన్ మరియు హానికర బ్యాక్టీరియా మేనేజ్\u200cమెంట్ కోసం ఫార్ములేషన్.',
    'Use for pond water hygiene and harmful bacterial management.': 'చెరువు నీటి హైజీన్ మరియు హానికర బ్యాక్టీరియా మేనేజ్\u200cమెంట్ కోసం ఉపయోగించండి.',
  },
  'हिन्दी': {
    'Smart Aquaculture. Better Results.': 'स्मार्ट एक्वाकल्चर। बेहतर परिणाम।',
    'Loading...': 'लोड हो रहा है...',
    '10-digit mobile number enter cheyyandi': '10 अंकों का मोबाइल नंबर दर्ज करें',
    'Enter Your Mobile Number': 'अपना मोबाइल नंबर दर्ज करें',
    'We will send a 6-digit OTP to verify your mobile number.': 'आपके मोबाइल नंबर को सत्यापित करने के लिए 6 अंकों का OTP भेजा जाएगा।',
    'Enter 10-digit number': '10 अंकों का नंबर दर्ज करें',
    'Send OTP  →': 'OTP भेजें  →',
    'Secure\nLogin': 'सुरक्षित\nलॉगिन',
    'Trusted by\nAqua Farmers': 'एक्वा किसानों का\nविश्वास',
    'Better\nTogether': 'साथ मिलकर\nबेहतर',
    '6-digit OTP enter cheyyandi': '6 अंकों का OTP दर्ज करें',
    'Verify Your Mobile Number': 'अपना मोबाइल नंबर सत्यापित करें',
    'We have sent a 6-digit OTP to': '6 अंकों का OTP भेजा गया है:',
    "Didn't receive OTP?  Resend OTP (00:28)": 'OTP नहीं मिला?  फिर से भेजें (00:28)',
    'Verify & Continue  →': 'सत्यापित करें और जारी रखें  →',
    'For a Healthier Aquaculture Tomorrow': 'स्वस्थ एक्वाकल्चर के बेहतर कल के लिए',
    'Tip Of The Day': 'आज की टिप',
    "Today's Pond Tip": 'आज की तालाब टिप',
    'Small checks can make a big difference in shrimp culture.': 'छोटी-छोटी जाँच झींगा पालन में बड़ा अंतर ला सकती हैं।',
    'Maintain Dissolved Oxygen': 'घुलित ऑक्सीजन बनाए रखें',
    'Monitor dissolved oxygen regularly, especially during early morning hours and after weather changes. Stable oxygen supports shrimp activity and feeding.': 'घुलित ऑक्सीजन की नियमित निगरानी करें, खासकर सुबह और मौसम बदलने के बाद। स्थिर ऑक्सीजन झींगों की गतिविधि और फीडिंग में मदद करती है।',
    'Observe Feed Response': 'फीड प्रतिक्रिया देखें',
    'Check feeding trays and shrimp activity. Sudden changes in feed response can be an early signal that pond conditions need attention.': 'फीडिंग ट्रे और झींगों की गतिविधि देखें। फीड प्रतिक्रिया में अचानक बदलाव तालाब की स्थिति पर ध्यान देने का शुरुआती संकेत हो सकता है।',
    'Watch Pond Bottom': 'तालाब के तल पर नज़र रखें',
    'Regularly observe sludge accumulation, water colour and unusual odour. Early pond-bottom management can help maintain a healthier culture environment.': 'स्लज जमा होना, पानी का रंग और असामान्य गंध नियमित रूप से देखें। समय पर तल प्रबंधन स्वस्थ पालन वातावरण बनाए रखने में मदद करता है।',
    'Shrimp Culture Guide': 'झींगा पालन गाइड',
    'Pond Preparation': 'तालाब की तैयारी',
    'Prepare and condition the pond, check water quality and ensure the pond bottom is ready before stocking.': 'तालाब तैयार और कंडीशन करें, पानी की गुणवत्ता जाँचें और स्टॉकिंग से पहले तालाब का तल तैयार रखें।',
    'Seed Stocking': 'सीड स्टॉकिंग',
    'Use healthy seed and follow the farm stocking plan. Record stocking date, quantity and pond details.': 'स्वस्थ सीड का उपयोग करें और फार्म स्टॉकिंग योजना का पालन करें। स्टॉकिंग तारीख, मात्रा और तालाब विवरण दर्ज करें।',
    'Water Management': 'जल प्रबंधन',
    'Regularly monitor pH, dissolved oxygen, salinity, temperature and ammonia. Record results in the app.': 'pH, घुलित ऑक्सीजन, लवणता, तापमान और अमोनिया की नियमित निगरानी करें। परिणाम ऐप में दर्ज करें।',
    'Feed Management': 'फीड प्रबंधन',
    'Adjust feeding based on shrimp growth, feeding response, water conditions and biomass observations.': 'झींगा वृद्धि, फीड प्रतिक्रिया, पानी की स्थिति और बायोमास के आधार पर फीडिंग समायोजित करें।',
    'Health Monitoring': 'स्वास्थ्य निगरानी',
    'Observe shrimp behaviour, gut appearance, moulting, growth and pond-bottom condition regularly.': 'झींगों का व्यवहार, गट की स्थिति, मोल्टिंग, वृद्धि और तालाब के तल की स्थिति नियमित देखें।',
    'Growth & Harvest': 'वृद्धि और हार्वेस्ट',
    'Track biomass and growth, maintain stable pond conditions and plan harvest based on farm targets.': 'बायोमास और वृद्धि ट्रैक करें, तालाब की स्थिर स्थिति बनाए रखें और फार्म लक्ष्यों के अनुसार हार्वेस्ट की योजना बनाएं।',
    'Biomass Calculator': 'बायोमास कैलकुलेटर',
    'Shrimp Biomass Calculator': 'झींगा बायोमास कैलकुलेटर',
    'Estimate pond biomass using area, stocking, survival and average body weight.': 'क्षेत्रफल, स्टॉकिंग, सर्वाइवल और औसत शरीर भार से तालाब बायोमास का अनुमान लगाएँ।',
    'Pond Area (Acres)': 'तालाब क्षेत्रफल (एकड़)',
    'Stocking Density (PL/acre)': 'स्टॉकिंग घनत्व (PL/एकड़)',
    'Survival Rate (%)': 'सर्वाइवल दर (%)',
    'Average Body Weight (grams)': 'औसत शरीर भार (ग्राम)',
    'CALCULATE BIOMASS': 'बायोमास की गणना करें',
    'CLEAR': 'क्लियर',
    'Calculation Result': 'गणना परिणाम',
    'Estimated Shrimp Count': 'अनुमानित झींगा संख्या',
    'Total Biomass': 'कुल बायोमास',
    'Biomass Per Acre': 'प्रति एकड़ बायोमास',
    'Formula: Estimated shrimp count × average body weight (g) ÷ 1000.': 'सूत्र: अनुमानित झींगा संख्या × औसत शरीर भार (g) ÷ 1000।',
    'Shrimp Diseases': 'झींगा रोग',
    'White Gut / Gut Health Issues': 'व्हाइट गट / गट स्वास्थ्य समस्याएँ',
    'Vibrio-Related Problems': 'विब्रियो संबंधी समस्याएँ',
    'Moulting Stress': 'मोल्टिंग तनाव',
    'Stress & Poor Growth': 'तनाव और कम वृद्धि',
    'Common warning signs to observe. Confirm diagnosis with a qualified aquaculture technical professional.': 'देखने योग्य सामान्य चेतावनी संकेत। निदान की पुष्टि योग्य एक्वाकल्चर तकनीकी विशेषज्ञ से करें।',
    'Select Language': 'भाषा चुनें',
    'Choose your language': 'अपनी भाषा चुनें',
    'Select the language you want to use in the app.': 'ऐप में उपयोग करने वाली भाषा चुनें।',
    'Language applied across the app.': 'भाषा पूरे ऐप पर लागू हो गई है।',
    'Home': 'होम',
    'Products': 'उत्पाद',
    'Support': 'सपोर्ट',
    'Profile': 'प्रोफ़ाइल',
    'Our Aquaculture Solutions': 'हमारे एक्वाकल्चर समाधान',
    'Trusted Products for Healthy Shrimp & Better Yields': 'स्वस्थ झींगा और बेहतर उत्पादन के लिए भरोसेमंद उत्पाद',
    'Success Stories': 'सफलता की कहानियाँ',
    'Real farmers. Real results.': 'असली किसान। असली परिणाम।',
    'Shrimp Growth Guide': 'झींगा वृद्धि गाइड',
    'Step-by-step guidance from stocking to harvest': 'स्टॉकिंग से हार्वेस्ट तक चरण-दर-चरण मार्गदर्शन',
    'Language': 'भाषा',
    'Healthy Ponds': 'स्वस्थ तालाब',
    'Stronger Shrimp': 'मजबूत झींगा',
    'Higher Profits': 'अधिक लाभ',
    'Complete Aquaculture Solutions\nfor a Better Tomorrow': 'बेहतर कल के लिए\nसंपूर्ण एक्वाकल्चर समाधान',
    'Explore Products  →': 'उत्पाद देखें  →',
    'Maintain proper dissolved oxygen levels for better growth.': 'बेहतर वृद्धि के लिए सही घुलित ऑक्सीजन स्तर बनाए रखें।',
    'Learn More  →': 'और जानें  →',
    'Learn setup, management & best practices.': 'सेटअप, प्रबंधन और सर्वोत्तम तरीकों के बारे में जानें।',
    'Explore Guide  →': 'गाइड देखें  →',
    'Get estimated biomass in 3 easy steps.': '3 आसान चरणों में अनुमानित बायोमास पाएँ।',
    'Calculate Now  →': 'अभी गणना करें  →',
    'Identify, prevent & treat common diseases.': 'सामान्य रोगों की पहचान, रोकथाम और प्रबंधन करें।',
    'View Details  →': 'विवरण देखें  →',
    'Dealers Location': 'डीलर लोकेशन',
    'Find our nearest dealers\nacross India.': 'भारत भर में\nअपने नज़दीकी डीलर खोजें।',
    'Find Nearby  →': 'पास में खोजें  →',
    'View All  →': 'सभी देखें  →',
    'Water Quality Tools': 'जल गुणवत्ता टूल्स',
    'Calculate, monitor and maintain ideal water parameters': 'आदर्श जल मानकों की गणना, निगरानी और रखरखाव करें',
    'Calculator': 'कैलकुलेटर',
    'Temperature': 'तापमान',
    'Guide': 'गाइड',
    'Salinity': 'लवणता',
    'DO': 'DO',
    'PL Selection': 'PL चयन',
    'Choose healthy PL': 'स्वस्थ PL चुनें',
    'Get your pond ready': 'अपना तालाब तैयार करें',
    'Feeding Guide': 'फीडिंग गाइड',
    'Right feed, faster growth': 'सही फीड, तेज़ वृद्धि',
    'Moulting Care': 'मोल्टिंग केयर',
    'Stronger shell, better growth': 'मजबूत शेल, बेहतर वृद्धि',
    'Our Products': 'हमारे उत्पाद',
    'Product Description': 'उत्पाद विवरण',
    'Usage': 'उपयोग',
    'Recommended Dosage': 'अनुशंसित मात्रा',
    'Composition': 'संरचना',
    'Technical Support': 'तकनीकी सहायता',
    'Marine Aqua Technologies technical team support': 'Marine Aqua Technologies तकनीकी टीम सहायता',
    'Customer Care': 'कस्टमर केयर',
    'Email': 'ईमेल',
    'Employee Login': 'कर्मचारी लॉगिन',
    'Employee Field Visit': 'कर्मचारी फील्ड विजिट',
    'About Marine Aqua Technologies': 'Marine Aqua Technologies के बारे में',
    'Employee ID': 'कर्मचारी ID',
    'Password': 'पासवर्ड',
    'LOGIN': 'लॉगिन',
    'Employee Dashboard': 'कर्मचारी डैशबोर्ड',
    'Field Visit': 'फील्ड विजिट',
    'Water Test': 'जल परीक्षण',
    'My Ponds': 'मेरे तालाब',
    'Dealer Locator': 'डीलर लोकेटर',
    'Phone Location/GPS ON cheyyandi': 'फोन लोकेशन/GPS चालू करें',
    'Location permission denied': 'लोकेशन अनुमति अस्वीकार की गई',
    'Location permission Settings lo enable cheyyandi': 'सेटिंग्स में लोकेशन अनुमति सक्षम करें',
    'Current GPS location captured': 'वर्तमान GPS लोकेशन कैप्चर हो गई',
    'Location capture failed': 'लोकेशन कैप्चर विफल हुआ',
    'Farmer name enter cheyyandi': 'किसान का नाम दर्ज करें',
    'Pond name/number enter cheyyandi': 'तालाब का नाम/नंबर दर्ज करें',
    'First GPS location capture cheyyandi': 'पहले GPS लोकेशन कैप्चर करें',
    'Visit photo capture cheyyandi': 'विजिट फोटो कैप्चर करें',
    'Visit Submitted': 'विजिट सबमिट हो गई',
    'OK': 'ठीक है',
    'Visit Details': 'विजिट विवरण',
    'Farmer Name': 'किसान का नाम',
    'Pond Name / Pond Number': 'तालाब का नाम / तालाब नंबर',
    'Visit Remarks': 'विजिट टिप्पणी',
    'SUBMIT FIELD VISIT': 'फील्ड विजिट सबमिट करें',
    'GPS Location': 'GPS लोकेशन',
    'Location not captured': 'लोकेशन कैप्चर नहीं हुई',
    'Village / Locality': 'गाँव / क्षेत्र',
    'Mandal': 'मंडल',
    'District': 'ज़िला',
    'State': 'राज्य',
    'Pincode': 'पिनकोड',
    'Latitude': 'अक्षांश',
    'Longitude': 'देशांतर',
    'Capturing...': 'कैप्चर हो रहा है...',
    'CAPTURE CURRENT LOCATION': 'वर्तमान लोकेशन कैप्चर करें',
    'Visit Photo': 'विजिट फोटो',
    'CAPTURE VISIT PHOTO': 'विजिट फोटो कैप्चर करें',
    'RETAKE PHOTO': 'फोटो फिर से लें',
    'Water Parameters': 'जल मानक',
    'DO (mg/L)': 'DO (mg/L)',
    'Ammonia': 'अमोनिया',
    'Water test saved locally': 'जल परीक्षण स्थानीय रूप से सेव हो गया',
    'SAVE WATER TEST': 'जल परीक्षण सेव करें',
    'Add Pond': 'तालाब जोड़ें',
    'Pond name / number': 'तालाब का नाम / नंबर',
    'SAVE': 'सेव',
    'No ponds added yet': 'अभी तक कोई तालाब नहीं जोड़ा गया',
    'Pond Diary': 'तालाब डायरी',
    'ADD ENTRY': 'एंट्री जोड़ें',
    'Add Dealer': 'डीलर जोड़ें',
    'Dealer Name': 'डीलर का नाम',
    'City': 'शहर',
    'Address': 'पता',
    'Phone': 'फोन',
    'Liquid Minerals': 'लिक्विड मिनरल्स',
    'Gut Health': 'गट हेल्थ',
    'Vibrio Control': 'विब्रियो कंट्रोल',
    'Probiotic Tablet': 'प्रोबायोटिक टैबलेट',
    'Oxygen Support': 'ऑक्सीजन सपोर्ट',
    'Growth Booster': 'ग्रोथ बूस्टर',
    'Sludge Management': 'स्लज मैनेजमेंट',
    'Moulting Support': 'मोल्टिंग सपोर्ट',
    'Minerals + Probiotics': 'मिनरल्स + प्रोबायोटिक्स',
    'Pond Hygiene': 'तालाब स्वच्छता',
    'Healthy & Active Shrimp': 'स्वस्थ और सक्रिय झींगा',
    'Higher Yields': 'अधिक उत्पादन',
    'Better Survival Rate': 'बेहतर सर्वाइवल रेट',
    '40% Faster Growth': '40% तेज़ वृद्धि',

    'A liquid mineral formulation designed to support shrimp moulting, shell formation and mineral balance.': 'రोज़ के झींगा पालन में मोल्टिंग, शेल निर्माण और मिनरल संतुलन में सहायता करने वाला लिक्विड मिनरल फॉर्मूला.',
    'Use during shrimp culture for mineral and moulting support.': 'झींगा पालन में मिनरल और मोल्टिंग सपोर्ट के लिए उपयोग करें।',
    'An Advanced Gut Health Formula designed to support shrimp gut health, digestion and nutrient utilization.': 'झींगा गट हेल्थ, पाचन और पोषक तत्वों के उपयोग में सहायता करने वाला एडवांस्ड गट हेल्थ फॉर्मूला।',
    'Use through feed for preventive or curative gut health support.': 'प्रिवेंटिव या क्यूरेटिव गट हेल्थ सपोर्ट के लिए फीड के माध्यम से उपयोग करें।',
    'A high-efficacy liquid formulation designed for Vibrio management in the pond.': 'तालाब में विब्रियो प्रबंधन के लिए बनाया गया हाई-एफिकेसी लिक्विड फॉर्मूला।',
    'Apply in the pond for Vibrio management. Product guidance recommends applying probiotics after 24 hours.': 'विब्रियो प्रबंधन के लिए तालाब में लागू करें। उत्पाद मार्गदर्शन के अनुसार 24 घंटे बाद प्रोबायोटिक्स लागू करें।',
    'A probiotic tablet formulation designed for biological pond support.': 'तालाब के जैविक सपोर्ट के लिए बनाया गया प्रोबायोटिक टैबलेट फॉर्मूला।',
    'Use for probiotic support in the pond.': 'तालाब में प्रोबायोटिक सपोर्ट के लिए उपयोग करें।',
    'A Smart Oxygen Release Technology formulation designed for oxygen support in the pond.': 'तालाब में ऑक्सीजन सपोर्ट के लिए बनाया गया स्मार्ट ऑक्सीजन रिलीज़ टेक्नोलॉजी फॉर्मूला।',
    'Apply according to the product dosage when pond oxygen support is required.': 'जब तालाब में ऑक्सीजन सपोर्ट की जरूरत हो, तो उत्पाद की मात्रा के अनुसार लागू करें।',
    'An advanced growth booster formulated with probiotics, enzymes, amino acids and feed assimilation support components for shrimp growth.': 'झींगा वृद्धि के लिए प्रोबायोटिक्स, एंजाइम, अमीनो एसिड और फीड असिमिलेशन सपोर्ट घटकों से बना एडवांस्ड ग्रोथ बूस्टर।',
    'Use through feed mixing to support digestion, nutrient utilization, immunity and growth.': 'पाचन, पोषक तत्वों के उपयोग, इम्युनिटी और वृद्धि के लिए फीड मिक्सिंग के माध्यम से उपयोग करें।',
    'A microbial formulation designed for organic sludge management and biological pond cleaning support at the pond bottom.': 'तालाब के तल में ऑर्गेनिक स्लज प्रबंधन और जैविक तालाब सफाई सपोर्ट के लिए बनाया गया माइक्रोबियल फॉर्मूला।',
    'Use for pond-bottom management and biological sludge breakdown support.': 'तालाब के तल प्रबंधन और जैविक स्लज ब्रेकडाउन सपोर्ट के लिए उपयोग करें।',
    'A formulation with chelated minerals and moulting support factors for shrimp moulting support.': 'झींगा मोल्टिंग सपोर्ट के लिए चिलेटेड मिनरल्स और मोल्टिंग सपोर्ट फैक्टर्स से बना फॉर्मूला।',
    'Apply in the pond for shrimp moulting support.': 'झींगा मोल्टिंग सपोर्ट के लिए तालाब में लागू करें।',
    'A formulation combining mineral support and probiotic support.': 'मिनरल और प्रोबायोटिक सपोर्ट को मिलाकर बनाया गया फॉर्मूला।',
    'Use according to the product dosage for mineral and probiotic support in shrimp culture.': 'झींगा पालन में मिनरल और प्रोबायोटिक सपोर्ट के लिए उत्पाद की मात्रा के अनुसार उपयोग करें।',
    'According to product label dosage': 'उत्पाद लेबल की मात्रा के अनुसार',
    'A formulation for pond water hygiene and harmful bacterial management.': 'तालाब के पानी की स्वच्छता और हानिकारक बैक्टीरिया प्रबंधन के लिए फॉर्मूला।',
    'Use for pond water hygiene and harmful bacterial management.': 'तालाब के पानी की स्वच्छता और हानिकारक बैक्टीरिया प्रबंधन के लिए उपयोग करें।',
  },
};

class MarineAquaApp extends StatelessWidget {
  MarineAquaApp({super.key});

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
      home: SplashScreen(),
    );
  }
}

// ---------------- SPLASH ----------------

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MobileNumberPage()),
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
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'marine_logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.water,
                        size: 120,
                        color: aqua,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(tr('Smart Aquaculture. Better Results.'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF082E63),
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 70),
                  SizedBox(
                    width: 54,
                    height: 54,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(tr('Loading...'),
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
      ..shader = LinearGradient(
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
  MobileNumberPage({super.key});

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
        SnackBar(content: Text(tr('10-digit mobile number enter cheyyandi'))),
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE9F8FF), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(24, 32, 24, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 145,
                    child: Image.asset(
                      'marine_logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.water,
                        size: 100,
                        color: aqua,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(tr('Smart Aquaculture. Better Results.'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF082E63),
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 55),
                Text(tr('Enter Your Mobile Number'),
                  style: TextStyle(
                    color: Color(0xFF082E63),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(tr('We will send a 6-digit OTP to verify your mobile number.'),
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                SizedBox(height: 28),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    prefixText: '+91 ',
                    prefixStyle: TextStyle(
                      color: Color(0xFF0877E8),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: tr('Enter 10-digit number'),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Color(0xFFBBDDF2)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Color(0xFFBBDDF2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color(0xFF0877E8),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: sendOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0877E8),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(tr('Send OTP  →'),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
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

  OtpPage({super.key, required this.phoneNumber});

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
        SnackBar(content: Text(tr('6-digit OTP enter cheyyandi'))),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainScreen()),
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFE9F8FF), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(22, 25, 22, 30),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  SizedBox(
                    height: 145,
                    child: Image.asset(
                      'marine_logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.water,
                        size: 100,
                        color: aqua,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(tr('Smart Aquaculture. Better Results.'),
                    style: TextStyle(
                      color: Color(0xFF082E63),
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 45),
                  Text(tr('Verify Your Mobile Number'),
                    style: TextStyle(
                      color: Color(0xFF082E63),
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(tr('We have sent a 6-digit OTP to'),
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                  ),
                  SizedBox(height: 6),
                  Text(
                    formattedPhone,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 28),
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
                          style: TextStyle(
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
                              borderSide: BorderSide(
                                color: Color(0xFFBBDDF2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
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
                  SizedBox(height: 24),
                  Text(tr("Didn't receive OTP?  Resend OTP (00:28)"),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: verify,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0877E8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(tr('Verify & Continue  →'),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpTrust(icon: Icons.verified_user, text: 'Secure\nLogin'),
                      OtpTrust(icon: Icons.eco, text: 'Trusted by\nAqua Farmers'),
                      OtpTrust(icon: Icons.groups, text: 'Better\nTogether'),
                    ],
                  ),
                  SizedBox(height: 90),
                  Text(tr('For a Healthier Aquaculture Tomorrow'),
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

  OtpTrust({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: marineTeal, size: 34),
        SizedBox(height: 7),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

// ---------------- QUICK TOOLS ----------------

class TipOfTheDayPage extends StatelessWidget {
  TipOfTheDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: Text(tr('Tip Of The Day')),
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          _ToolHeader(
            icon: Icons.lightbulb_rounded,
            title: 'Today\'s Pond Tip',
            subtitle: 'Small checks can make a big difference in shrimp culture.',
            color: Colors.orange,
          ),
          SizedBox(height: 16),
          _TipCard(
            title: 'Maintain Dissolved Oxygen',
            text: 'Monitor dissolved oxygen regularly, especially during early morning hours and after weather changes. Stable oxygen supports shrimp activity and feeding.',
          ),
          _TipCard(
            title: 'Observe Feed Response',
            text: 'Check feeding trays and shrimp activity. Sudden changes in feed response can be an early signal that pond conditions need attention.',
          ),
          _TipCard(
            title: 'Watch Pond Bottom',
            text: 'Regularly observe sludge accumulation, water colour and unusual odour. Early pond-bottom management can help maintain a healthier culture environment.',
          ),
        ],
      ),
    );
  }
}

class ShrimpCultureGuidePage extends StatelessWidget {
  ShrimpCultureGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final stages = [
      ('1', 'Pond Preparation', 'Prepare and condition the pond, check water quality and ensure the pond bottom is ready before stocking.'),
      ('2', 'Seed Stocking', 'Use healthy seed and follow the farm stocking plan. Record stocking date, quantity and pond details.'),
      ('3', 'Water Management', 'Regularly monitor pH, dissolved oxygen, salinity, temperature and ammonia. Record results in the app.'),
      ('4', 'Feed Management', 'Adjust feeding based on shrimp growth, feeding response, water conditions and biomass observations.'),
      ('5', 'Health Monitoring', 'Observe shrimp behaviour, gut appearance, moulting, growth and pond-bottom condition regularly.'),
      ('6', 'Growth & Harvest', 'Track biomass and growth, maintain stable pond conditions and plan harvest based on farm targets.'),
    ];

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: Text(tr('Shrimp Culture Guide')),
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(18),
        itemCount: stages.length,
        itemBuilder: (_, index) {
          final item = stages[index];
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Color(0xFFDCEAF4)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: marineTeal,
                  foregroundColor: Colors.white,
                  child: Text(item.$1, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr(item.$2), style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: darkText)),
                      SizedBox(height: 6),
                      Text(tr(item.$3), style: TextStyle(fontSize: 13, height: 1.45, color: Colors.black54)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BiomassCalculatorPage extends StatefulWidget {
  BiomassCalculatorPage({super.key});

  @override
  State<BiomassCalculatorPage> createState() => _BiomassCalculatorPageState();
}

class _BiomassCalculatorPageState extends State<BiomassCalculatorPage> {
  final areaController = TextEditingController();
  final stockingController = TextEditingController();
  final survivalController = TextEditingController();
  final abwController = TextEditingController();

  double? totalShrimp;
  double? biomassKg;
  double? biomassPerAcre;

  void calculateBiomass() {
    final area = double.tryParse(areaController.text.trim());
    final stocking = double.tryParse(stockingController.text.trim());
    final survival = double.tryParse(survivalController.text.trim());
    final abw = double.tryParse(abwController.text.trim());

    if (area == null || stocking == null || survival == null || abw == null || area <= 0 || stocking <= 0 || survival < 0 || survival > 100 || abw <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(tr('Please enter valid values in all fields.'))),
      );
      return;
    }

    final shrimpCount = area * stocking * (survival / 100);
    final biomass = shrimpCount * abw / 1000;

    setState(() {
      totalShrimp = shrimpCount;
      biomassKg = biomass;
      biomassPerAcre = biomass / area;
    });
  }

  void clearCalculator() {
    areaController.clear();
    stockingController.clear();
    survivalController.clear();
    abwController.clear();
    setState(() {
      totalShrimp = null;
      biomassKg = null;
      biomassPerAcre = null;
    });
  }

  @override
  void dispose() {
    areaController.dispose();
    stockingController.dispose();
    survivalController.dispose();
    abwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: Text(tr('Biomass Calculator')),
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ToolHeader(
              icon: Icons.calculate_rounded,
              title: 'Shrimp Biomass Calculator',
              subtitle: 'Estimate pond biomass using area, stocking, survival and average body weight.',
              color: marineTeal,
            ),
            SizedBox(height: 18),
            _calcField(areaController, 'Pond Area (Acres)', Icons.waves, 'Example: 2.5'),
            _calcField(stockingController, 'Stocking Density (PL/acre)', Icons.set_meal, 'Example: 100000'),
            _calcField(survivalController, 'Survival Rate (%)', Icons.favorite, 'Example: 85'),
            _calcField(abwController, 'Average Body Weight (grams)', Icons.scale, 'Example: 15'),
            SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: calculateBiomass,
                icon: Icon(Icons.calculate),
                label: Text(tr('CALCULATE BIOMASS'), style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: marineTeal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                ),
              ),
            ),
            SizedBox(height: 9),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(onPressed: clearCalculator, child: Text(tr('CLEAR'))),
            ),
            if (biomassKg != null) ...[
              SizedBox(height: 20),
              Text(tr('Calculation Result'), style: TextStyle(color: darkText, fontSize: 21, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _resultCard('Estimated Shrimp Count', '${totalShrimp!.round()} shrimp', Icons.set_meal, Color(0xFFE1F2FF)),
              _resultCard('Total Biomass', '${biomassKg!.toStringAsFixed(2)} kg', Icons.scale, Color(0xFFDDF8EA)),
              _resultCard('Biomass Per Acre', '${biomassPerAcre!.toStringAsFixed(2)} kg/acre', Icons.waves, Color(0xFFFFF1D6)),
              SizedBox(height: 5),
              Text(tr('Formula: Estimated shrimp count × average body weight (g) ÷ 1000.'), style: TextStyle(color: Colors.black54, fontSize: 12)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _calcField(TextEditingController controller, String label, IconData icon, String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: tr(label),
          hintText: tr(hint),
          prefixIcon: Icon(icon, color: marineTeal),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(13), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13), borderSide: BorderSide(color: Color(0xFFDCEAF4))),
        ),
      ),
    );
  }

  Widget _resultCard(String title, String value, IconData icon, Color background) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Icon(icon, color: marineTeal, size: 30),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr(title), style: TextStyle(color: darkText, fontSize: 12)),
                SizedBox(height: 3),
                Text(value, style: TextStyle(color: darkText, fontSize: 19, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShrimpDiseasesPage extends StatelessWidget {
  ShrimpDiseasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final diseases = [
      ('White Gut / Gut Health Issues', 'Watch for abnormal gut appearance, reduced feed response and changes in shrimp activity. Check water quality and seek technical guidance for diagnosis and management.'),
      ('Vibrio-Related Problems', 'Monitor pond conditions, organic load, shrimp behaviour and unusual mortality. Use appropriate pond management and product guidance for Vibrio management.'),
      ('Moulting Stress', 'Sudden changes in water quality and mineral balance can affect moulting. Maintain stable water parameters and adequate mineral support.'),
      ('Stress & Poor Growth', 'Check feeding response, water quality, stocking density, pond bottom condition and overall culture management when growth slows.'),
    ];

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        title: Text(tr('Shrimp Diseases')),
        backgroundColor: marineBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          _ToolHeader(
            icon: Icons.health_and_safety_rounded,
            title: 'Shrimp Health Monitor',
            subtitle: 'Common warning signs to observe. Confirm diagnosis with a qualified aquaculture technical professional.',
            color: Colors.red,
          ),
          SizedBox(height: 16),
          ...diseases.map((d) => Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Color(0xFFF0D9D9)),
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.only(bottom: 8),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFFFE2E2),
                    child: Icon(Icons.warning_amber_rounded, color: Colors.red),
                  ),
                  title: Text(tr(d.$1), style: TextStyle(color: darkText, fontWeight: FontWeight.bold, fontSize: 15)),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(tr(d.$2), style: TextStyle(color: Colors.black54, fontSize: 13, height: 1.45)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _ToolHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  _ToolHeader({required this.icon, required this.title, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF063B75), Color(0xFF087ED6), Color(0xFF16AFC6)]),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 36),
          SizedBox(height: 8),
          Text(tr(title), style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(tr(subtitle), style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final String title;
  final String text;

  _TipCard({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17), border: Border.all(color: Color(0xFFDCEAF4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Icon(Icons.check_circle, color: marineTeal), SizedBox(width: 9), Expanded(child: Text(tr(title), style: TextStyle(color: darkText, fontSize: 16, fontWeight: FontWeight.bold)))]),
          SizedBox(height: 9),
          Text(tr(text), style: TextStyle(color: Colors.black54, fontSize: 13, height: 1.45)),
        ],
      ),
    );
  }
}

// ---------------- LANGUAGE ----------------

class LanguagePage extends StatelessWidget {
  LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      ('English', 'English'),
      ('తెలుగు', 'Telugu'),
      ('हिन्दी', 'Hindi'),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF6FBFD),
      appBar: AppBar(
        title: Text(tr('Select Language')),
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF063B75),
        elevation: 0,
      ),
      body: ValueListenableBuilder<String>(
        valueListenable: selectedLanguage,
        builder: (context, current, _) {
          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF063B75), Color(0xFF087ED6)],
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Icon(Icons.translate_rounded, color: Colors.white, size: 34),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tr('Choose your language'),
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(tr('Select the language you want to use in the app.'),
                            style: TextStyle(color: Colors.white70, fontSize: 11.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ...languages.map((item) {
                final selected = current == item.$1;
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(
                        color: selected ? Color(0xFF087ED6) : Color(0xFFD8E7F0),
                        width: selected ? 1.5 : 1,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      leading: CircleAvatar(
                        backgroundColor: selected ? Color(0xFFE1F2FF) : Color(0xFFF1F6F9),
                        child: Icon(
                          Icons.language_rounded,
                          color: selected ? Color(0xFF087ED6) : Color(0xFF557080),
                        ),
                      ),
                      title: Text(
                        item.$1,
                        style: TextStyle(color: Color(0xFF063B75), fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item.$2),
                      trailing: selected
                          ? Icon(Icons.check_circle_rounded, color: Color(0xFF008B68), size: 25)
                          : Icon(Icons.radio_button_unchecked_rounded, color: Colors.black26),
                      onTap: () {
                        selectedLanguage.value = item.$1;
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              }),
              SizedBox(height: 8),
              Text(tr('Language applied across the app.'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 11),
              ),
            ],
          );
        },
      ),
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
    description: 'A liquid mineral formulation designed to support shrimp moulting, shell formation and mineral balance.',
    usage: 'Use during shrimp culture for mineral and moulting support.',
    dosage: 'Pond: 2–3 L/acre\nFeed: 10 ml/kg feed',
    composition: 'Bio-available macro minerals, chelated trace elements, stabilized ionic complexes, moulting support factors మరియు mineral uptake enhancers.',
  ),
  Product(
    name: 'MARINE WHITE SHIELD',
    image: 'white shield.png',
    category: 'Gut Health',
    description: 'An Advanced Gut Health Formula designed to support shrimp gut health, digestion and nutrient utilization.',
    usage: 'Use through feed for preventive or curative gut health support.',
    dosage: 'Preventive: 5–10 ml/kg feed\nCurative: 10 ml/kg feed',
    composition: 'Multi-Strain Probiotic Complex, Gut Stabilizing Organic Acid Salts, Natural Phytogenic Extracts, Yeast Beta-Glucans, Digestive Enzyme Complex, Toxin Binder & Gut Protectant, MOS & FOS.',
  ),
  Product(
    name: 'MARINE VIBRIO SHIELD',
    image: 'vibrio shield.png',
    category: 'Vibrio Control',
    description: 'A high-efficacy liquid formulation designed for Vibrio management in the pond.',
    usage: 'Apply in the pond for Vibrio management. Product guidance recommends applying probiotics after 24 hours.',
    dosage: 'Preventive: 1 L/acre\nCurative: 1.5 L/acre\nProbiotics: after 24 hours',
    composition: 'Proprietary high-efficacy liquid formulation, controlled oxidative activators, marine-grade salts మరియు advanced stabilizing agents.',
  ),
  Product(
    name: 'MARINE PROTAB',
    image: 'protab.png',
    category: 'Probiotic Tablet',
    description: 'A probiotic tablet formulation designed for biological pond support.',
    usage: 'Use for probiotic support in the pond.',
    dosage: '250–300 g/acre',
    composition: 'Spore-Forming Marine Probiotic Blend, Nitrifying Bacteria Complex, Purple Non-Sulfur Bacteria, Lactic Acid Bacteria, Yeast Culture Extract, MOS, beta glucan మరియు seaweed polysaccharide extract.',
  ),
  Product(
    name: 'OXY TAB+',
    image: 'oxytab.png',
    category: 'Oxygen Support',
    description: 'A Smart Oxygen Release Technology formulation designed for oxygen support in the pond.',
    usage: 'Apply according to the product dosage when pond oxygen support is required.',
    dosage: '500 g/acre',
    composition: 'Oxygen precursors, sodium perborate, sodium percarbonate and stabilizers.',
  ),
  Product(
    name: 'MARINE VOLT-X',
    image: 'volt-x.png',
    category: 'Growth Booster',
    description: 'An advanced growth booster formulated with probiotics, enzymes, amino acids and feed assimilation support components for shrimp growth.',
    usage: 'Use through feed mixing to support digestion, nutrient utilization, immunity and growth.',
    dosage: 'Preventive: 5–10 ml/kg feed\nCurative: 10 ml/kg feed',
    composition: 'Energy Activator Complex, Stabilized Vitamin Blend, Essential Amino Acids, Hepatopancreas Support Extract, Electrolyte Balance System, Beta-Glucan Immune Support, Chelated Trace Minerals and Feed Assimilation Enhancer.',
  ),
  Product(
    name: 'BIO SLUDGE-X',
    image: 'bio sludge -x.png',
    category: 'Sludge Management',
    description: 'A microbial formulation designed for organic sludge management and biological pond cleaning support at the pond bottom.',
    usage: 'Use for pond-bottom management and biological sludge breakdown support.',
    dosage: '250–500 g/acre',
    composition: 'Beneficial Bacillus species, enzyme mix, Yucca extract, Thiobacillus spp, nitrifying bacteria, enzyme activation system and bottom activation carriers.',
  ),
  Product(
    name: 'FREE MOULT',
    image: 'free moult.png',
    category: 'Moulting Support',
    description: 'A formulation with chelated minerals and moulting support factors for shrimp moulting support.',
    usage: 'Apply in the pond for shrimp moulting support.',
    dosage: '5–10 kg/acre',
    composition: 'Chelated minerals, moulting inducers, selenium, cobalt, iodine, enzymes and supporting nutrients.',
  ),
  Product(
    name: 'STARMIN',
    image: 'starmin.png',
    category: 'Minerals + Probiotics',
    description: 'A formulation combining mineral support and probiotic support.',
    usage: 'Use according to the product dosage for mineral and probiotic support in shrimp culture.',
    dosage: 'According to product label dosage',
    composition: 'Bacillus subtilis, B. licheniformis, B. megatherium, B. acidophilus, Lactobacillus acidophilus and Pediococcus; 6 Billion CFU/g.',
  ),
  Product(
    name: 'RED THUNDER-80',
    image: 'red thunder.png',
    category: 'Pond Hygiene',
    description: 'A formulation for pond water hygiene and harmful bacterial management.',
    usage: 'Use for pond water hygiene and harmful bacterial management.',
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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: selectedLanguage,
      builder: (context, _, __) {
        final pages = [
          HomePage(),
          ProductsPage(),
          SupportPage(),
          ProfilePage(),
        ];
        return Scaffold(
          body: pages[index],
          bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (v) => setState(() => index = v),
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: tr('Home'),
              ),
              NavigationDestination(
                icon: const Icon(Icons.inventory_2_outlined),
                selectedIcon: const Icon(Icons.inventory_2),
                label: tr('Products'),
              ),
              NavigationDestination(
                icon: const Icon(Icons.support_agent_outlined),
                selectedIcon: const Icon(Icons.support_agent),
                label: tr('Support'),
              ),
              NavigationDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: tr('Profile'),
              ),
            ],
          ),
        );
      },
    );
  }
}
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFFF6FBFD),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              SizedBox(height: 8),
              _hero(),
              SizedBox(height: 8),
              _dots(),
              SizedBox(height: 10),
              _quickRows(context),
              SizedBox(height: 14),
              _dealer(context),
              SizedBox(height: 18),
              _sectionHeader(Icons.inventory_2_rounded, 'Our Aquaculture Solutions', 'Trusted Products for Healthy Shrimp & Better Yields'),
              SizedBox(height: 9),
              _products(context),
              SizedBox(height: 18),
              _sectionHeader(Icons.emoji_events_rounded, 'Success Stories', 'Real farmers. Real results.', iconColor: Colors.amber),
              SizedBox(height: 9),
              _successStories(),
              SizedBox(height: 18),
              _waterTools(),
              SizedBox(height: 18),
              _sectionHeader(Icons.menu_book_rounded, 'Shrimp Growth Guide', 'Step-by-step guidance from stocking to harvest'),
              SizedBox(height: 9),
              _growthGuide(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 7, 8, 7),
      decoration: BoxDecoration(
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
            errorBuilder: (_, __, ___) => Icon(Icons.water_drop, color: marineBlue, size: 46),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr('MARINE AQUA'), style: TextStyle(color: Color(0xFF063B75), fontSize: 18, fontWeight: FontWeight.w800)),
                Text(tr('TECHNOLOGIES'), style: TextStyle(color: Color(0xFF063B75), fontSize: 10.5, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                Text(tr('Smart Aquaculture. Better Results.'), style: TextStyle(color: Colors.black54, fontSize: 8)),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_rounded, color: Color(0xFF063B75), size: 27)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LanguagePage()),
              );
            },
            icon: Icon(Icons.translate_rounded, color: Color(0xFF063B75), size: 24),
            tooltip: tr('Language'),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: Color(0xFFE5F2FF), shape: BoxShape.circle),
            child: Icon(Icons.person, color: Color(0xFF087ED6), size: 25),
          ),
        ],
      ),
    );
  }

  Widget _hero() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 190,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          gradient: LinearGradient(colors: [Color(0xFF063B75), Color(0xFF087ED6), Color(0xFF16AFC6)]),
        ),
        child: Stack(
          children: [
            Positioned(right: -10, top: 16, child: Icon(Icons.set_meal, size: 145, color: Colors.white.withOpacity(.18))),
            Positioned(right: 5, bottom: -15, child: Icon(Icons.water, size: 125, color: Colors.white.withOpacity(.13))),
            Padding(
              padding: EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr('Healthy Ponds'), style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                  Text(tr('Stronger Shrimp'), style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                  Text(tr('Higher Profits'), style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                  SizedBox(height: 5),
                  Text(tr('Complete Aquaculture Solutions\nfor a Better Tomorrow'), style: TextStyle(color: Colors.white, fontSize: 12, height: 1.25)),
                  SizedBox(height: 12),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(9))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      child: Text(tr('Explore Products  →'), style: TextStyle(color: Color(0xFF063B75), fontSize: 12.5, fontWeight: FontWeight.bold)),
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
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(color: i == 0 ? Color(0xFF087ED6) : Color(0xFFC9D8E5), borderRadius: BorderRadius.circular(8)),
      )),
    );
  }

  Widget _quickRows(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: _quickCard(
                Icons.lightbulb_rounded,
                Colors.orange,
                Color(0xFFDDF8EA),
                'Tip Of The Day',
                'Maintain proper dissolved oxygen levels for better growth.',
                'Learn More  →',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => TipOfTheDayPage()));
                },
              ),
            ),
            SizedBox(width: 9),
            Expanded(
              child: _quickCard(
                Icons.menu_book_rounded,
                Color(0xFF087ED6),
                Color(0xFFE1F2FF),
                'Shrimp Culture Guide',
                'Learn setup, management & best practices.',
                'Explore Guide  →',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ShrimpCultureGuidePage()));
                },
              ),
            ),
          ]),
          SizedBox(height: 9),
          Row(children: [
            Expanded(
              child: _quickCard(
                Icons.calculate_rounded,
                Color(0xFF008B68),
                Color(0xFFD9F7E5),
                'Biomass Calculator',
                'Get estimated biomass in 3 easy steps.',
                'Calculate Now  →',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BiomassCalculatorPage()));
                },
              ),
            ),
            SizedBox(width: 9),
            Expanded(
              child: _quickCard(
                Icons.health_and_safety_rounded,
                Colors.red,
                Color(0xFFFFE2E2),
                'Shrimp Diseases',
                'Identify, prevent & treat common diseases.',
                'View Details  →',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ShrimpDiseasesPage()));
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _quickCard(
    IconData icon,
    Color iconColor,
    Color bg,
    String title,
    String description,
    String button, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
      height: 154,
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: iconColor, size: 30),
        SizedBox(height: 4),
        Text(tr(title), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF063B75), fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Expanded(child: Text(tr(description), maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF34546D), fontSize: 10.5, height: 1.2))),
        Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7), decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(8)), child: Text(tr(button), style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
      ]),
      ),
    );
  }

  Widget _dealer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(color: Color(0xFFEAF6FF), borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xFFD4EAF8))),
        child: Row(children: [
          Icon(Icons.location_on_rounded, color: Colors.red, size: 55),
          SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(tr('Dealers Location'), style: TextStyle(color: Color(0xFF063B75), fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 3),
            Text(tr('Find our nearest dealers\nacross India.'), style: TextStyle(color: Color(0xFF34546D), fontSize: 11.5, height: 1.2)),
          ])),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DealerPage())),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF087ED6), foregroundColor: Colors.white, elevation: 0, padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: Text(tr('Find Nearby  →'), style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }

  Widget _sectionHeader(IconData icon, String title, String subtitle, {Color iconColor = const Color(0xFF087ED6)}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(children: [
        Icon(icon, color: iconColor, size: 28),
        SizedBox(width: 7),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(tr(title), style: TextStyle(color: Color(0xFF063B75), fontSize: 17, fontWeight: FontWeight.bold)),
          Text(tr(subtitle), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black54, fontSize: 9.5)),
        ])),
        Text(tr('View All  →'), style: TextStyle(color: Color(0xFF087ED6), fontSize: 10.5, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _products(BuildContext context) {
    final items = products.take(5).toList();
    return SizedBox(
      height: 174,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (_, i) {
          final product = items[i];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsPage(product: product))),
            child: Container(
              width: 132,
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: Color(0xFFDCEAF4))),
              child: Column(children: [
                Expanded(child: Image.asset(product.image, fit: BoxFit.contain, errorBuilder: (_, __, ___) => Icon(Icons.inventory_2_rounded, color: Color(0xFF087ED6), size: 48))),
                Text(product.name, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF063B75), fontSize: 10.5, fontWeight: FontWeight.bold)),
                Text(tr(product.category), textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black54, fontSize: 8.5)),
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
        padding: EdgeInsets.symmetric(horizontal: 12),
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
      margin: EdgeInsets.only(right: 9),
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF087ED6), Color(0xFF063B75)], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(14)),
      child: Stack(children: [
        Center(child: Icon(icon, color: Colors.white.withOpacity(.28), size: 66)),
        Center(child: CircleAvatar(radius: 19, backgroundColor: Colors.white70, child: Icon(Icons.play_arrow, color: Color(0xFF063B75), size: 23))),
        Positioned(left: 9, right: 9, bottom: 8, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(tr(title), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.bold)),
          Text(tr(location), style: TextStyle(color: Colors.white70, fontSize: 9)),
        ])),
      ]),
    );
  }

  Widget _waterTools() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: EdgeInsets.fromLTRB(9, 11, 9, 9),
        decoration: BoxDecoration(color: Color(0xFFDDF8EA), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.science_rounded, color: Color(0xFF009B73), size: 28),
            SizedBox(width: 7),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(tr('Water Quality Tools'), style: TextStyle(color: Color(0xFF063B75), fontSize: 17, fontWeight: FontWeight.bold)),
              Text(tr('Calculate, monitor and maintain ideal water parameters'), style: TextStyle(color: Colors.black54, fontSize: 9.5)),
            ]),
          ]),
          SizedBox(height: 9),
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
      margin: EdgeInsets.symmetric(horizontal: 3),
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 3),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11)),
      child: Column(children: [
        Icon(icon, color: Color(0xFF087ED6), size: 26),
        SizedBox(height: 3),
        Text(tr(title), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF063B75), fontSize: 9.5, fontWeight: FontWeight.bold)),
        Text(tr(subtitle), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize: 7.5)),
      ]),
    ));
  }

  Widget _growthGuide() {
    return SizedBox(
      height: 145,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
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
      margin: EdgeInsets.only(right: 9),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13), border: Border.all(color: Color(0xFFDCEAF4))),
      child: Column(children: [
        Expanded(child: Container(width: double.infinity, decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFDDF3FF), Color(0xFFE8F8F0)]), borderRadius: BorderRadius.circular(9)), child: Icon(icon, color: Color(0xFF087ED6), size: 44))),
        SizedBox(height: 5),
        Align(alignment: Alignment.centerLeft, child: Text(tr(title), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF063B75), fontSize: 10.5, fontWeight: FontWeight.bold))),
        Align(alignment: Alignment.centerLeft, child: Text(tr(subtitle), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black54, fontSize: 8.5))),
      ]),
    );
  }
}

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget page;

  QuickCard({
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
              SizedBox(height: 14),
              Text(
                title,
                style: TextStyle(
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

  ProductMiniCard({super.key, required this.product});

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
          padding: EdgeInsets.all(12),
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
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.image_not_supported,
                    size: 50,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
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
  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(22),
              color: marineBlue,
              child: Text(tr('Our Products'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: products.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
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

  ProductCard({super.key, required this.product});

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
        padding: EdgeInsets.all(12),
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
                    Icon(Icons.image_not_supported, size: 50),
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: darkText,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              tr(product.category),
              textAlign: TextAlign.center,
              style: TextStyle(color: marineTeal, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: pageBg,
        appBar: AppBar(
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
          title: Text(product.name),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 330,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Image.asset(product.image, fit: BoxFit.contain),
              ),
              SizedBox(height: 24),
              Text(
                product.name,
                style: TextStyle(
                  color: darkText,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                tr(product.category),
                style: TextStyle(
                  color: marineTeal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
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

  InfoSection({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(20),
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
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    tr(title),
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              tr(text),
              style: TextStyle(fontSize: 16, height: 1.55),
            ),
          ],
        ),
      );
}

// ---------------- SUPPORT / PROFILE ----------------

class SupportPage extends StatelessWidget {
  SupportPage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 70),
              Icon(Icons.support_agent, size: 80, color: marineTeal),
              SizedBox(height: 20),
              Text(tr('Technical Support'),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
              SizedBox(height: 12),
              Text(tr('Marine Aqua Technologies technical team support'),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 35),
              ListTile(
                leading: Icon(Icons.phone, color: marineTeal),
                title: Text(tr('Customer Care')),
                subtitle: Text(tr('+91 93902 59830')),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              SizedBox(height: 12),
              ListTile(
                leading: Icon(Icons.email, color: marineTeal),
                title: Text(tr('Email')),
                subtitle: Text(tr('marineaquahr@gmail.com')),
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
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 25),
            CircleAvatar(
              radius: 48,
              backgroundColor: lightAqua,
              child: Icon(Icons.person, size: 55, color: marineTeal),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(tr('MARINE AQUA TECHNOLOGIES'),
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),
            SizedBox(height: 30),
            ProfileMenu(
              icon: Icons.badge_outlined,
              title: 'Employee Login',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EmployeeLoginPage(),
                ),
              ),
            ),
            ProfileMenu(
              icon: Icons.location_on_outlined,
              title: 'Employee Field Visit',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EmployeeVisitPage(),
                ),
              ),
            ),
            ProfileMenu(
              icon: Icons.info_outline,
              title: 'About Marine Aqua Technologies',
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'MARINE AQUA TECHNOLOGIES',
                applicationLegalese: tr('Smart Aquaculture. Better Results.'),
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

  ProfileMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: Icon(icon, color: marineTeal),
          title: Text(tr(title)),
          trailing: Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      );
}

// ---------------- EMPLOYEE ----------------

class EmployeeLoginPage extends StatefulWidget {
  EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  final id = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(tr('Employee Login')),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 35),
              Icon(Icons.badge, size: 75, color: marineTeal),
              SizedBox(height: 25),
              TextField(
                controller: id,
                decoration: inputDecoration('Employee ID', Icons.person),
              ),
              SizedBox(height: 15),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: inputDecoration('Password', Icons.lock),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EmployeeDashboardPage(),
                    ),
                  ),
                  child: Text(tr('LOGIN')),
                ),
              ),
            ],
          ),
        ),
      );
}

class EmployeeDashboardPage extends StatelessWidget {
  EmployeeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(tr('Employee Dashboard')),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            dashboardTile(
              context,
              Icons.location_on,
              'Field Visit',
              EmployeeVisitPage(),
            ),
            dashboardTile(
              context,
              Icons.water_drop,
              'Water Test',
              WaterTestPage(),
            ),
            dashboardTile(
              context,
              Icons.waves,
              'My Ponds',
              MyPondsPage(),
            ),
            dashboardTile(
              context,
              Icons.store,
              'Dealer Locator',
              DealerPage(),
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
          tr(title),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
      ),
    );

// ---------------- FIELD VISIT ----------------

class EmployeeVisitPage extends StatefulWidget {
  EmployeeVisitPage({super.key});

  @override
  State<EmployeeVisitPage> createState() => _EmployeeVisitPageState();
}

class _EmployeeVisitPageState extends State<EmployeeVisitPage> {
  final Geocoding geocoding = Geocoding();

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
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      String v = '';
      String m = '';
      String d = '';
      String s = '';
      String p = '';

      try {
        final marks = await geocoding.placemarkFromCoordinates(
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
        title: Text(tr('Visit Submitted')),
        content: Text(
          '${tr('Farmer Name')}: ${farmerController.text}\n'
          '${tr('Pond Name / Pond Number')}: ${pondController.text}\n\n'
          '${tr('Village / Locality')}: $village\n'
          '${tr('Mandal')}: $mandal\n'
          '${tr('District')}: $district\n'
          '${tr('State')}: $state\n'
          '${tr('Pincode')}: $pincode\n\n'
          '${tr('Latitude')}: ${currentPosition!.latitude}\n'
          '${tr('Longitude')}: ${currentPosition!.longitude}\n\n'
          'Date/Time: ${DateTime.now()}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(tr('OK')),
          ),
        ],
      ),
    );
  }

  void _message(String text) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(tr(text))),
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
          title: Text(tr('Field Visit')),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr('Visit Details'),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
              SizedBox(height: 22),
              TextField(
                controller: farmerController,
                decoration: inputDecoration('Farmer Name', Icons.person),
              ),
              SizedBox(height: 15),
              TextField(
                controller: pondController,
                decoration: inputDecoration(
                  'Pond Name / Pond Number',
                  Icons.waves,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: remarksController,
                maxLines: 4,
                decoration: inputDecoration(
                  'Visit Remarks',
                  Icons.notes,
                ),
              ),
              SizedBox(height: 22),
              _gpsCard(),
              SizedBox(height: 18),
              _photoCard(),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: submitVisit,
                  icon: Icon(Icons.send),
                  label: Text(tr('SUBMIT FIELD VISIT'),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: marineBlue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      );

  Widget _gpsCard() => Container(
        width: double.infinity,
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: marineTeal),
                SizedBox(width: 10),
                Text(tr('GPS Location'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            if (currentPosition == null)
              Text(tr('Location not captured'),
                style: TextStyle(color: Colors.grey),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr('Latitude: ${currentPosition!.latitude}')),
                  Text(tr('Longitude: ${currentPosition!.longitude}')),
                  SizedBox(height: 15),
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
            SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: loadingLocation ? null : captureLocation,
                icon: Icon(Icons.my_location),
                label: Text(
                  tr(loadingLocation
                      ? 'Capturing...'
                      : 'CAPTURE CURRENT LOCATION'),
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
        padding: EdgeInsets.only(bottom: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: marineTeal),
            SizedBox(width: 9),
            Expanded(
              child: Text('${tr(title)}: $value',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      );

  Widget _photoCard() => Container(
        width: double.infinity,
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.camera_alt, color: marineTeal),
                SizedBox(width: 10),
                Text(tr('Visit Photo'),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
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
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: capturePhoto,
                icon: Icon(Icons.camera_alt),
                label: Text(
                  tr(visitPhoto == null
                      ? 'CAPTURE VISIT PHOTO'
                      : 'RETAKE PHOTO'),
                ),
              ),
            ),
          ],
        ),
      );
}

// ---------------- WATER TEST / PONDS / DIARY / DEALER ----------------

class WaterTestPage extends StatefulWidget {
  WaterTestPage({super.key});

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
          title: Text(tr('Water Test')),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(tr('Water Parameters'),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            SizedBox(height: 20),
            field(pH, 'pH', Icons.science),
            field(doC, 'DO (mg/L)', Icons.air),
            field(sal, 'Salinity', Icons.water),
            field(ammonia, 'Ammonia', Icons.warning_amber),
            field(temp, 'Temperature °C', Icons.thermostat),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(tr('Water test saved locally')),
                ),
              ),
              child: Text(tr('SAVE WATER TEST')),
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
        padding: EdgeInsets.only(bottom: 14),
        child: TextField(
          controller: c,
          keyboardType: TextInputType.number,
          decoration: inputDecoration(label, i),
        ),
      );
}

class MyPondsPage extends StatefulWidget {
  MyPondsPage({super.key});

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
          title: Text(tr('My Ponds')),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(tr('Add Pond')),
              content: TextField(
                controller: c,
                decoration: InputDecoration(
                  hintText: tr('Pond name / number'),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    add();
                    Navigator.pop(context);
                  },
                  child: Text(tr('SAVE')),
                ),
              ],
            ),
          ),
          child: Icon(Icons.add),
        ),
        body: ponds.isEmpty
            ? Center(child: Text(tr('No ponds added yet')))
            : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: ponds.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    leading: Icon(
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
  PondDiaryPage({super.key});

  @override
  State<PondDiaryPage> createState() => _PondDiaryPageState();
}

class _PondDiaryPageState extends State<PondDiaryPage> {
  final c = TextEditingController();
  final entries = <String>[];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(tr('Pond Diary')),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
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
              SizedBox(height: 12),
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
                  child: Text(tr('ADD ENTRY')),
                ),
              ),
              SizedBox(height: 15),
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
  DealerPage({super.key});

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
          title: Text(tr('Dealer Locator')),
          backgroundColor: marineBlue,
          foregroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(tr('Add Dealer')),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: n,
                      decoration:
                          InputDecoration(labelText: tr('Dealer Name')),
                    ),
                    TextField(
                      controller: city,
                      decoration:
                          InputDecoration(labelText: tr('City')),
                    ),
                    TextField(
                      controller: addr,
                      decoration:
                          InputDecoration(labelText: tr('Address')),
                    ),
                    TextField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration:
                          InputDecoration(labelText: tr('Phone')),
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
                  child: Text(tr('SAVE')),
                ),
              ],
            ),
          ),
          label: Text(tr('Add Dealer')),
          icon: Icon(Icons.add),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: dealers.length,
          itemBuilder: (_, i) {
            final d = dealers[i];
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: lightAqua,
                  child: Icon(Icons.store, color: marineTeal),
                ),
                title: Text(
                  d['name'] ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
      labelText: tr(label),
      prefixIcon: Icon(icon, color: marineTeal),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 17,
      ),
    );
