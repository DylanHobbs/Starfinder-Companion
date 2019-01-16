import 'dart:math';

import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/models/toon.dart';
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
  static var rng = new Random();
  static final rand_id = rng.nextInt(200);
  Character data = Character.fromJson({"id":rand_id,"name":"","speed":30,"race":"","theme":"","klass":"","level":1,"xp":0,"description":"","languages":"","allignment":"","diety":false,"money":10,"current_hp":10,"EAC":10,"KAC":10,"keyAbility":"","carrying_cap":100,"Acrobatics":1,"Athletics":1,"Bluff":1,"Computers":1,"Culture":1,"Diplomacy":1,"Disguise":1,"Engineering":1,"Intimidate":1,"Life_Science":1,"Medicine":1,"Mysticism":1,"Perception":1,"Physical_Science":1,"Piloting":1,"Profession":1,"Sense_Motive":1,"Sleight_of_Hand":1,"Stealth":1,"Survival":1,"Strength":10,"Dexterity":10,"Constitution":10,"Intelligence":10,"Wisdom":10,"Charisma":10});
  int currentStep = 0;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static GlobalKey<FormState> _infoKey = new GlobalKey<FormState>();
  static GlobalKey<FormState> _statsKey = new GlobalKey<FormState>();
  CharacterBloc bloc;
  ToonCreationState(this.bloc);

  List<Step> steps = [
    new Step(
        // Title of the Step
        title: new Text("Info"),
        // Content, it can be any widget here. Using basic Text for this example
        content: CharacterOverview(_infoKey),
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Stats"),
        content: CharacterStats(_statsKey),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Step 3"),
        content: new Text("Hello World!"),
        state: StepState.editing,
        isActive: true),
  ];

  /*
    Little utility function to set the state of the correct
    form based on state of stepper.
  */
  preverseData(int currentStep){
    if(currentStep == 0){
      _infoKey.currentState.save();
    } else if(currentStep == 1) {
      _statsKey.currentState.save();
    }
  }

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
                  preverseData(currentStep);
                  // On hitting step itself, change the state and jump to that step
                  setState(() {
                    // update the variable handling the current step value
                    // jump to the tapped step
                    _formKey.currentState.save();
                    currentStep = step;
                  });
                },
                onStepCancel: () {
                  // Handle preserving data
                  preverseData(currentStep);
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
                  // Handle preserving data
                  preverseData(currentStep);
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
