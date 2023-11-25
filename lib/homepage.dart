import 'dart:io';

import 'package:cred_task/select_bank.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'select_plan.dart';
import 'set_amount.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // bool variable used for each page to check whether the following page to be displayed or not
  bool setAmountScreenSelected = true;
  bool selectPlanScreenSelected = false;
  bool selectBankScreenSelected = false;

  @override
  Widget build(BuildContext context) {
    // to get device's screen' height and width
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return WillPopScope(
      onWillPop: () async {
        if (selectBankScreenSelected) {
          setState(() {
            selectPlanScreenSelected = true;
            selectBankScreenSelected = false;
          });
        } else if (selectPlanScreenSelected) {
          setState(() {
            selectPlanScreenSelected = false;
            setAmountScreenSelected = true;
          });
        } else {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,

        // Bottom button to navigate to further pages
        bottomNavigationBar: GestureDetector(
          onTap: () {
            if (setAmountScreenSelected) {
              setState(() {
                setAmountScreenSelected = false;
                selectPlanScreenSelected = true;
              });
            } else {
              setState(() {
                selectPlanScreenSelected = false;
                selectBankScreenSelected = true;
              });
            }
          },
          child: Stack(
            children: [
              Container(
                color: const Color(0xff1c1f24),
                height: height * 0.07,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xff3b479b),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: height * 0.07,
                alignment: Alignment.center,
                child: Text(
                  setAmountScreenSelected
                      ? "Proceed to EMI selection"
                      : selectPlanScreenSelected
                          ? "Select your bank account"
                          : selectBankScreenSelected
                              ? "Tap for 1-click KYC"
                              : "",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffab9dce)),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cross Button
                    GestureDetector(
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff1c1f24),
                            borderRadius: BorderRadius.circular(height)),
                        child: Text(
                          "X",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: const Color(0xff7c8b96)),
                        ),
                      ),
                    ),

                    // Information Button
                    GestureDetector(
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff1c1f24),
                            borderRadius: BorderRadius.circular(height)),
                        child: Text(
                          "?",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: const Color(0xff7c8b96)),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Stack of pages to be displayed
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SetAmount(
                        hidePhase: !setAmountScreenSelected,
                        opacity: setAmountScreenSelected
                            ? 0
                            : selectPlanScreenSelected
                                ? 0.3
                                : 0.6),
                    if (!setAmountScreenSelected)
                      SelectPlan(
                        hidePhase: !selectPlanScreenSelected,
                        opacity: selectBankScreenSelected ? 0.3 : 0,
                      ),
                    if (!selectPlanScreenSelected && !setAmountScreenSelected)
                      const SelectBank(),
                    if (!setAmountScreenSelected)
                      Positioned(
                        top: height * 0.045,
                        right: width * 0.1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              setAmountScreenSelected = true;
                              selectBankScreenSelected = false;
                              selectPlanScreenSelected = false;
                            });
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xffe8dfe7),
                          ),
                        ),
                      ),
                    if (!setAmountScreenSelected && !selectPlanScreenSelected)
                      Positioned(
                        top: height * 0.145,
                        right: width * 0.1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectBankScreenSelected = false;
                              selectPlanScreenSelected = true;
                            });
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xffe8dfe7),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
