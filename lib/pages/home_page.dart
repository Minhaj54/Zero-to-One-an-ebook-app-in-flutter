import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chapters_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isLoading;
  final paymentUrl = Uri.parse('https://rzp.io/l/appexploade');

  @override
  void initState() {
    _isLoading = true;
    Future.delayed( const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future openDialog() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Support"),
            content: const Text(
                'Enjoy our free e-book app! This app is totally free,and all content of this e-book is belong to their original owners. If you like this and  want to support developer then you can contribute something to the developer\'s hardwork. Thank You!! '),
            actions: [
              TextButton(
                onPressed: () => setState(() {
                  launchUrl(paymentUrl,
                      mode: LaunchMode.inAppBrowserView);
                }),
                child: const Text('Support Us!!'),
              ),
            ],
          ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
         ),
        actions: [
          IconButton(
              onPressed: () {
                openDialog();
              },
              icon: const Icon(Icons.info_outline))
        ],
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ))
          : SafeArea(
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              'assets/images/cover.png',
                            )),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                child: const Chapters(),
                                type: PageTransitionType.rightToLeft)),
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(35)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Start Reading",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,)

                  ],
                ),
              ),
            ),
    );
  }
}
