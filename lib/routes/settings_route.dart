import 'package:flutter/material.dart';
import 'package:quiz_app/data/color_gradients.dart';


class SettingsRoute extends StatefulWidget {
  const SettingsRoute({
    required this.gradientBackground,
    required this.onChangeBackground,
    super.key
  });

  final List<Color> gradientBackground;
  final Function onChangeBackground;

  @override
  State<SettingsRoute> createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.gradientBackground,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: widget.gradientBackground.map((color) => color.withOpacity(.05)).toList(),
          // ),
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
                      widget.onChangeBackground(colorGradients[index].colorsList);
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
                                  widget.gradientBackground == colorGradients[index].colorsList ? const Icon(Icons.check_circle, color: Colors.white) : Container(),
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
