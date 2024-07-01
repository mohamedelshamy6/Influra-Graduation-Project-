import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReqBody extends StatelessWidget {
  const ReqBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Dear [Mohamed]'),
        const SizedBox(height: 10,),
        const Text('''I am reaching out on behalf of [Women's Handball Academy] and would love to collaborate with you on promoting our academy to your audience. We are impressed by your influence and engagement and believe your platform is a perfect fit for reaching female athletes interested in handball.

In exchange for your promotion, we can offer [specific compensation or benefits]. If you are interested, please let us know so we can discuss further details.

Thank you for considering this opportunity. We look forward to hearing from you soon.

Best regards,
[ Lisa Jerardo ]
[Women's Handball Academy]'''),
        SizedBox(height: 40.h,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(6)
          ),
          padding: const EdgeInsets.all(8),
          child: const Row(
            children: [
              Text('1.7.2024'),
              Spacer(),
              Icon(Icons.date_range)
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(6)
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: const Text('20,000 EGP'),
        ),
        SizedBox(height: 40.h,),
      ],
    );
  }
}
