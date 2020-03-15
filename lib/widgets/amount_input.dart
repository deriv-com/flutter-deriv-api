import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:flutter_deriv_api/helpers.dart';
import 'package:flutter_deriv_api/widgets/animated_message.dart';
import 'package:flutter_deriv_api/widgets/circular_close_button.dart';

/// Amount input
class AmountInput extends StatefulWidget {
  /// Class constructor
  const AmountInput({
    @required this.initialAmount,
    @required this.minimumValue,
    @required this.maximumValue,
    @required this.formatter,
    @required this.buttonColor,
    @required this.backgroundColor,
    @required this.invalidInputColor,
    @required this.backspaceColor,
    @required this.actionButtonColor,
    @required this.titleStyle,
    @required this.defaultMessageStyle,
    @required this.amountStyle,
    @required this.invalidAmountStyle,
    @required this.keyboardButtonTextStyle,
    this.maxInputLength = 11,
  });

  /// Initial amount
  final double initialAmount;

  /// Minimum value
  final double minimumValue;

  /// Maximum value
  final double maximumValue;

  /// Value Formatter
  final NumberFormat formatter;

  /// Maximum input length
  final int maxInputLength;

  /// Button color
  final Color buttonColor;

  /// Background color
  final Color backgroundColor;

  /// Invalid input color
  final Color invalidInputColor;

  /// Backspace color
  final Color backspaceColor;

  /// Action button color
  final Color actionButtonColor;

  /// Title style
  final TextStyle titleStyle;

  /// Message style
  final TextStyle defaultMessageStyle;

  /// Amount style
  final TextStyle amountStyle;

  /// Invalid amount style
  final TextStyle invalidAmountStyle;

  /// Keyboard button text style
  final TextStyle keyboardButtonTextStyle;

  @override
  State<StatefulWidget> createState() => _AmountInputState();
}

class _AmountInputState extends State<AmountInput> {
  NumberFormat _formatter;
  String _validationError;

  final StringBuffer _buyAmount = StringBuffer();
  final TextEditingController _textFieldController = TextEditingController();

