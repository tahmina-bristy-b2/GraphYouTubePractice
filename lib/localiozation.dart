import 'dart:convert';

import 'package:flutter/material.dart';

class ArabicLinemanagement extends StatefulWidget {
  const ArabicLinemanagement({super.key});

  @override
  State<ArabicLinemanagement> createState() => _ArabicLinemanagementState();
}

class _ArabicLinemanagementState extends State<ArabicLinemanagement> {
  String text =
      "(৬) সিজদা : ক্বওমার দো‘আ পাঠ শেষে ‘আল্লা-হু আকবর’ বলে প্রথমে দু’হাত ও পরে দু’হাঁটু মাটিতে রেখে সিজদায় যাবে ও বেশী বেশী দো‘আ পড়বে। এ সময় দু’হাত ক্বিবলামুখী করে মাথার দু’পাশে কাঁধ বা কান বরাবর মাটিতে স্বাভাবিকভাবে রাখবে। কনুই ও বগল ফাঁকা থাকবে। হাঁটুতে বা মাটিতে ঠেস দিবে না। সিজদা লম্বা হবে ও পিঠ সোজা থাকবে। যেন নীচ দিয়ে একটি বকরীর বাচ্চা যাওয়ার মত ফাঁকা থাকে।\n\nসিজদা থেকে উঠে বাম পায়ের পাতার উপরে বসবে ও ডান পায়ের পাতা খাড়া রাখবে। এ সময় স্থিরভাবে বসে দো‘আ পড়বে। অতঃপর ‘আল্লা-হু আকবর’ বলে দ্বিতীয় সিজদায় যাবে ও দো‘আ পড়বে। রুকূ ও সিজদায় কুরআনী দো‘আ পড়বে না। ২য় ও ৪র্থ রাক‘আতে দাঁড়াবার প্রাক্কালে সিজদা থেকে উঠে সামান্য সময়ের জন্য স্থির হয়ে বসবে। একে ‘জালসায়ে ইস্তিরা-হাত’ বা ‘স্বস্তির বৈঠক’ বলে। অতঃপর মাটিতে দু’হাতে ভর দিয়ে উঠে দাঁড়িয়ে যাবে।\n\nসিজদার দো‘আ : سُبْحَانَ رَبِّيَ الْأَعْلَى (সুবহা-না রবিয়াল আ‘লা) অর্থঃ ‘মহাপবিত্র আমার প্রতিপালক যিনি সর্বোচ্চ’। কমপক্ষে তিনবার পড়বে। রুকূ ও সিজদার অন্য দো‘আও রয়েছে।\n\nদুই সিজদার মধ্যবর্তী বৈঠকের দো‘আ :\n\nاَللَّهُمَّ اغْفِرْ لِيْ وَارْحَمْنِيْ وَاجْبُرْنِيْ وَاهْدِنِيْ وَعَافِنِيْ وَارْزُقْنِيْ\n\nউচ্চারণ : আল্লা-হুম্মাগফিরলী ওয়ারহামনী ওয়াজ্বুরনী ওয়াহদিনী ওয়া ‘আ-ফেনী ওয়ারঝুক্বনী।\n\nঅনুবাদ : ‘হে আল্লাহ! আপনি আমাকে ক্ষমা করুন, আমার উপরে রহম করুন, আমার অবস্থার সংশোধন করুন, আমাকে সৎপথ প্রদর্শন করুন, আমাকে সুস্থতা দান করুন ও আমাকে রূযী দান করুন’।[3]";

  String languageCodes = '';
  final RegExp arabic = RegExp(r'^[\u0621-\u064A]+');

  @override
  Widget build(BuildContext context) {
    // matha();
    return Scaffold(
        body: ListTile(
            title: Text("Title Text "),
            subtitle: Column(
                children: LineSplitter.split(text).map((t) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Text("1 "),
                  Expanded(
                    child: Text(
                      t,
                      textAlign: arabic.hasMatch(t) == true
                          ? TextAlign.right
                          : TextAlign.start,
                    ),
                  )
                ],
              );
            }).toList())));
  }
}
