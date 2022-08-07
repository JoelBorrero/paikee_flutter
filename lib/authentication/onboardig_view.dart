import 'package:flutter/material.dart';
import 'package:paikee/utils/constants.dart';

PageController _controller = PageController();

class Onboarding extends StatefulWidget {
  final PageController authenticationController;
  const Onboarding({Key? key, required this.authenticationController})
      : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
              onPageChanged: (newPage) => setState(() {
                    page = newPage;
                  }),
              controller: _controller,
              children: [
                const Page1(),
                const Page2(),
                Page3(controller: widget.authenticationController)
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: _stepper(context, page),
        )
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
      child: Column(children: [
        Image.asset("assets/images/onboarding_1.png", width: 290),
        const SizedBox(height: 20),
        Text("Aprende idiomas\nbien, simple y rápido",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center),
        const SizedBox(height: 20),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et. Eget viverra urna.",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center),
        const SizedBox(height: 100)
      ]),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
      child: Column(children: [
        Image.asset("assets/images/onboarding_2.png", width: 290),
        const SizedBox(height: 20),
        Text("Gestiona todas\ntus clases online",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center),
        const SizedBox(height: 20),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et. Eget viverra urna, vestibulum.",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center),
      ]),
    );
  }
}

class Page3 extends StatefulWidget {
  final PageController controller;
  const Page3({Key? key, required this.controller}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
      child: Column(children: [
        Image.asset(
          "assets/images/onboarding_3.png",
          width: 290,
        ),
        const SizedBox(height: 50),
        Text("Obtén clases\nparticulares rápido",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center),
        const SizedBox(height: 20),
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio.",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center),
        const SizedBox(height: 50),
        ElevatedButton(
            onPressed: () =>
                widget.controller.nextPage(duration: duration, curve: curve),
            child: const Text(
              "Empezar",
            )),
      ]),
    );
  }
}

Widget _stepper(context, step) {
  Color color = Theme.of(context).primaryColor;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // AnimatedContainer(
      AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: step == 0 ? 40 : 25,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: step == 0 ? color : Colors.grey[400],
            // ),
          )),
      AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: step == 1 ? 40 : 25,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: step == 1 ? color : Colors.grey[400],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
      ),
      AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: step == 2 ? 40 : 25,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: step == 2 ? color : Colors.grey[400],
        ),
      )
    ],
  );
}
