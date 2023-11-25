// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SetAmount extends StatefulWidget {
  SetAmount({super.key, required this.hidePhase, required this.opacity});
  bool hidePhase;
  double opacity;
  @override
  State<SetAmount> createState() => _SetAmountState();
}

class _SetAmountState extends State<SetAmount> {
  double _volumeValue = 150000;

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Positioned(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xff1c1f24),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: widget.hidePhase
            ? Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.1, vertical: height * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "credit amount",
                          style: GoogleFonts.quicksand(
                              color: const Color(0xff7c8b96)),
                        ),
                        Text(
                          "₹${NumberFormat.decimalPattern('en_in').format(_volumeValue.toInt())}",
                          style: GoogleFonts.quicksand(
                              color: const Color(0xff7c8b96),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
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
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "anurag, how much do you need?",
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
                      "move the dial and set any amount you need upto ₹4,87,891",
                      style: GoogleFonts.quicksand(
                          color: const Color(0xff7c8b96), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            height: width * 0.8,
                            child: SfRadialGauge(
                                enableLoadingAnimation: true,
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 487891,
                                    startAngle: 270,
                                    endAngle: 270,
                                    centerY: 0.43,
                                    canScaleToFit: true,
                                    showLabels: false,
                                    showTicks: false,
                                    radiusFactor: 0.85,
                                    axisLineStyle: AxisLineStyle(
                                        cornerStyle: CornerStyle.bothFlat,
                                        color: Colors.grey.withOpacity(0.2),
                                        thickness: 1),
                                  ),
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 487891,
                                    startAngle: 270,
                                    canScaleToFit: true,
                                    endAngle: 270,
                                    showLabels: false,
                                    showTicks: false,
                                    centerY: 0.43,
                                    radiusFactor: 1,
                                    axisLineStyle: const AxisLineStyle(
                                        cornerStyle: CornerStyle.bothFlat,
                                        color: Color(0xfffaeadf),
                                        thickness: 12),
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: _volumeValue,
                                        cornerStyle: CornerStyle.bothFlat,
                                        width: 12,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        color: const Color(0xffcf8c74),
                                      ),
                                      MarkerPointer(
                                          value: _volumeValue,
                                          enableDragging: true,
                                          onValueChanged: onVolumeChanged,
                                          markerHeight: 35,
                                          markerWidth: 35,
                                          markerType: MarkerType.image,
                                          imageUrl:
                                              'assets/images/circular_marker.png',
                                          color: const Color(0XFFFFAB40),
                                          borderWidth: 2,
                                          borderColor: Colors.white54)
                                    ],
                                    annotations: [
                                      GaugeAnnotation(
                                          widget: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "credit amount",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.quicksand(
                                                    color:
                                                        const Color(0xff7c8b96),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "₹",
                                                    style:
                                                        GoogleFonts.quicksand(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                  ),
                                                  Text(
                                                    NumberFormat.decimalPattern(
                                                            'en_in')
                                                        .format(_volumeValue
                                                            .toInt()),
                                                    style: GoogleFonts.quicksand(
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationStyle:
                                                            TextDecorationStyle
                                                                .dotted,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "@1.04% monthly",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.quicksand(
                                                    color:
                                                        Colors.green.shade600,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          angle: 270,
                                          positionFactor: 0.1)
                                    ],
                                  ),
                                ]),
                          ),
                          Text(
                            "stash is instant. money will be credited within seconds.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                                color: const Color(0xff7c8b96), fontSize: 12),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
              ),
      ).animate().slideY(end: 0, begin: 1),
    );
  }
}
