import 'package:flutter/material.dart';

class StepperO extends StatefulWidget {
  StepperO({Key key}) : super(key: key);

  @override
  _StepperOState createState() => _StepperOState();
}

class _StepperOState extends State<StepperO> {
  String isim, email, sifre;
  bool hata = false;
  int activeStep = 0;
  List<Step> steplerr;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    steplerr = tumstepler();
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Stepper "),
          ),
          body: SingleChildScrollView(
            child: Stepper(
              steps: steplerr,
              currentStep: activeStep,
              onStepContinue: () {

                setState(() {
                  ileributtonkontrol();
                });
                
              },
              /* onStepTapped: (tiklanilanStep){
                                setState(() {
                                  activeStep=tiklanilanStep;
                                });  
                              }, */
              onStepCancel: () {
                if (activeStep > 0) {
                  setState(() {
                    activeStep--;
                  });
                }
              },
            ),
          )),
    );
  }

  List<Step> tumstepler() {
    List<Step> stepler = [
      Step(
          title: Text("Username Başlık "),
          subtitle: Text("Username Subtitle"),
          isActive: true,
          state: stateBelirle(0),
          content: TextFormField(
            decoration: InputDecoration(
              labelText: "Kullanıcı ıd'nizi giriniz",
              border: OutlineInputBorder(),
            ),
            key: key0,
            validator: (geleninputdegeri) {
              if (geleninputdegeri.length < 6) {
                return "En az 6 karakter giriniz";
              }
            },
            onSaved: (geleninputdegeri) {
              isim = geleninputdegeri;
            },
          )),
      Step(
          title: Text("Şifre Başlık "),
          subtitle: Text("Şifre Subtitle"),
          isActive: true,
          state: stateBelirle(1),
          content: TextFormField(
            decoration: InputDecoration(
              labelText: "şifrenizi giriniz",
              border: OutlineInputBorder(),
            ),
            key: key1,
            validator: (geleninputdegeri) {
              if (geleninputdegeri.length < 6) {
                return "En az 6 karakter giriniz";
              }
            },
            onSaved: (geleninputdegeri) {
              sifre = geleninputdegeri;
            },
          )),
      Step(
          title: Text("E-Mail Başlık "),
          subtitle: Text("E-Mail Subtitle"),
          isActive: true,
          state: stateBelirle(2),
                    content: TextFormField(
                      decoration: InputDecoration(
                        labelText: "E-Mail adresinizi giriniz",
                        border: OutlineInputBorder(),
                      ),
                      key: key2,
                      validator: (geleninputdegeri) {
                        if (geleninputdegeri.length < 6 ||
                            !geleninputdegeri.contains("@")) {
                          return "Lütfen uygun bir e-mail adresi giriniz";
                        }
                      },
                      onSaved: (geleninputdegeri) {
                        email = geleninputdegeri;
                      },
                    )),
              ];
          
              return stepler;
            }
          
            void ileributtonkontrol() {
              switch (activeStep) {
                case 0:
                  if (key0.currentState.validate()) {
                    key0.currentState.save();
                    activeStep = 1;
                    hata = false;
                  } else {
                    hata = true;
                  }
                  break;
          
                case 1:
                  if (key1.currentState.validate()) {
                    key1.currentState.save();
                    activeStep = 2;
                    hata = false;
                  } else {
                    hata = true;
                  }
          
                  break;
          
                case 2 : 
                if (key2.currentState.validate()) {
                    key2.currentState.save();
                    activeStep = 2;
                    hata = false;
                    formtamamlandi();
                            } else {
                              hata = true;
                            }
                            break;
                    
                          default:
                        }
                      }
                    
                      void formtamamlandi() {
                        debugPrint("kullanıcı adı $isim  , sifre => $sifre  ,  e-mail => $email ");
          
                      }
          
            stateBelirle(int stateDegeri) {
              if(stateDegeri == activeStep){
                if (hata) {
                  return StepState.error;
                  
                }
                else{
                  return StepState.editing;
                }
              }
              else{
                return StepState.complete;
              }



            }
}
