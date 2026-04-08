import 'package:flutter/material.dart';
import 'package:nav_page_route_builder_app/Screens/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 350),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const DetailPage(
                          bodyHead: "Slide Transition (Most Common)",
                        );
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;

                            final tween = Tween(
                              begin: begin,
                              end: end,
                            ).chain(CurveTween(curve: Curves.ease));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_circle_right_outlined),
                label: const Text("Slide Transition (Most Common)"),
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (_, animation, __) => const DetailPage(
                        bodyHead: "Fade Transition (Clean UI)",
                      ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_circle_right_outlined),
                label: const Text("Fade Transition (Clean UI)"),
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 350),
                      pageBuilder: (_, animation, __) => const DetailPage(
                        bodyHead: "Scale Transition (Modern App Style)",
                      ),
                      transitionsBuilder: (_, animation, __, child) {
                        final scale = Tween<double>(begin: 0.8, end: 1.0)
                            .animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ),
                            );

                        return ScaleTransition(scale: scale, child: child);
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_circle_right_outlined),
                label: const Text("Scale Transition (Modern App Style)"),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: const DetailPage(
                        bodyHead: "Production Pattern (Reusable Route)",
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_circle_right_outlined),
                label: const Text("Production Pattern (Reusable Route)"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;

  SlidePageRoute({required this.page})
    : super(
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.ease));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
}
