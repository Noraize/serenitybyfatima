import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:serenitybyfatima/sidebar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

String Latitude = "", Longitude = "";
List<String> recipents = [];
PermissionStatus status = PermissionStatus.granted;

Future<void> getLoc() async {
  status = await Permission.location.request();
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}

Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error("Location services are disabled");
  }
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location permissions are permanently denied.");
  }
  return await Geolocator.getCurrentPosition();
}

void liveLocation() {
  LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    (Position position) {
      Latitude = position.latitude.toString();
      Longitude = position.longitude.toString();
    },
  );
}

class _HomeState extends State<Home> {
  Contact? _contact;
  late TextEditingController textController = TextEditingController();
  final FlutterContactPicker _contactPicker = FlutterContactPicker();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
    getLoc();
    if (status.isGranted) {
      getCurrentLocation().then(
        (value) {
          Latitude = "${value.latitude}";
          Longitude = "${value.longitude}";
        },
      );
      liveLocation();
    }
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.pink,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _contact?.fullName?.toString() ?? 'Chose a contact',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const Icon(
                      Icons.contacts,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
                onPressed: () async {
                  Contact? contact = await _contactPicker.selectContact();
                  setState(
                    () {
                      _contact = contact;
                      if (_contact == null) {
                        textController.text = "";
                      } else {
                        textController.text =
                            "Hello ${_contact?.fullName?.toString()}. I think I am in danger! Please reach out to me at the location attached below!\nhttps://www.google.com/maps/search/?api=1&query-$Latitude,$Longitude";
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                textAlign: TextAlign.justify,
                controller: textController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: MaterialButton(
                onPressed: () {
                  String Number =
                      _contact!.phoneNumbers.toString().replaceAll("[", "");
                  Number = Number.replaceAll("]", "");
                  recipents.add(Number);
                  _sendSMS(
                    textController.text.toString(),
                    recipents,
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.pink,
                child: const Text(
                  "Send SMS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
