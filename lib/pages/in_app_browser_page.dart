import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/setup_locator.dart';
import '../services/navigation_service.dart';

/// Browser in application
class InAppWebViewExampleScreen extends StatefulWidget {
  final String _url;

  /// Constructor for new instance
  InAppWebViewExampleScreen(this._url);
  @override
  _InAppWebViewExampleScreenState createState() =>
      _InAppWebViewExampleScreenState(_url);
}

class _InAppWebViewExampleScreenState extends State<InAppWebViewExampleScreen> {
  InAppWebViewController webView;
  final String _url;
  bool _showLoading = true;
  _InAppWebViewExampleScreenState(this._url);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(''),
            backgroundColor: Color(0xFF141D28),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                locator.get<NavigationService>().goBack();
              },
            )),
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.all(10.0),
              child: _showLoading ? LinearProgressIndicator() : Container()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: InAppWebView(
                initialUrl: _url,
                // initialFile: "assets/index.html",
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    debuggingEnabled: true,
                    useShouldOverrideUrlLoading: true,
                  ),
                ),
                onWebViewCreated: (controller) {
                  webView = controller;
                  print("onWebViewCreated");
                },

                shouldOverrideUrlLoading:
                    (controller, shouldOverrideUrlLoadingRequest) async {
                  var url = shouldOverrideUrlLoadingRequest.url;
                  var uri = Uri.parse(url);

                  if (![
                    "http",
                    "https",
                    "file",
                    "chrome",
                    "data",
                    "javascript",
                    "about"
                  ].contains(uri.scheme)) {
                    if (await canLaunch(url)) {
                      // Launch the App
                      await launch(
                        url,
                      );
                      // and cancel the request
                      return ShouldOverrideUrlLoadingAction.CANCEL;
                    }
                  }

                  return ShouldOverrideUrlLoadingAction.ALLOW;
                },
                onLoadStop: (controller, url) async {
                  print("onLoadStop $url");
                  setState(() {
                    _showLoading = false;
                  });
                },
              ),
            ),
          ),
        ])));
  }
}
