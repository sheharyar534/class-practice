import 'dart:math';

void main() {
  // Generate a random number between 1 and 100
  int randomNumber = Random().nextInt(100) + 1;
  print('Random number: $randomNumber');

  // Calculate the square root of the random number
  double squareRoot = sqrt(randomNumber);
  print('Square root of the random number: $squareRoot');
  print("can i post it");
  import 'package:flutter/material.dart';
import 'package:flutter_application_/getstart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List onBoardingData = [
    {
      "image": 'assets/images/onboard_1.png',
      "title": 'Request Ride',
      "description": 'Request a ride get picked up by a nearby community driver'
    },
    {
      "image": 'assets/images/onboard_2.png',
      "title": 'Confirm Your Driver',
      "description":
          'Huge drivers network helps you find comforable, safe and cheap ride'
    },
    {
      "image": 'assets/images/onboard_3.png',
      "title": 'Track your ride',
      "description":
          'Know your driver in advance and be able to view current location in real time on the map'
    },
    
  ];

  Color textcolor = const Color(0xff262628);

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GetStart()));
              },
              child:  Text(
                "Skip",
                style:Theme.of(context).textTheme.labelSmall?.copyWith(decoration: TextDecoration.underline),
              ))
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onBoardingData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top:10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 130,
                      child: Image.asset(onBoardingData[index]['image']),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      onBoardingData[index]["title"],
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: textcolor,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: (MediaQuery.sizeOf(context).width / 100) * 74,
                      child: Text(onBoardingData[index]['description'],
                          textAlign: TextAlign.center,
                          style:Theme.of(context).textTheme.displaySmall,
                    ),
                    )
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Expanded(
              
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration:  BoxDecoration(
                     borderRadius: (BorderRadius.circular(100))
                  ),
                  child: SmoothPageIndicator(
                      effect: const SlideEffect(
                        spacing: 0,
                        radius: 0,
                        dotWidth: 30,
                        dotHeight: 3,
                        activeDotColor : Colors.amber,
                      ),
                      controller: pageController,
                      count: onBoardingData.length),
                ),
              ),
            ),
          ),
          
          
        ],
      ),
    );
  }
}








}
