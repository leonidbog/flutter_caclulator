
import 'CalculatorModel.dart';

class CalculatorController {
  final CalculatorModel model = CalculatorModel();
  String output = "0";

  void buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      output = "0";
      model.setNum1(0);
      model.setNum2(0);
      model.setOperand("");
    } else if ('+-*/'.contains(buttonText)) {
      model.setNum1(double.parse(output));
      model.setOperand(buttonText);
      output = "0";
    } else if (buttonText == '=') {
      model.setNum2(double.parse(output));
      output = model.calculate();
      model.setNum1(double.parse(output)); // Ready for next operation
    } else {
      if (output == "0") {
        output = buttonText;
      } else {
        output += buttonText;
      }
    }
  }
}

