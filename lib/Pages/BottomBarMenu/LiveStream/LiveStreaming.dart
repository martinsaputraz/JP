import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/LiveStream/LiveStreamHadiah.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/LiveStream/LiveStreamJackpot.dart';


class LiveStreaming extends StatefulWidget {
  const LiveStreaming({super.key});

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Live Streaming',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const <Widget>[
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Undian Hadiah',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Tab(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.celebration_outlined, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Undian Jackpot',
                      style: TextStyle(
                          color: Colors.white), // Ubah warna teks di sini
                      textAlign:
                          TextAlign.center, // Atur tata letak teks di sini
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          LiveStreamHadiah(),
          LiveStreamingJackpot(),
        ],
      ),
    );
  }
}
