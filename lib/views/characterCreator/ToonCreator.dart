import 'package:flutter/material.dart';
import 'package:Starbuilder/views/characterCreator/steps/characterOverview.dart';
import 'package:Starbuilder/views/characterCreator/steps/statsAllocator.dart';

class ToonCreationState extends State<ToonCreation> {
  int currentStep = 0;

  List<Step> steps = [
    new Step(
      // Title of the Step
      title: new Text("Info"),
      // Content, it can be any widget here. Using basic Text for this example
      content: CharacterOverview(),
      state: StepState.editing,
      isActive: true
    ),
    new Step(
      title: new Text("Stats"),
      content: CharacterStats(),
      // You can change the style of the step icon i.e number, editing, etc.
      state: StepState.editing,
      isActive: true
    ),
    new Step(
      title: new Text("Step 3"),
      content: new Text("Hello World!"),
      state: StepState.editing,
      isActive: true
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  new Container(
      child: new Form(
        child: new Stepper(
          currentStep: this.currentStep,
          // List the steps you would like to have
          steps: steps,
          // Define the type of Stepper style
          // StepperType.horizontal :  Horizontal Style
          // StepperType.vertical   :  Vertical Style
          type: StepperType.horizontal,
          // Know the step that is tapped
          onStepTapped: (step) {
            // On hitting step itself, change the state and jump to that step
            setState(() {
              // update the variable handling the current step value
              // jump to the tapped step
              currentStep = step;
            });
          },
          onStepCancel: () {
            // On hitting cancel button, change the state
            setState(() {
              // update the variable handling the current step value
              // going back one step i.e subtracting 1, until its 0
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
          // On hitting continue button, change the state
          onStepContinue: () {
            setState(() {
              // update the variable handling the current step value
              // going back one step i.e adding 1, until its the length of the step
              if (currentStep < steps.length - 1) {
                currentStep = currentStep + 1;
              } else {
                currentStep = 0;
              }
            });
          },
          controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: onStepCancel,
                  child: const Text("Back"),
                ),
                RaisedButton(
                  onPressed: onStepContinue,
                  child: const Text("Next"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ToonCreation extends StatefulWidget {
  @override
  ToonCreationState createState() {
    // TODO: Possible to pass CharecterStorageHere to allow saving save?
    return ToonCreationState();
  }
}