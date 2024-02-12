import 'package:flutter/material.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/UserAccounts/BalanceWallet/DepositBalance.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/UserAccounts/BalanceWallet/HistoryBalance.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/UserAccounts/General/AboutUs.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/UserAccounts/Riwayat/HistoryReward.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/UserAccounts/SettingsApp/ChangeLanguage.dart';
import 'package:go_hadiah/Pages/BottomBarMenu/UserAccounts/SettingsApp/ChangePassword.dart';
import 'package:go_hadiah/Pages/Login&Register/LoginApps.dart';

class UserAccounts extends StatefulWidget {
  const UserAccounts({super.key});

  @override
  State<UserAccounts> createState() => _UserAccountsState();
}

class _UserAccountsState extends State<UserAccounts> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          /// USER ACCOUNTS DETAILS
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  // Container(
                  //   padding: const EdgeInsets.all(5),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(50),
                  //     child: Image.asset(
                  //       'assets/images/food.jpg',
                  //       fit: BoxFit.cover,
                  //       height: 50,
                  //       width: 50,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elsa Diana',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'elsa@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      // Text(
                      //   '081888888888',
                      //   style: TextStyle(fontSize: 12),
                      // ),
                    ],
                  ),
                  // const SizedBox(width: 50),
                  // Container(
                  //   padding: const EdgeInsets.all(5),
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {
                  //       // Navigator.push(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //         builder: (context) => const EditProfile()));
                  //     },
                  //     icon: const Icon(Icons.edit),
                  //     label: const Text('Ubah'),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          /// E-WALLET INFORMATION
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      child: const Icon(Icons.wallet)),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Saldo Kamu',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const Text(
                        'Rp 1.000.000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      // Text(
                      //   'Poin Kamu : 1.000',
                      //   style: TextStyle(fontSize: 12),
                      // ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DepositBalance()));
                              },
                              icon: const Icon(Icons.paid_outlined),
                              label: const Text('Deposit'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HistoryBalance()));
                              },
                              icon: const Icon(Icons.history),
                              label: const Text('History'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),

          // /// ACCOUNTS CATEGORY
          // Container(
          //   padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
          //   child: Column(
          //     children: [
          //       const ListTile(
          //         title: Text(
          //           'Accounts',
          //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //         ),
          //       ),
          //       // ListTile(
          //       //   leading: const Icon(Icons.map),
          //       //   trailing: const Icon(Icons.arrow_forward_ios, size: 15),
          //       //   title: const Text('Daftar Alamat'),
          //       //   onTap: () {
          //       //     Navigator.push(
          //       //         context,
          //       //         MaterialPageRoute(
          //       //             builder: (context) =>
          //       //                 const ChangePassword()));
          //       //   },
          //       // ),
          //       ListTile(
          //         leading: const Icon(Icons.local_play_outlined),
          //         trailing: const Icon(Icons.arrow_forward_ios, size: 15),
          //         title: const Text('Promo & Voucher'),
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const PromoVoucher()));
          //         },
          //       ),
          //       ListTile(
          //         leading: const Icon(Icons.notifications),
          //         trailing: const Icon(Icons.arrow_forward_ios, size: 15),
          //         title: const Text('Pengaturan Notifikasi'),
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) =>
          //                       const NotificationsSettings()));
          //         },
          //       ),
          //     ],
          //   ),
          // ),

          /// HISTORY CATEGORY
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'Riwayat',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.history),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  title: const Text('Riwayat Hadiah'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryPrize()));
                  },
                ),
              ],
            ),
          ),

          /// APP SETTING CATEGORY
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'Pengaturan Aplikasi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.translate),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  title: const Text('Ubah Bahasa'),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ChangeLanguageTile(
                                language: 'Bahasa Indonesia',
                                iconPath:
                                    'assets/icon/language/Icon_Indonesia.png',
                                selectedLanguage: selectedLanguage,
                                onTap: (selectedLanguage) {
                                  setState(() {
                                    this.selectedLanguage = selectedLanguage;
                                  });
                                },
                              ),
                              ChangeLanguageTile(
                                language: 'English (US)',
                                iconPath: 'assets/icon/language/Icon_US.png',
                                selectedLanguage: selectedLanguage,
                                onTap: (selectedLanguage) {
                                  setState(() {
                                    this.selectedLanguage = selectedLanguage;
                                  });
                                },
                              ),
                              // Add more language options as needed
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.password),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  title: const Text('Ubah Password'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePassword()));
                  },
                ),
              ],
            ),
          ),

          // /// KEAMANAN CATEGORY
          // Container(
          //   padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
          //   child: Column(
          //     children: [
          //       const ListTile(
          //         title: Text(
          //           'Keamanan',
          //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //         ),
          //       ),
          //
          //     ],
          //   ),
          // ),

          /// GENERAL CATEGORY
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'Umum',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  title: const Text('Tentang Kami'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutPages()));
                  },
                ),
              ],
            ),
          ),

          // /// GENERAL CATEGORY
          // Container(
          //   padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
          //   child: Column(
          //     children: [
          //       const ListTile(
          //         title: Text(
          //           'General',
          //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //         ),
          //       ),
          //       ListTile(
          //         leading: const Icon(Icons.security),
          //         trailing: const Icon(Icons.arrow_forward_ios, size: 15),
          //         title: const Text('Privacy Policy'),
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const PrivacyPolicy()));
          //         },
          //       ),
          //       ListTile(
          //         leading: const Icon(Icons.menu_book),
          //         trailing: const Icon(Icons.arrow_forward_ios, size: 15),
          //         title: const Text('Terms of Service'),
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const TermsOfService()));
          //         },
          //       ),
          //       ListTile(
          //         leading: const Icon(Icons.perm_device_info),
          //         trailing: const Icon(Icons.arrow_forward_ios, size: 15),
          //         title: const Text('About'),
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const AboutPages()));
          //         },
          //       ),
          //     ],
          //   ),
          // ),

          /// ENDS
          /// APPS VERSION
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: const Text(
              'App Version : 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45),
            ),
          ),

          /// LOGOUT BUTTON
          Container(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 20),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPages()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
