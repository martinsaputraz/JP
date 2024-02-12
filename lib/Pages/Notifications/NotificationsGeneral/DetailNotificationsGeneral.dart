import 'package:flutter/material.dart';

class NotificationDetailGeneral {
  final String id;
  final String cdate;
  final String image;
  final String title;
  final String news;

  NotificationDetailGeneral({
    required this.id,
    required this.cdate,
    required this.image,
    required this.title,
    required this.news,
  });
}

class DetailNotificationGeneral extends StatefulWidget {
  final String idDetail;

  const DetailNotificationGeneral({Key? key, required this.idDetail})
      : super(key: key);

  @override
  State<DetailNotificationGeneral> createState() =>
      _DetailNotificationGeneralState();
}

class _DetailNotificationGeneralState extends State<DetailNotificationGeneral> {
  @override
  void initState() {
    // Generate dummy data for _notification_detail
    _notification_detail = [
      NotificationDetailGeneral(
        id: '1',
        cdate: '01/01/2023',
        image: 'assets/images/sale.jpg',
        title: 'Dummy Notification Title 1',
        news:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      ),
      // Add more dummy notifications as needed
    ];

    super.initState();
  }

  List<NotificationDetailGeneral> _notification_detail = [];

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
          'Notifikasi',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var notif in _notification_detail)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// NOTIFICATION DETAILS TIME
                    Text(
                      notif.cdate,
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 20),

                    /// NOTIFICATION DETAILS IMAGES
                    if (notif.image.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Image.asset(
                            notif.image,
                            width: 500,
                            height: 200,
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),

                    /// NOTIFICATION DETAILS TITLE
                    Text(
                      notif.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// NOTIFICATION DETAILS DESCRIPTION
                    Text(
                      notif.news,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
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
