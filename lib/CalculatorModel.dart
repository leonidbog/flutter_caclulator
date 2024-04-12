class CalculatorModel {
  double? _num1;
  double? _num2;
  String? _operand;

  void setOperand(String operand) {
    _operand = operand;
  }

  void setNum1(double num) {
    _num1 = num;
  }

  void setNum2(double num) {
    _num2 = num;
  }

  String calculate() {
    double result = 0;
    switch (_operand) {
      case '+':
        result = _num1! + _num2!;
        break;
      case '-':
        result = _num1! - _num2!;
        break;
      case '*':
        result = _num1! * _num2!;
        break;
      case '/':
        if (_num2 != 0) {
          result = _num1! / _num2!;
        } else {
          return "Error"; // Division by zero
        }
        break;
      default:
        return "Invalid operation";
    }
    return result.toStringAsFixed(2); // Formatting to two decimal places
  }
}
