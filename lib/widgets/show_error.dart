// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

showError(String message, String e, Color msgColor, IconData msgIcon) {
  return SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.all(10),
    content: Stack(
      children: [
        Container(
          height: 120,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: msgColor,
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      e,
                      style: const TextStyle(
                        // color: white,
                        fontSize: 16,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 35,
            left: 10,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  // Icon(
                  //   CupertinoIcons.exclamationmark,
                  //   size: 80,
                  // )
                  SvgPicture.asset(
                    "/assets/images/profilePictures/owl.svg",
                    height: 48,
                    width: 40,
                    color: msgColor,
                  ),
                  // Image.asset(
                  //   "assets/images/exclamation.png",
                  //   height: 80,
                  //   width: 40,
                  //   // color: const Color(0xFF801336),
                  // )
                  Icon(msgIcon, size: 40)
                ],
              ),
            )),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/fail.svg",
                height: 40,
              ),
              Positioned(
                  child: SvgPicture.asset(
                "assets/images/close.svg",
                height: 16,
              ))
            ],
          ),
        ),
      ],
    ),
  );
}
