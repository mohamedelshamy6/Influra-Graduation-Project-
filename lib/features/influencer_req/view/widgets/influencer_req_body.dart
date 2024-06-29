import 'package:flutter/material.dart';

class InfluencerReqBody extends StatefulWidget {
  const InfluencerReqBody({super.key});

  @override
  State<InfluencerReqBody> createState() => _InfluencerReqBodyState();
}

class _InfluencerReqBodyState extends State<InfluencerReqBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dear [Moamed]'),
            SizedBox(height: 10,),
            Text('afjsafjlkskl kjkkjasfkjfs asjkkjsfkjsfkj sakjskfj\ndjfdjsdjbdsjhbdsfsggsv gsgssggg'),
            
          ],
        ),
      ),
    );
  }
}