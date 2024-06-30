import 'package:flutter/material.dart';
import 'package:influra/features/influencer_req/view/widgets/req_actions.dart';
import 'package:influra/features/influencer_req/view/widgets/req_body.dart';

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ReqBody(),
      ),
      bottomNavigationBar: const ReqActions(),
    );
  }
}