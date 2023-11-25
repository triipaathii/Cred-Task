// ignore_for_file: must_be_immutable

import 'package:cred_task/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectPlan extends StatefulWidget {
  SelectPlan({super.key, required this.hidePhase, required this.opacity});
  bool hidePhase;
  double opacity;

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {
  // By default, the selected plan will be the first plan in the subscription list
  String selectedPlanPrice = subscriptions[0]['price'] as String;
  int selectedPlanMonths = subscriptions[0]['total_months'] as int;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Positioned(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff1c1f24),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: widget.hidePhase
                  ? Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.1, vertical: height * 0.03),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "EMI",
                                    style: GoogleFonts.quicksand(
                                        color: const Color(0xff7c8b96)),
                                  ),
                                  Text(
                                    "₹$selectedPlanPrice/mo",
                                    style: GoogleFonts.quicksand(
                                        color: const Color(0xff7c8b96),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width * 0.15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "duration",
                                    style: GoogleFonts.quicksand(
                                        color: const Color(0xff7c8b96)),
                                  ),
                                  Text(
                                    "$selectedPlanMonths months",
                                    style: GoogleFonts.quicksand(
                                        color: const Color(0xff7c8b96),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(widget.opacity),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))))
                      ],
                    ).animate().fadeIn()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.1,
                          ),
                          child: Text(
                            "how much do you wish to repay?",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: const Color(0xff7c8b96)),
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.1,
                          ),
                          child: Text(
                            "choose one of our recommended plans or make your own",
                            style: GoogleFonts.quicksand(
                                color: const Color(0xff7c8b96), fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.1,
                              ),
                              for (int i = 0;
                                  i < subscriptions.length;
                                  i++) ...[
                                Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 215,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            subscriptions[i]['color'] as Color,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 30),
                                      height: 200,
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedPlanPrice =
                                                    subscriptions[i]['price']
                                                        as String;
                                                selectedPlanMonths =
                                                    subscriptions[0]
                                                        ['total_months'] as int;
                                              });
                                            },
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: subscriptions[i]
                                                            ['price'] ==
                                                        selectedPlanPrice
                                                    ? BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100))
                                                    : BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffe8dfe7))),
                                                child: subscriptions[i]
                                                            ['price'] ==
                                                        selectedPlanPrice
                                                    ? const Icon(
                                                        Icons.check_rounded,
                                                        color:
                                                            Color(0xffe8dfe7),
                                                      )
                                                    : null),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "₹",
                                                style: GoogleFonts.quicksand(
                                                  color:
                                                      const Color(0xffe8dfe7),
                                                ),
                                              ),
                                              Text(
                                                subscriptions[i]['price']
                                                    as String,
                                                style: GoogleFonts.quicksand(
                                                    color:
                                                        const Color(0xffe8dfe7),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                " /mo",
                                                style: GoogleFonts.quicksand(
                                                  color:
                                                      const Color(0xffe8dfe7),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "for ${subscriptions[i]['total_months']} months",
                                            style: GoogleFonts.quicksand(
                                              color: const Color(0xffe8dfe7),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "See calculations",
                                            style: GoogleFonts.quicksand(
                                                color: const Color(0xffe8dfe7),
                                                fontSize: 13,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationStyle:
                                                    TextDecorationStyle.dotted,
                                                decorationColor:
                                                    const Color(0xffe8dfe7),
                                                height: 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (subscriptions[i]['recommended'] == true)
                                      Positioned(
                                        top: 0,
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 17, vertical: 3),
                                            child: Text(
                                              "recommended",
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                              SizedBox(
                                width: width * 0.06,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.1,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff1c1f24),
                                elevation: 0,
                                side:
                                    const BorderSide(color: Color(0xff7c8b96))),
                            child: Text(
                              "create your own plan",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff7c8b96)),
                            ),
                          ),
                        )
                      ],
                    )
                      .animate()
                      .fadeIn(delay: const Duration(milliseconds: 500)),
            ).animate().slideY(end: 0, begin: 1),
          ),
        ],
      ),
    ).animate().slideY(end: 0, begin: 1).fadeIn();
  }
}
