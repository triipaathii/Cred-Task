import 'package:cred_task/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectBank extends StatefulWidget {
  const SelectBank({super.key});

  @override
  State<SelectBank> createState() => _SelectBankState();
}

class _SelectBankState extends State<SelectBank> {
  // By default, the selected bank account will be the first bank account in the list
  String selectedAccNo = banks[0]['acc_no'] as String;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Positioned(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1, vertical: height * 0.03),
              decoration: const BoxDecoration(
                  color: Color(0xff1c1f24),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "where should we send the money?",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: const Color(0xff7c8b96)),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 5,
                  ),
                  Text(
                    "amount will be credited to this bank account, EMI will also be debited from this bank account",
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff7c8b96), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      for (int i = 0; i < banks.length; i++) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 45,
                              width: 45,
                              child: Image.asset(
                                banks[i]['logo_path'] as String,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  banks[i]['name'] as String,
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white),
                                ),
                                Text(
                                  banks[i]['acc_no'] as String,
                                  style:
                                      GoogleFonts.quicksand(color: Colors.grey),
                                )
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAccNo = banks[i]['acc_no'] as String;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(100)),
                                child: selectedAccNo == banks[i]['acc_no']
                                    ? const Icon(
                                        Icons.check_rounded,
                                        color: Color(0xffe8dfe7),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1c1f24),
                        elevation: 0,
                        side: const BorderSide(color: Color(0xff7c8b96))),
                    child: Text(
                      "Change account",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff7c8b96)),
                    ),
                  )
                ],
              ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
            ).animate().slideY(end: 0, begin: 1),
          ),
        ],
      ),
    ).animate().slideY(end: 0, begin: 1).fadeIn();
  }
}
