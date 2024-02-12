import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/Notifications/NotificationsPages.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class TicketData {
  final String ticketNumber;
  final String date;
  final String time;
  final String jackpot;
  final String hadiah;
  final String imagePath; // Added imagePath attribute

  TicketData({
    required this.ticketNumber,
    required this.date,
    required this.time,
    required this.jackpot,
    required this.hadiah,
    required this.imagePath,
  });
}

class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    super.initState();
    filteredList = ticketList;
  }

  /// TICKET LIST
  List<TicketData> ticketList = [
    TicketData(
      ticketNumber: "MLA24010003",
      date: "5 Januari 2024",
      time: "10:30",
      jackpot: "Mobil Listrik",
      hadiah: "",
      imagePath: "assets/images/ElectricCar.png",
    ),
    TicketData(
      ticketNumber: "MLA24010002",
      date: "3 Januari 2024",
      time: "13:45",
      jackpot: "",
      hadiah: "Voucher100K",
      imagePath: "assets/images/Voucher(2).png",
    ),
    TicketData(
      ticketNumber: "MLA24010001",
      date: "1 Januari 2024",
      time: "19:45",
      jackpot: "",
      hadiah: "Diskon Belanja 20%",
      imagePath: "assets/images/Voucher(1).png",
    ),
    TicketData(
      ticketNumber: "MLA24010001",
      date: "1 Januari 2024",
      time: "19:45",
      jackpot: "",
      hadiah: "Diskon Belanja 20%",
      imagePath: "assets/images/Voucher(1).png",
    ),
    // Add more ticket data as needed
  ];

  /// SEARCH FUNCTIONS
  TextEditingController searchController = TextEditingController();

  List<TicketData> filteredList = [];
  void searchTickets(String query) {
    setState(() {
      filteredList = ticketList
          .where((ticket) =>
              ticket.ticketNumber.toLowerCase().contains(query.toLowerCase()) ||
              ticket.jackpot.toLowerCase().contains(query.toLowerCase()) ||
              ticket.hadiah.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  border: Border.all(color: Colors.redAccent),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: searchTickets,
                        decoration: const InputDecoration(
                          hintText: "Cari disini...",
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    ),
                    IconButton(
                      // style: ButtonStyle(
                      //   shape: BoxDecoration(
                      //     color: Colors.redAccent
                      //   )
                      // ),
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()));
              },
              icon: const Icon(Icons.notifications, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Tiket Kamu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(
                      "No. Tiket : ${filteredList[index].ticketNumber}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${filteredList[index].date}, ${filteredList[index].time}",
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 10),
                              if (filteredList[index].jackpot.isNotEmpty)
                                Text(
                                  "Jackpot :\n${filteredList[index].jackpot}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              if (filteredList[index].hadiah.isNotEmpty)
                                Text(
                                  "Hadiah :\n${filteredList[index].hadiah}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                            ],
                          ),
                        ),

                        Column(
                          children: [
                            Image.asset(
                              filteredList[index].imagePath,
                              width: 150,
                              height: 150,
                            ),
                          ],
                        ),
                        // const SizedBox(width: 50),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.redAccent,
        backgroundColor: Colors.white,
        onPressed: () async {
          // if (hasInternet) {
          //   if (_modelconfig.isNotEmpty) {
          //     final Uri url = Uri.parse(_modelconfig[0].url_live);
          //     await launchUrl(url);
          //   }
          // }
          // else {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => MaintenanceAndElevatorButton(
          //           textMaintance: constants.koneksi),
          //     ),
          //   );
          // }
        },
        label: const Text('Live Chat'),
        icon: const Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}