  static const double _smallestScreenHeight = 450;
  static const List<String> _keyboardContent = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    '<-',
    'PLACE ORDER',
  ];

  ///There are 3 column in keyboard that amount of w/h of each one is 0.4 (48/120)
  double get _keyboardHeight =>
      MediaQuery.of(context).size.width / 3.0 * 0.4 * 5.0;

  double get _overflowSpace =>
      _smallestScreenHeight - MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();

    _formatter = widget.formatter;
    _buyAmount.write(_formatter.format(widget.initialAmount));
    _textFieldController.text = _buyAmount.toString();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomCenter,
              child: _buildMessage(),
            ),
            Container(child: _buildKeyboard()),
          ],
        ),
      );

  Widget _buildMessage() => AnimatedMessage(
        animationDuration: const Duration(milliseconds: 800),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _isInputResultValid()
                ? widget.buttonColor
                : widget.invalidInputColor,
          ),
          child: Text(
            _isInputResultValid()
                ? 'Enter amount between '
                    '${_getAmountWithoutSymbol(_formatter.format(widget.minimumValue))} and '
                    '${_getAmountWithoutSymbol(_formatter.format(widget.maximumValue))}'
                : _validationError,
            style: widget.defaultMessageStyle,
          ),
        ),
      );

  Widget _buildKeyboard() => Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: _buildCircularBorderRadius(8),
        ),
        child: _buildBottomSheetContent(),
      );

  Widget _buildBottomSheetContent() => Column(
        children: <Widget>[
          _buildTitle(),
          _buildAmountScreen(),
          _buildNumericKeyboard(),
        ],
      );

  Widget _buildTitle() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: _buildCircularBorderRadius(8),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            _buildTextTitle(),
            _buildIconTitle(),
          ],
        ),
      );

  Widget _buildTextTitle() => Container(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Amount',
            style: widget.titleStyle,
          ),
        ),
      );

  Widget _buildIconTitle() => Align(
        alignment: Alignment.centerRight,
        child: const CircularCloseButton(size: 24),
      );

  Widget _buildNumericKeyboard() => Container(
        child: Container(
          height: MediaQuery.of(context).size.height >= _smallestScreenHeight
              ? _keyboardHeight
              : _keyboardHeight - _overflowSpace,
          child: Column(
            children: List<Widget>.generate(
              5,
              (int rowCounter) => _buildKeyboardRows(rowCounter),
            ),
          ),
        ),
      );

  Widget _buildAmountScreen() => TextField(
        controller: _textFieldController,
        style: _isInputResultValid()
            ? widget.amountStyle
            : widget.invalidAmountStyle,
        textAlign: TextAlign.center,
        decoration: InputDecoration(border: InputBorder.none),
        readOnly: true,
        showCursor: true,
        enableInteractiveSelection: false,
        autofocus: true,
      );

  Widget _buildKeyboardRows(int row) => Expanded(
        child: Row(
          children: List<Widget>.generate(
            (row != 4) ? 3 : 1,
            (int columnCounter) =>
                _buildKeyboardButton(columnCounter, (row != 4) ? row * 3 : 12),
          ),
        ),
      );

  Widget _buildKeyboardButton(int i, int count) {
    final String text = _keyboardContent[i + count];

    return Builder(
      builder: (BuildContext context) => Expanded(
        child: SizedBox.expand(
          child: IgnorePointer(
            ignoring: text == 'PLACE ORDER' && !_isInputResultValid(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              foregroundDecoration: BoxDecoration(
                color: text == 'PLACE ORDER' && !_isInputResultValid()
                    ? Colors.black.withOpacity(0.5)
                    : Colors.transparent,
              ),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: widget.backgroundColor,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
                color: (text == 'PLACE ORDER')
                    ? widget.actionButtonColor
                    : widget.buttonColor,
                child: (text != '<-')
                    ? Text(
                        text,
                        style: widget.keyboardButtonTextStyle,
                      )
                    : _buildIcon(Icons.backspace, 18, widget.backspaceColor),
                onPressed: () => _onKeyboardButtonPressed(text, context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onKeyboardButtonPressed(String text, BuildContext context) {
    switch (text) {
      case 'PLACE ORDER':
        if (_isInputResultValid()) {
          Navigator.pop(context,
              double.parse(_getAmountWithoutSymbol(_buyAmount.toString())));
        }
        break;
      case '<-':
        _handleBackSpace();
        break;

      default:
        if (_isInputValid(text)) {
          _setNewAmount(text);
        }
        break;
    }
  }

  bool _isInputResultValid() {
    try {
      final bool isLessThanLimit = NumberValidator.isLessThanLimit(
          stringValue: _getAmountWithoutSymbol(_buyAmount.toString()),
          upperLimit: widget.maximumValue);

      final bool isMoreThanLimit = NumberValidator.isMoreThanLimit(
          stringValue: _getAmountWithoutSymbol(_buyAmount.toString()),
          lowerLimit: widget.minimumValue);

      if (isLessThanLimit) {
        _validationError = 'Minimum amount is '
            '${_getAmountWithoutSymbol(_formatter.format(widget.minimumValue))}';
      } else if (isMoreThanLimit) {
        _validationError = 'Maximum amount is '
            '${_getAmountWithoutSymbol(_formatter.format(widget.maximumValue))}';
      }

      return isLessThanLimit && isMoreThanLimit;
    } on Exception catch (error) {
      print(error);

      _validationError = 'Please enter amount';

      return false;
    }
  }

  Widget _buildIcon(IconData icon, double size, Color color) =>
      Icon(icon, size: size, color: color);

  BorderRadius _buildCircularBorderRadius(double radius) => BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      );

  void _handleBackSpace() {
    final String lastCharacter =
        _buyAmount.toString().substring(_buyAmount.length - 1);

    if (NumberValidator.isANumber(lastCharacter) || lastCharacter == '.') {
      final String remaining =
          _buyAmount.toString().substring(0, _buyAmount.length - 1);

      _buyAmount.clear();

      _setNewAmount(remaining);
    }
  }

  void _setNewAmount(String newAmount) {
    _buyAmount.write(newAmount);

    _textFieldController
      ..text = _buyAmount.toString()
      ..selection =
          TextSelection.collapsed(offset: _textFieldController.text.length);

    setState(() {});
  }

  /// Increment maxInputLength by 1 because it counts the symbol one character
  bool _isInputValid(String input) {
    if (_buyAmount.length >= (widget.maxInputLength + 1)) {
      return false;
    } else if (_getAmountWithoutSymbol(_buyAmount.toString()) == '0' &&
        input == '0') {
      return false;
    } else if (_buyAmount.toString().contains('.') && input == '.') {
      return false;
    } else if (_getAmountWithoutSymbol(_buyAmount.toString()) == null &&
        input == '.') {
      return false;
    } else if (!NumberValidator.hasValidPrecision(
        stringValue: '$_buyAmount$input', validDecimalNumber: 2)) {
      return false;
    }

    return true;
  }

  String _getAmountWithoutSymbol(String amount) {
    try {
      int firstNumberIndex;
      for (int i = 0; i < amount.length; i++) {
        final String character = amount[i];

        if (NumberValidator.isANumber(character)) {
          firstNumberIndex = i;
          break;
        }
      }

      return amount.substring(firstNumberIndex);
    } on Exception catch (error) {
      print(error);

      return null;
    }
  }
}
