package extension.ga;

@:enum
abstract GAErrorSeverity(Int) {
  var Undefined = 0;
  var Debug = 1;
  var Info = 2;
  var Warning = 3;
  var Error = 4;
  var Critical = 5;
}


@:enum
abstract GAProgression(Int) {
  var Undefined = 0;
  var Started = 1;
  var Complete = 2;
  var Fail = 3;
}

@:enum
abstract GAGender(Int) {
  var Undefined = 0;
  var Male = 1;
  var Female = 2; 
}

@:enum
abstract GAFlowType(Int) {
  var Undefined = 0;
  var Source = 1;
  var Sink = 2;
}

/*
 * Cross platform conversion functions
 */
class GADef
{
  public static function genderToString(gender:GAGender)
  {
      switch(gender)
      {
#if html5 /* JS SDK use first char upper case */
        case GAGender.Male : return 'Male';
        case GAGender.Female : return 'Female';
#else  /* Android SDK use low case*/
        case GAGender.Male : return 'male';
        case GAGender.Female : return 'female';
#end
        default : return '';
      }
  }

  public static function flowToString(flowType:GAFlowType)
  {
      switch(flowType)
      {
        case GAFlowType.Source : return 'Source';
        case GAFlowType.Sink : return 'Sink';
        default: return "Undefined";
      }
  }

  public static function errorToString(errorSeverity:GAErrorSeverity)
  {
    switch(errorSeverity)
    {
      case Debug: return "Debug";
      case Info: return "Info";
      case Warning: return "Warning";
      case Error: return "Error";
      case Critical: return "Critical";
      default: return "Undefined";
    }
  }
}
