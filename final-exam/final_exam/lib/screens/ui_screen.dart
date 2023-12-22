import 'package:final_exam/final_widgets/color_circle.dart';
import 'package:flutter/material.dart';

class UIScreen extends StatelessWidget {
  const UIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //
          const SizedBox(height: 40),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                //
                Flexible(
                  child: Text(
                    'Recommended for your devices',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(width: 40),

                Text(
                  'See All',
                  style: TextStyle(color: Colors.blue, fontSize: 22),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 36, 35, 35),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  //
                  const SizedBox(height: 20),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.bookmark_outline,
                        color: Colors.blue,
                        size: 35,
                      ),
                      SizedBox(width: 20),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Image.asset('assets/airpodsRemoved.png'),

                  const Text(
                    'Free Engraving',
                    style: TextStyle(
                      color: Color.fromARGB(255, 241, 178, 6),
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'AirPods Max -- Silver',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'A\$899.0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //

                      ColorCircle(color: Colors.red),

                      ColorCircle(color: Colors.orange),

                      ColorCircle(color: Colors.pink),

                      ColorCircle(color: Colors.purple),

                      SizedBox(width: 10),

                      Text(
                        '+1 more',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
