import 'package:flutter/material.dart';
import 'package:serenitybyfatima/sidebar.dart';

final List<String> safetyTips = [
  'Tip #1 - Say No and Mean It.',
  'Tip #2 - Use Simple Weapons.',
  'Tip #3 - Trust Your Instincts.',
  'Tip #4 - Deny Attack Opportunities.',
  'Tip #5 - Protect Your Personal Space.',
  'Tip #6 - Present Yourself Confidently.',
  'Tip #7 - Never Go to a Second Location.',
  'Tip #8 - Awareness of Surroundings and the People In Them.',
  'Tip #9 - If someone on an elevator gives you the creeps, wait for the next one.',
  'Tip #10 - If someone is lingering by your car or front door, wait for them to leave.',
  'Tip #11 - When waiting for a bus stand with your back against a wall so you can see all angles.',
  "Tip #12 - Personal alarm or whistle.",
  "Tip #13 - Self-defense tool (if legal and trained to use).",
  "Tip #14 - Flashlight or headlamp with spare batteries.",
  "Tip #15 - Keep small first aid kit.",
  "Tip #16 - Medications and prescriptions.",
  "Tip #17 - When calling for an Uber, choose a well-lit pickup location.",
  "Tip #18 - When calling for an Uber, verify the driver's photo, name, and license plate.",
  "Tip #19 - When calling for an Uber, Share your trip details with a trusted contact.",
  "Tip #20 - When waiting for an Uber, Wait indoors if possible.",
  "Tip #21 - When sitting in an Uber, Sit in the back seat.",
  "Tip #22 - When sitting for an Uber, Trust your instincts; exit if you feel unsafe.",
  "Tip #23 - When sitting in an Uber, Stay connected with a charged phone.",
  "Tip #24 - When sitting in an Uber, Avoid sharing personal information.",
  "Tip #25 - When sitting in an Uber, Use Uber's in-app navigation.",
  "Tip #26 - When sitting in an Uber, Rate and review your driver. This will let others know their reality.",
  "Tip #27 - When sitting in an Uber, Know how to contact emergency services.",
  "Tip #28 - When sitting in an Uber, Check for child safety locks.",
  "Tip #29 - When sitting in an Uber, Inform a trusted friend or family member about your ride.",
  "Tip #30 - Do not let the Uber driver cancel the ride without your consent."
];

class Tips extends StatefulWidget {
  const Tips({super.key});
  @override
  State<Tips> createState() => _HomeState();
}

class _HomeState extends State<Tips> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Serenity By Fatima",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          color: Colors.white,
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: const SideBar(),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: safetyTips.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    safetyTips[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
