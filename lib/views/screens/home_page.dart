// ignore_for_file: non_constant_identifier_names

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Transform.scale(
              scale: 0.5,
              child: StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Object chack = snapshot.data!;

                    switch (chack) {
                      case ConnectivityResult.mobile:
                        return const Center(
                          child: Icon(Icons.network_cell_rounded),
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
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                    }
                  } else if (snapshot.hasError) {
                    return const Icon(Icons.report_gmailerrorred_rounded);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
