import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import '../bmi_logic.dart';
import 'result_page.dart';

enum Gender { male, female }

int height = 180;
int weight = 65;
int age = 20;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars,
                          size: 80.0,
                          title: "MALE",
                        ),
                        colour: selectedGender == Gender.male
                            ? kActiveCardColour
                            : kInActiveCardColour,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.venus,
                          size: 80.0,
                          title: "FEMALE",
                        ),
                        colour: selectedGender == Gender.female
                            ? kActiveCardColour
                            : kInActiveCardColour,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "HEIGHT",
                              style: kTitleTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumberTitleTextStyle,
                                ),
                                const Text(
                                  "cm",
                                  style: kTitleTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: const Color(0xFF8D8E98),
                                trackHeight: 1.5,
                                thumbColor: const Color(0xFFEB1555),
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 28.0,
                                ),
                                overlayColor: const Color(0x29EB1555),
                              ),
                              child: Slider(
                                onChanged: (double value) {
                                  setState(() {
                                    height = value.round();
                                  });
                                },
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                              ),
                            ),
                          ],
                        ),
                        colour: kActiveCardColour,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "WEIGHT",
                              style: kTitleTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTitleTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ],
                            ),
                          ],
                        ),
                        colour: kActiveCardColour,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style: kTitleTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTitleTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ],
                            ),
                          ],
                        ),
                        colour: kActiveCardColour,
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                onTap: () {
                  BMILogic calculator =
                      BMILogic(height: height, weight: weight);

                  var bmiResult = calculator.getBMI();
                  var resultText = calculator.getResult();
                  var interpratation = calculator.getInterpration();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: bmiResult,
                        resultText: resultText,
                        interpratation: interpratation,
                      ),
                    ),
                  );
                },
                text: "CALCULATE",
              )
            ],
          ),
        ));
  }
}
