import 'package:fl_blueprint/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/navigation_service.dart';

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
  InAppWebViewController? webView;
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
                initialUrlRequest: URLRequest(url: Uri.parse(_url)),
                // initialFile: "assets/index.html",
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    useShouldOverrideUrlLoading: true,
                  ),
                ),
                onWebViewCreated: (controller) {
                  webView = controller;
                  print("onWebViewCreated");
                },

                shouldOverrideUrlLoading:
                    (controller, shouldOverrideUrlLoadingRequest) async {
                  var uri = shouldOverrideUrlLoadingRequest.request.url!;

                  if (![
                    "http",
                    "https",
                    "file",
                    "chrome",
                    "data",
                    "javascript",
                    "about"
                  ].contains(uri.scheme)) {
                    if (await canLaunch(_url)) {
                      // Launch the App
                      await launch(
                        _url,
                      );
                      // and cancel the request
                      return NavigationActionPolicy.CANCEL;
                    }
                  }

                  return NavigationActionPolicy.ALLOW;
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
