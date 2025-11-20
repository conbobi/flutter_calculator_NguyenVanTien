class CalculatorLogic {
  String display = "0";
  String equation = "";

  List<String> tokens = [];
  bool _shouldResetDisplay = false;

  static const int maxDigits = 15;

  /* -----------------------------------------------------
      UTIL
  ----------------------------------------------------- */

  String _format(double v) {
    if (v.isInfinite || v.isNaN) return "Error";
    if (v % 1 == 0) return v.toInt().toString();
    String s = v.toStringAsFixed(10);
    return s.replaceFirst(RegExp(r'\.?0+$'), '');
  }

  void _setDisplay(String v) {
    if (v.length > maxDigits) {
      display = v.substring(0, maxDigits);
    } else {
      display = v;
    }
  }

  /* -----------------------------------------------------
      1) pressNumber()
  ----------------------------------------------------- */
  void pressNumber(String n) {
    if (_shouldResetDisplay) {
      display = "0";
      _shouldResetDisplay = false;
    }

    if (display == "0") {
      display = n;               // replace leading zero
    } else {
      if (display.length < maxDigits) {
        display += n;
      }
    }

    _updateEquationPreview();
  }

  /* -----------------------------------------------------
      2) addDecimal()
  ----------------------------------------------------- */
  void addDecimal() {
    if (_shouldResetDisplay) {
      display = "0";
      _shouldResetDisplay = false;
    }
    if (!display.contains(".")) {
      display += ".";
    }
    _updateEquationPreview();
  }

  /* -----------------------------------------------------
      3) pressOperator()
  ----------------------------------------------------- */
  void pressOperator(String op) {
    // Nếu vừa tính xong bằng, tiếp tục expression mới
    if (_shouldResetDisplay) {
      _shouldResetDisplay = false;
    }

    // Add current number to tokens
    tokens.add(display);

    // Nếu operator liên tiếp → replace operator trước
    if (tokens.isNotEmpty && _isOperator(tokens.last)) {
      tokens[tokens.length - 1] = op;
    } else {
      tokens.add(op);
    }

    _shouldResetDisplay = true;
    _updateEquationPreview();
  }

  bool _isOperator(String s) {
    return s == "+" || s == "-" || s == "×" || s == "÷";
  }

  /* -----------------------------------------------------
      4) calculate()
  ----------------------------------------------------- */
  void calculate() {
    // Add final number vào expression
    if (!_shouldResetDisplay) tokens.add(display);

    if (tokens.isEmpty) return;

    double? result = _evaluateTokens(tokens);

  if (result == null) {
    display = "Error";
    tokens.clear();        // reset expression nhưng không xóa display
    equation = "";
    _shouldResetDisplay = true;  // tránh người dùng tiếp tục nhập nối trực tiếp
    return;
  }

    display = _format(result);
    equation = "";
    tokens.clear();         // reset expression
    _shouldResetDisplay = true;
  }

  /* -----------------------------------------------------
      Xử lý precedence:
      - vòng 1: × ÷
      - vòng 2: + -
  ----------------------------------------------------- */
  double? _evaluateTokens(List<String> list) {
    if (list.isEmpty) return 0;

    // Copy tránh sửa trực tiếp
    List<String> arr = List.from(list);

    /* ---- PASS 1: × ÷ ---- */
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == "×" || arr[i] == "÷") {
        double a = double.parse(arr[i - 1]);
        double b = double.parse(arr[i + 1]);

        if (arr[i] == "÷" && b == 0) return null;

        double temp = arr[i] == "×" ? a * b : a / b;

        arr.removeRange(i - 1, i + 2);
        arr.insert(i - 1, temp.toString());

        i = i - 1; // lùi lại 1 bước để check lại
      }
    }

    /* ---- PASS 2: + - ---- */
    double result = double.parse(arr[0]);
    for (int i = 1; i < arr.length; i += 2) {
      String op = arr[i];
      double b = double.parse(arr[i + 1]);

      if (op == "+") result += b;
      if (op == "-") result -= b;
    }

    return result;
  }

  /* -----------------------------------------------------
      5) togglePlusMinus()
  ----------------------------------------------------- */
  void togglePlusMinus() {
    if (display == "0") return;

    if (display.startsWith("-")) {
      display = display.substring(1);
    } else {
      display = "-$display";
    }

    _updateEquationPreview();
  }

  /* -----------------------------------------------------
      6) percent()
  ----------------------------------------------------- */
  void percent() {
    try {
      double v = double.parse(display) / 100;
      display = _format(v);
      _updateEquationPreview();
    } catch (_) {
      display = "0";
    }
  }

  /* -----------------------------------------------------
      7) clear()
  ----------------------------------------------------- */
  void clear() {
    display = "0";
    equation = "";
    tokens.clear();
    _shouldResetDisplay = false;
  }

  /* -----------------------------------------------------
      8) clearEnd()
  ----------------------------------------------------- */
  void clearEnd() {
    if (display.length <= 1) {
      display = "0";
    } else {
      display = display.substring(0, display.length - 1);
    }
    _updateEquationPreview();
  }

  /* -----------------------------------------------------
      Update equation preview (UI requirement)
  ----------------------------------------------------- */
  void _updateEquationPreview() {
    equation = tokens.join(" ") + (tokens.isNotEmpty ? " " : "") + display;
  }
}
