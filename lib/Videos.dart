import 'package:flutter/material.dart';
import 'package:serenitybyfatima/URLLauncher.dart';
import 'package:serenitybyfatima/sidebar.dart';
import 'package:youtube_video_info/youtube.dart';

final List<String> videoURLs = [
  "https://www.youtube.com/watch?v=JJ5oH4PB368",
  "https://www.youtube.com/watch?v=E1YdLpa1HUo",
  "https://www.youtube.com/watch?v=KVpxP3ZZtAc",
  "https://www.youtube.com/watch?v=T7aNSRoDCmg",
  "https://www.youtube.com/watch?v=pndPbpHLpos",
  "https://www.youtube.com/watch?v=RoeH4FslNaE",
  "https://www.youtube.com/watch?v=g001P88mPrI",
  "https://www.youtube.com/watch?v=cQ-C7Nr-WxA",
  "https://www.youtube.com/watch?v=TsWRa_cgBsA",
  "https://www.youtube.com/watch?v=fBt-zXE0V5w"
];

final List<String> videoTitles = [];

class videopage extends StatefulWidget {
  const videopage({super.key});
  @override
  State<videopage> createState() => _HomeState();
}

class _HomeState extends State<videopage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<Widget?> _fetchMetadata(int index) async {
    final videoData = await YoutubeData.getData(videoURLs[index]);
    print(videoData.title.toString());
    //setState(() {});
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                videoData.title.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          onTap: () => launchURLApp(videoURLs[index]),
        ),
      ),
    );
  }

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
        itemCount: videoURLs.length,
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: _fetchMetadata(index),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data ?? Container();
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
