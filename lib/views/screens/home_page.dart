// ignore_for_file: non_constant_identifier_names

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gov_ser_flutter_app/modals/list_gov_web.dart';
import 'package:gov_ser_flutter_app/utils/routes_utils.dart';

class home_page extends StatelessWidget {
  home_page({super.key});

  Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Government Services",
          style: GoogleFonts.zcoolXiaoWei(
            textStyle: TextStyle(
              height: s.height * 0.02,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Object check = snapshot.data!;
            switch (check) {
              case ConnectivityResult.mobile:
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: s.height * 0.8,
                                child: GridView.builder(
                                  itemCount: AllWebside.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3 / 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            // color: Colors.grey,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black54,
                                                blurRadius: 3,
                                                spreadRadius: 2,
                                                offset: Offset(0.2, 0.1),
                                                blurStyle: BlurStyle.outer,
                                              ),
                                            ],
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  AllWebside[index].logo),
                                              // fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              // border: Border.all(color: Colors.black26,width: 5,),
                                              ),
                                          child: Text(
                                            AllWebside[index].name,
                                            style: GoogleFonts.zcoolXiaoWei(
                                              textStyle: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              case ConnectivityResult.wifi:
                return const Center(
                  child: Icon(Icons.wifi_outlined),
                );
              case ConnectivityResult.bluetooth:
                return const Center(
                  child: Icon(Icons.bluetooth),
                );
              case ConnectivityResult.none:
                return const Center(
                  child: Icon(Icons
                      .signal_cellular_connected_no_internet_4_bar_rounded),
                );
              default:
                return const CircularProgressIndicator();
            }
          } else if (snapshot.hasError) {
            return const Icon(Icons.report_gmailerrorred_rounded);
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: s.height * 0.8,
                        child: GridView.builder(
                          itemCount: AllWebside.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AllRoutes.WebsidePage,
                                arguments: index,
                              );
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black87,
                                        width: 5,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, -1),
                                          color: Colors.grey,
                                          blurRadius: 15,
                                          blurStyle: BlurStyle.outer,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            AllWebside[index].logo),
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: s.height * 0.01),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          color: Colors.black,
                                          blurRadius: 5,
                                          blurStyle: BlurStyle.outer,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                      color: Colors.grey.shade100,
                                      border: Border.all(
                                        color: Colors.black87,
                                        width: 5,
                                      ),
                                    ),
                                    alignment: const Alignment(0, -0.1),
                                    child: Text(
                                      AllWebside[index].name,
                                      style: GoogleFonts.zcoolXiaoWei(
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
