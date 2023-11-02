import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/color_gradients.dart';

import '../providers/color_gradient_provider.dart';


class SettingsRoute extends StatefulWidget {
  const SettingsRoute({super.key});

  @override
  State<SettingsRoute> createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  @override
  Widget build(BuildContext context) {
    final colorGradientState = Provider.of<ColorGradientState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colorGradientState.gradientBackground,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
          ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Theme:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87
                ),
              ),
              Expanded(child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2
                ),
                itemCount: colorGradients.length,
                itemBuilder: (ctx, index) =>
                  GestureDetector(
                    onTap: (){
                      colorGradientState.changeBackground(colorGradients[index].colorsList);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: colorGradients[index].colorsList,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    colorGradients[index].title,
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  colorGradientState.gradientBackground == colorGradients[index].colorsList ? const Icon(Icons.check_circle, color: Colors.white) : Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ),
                    ),
                  ),
                )
            ],
          ),
        )
      )
    );
  }
}
