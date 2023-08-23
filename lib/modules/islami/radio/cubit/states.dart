abstract class RadioStates {}

class initRadioState extends RadioStates {}

class LoadingRadioState extends RadioStates {}

class SuccessRadioState extends RadioStates {}

class ErrorRadioState extends RadioStates {
  String? error;
  ErrorRadioState(this.error);
}
