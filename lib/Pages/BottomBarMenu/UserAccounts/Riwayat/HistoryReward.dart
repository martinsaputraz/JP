import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class HistoryPrize extends StatefulWidget {
  const HistoryPrize({Key? key}) : super(key: key);

  @override
  State<HistoryPrize> createState() => _HistoryPrizeState();
}

class _HistoryPrizeState extends State<HistoryPrize> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  //
  final ScrollController _scrollController = ScrollController();
  bool showUpwardArrow = false;
  String iD = "";

  void _scrollListener() {
    setState(() {
      showUpwardArrow = _scrollController.offset >=
          _scrollController.position.maxScrollExtent;
    });
  }

  /// DROPDOWNMENU FUNCTION
  /// "MONTH PERIOD" LIST DATA
  final List<String> items = [
    'Desember 2023',
    'November 2023',
    'Oktober 2023',
    'September 2023',
    'Agustus 2023',
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's the last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  /// "WALLET HISTORY" LIST DATA
  List<WalletHistory> _getHistoryPrize() {
    // Replace this with the logic to fetch real data from your data source
    List<WalletHistory> getHistoryPrize = [
      WalletHistory(
        idData: 1,
        typeReward: "Jackpot",
        waktu: "31 Januari 2024",
        prize: "Mobil Listrik",
        image: 'assets/images/sale.jpg',
      ),
      WalletHistory(
        idData: 2,
        typeReward: "Hadiah",
        waktu: "25 Januari 2024",
        prize: "Voucher 100K",
        image: 'assets/images/grooming.png',
      ),
      WalletHistory(
        idData: 3,
        typeReward: "Hadiah",
        waktu: "20 Januari 2024",
        prize: "Diskon Belanja 20%",
        image: 'assets/images/food.jpg',
      ),
      WalletHistory(
        idData: 4,
        typeReward: "Hadiah",
        waktu: "10 Januari 2024",
        prize: "Diskon Belanja 20%",
        image: 'assets/images/food.jpg',
      ),
      // Add more notifications as needed
    ];
    return getHistoryPrize;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Riwayat Hadiah',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          /// SEARCH BAR & "MONTH PERIOD" DROPDOWN BUTTON
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                /// SEARCH BAR
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(color: Colors.redAccent),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Cari disini...",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                        IconButton(
                          // style: ButtonStyle(
                          //   shape: BoxDecoration(
                          //     color: Colors.redAccent
                          //   )
                          // ),
                          onPressed: () {},
                          icon:
                              const Icon(Icons.search, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                ),

                /// "MONTH PERIOD" DROPDOWN BUTTON
                const SizedBox(width: 10),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 15,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Pilih Periode',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        // border: Border.all(
                        //   color: Colors.black26,
                        // ),
                        color: Colors.redAccent,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 15,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.redAccent,
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 10, right: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// "HISTORY WALLET" WIDGET
          _historyWalletList(_getHistoryPrize()),
        ],
      ),
    );
  }

  /// "HISTORY WALLET" WIDGET
  Widget _historyWalletList(List<WalletHistory> historyWallet) {
    return Column(
      children: historyWallet.map((historyReward) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () async {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const DetailHistoryPrize(
              //         idDetail: '',
              //       )),
              // );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        /// "ICON" WALLET HISTORY, "CATEGORY" WALLET HISTORY & "TIME" WALLET HISTORY
                        Expanded(
                          child: Row(
                            children: [
                              /// "ICON" WALLET HISTORY
                              const Icon(Icons.card_giftcard),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// "CATEGORY" WALLET HISTORY
                                  Text(
                                    historyReward.typeReward,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),

                                  /// "TIME" WALLET HISTORY
                                  Text(
                                    historyReward.waktu,
                                    // style: TextStyle(
                                    //     fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        /// "EXPENSE TRANSACTION"
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${historyReward.prize}',
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   historyReward.prize,
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold),
                            // )
                          ],
                        ),
                        //
                      ],
                    ),

                    //
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

//
class WalletHistory {
  final int idData;
  final String waktu;
  final String typeReward;
  final String prize;
  final String? image; // Use nullable type for image

  WalletHistory({
    required this.idData,
    required this.typeReward,
    required this.waktu,
    required this.prize,
    this.image,
  });
}
