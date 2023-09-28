import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User? user;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((value) async {
      if (value != null) {
        user = value;
      }
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        body: Text('loading'),
      );
    }
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            if (user?.isAnonymous == true)
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        final GoogleSignInAccount? googleUser =
                            await GoogleSignIn().signIn();
                        final GoogleSignInAuthentication? googleAuth =
                            await googleUser?.authentication;
                        final credential = GoogleAuthProvider.credential(
                          accessToken: googleAuth?.accessToken,
                          idToken: googleAuth?.idToken,
                        );
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('you have successfully signed in'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 104,
                        height: 48,
                        child: Text(
                          "sign in",
                          style: TextStyle(fontFamily: 'TitanOne'),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Color.fromARGB(255, 38, 114, 38),
                              width: 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (user?.isAnonymous == false)
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 154, 98),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Habitude',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'TitanOne',
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: ClipOval(
                              child: Image.network(
                                user?.photoURL ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey)),
                            child: Text(
                              user?.email ?? "",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      width: 360,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 251, 221, 203),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Warna bayangan
                              spreadRadius: 2, // Radius penyebaran bayangan
                              blurRadius: 8, // Radius blur bayangan
                              offset: Offset(0, 4), // Posisi offset bayangan
                            )
                          ]),
                      child: Row(
                        children: [
                          Icon(Icons.notifications),
                          SizedBox(width: 32),
                          Text(
                            'Notification Seting',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'TitiliumWeb'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      width: 360,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 251, 221, 203),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Warna bayangan
                              spreadRadius: 2, // Radius penyebaran bayangan
                              blurRadius: 8, // Radius blur bayangan
                              offset: Offset(0, 4), // Posisi offset bayangan
                            )
                          ]),
                      child: Row(
                        children: [
                          Icon(Icons.surfing),
                          SizedBox(width: 32),
                          Text(
                            'Holiday Mode',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'TitiliumWeb'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      width: 360,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 251, 221, 203),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Warna bayangan
                              spreadRadius: 2, // Radius penyebaran bayangan
                              blurRadius: 8, // Radius blur bayangan
                              offset: Offset(0, 4), // Posisi offset bayangan
                            )
                          ]),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(width: 32),
                          Text(
                            'Aplication Version Info',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'TitiliumWeb'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        width: 360,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 251, 221, 203),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Warna bayangan
                                spreadRadius: 2, // Radius penyebaran bayangan
                                blurRadius: 8, // Radius blur bayangan
                                offset: Offset(0, 4), // Posisi offset bayangan
                              )
                            ]),
                        child: Row(
                          children: [
                            Icon(Icons.logout_outlined),
                            SizedBox(width: 32),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'TitiliumWeb'),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 1000.0, maxHeight: 200),
                                      padding: EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 235, 142, 142),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2.0,
                                          )),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.logout,
                                              size: 40,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              "Are you sure you want to log out of your account?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'TitanOne',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.only(
                                                      top: 8.0, right: 4.0),
                                                  height: 40,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 207, 88, 80),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 175, 42, 32),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'cancel',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'TitanOne',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await FirebaseAuth.instance
                                                      .signOut();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'you have successfully signed out'),
                                                      duration:
                                                          Duration(seconds: 2),
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(4),
                                                  height: 40,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 64, 152, 96),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 42, 90, 59)),
                                                  ),
                                                  child: Text(
                                                    'sign out',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'TitanOne',
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ])
                                          ])),
                                ));
                      },
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(28),
                    //   color: Colors.white,
                    //   width: MediaQuery.of(context).size.width,
                    //   // height: MediaQuery.of(context).size.height,
                    //   child: Column(
                    //     children: [
                    //       InkWell(
                    //           onTap: () => showDialog<String>(
                    //               context: context,
                    //               builder: (BuildContext context) => Dialog(
                    //                     backgroundColor: Colors.transparent,
                    //                     child: Container(
                    //                       constraints: BoxConstraints(
                    //                           maxWidth: 1000.0, maxHeight: 200),
                    //                       padding: EdgeInsets.all(18),
                    //                       decoration: BoxDecoration(
                    //                           color: Color.fromARGB(
                    //                               255, 235, 142, 142),
                    //                           borderRadius:
                    //                               BorderRadius.circular(24),
                    //                           border: Border.all(
                    //                             color: Colors.red,
                    //                             width: 2.0,
                    //                           )),
                    //                       child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.center,
                    //                           children: [
                    //                             Icon(
                    //                               Icons.logout,
                    //                               size: 40,
                    //                               color: Colors.red,
                    //                             ),
                    //                             Text(
                    //                               "Are you sure you want to log out of your account?",
                    //                               textAlign: TextAlign.center,
                    //                               style: TextStyle(
                    //                                 color: Colors.white,
                    //                                 fontFamily: 'TitanOne',
                    //                               ),
                    //                             ),
                    //                             SizedBox(
                    //                               height: 20,
                    //                             ),
                    //                             Row(
                    //                               children: [
                    //                                 InkWell(
                    //                                   onTap: () {
                    //                                     Navigator.pop(context);
                    //                                   },
                    //                                   child: Container(
                    //                                     alignment:
                    //                                         Alignment.center,
                    //                                     padding:
                    //                                         EdgeInsets.only(
                    //                                             top: 8.0,
                    //                                             right: 4.0),
                    //                                     height: 40,
                    //                                     width: 120,
                    //                                     decoration:
                    //                                         BoxDecoration(
                    //                                       color: Color.fromARGB(
                    //                                           255, 207, 88, 80),
                    //                                       borderRadius:
                    //                                           BorderRadius
                    //                                               .circular(16),
                    //                                       border: Border.all(
                    //                                         color:
                    //                                             Color.fromARGB(
                    //                                                 255,
                    //                                                 175,
                    //                                                 42,
                    //                                                 32),
                    //                                       ),
                    //                                     ),
                    //                                     child: Text(
                    //                                       'cancel',
                    //                                       style: TextStyle(
                    //                                         color: Colors.white,
                    //                                         fontFamily:
                    //                                             'TitanOne',
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 SizedBox(
                    //                                   height: 16,
                    //                                 ),
                    //                                 InkWell(
                    //                                   onTap: () async {
                    //                                     await FirebaseAuth
                    //                                         .instance
                    //                                         .signOut();
                    //                                     ScaffoldMessenger.of(
                    //                                             context)
                    //                                         .showSnackBar(
                    //                                       SnackBar(
                    //                                         content: Text(
                    //                                             'you have successfully signed out'),
                    //                                         duration: Duration(
                    //                                             seconds: 2),
                    //                                       ),
                    //                                     );
                    //                                     Navigator.pop(context);
                    //                                   },
                    //                                   child: Container(
                    //                                     alignment:
                    //                                         Alignment.center,
                    //                                     margin:
                    //                                         EdgeInsets.all(4),
                    //                                     height: 40,
                    //                                     width: 120,
                    //                                     decoration:
                    //                                         BoxDecoration(
                    //                                       color: Color.fromARGB(
                    //                                           255, 64, 152, 96),
                    //                                       borderRadius:
                    //                                           BorderRadius
                    //                                               .circular(16),
                    //                                       border: Border.all(
                    //                                           color: Color
                    //                                               .fromARGB(
                    //                                                   255,
                    //                                                   42,
                    //                                                   90,
                    //                                                   59)),
                    //                                     ),
                    //                                     child: Text(
                    //                                       'sign out',
                    //                                       style: TextStyle(
                    //                                         color: Colors.white,
                    //                                         fontFamily:
                    //                                             'TitanOne',
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 )
                    //                               ],
                    //                             )
                    //                           ]),
                    //                     ),
                    //                   )),
                    //           child: Container(
                    //             alignment: Alignment.center,
                    //             width: 104,
                    //             height: 48,
                    //             child: Text(
                    //               "sign out",
                    //               style: TextStyle(fontFamily: 'TitanOne'),
                    //             ),
                    //             decoration: BoxDecoration(
                    //               color: Colors.red,
                    //               borderRadius: BorderRadius.circular(8.0),
                    //               border: Border.all(
                    //                   color: Color.fromARGB(255, 38, 114, 38),
                    //                   width: 1.0),
                    //             ),
                    //           ))
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
