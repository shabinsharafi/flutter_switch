import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Switch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E1E1E)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLightOn = false;

  var gradient = const [
    Color(0xFF4B4B4B),
    Color(0xFF2F2F2F),
    Color(0xFF2C2C2C),
  ];

  var gradientBg = const [
    Color(0xFF282525),
    Color(0xFF2d2d2d),
    Color(0xFF2d2d2d),
    Color(0xFF282525),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF363636),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 220,
              width: 150,
              margin: const EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                  color: const Color(0xFF595959),
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(width: 15, color: const Color(0xFF595959))),
              child: GestureDetector(
                onTap: () => setState(() {
                  isLightOn = !isLightOn;
                }),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: gradientBg, stops: const [0, 0.2, 0.8, 1]),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: const Color(0xFF1E1E1E), width: 1.5),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: isLightOn
                        ? const EdgeInsets.only(top: 20)
                        : const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: isLightOn
                            ? const BorderRadius.vertical(
                                top: Radius.circular(22),
                                bottom: Radius.circular(15))
                            : const BorderRadius.vertical(
                                top: Radius.circular(15),
                                bottom: Radius.circular(22)),
                        border: Border.all(color: const Color(0xFF2F2F2F)),
                        gradient: LinearGradient(
                            colors: isLightOn
                                ? gradient
                                : gradient.reversed.toList(),
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0, 0.5, 1])),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: isLightOn
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                          BoxShadow(
                              color: Colors.amber.withOpacity(0.2),
                              blurRadius: 200,
                              spreadRadius: 180)
                        ])
                  : null,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/bulb.png",
                      width: 100,
                      height: 250,
                    ),
                  ),
                  isLightOn
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: 100,
                            height: 250,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 8, right: 8, top: 155, bottom: 0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.amber.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 10),
                                  BoxShadow(
                                      color: Colors.amber.withOpacity(0.25),
                                      spreadRadius: 25,
                                      blurRadius: 25),
                                  BoxShadow(
                                      color: Colors.amber.withOpacity(0.3),
                                      spreadRadius: 55,
                                      blurRadius: 55)
                                ],
                                gradient: RadialGradient(colors: [
                                  Colors.amber,
                                  Colors.amber.withOpacity(0.8),
                                  Colors.amber.withOpacity(0.7),
                                  Colors.amber.withOpacity(0.6),
                                  Colors.amber.withOpacity(0.0),
                                ], stops: const [
                                  0.3,
                                  0.6,
                                  0.8,
                                  0.95,
                                  1
                                ]),
                              ),
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

