import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influra/core/theme/app_text_styles.dart';
import 'package:influra/core/widgets/custom_button.dart';


class InfluencerBalance extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {'name': 'Shahid Miah', 'date': '22/10/2022', 'amount': '-\$340.00'},
    {'name': 'Cameron Williamson', 'date': '22/10/2022', 'amount': '+\$240.00'},
    {'name': 'Ronald Richards', 'date': '22/10/2022', 'amount': '-\$340.00'},
    {'name': 'Darlene Robertson', 'date': '22/10/2022', 'amount': '+\$240.00'},
    {'name': 'Darlene Robertson', 'date': '22/10/2022', 'amount': '-\$340.00'},
    {'name': 'Devon Lane', 'date': '22/10/2022', 'amount': '-\$340.00'},
    {'name': 'Esther Howard', 'date': '22/10/2022', 'amount': '+\$240.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2go3DY4UlFzbibP4SBwU8I10f99YF6d6bYccj-OpLeEj_-9cNqCX-WuTZvFYLDzKmP7M&usqp=CAU'),
                ),
                SizedBox(width: 25.w,),
                Text(
                  '\$3,576.89',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomButton(buttonText: 'Withdraw', buttonAction: ()async{
              // PaymentCubit cubit = BlocProvider.of<PaymentCubit>(context);
              // await cubit.getOrderId(
              //   ctx: context,
              //   price: '1500',
              //   email: 'AmrNossohy1985@gmail.com',
              //   order: {},
              //   firstName: cubit.firstName,
              //   lastName: cubit.lastName,
              //   phone: cubit.phone,
              //   country: cubit.country,
              //   city: cubit.city,
              //   detailedAddress: cubit.detailedAddress,
              // );
            }, buttonStyle: AppTextStyles.poppinsBold15White),
            SizedBox(height: 20),
            Text(
              'Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: Text(
                        transactions[index]['name']![0],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Text(transactions[index]['name']!),
                    subtitle: Text(transactions[index]['date']!),
                    trailing: Text(transactions[index]['amount']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}