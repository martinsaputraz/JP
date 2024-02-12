import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/Notifications/NotificationsReward/DetailNotificationsReward.dart';
import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:intl/intl.dart';

class NotificationReward extends StatefulWidget {
  const NotificationReward({super.key});

  @override
  State<NotificationReward> createState() => _NotificationRewardState();
}

class _NotificationRewardState extends State<NotificationReward> {
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

  final ScrollController _scrollController = ScrollController();
  bool showUpwardArrow = false;
  String ID = "";

  void _scrollListener() {
    setState(() {
      showUpwardArrow = _scrollController.offset >=
          _scrollController.position.maxScrollExtent;
    });
  }

  /// FUNCTION NOTIFICATIONS
  String _getWaktu(DateTime waktu) {
    var selisih = DateTime.now().difference(waktu);

    if (selisih.inMinutes < 1) {
      return 'Now';
    } else if (selisih.inHours < 1) {
      return '${selisih.inMinutes} minutes ago';
    } else if (selisih.inDays < 1) {
      return '${selisih.inHours} hours ago';
    } else if (selisih.inDays < 30) {
      return '${selisih.inDays} days ago';
    } else if (selisih.inDays < 365) {
      return '${selisih.inDays ~/ 30} months ago';
    } else {
      return DateFormat('dd/MM/yyyy').format(waktu);
    }
  }

  List<Notifikasi> _getTerbaruNotifikasi() {
    // Replace this with the logic to fetch real data from your data source
    List<Notifikasi> terbaruNotifikasi = [
      Notifikasi(
        id_data: 1,
        judul: "Notification Title 1",
        waktu: DateTime.now(),
        deskripsi: "Notification description 1",
        image: 'assets/images/sale.jpg',
      ),
      Notifikasi(
        id_data: 2,
        judul: "Notification Title 2",
        waktu: DateTime.now(),
        deskripsi: "Notification description 2",
        image: "",
      ),
      // Add more notifications as needed
    ];

    return terbaruNotifikasi;
  }

  List<Notifikasi> _getSebelumnyaNotifikasi() {
    // Replace this with the logic to fetch real data from your data source
    List<Notifikasi> sebelumnyaNotifikasi = [
      Notifikasi(
        id_data: 3,
        judul: "Previous Notification Title 1",
        waktu: DateTime.now().subtract(const Duration(hours: 1)),
        deskripsi: "Previous Notification description 1",
        image: "", // No image specified
      ),
      Notifikasi(
        id_data: 4,
        judul: "Previous Notification Title 2",
        waktu: DateTime(2023, 12, 26), // Replace with the desired date
        deskripsi: "Previous Notification description 2",
        image: 'assets/images/sale.jpg',
      ),
      // Add more notifications as needed
    ];

    return sebelumnyaNotifikasi;
  }

  String _getLimitedText(String text, int minimumCharacters) {
    if (text.length <= minimumCharacters) {
      return text;
    } else {
      var words = text.split(' ');
      var limitedWords = <String>[];

      var characterCount = 0;
      for (var word in words) {
        if (characterCount + word.length <= minimumCharacters) {
          limitedWords.add(word);
          characterCount +=
              word.length + 1; // Account for the space after the word
        } else {
          break;
        }
      }

      var limitedText = limitedWords.join(' ');
      if (limitedWords.length < words.length) {
        limitedText += '...';
      }

      return limitedText;
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          _buildTerbaruList(),
          _buildSebelumnyaList(),
        ],
      ),
    );
  }

  /// Widget Notifications
  Widget _buildTerbaruList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // tambahkan properti ini
      children: <Widget>[
        _buildSectionHeader('Terbaru'),
        _buildNotificationList(_getTerbaruNotifikasi()),
      ],
    );
  }

  Widget _buildSebelumnyaList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // tambahkan properti ini
      children: <Widget>[
        _buildSectionHeader('Sebelumnya'),
        _buildNotificationList(_getSebelumnyaNotifikasi()),
      ],
    );
  }

  Widget _buildNotificationList(List<Notifikasi> notifikasi) {
    return ListView.builder(
        itemCount: notifikasi.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () async {
                Navigator.of(context).push(
                  PageAnimationTransition(
                    page: const DetailNotificationReward(idDetail: ''),
                    pageAnimationType: ScaleAnimationTransition(),
                  ),
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// NOTIFICATIONS TITLE
                              Expanded(
                                child: Text(
                                  notifikasi[index].judul,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              /// NOTIFICATIONS TIME
                              Text(
                                _getWaktu(notifikasi[index].waktu),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),

                          /// NOTIFICATIONS DESCRIPTION
                          Text(
                            _getLimitedText(notifikasi[index].deskripsi, 25),
                          )
                        ],
                      ),
                    ),

                    /// NOTIFICATIONS IMAGES
                    if (notifikasi[index].image != null &&
                        notifikasi[index].image!.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Image.asset(
                            notifikasi[index].image!,
                            width: 500,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

/// WIDGET HEADER "TERBARU / SEBELUMNYA"
Widget _buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
    ),
  );
}

//
class Notifikasi {
  final int id_data;
  final String judul;
  final DateTime waktu;
  final String deskripsi;
  final String? image; // Use nullable type for image

  Notifikasi({
    required this.id_data,
    required this.judul,
    required this.waktu,
    required this.deskripsi,
    this.image,
  });
}
