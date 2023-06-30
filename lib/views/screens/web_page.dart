// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gov_ser_flutter_app/modals/list_gov_web.dart';

class web_page extends StatefulWidget {
  const web_page({super.key});

  @override
  State<web_page> createState() => _web_pageState();
}

class _web_pageState extends State<web_page> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;

  double progress = 0;

  late var url;

  var urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
      options: PullToRefreshOptions(
        color: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (await webViewController!.canGoBack()) {
              webViewController!.goBack();
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text("Government App Web",
          style: GoogleFonts.zcoolXiaoWei(
            textStyle: TextStyle(
              height: s.height * 0.02,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),),
        actions: [
          IconButton(
            onPressed: () async {
              if (await webViewController!.canGoForward()) {
                webViewController!.goForward();
              }
            },
            icon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: InAppWebView(
          onLoadStop: (controller, url) {
            refreshController!.endRefreshing();
          },
          onLoadStart: (controller, url) {
            var v = url.toString();
            setState(() {
              urlController.text = v;
            });
          },
          pullToRefreshController: refreshController,
          onWebViewCreated: (controller) => webViewController = controller,
          initialUrlRequest: URLRequest(
            url: Uri.parse(AllWebside[index].url),
          ),
        ),
      ),
    );
  }
}
