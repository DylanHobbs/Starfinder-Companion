import 'package:flutter/material.dart';
import 'DropDownField.dart';
import 'InputTextField.dart';

class ToonCreationState extends State<ToonCreation> {
  int currentStep = 0;

  List<Step> steps = [
    new Step(
      // Title of the Step
      title: new Text("Info"),
      // Content, it can be any widget here. Using basic Text for this example
      content: new Form(
        child: ListView(
          padding: new EdgeInsets.all(10.0),
          shrinkWrap: true,
          children: <Widget>[
            InputTextField(Icons.person, "Name", Colors.cyanAccent),
            InputTextField(Icons.description, "Description", Colors.cyanAccent),
            DropdownField(Icons.label, "Race"),
            DropdownField(Icons.format_paint, "Class"),
          ],
        ),
      ),
      state: StepState.editing,
      isActive: true
    ),
    new Step(
      title: new Text("Stats"),
      content: new Form(
        child: ListView(
          padding: new EdgeInsets.all(10.0),
          shrinkWrap: true,
          children: <Widget>[
            InputTextField(Icons.camera, "Str", Colors.cyanAccent),
            InputTextField(Icons.donut_large, "Con", Colors.cyanAccent),
            InputTextField(Icons.drag_handle, "Dex", Colors.cyanAccent),
            InputTextField(Icons.book, "Int", Colors.cyanAccent),
            InputTextField(Icons.wifi, "Wis", Colors.cyanAccent),
            InputTextField(Icons.thumbs_up_down, "Cha", Colors.cyanAccent),
          ],
        ),
      ),
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
          // Log function call
          print("Current Step : " + this.currentStep.toString());
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
          // Log function call
          print("onStepCancel : " + currentStep.toString());
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
          // Log function call
          print("onStepContinue : " + currentStep.toString());
        },
        controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: onStepCancel,
                child: const Text("Cancel"),
              ),
              RaisedButton(
                onPressed: onStepContinue,
                child: const Text("Continue"),
              ),
            ],
          );
        },
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