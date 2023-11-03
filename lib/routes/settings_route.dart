import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/color_gradients.dart';
import 'package:quiz_app/providers/number_of_questions_provider.dart';
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
    final noOfQuestionState = Provider.of<NumberOfQuestionsState>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Settings"),
        centerTitle: true,
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
          color: Colors.white10
          ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'General',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 10
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('No. of Questions:'),
                      DropdownButton<int>(
                        elevation: 0,
                        underline: Container(),
                        value: noOfQuestionState.questionsNo,
                        items: [5, 10, 15].map((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value')
                          );
                        }).toList(),
                        onChanged: (value) {
                          noOfQuestionState.changeNumberOfQuestions(value!);
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Theme:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.25
                  ),
                  itemCount: colorGradients.length,
                  itemBuilder: (ctx, index) =>
                    GestureDetector(
                      onTap: (){
                        colorGradientState.changeBackground(colorGradients[index].colorsList);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                                      color: Colors.white,

                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  colorGradientState.gradientBackground == colorGradients[index].colorsList ? const Icon(Icons.check_circle, color: Colors.white,) : Container(),
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
