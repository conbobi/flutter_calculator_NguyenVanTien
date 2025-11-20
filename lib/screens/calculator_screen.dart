import 'package:flutter/material.dart';
import '../widgets/calc_button.dart';
import '../widgets/display_panel.dart';
import '../services/calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic _logic = CalculatorLogic();

 void _onDigit(String d) {
  setState(() {
    _logic.pressNumber(d);
  });
}

void _onDecimal() {
  setState(() {
    _logic.addDecimal();
  });
}

void _onOperation(String op) {
  setState(() {
    _logic.pressOperator(op);
  });
}

void _onEqual() {
  setState(() {
    _logic.calculate();
  });
}

void _onClear() {
  setState(() {
    _logic.clear();
  });
}

void _onCE() {
  setState(() {
    _logic.clearEnd();
  });
}

void _onToggleSign() {
  setState(() {
    _logic.togglePlusMinus();
  });
}

void _onPercent() {
  setState(() {
    _logic.percent();
  });
}


  @override
  Widget build(BuildContext context) {
    // Colors per design
    const Color primaryBg = Color(0xFF2D3142);
    const Color secondaryBtn = Color(0xFF4F5D75);
    const Color accentBtn = Color(0xFFEF8354);

    return Scaffold(
      backgroundColor: primaryBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20), // screen padding per spec
          child: Column(
            children: [
              // Display area
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: DisplayPanel(
                  equation: _logic.equation,
                  display: _logic.display,
                ),
              ),

              const SizedBox(height: 8),

              // Buttons grid: use Expanded with GridView.count
              Expanded(
  child: GridView.count(
    crossAxisCount: 4,
    childAspectRatio: 1.05,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    padding: EdgeInsets.zero,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      CalcButton(label: 'C', onTap: _onClear, bgColor: accentBtn),
      CalcButton(label: 'CE', onTap: _onCE, bgColor: secondaryBtn),
      CalcButton(label: '%', onTap: _onPercent, bgColor: secondaryBtn),
      CalcButton(label: '÷', onTap: () => _onOperation('÷'), bgColor: accentBtn),

      CalcButton(label: '7', onTap: () => _onDigit('7'), bgColor: secondaryBtn),
      CalcButton(label: '8', onTap: () => _onDigit('8'), bgColor: secondaryBtn),
      CalcButton(label: '9', onTap: () => _onDigit('9'), bgColor: secondaryBtn),
      CalcButton(label: '×', onTap: () => _onOperation('×'), bgColor: accentBtn),

      CalcButton(label: '4', onTap: () => _onDigit('4'), bgColor: secondaryBtn),
      CalcButton(label: '5', onTap: () => _onDigit('5'), bgColor: secondaryBtn),
      CalcButton(label: '6', onTap: () => _onDigit('6'), bgColor: secondaryBtn),
      CalcButton(label: '-', onTap: () => _onOperation('-'), bgColor: accentBtn),

      CalcButton(label: '1', onTap: () => _onDigit('1'), bgColor: secondaryBtn),
      CalcButton(label: '2', onTap: () => _onDigit('2'), bgColor: secondaryBtn),
      CalcButton(label: '3', onTap: () => _onDigit('3'), bgColor: secondaryBtn),
      CalcButton(label: '+', onTap: () => _onOperation('+'), bgColor: accentBtn),

      CalcButton(label: '±', onTap: _onToggleSign, bgColor: secondaryBtn),
      CalcButton(label: '0', onTap: () => _onDigit('0'), bgColor: secondaryBtn),
      CalcButton(label: '.', onTap: _onDecimal, bgColor: secondaryBtn),
      CalcButton(label: '=', onTap: _onEqual, bgColor: accentBtn),
    ],
  ),
)
,
            ],
          ),
        ),
      ),
    );
  }
}
