import 'dart:ui';

class PickerColors {
  // Color for the picker shown in Card on the screen.
   late Color _screenPickerColor;
  // Color for the picker in a dialog using onChanged.
   late Color _dialogPickerColor;
  // Color for picker using the color select dialog.
    late Color _dialogSelectColor;

   Color get screenPickerColor => _screenPickerColor;

  set screenPickerColor(Color value) {
    _screenPickerColor = value;
  }

   Color get dialogPickerColor => _dialogPickerColor;

   Color get dialogSelectColor => _dialogSelectColor;

  set dialogSelectColor(Color value) {
    _dialogSelectColor = value;
  }

  set dialogPickerColor(Color value) {
    _dialogPickerColor = value;
  }
}