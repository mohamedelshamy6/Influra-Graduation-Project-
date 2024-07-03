import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestBody extends StatefulWidget {
  final Widget title;
  const RequestBody({Key? key, required this.title}) : super(key: key);

  @override
  State<RequestBody> createState() => _RequestBodyState();
}

class _RequestBodyState extends State<RequestBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: widget.title,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dear [Mohamed]'),
            const SizedBox(
              height: 10,
            ),
            const Text(
                '''I am reaching out on behalf of [Women's Handball Academy] and would love to collaborate with you on promoting our academy to your audience. We are impressed by your influence and engagement and believe your platform is a perfect fit for reaching female athletes interested in handball.
        
        In exchange for your promotion, we can offer [specific compensation or benefits]. If you are interested, please let us know so we can discuss further details.
        
        Thank you for considering this opportunity. We look forward to hearing from you soon.
        
        Best regards,
        [ Lisa Jerardo ]
        [Women's Handball Academy]'''),
            SizedBox(
              height: 40.h,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(6)),
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [Text('1.7.2024'), Spacer(), Icon(Icons.date_range)],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(6)),
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: const Text('20,000 EGP'),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              buttonText: 'Pay Now',
              buttonAction: () async {
                await _launchInWebView(Uri.parse(
                    'https://www.sandbox.paypal.com/checkoutnow?token=5DA554809E119325C'));
              },
              buttonStyle: AppTextStyles.poppinsBold15White,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}
