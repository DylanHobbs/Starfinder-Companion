import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/views/home.dart';
import 'package:flutter/material.dart';
import 'package:Starbuilder/views/characterCreator/steps/characterOverview.dart';
import 'package:Starbuilder/views/characterCreator/steps/statsAllocator.dart';

class FormData extends InheritedWidget {
  FormData({
      Key key, 
      this.child,
      this.data,
    }) : super(key: key, child: child);

  final Widget child;
  final Character data;

  static FormData of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FormData)as FormData);
  }

  @override
  bool updateShouldNotify( FormData oldWidget) => true;
}

class ToonCreationState extends State<ToonCreation> {
  int currentStep = 0;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Character data = Character.fromJson({
                        "id": -1,
                        "name": "",
                        "klass": "",
                        "level": 1,
                        "race": ""
                      });
  CharacterBloc bloc;
  ToonCreationState(this.bloc);

  List<Step> steps = [
    new Step(
        // Title of the Step
        title: new Text("Info"),
        // Content, it can be any widget here. Using basic Text for this example
        content: CharacterOverview(),
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Stats"),
        content: CharacterStats(),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Step 3"),
        content: new Text("Hello World!"),
        state: StepState.editing,
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {  
    return FormData(
          data: data,
          child: new Scaffold(
          appBar: new AppBar(
            title: new Text("Charecter Creator"),
          ),
          body: Container(
            child: new Form(
              key: _formKey,
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
                    _formKey.currentState.save();
                    currentStep = step;
                  });
                },
                onStepCancel: () {
                  // Check if the cancel button is hit on step 1
                  if(currentStep == 0){
                    Navigator.pop(context);
                  }
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
                  // final Character newCharacter = FormData.of(context).data;
                  setState(() {
                    // update the variable handling the current step value
                    // going back one step i.e adding 1, until its the length of the step
                    if (currentStep < steps.length - 1) {
                      _formKey.currentState.save();
                      currentStep = currentStep + 1;
                    } else {
                      // All done
                      bloc.add(data);
                      currentStep = 0;
                    }
                  });
                },
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: onStepCancel,
                        child: const Text("Back"),
                        shape: StadiumBorder(),
                      ),
                      RaisedButton(
                        onPressed: onStepContinue,
                        child: const Text("Next"),
                        shape: StadiumBorder(),
                      ),
                    ],
                  );
                },
              ),
            ),
          )),
    );
  }
}

class ToonCreation extends StatefulWidget {
  CharacterBloc bloc;
  ToonCreation(this.bloc);

  @override
  ToonCreationState createState() {
    return ToonCreationState(bloc);
  }

  static FormData of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(FormData) as FormData);
  }
}
