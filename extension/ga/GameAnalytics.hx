package extension.ga;

#if cpp
        import cpp.Lib;
        import Type;
#elseif neko
        import neko.Lib;
#else
        #if android
                import openfl.Lib;
        #end
#end

#if openfl_legacy
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end

#if html5
import extension.ga.js.GameAnalyticsJS;
#end

import extension.ga.GADef;

class GameAnalytics {

  //sdk version
  private static inline var sdk_version_ios:String = "ios 3.2.1";
  private static inline var sdk_version_android:String = "android 4.0.0";
  private static inline var sdk_version_javascript:String = "javascript 3.1.2";

  //extension version
  private static inline var sdk_name:String = "openfl"; //GameAnalytics SDK name
  private static inline var sdk_version:String = "3.0.0"; //GameAnalytics SDK version

  //Settings cache
  private static var gameKey:String;
  private static var secretKey:String;
  private static var user_id:String;
  private static var build:String;
  private static var enableVerboseB:Bool;
  private static var enableInfoB:Bool;
  private static var gender:GAGender;
  private static var birthYear:Int;

  //Custom dimensions
  private static var customDimensions01:String; //configured before initialisation
  private static var customDimensions02:String; //configured before initialisation
  private static var customDimensions03:String; //configured before initialisation
  private static var customDimension:String; //used in all setters

  //Events cache

  //common param
  private static var amount:Float; //shared by design and resource events
  private static var itemType:String; //shared by design and business events
  private static var itemId:String; //shared by design and business events
  private static var currency:String; //shared by business and resource events

  //design
  private static var designEventId:String;
  //business
  private static var cartType:String;
  private static var receipt:String;
  private static var store:String;
  private static var signature:String;
  private static var amountInCents:Int;
  //resource
  private static var currencies:String; //configured before initialisation
  private static var itemTypes:String; //configured before initialisation
  private static var flowType:GAFlowType;
  //progression
  private static var progression01:String;
  private static var progression02:String;
  private static var progression03:String;
  private static var status:Int;
  private static var score:Int;
  //error
  private static var severity:GAErrorSeverity;
  private static var message:String;
  //CC
  private static var ready:Bool = false;
  private static var configKey:String;
  private static var configDefaultValue:String;
  private static var configValue:String;

        #if ios
                private static var initGA = Lib.load("gameanalytics", "initGA", 2);
                private static var enableVerboseGA = Lib.load("gameanalytics","enableVerboseGA",1);
                private static var enableInfoGA = Lib.load("gameanalytics","enableInfoGA",1);
                private static var configureUserIdGA = Lib.load("gameanalytics","configureUserIdGA",1);
                private static var configureBuildGA = Lib.load("gameanalytics","configureBuildGA",1);
                private static var configureAvailableResourceCurrenciesGA = Lib.load("gameanalytics","configureAvailableResourceCurrenciesGA",1);
                private static var configureAvailableResourceItemTypesGA = Lib.load("gameanalytics","configureAvailableResourceItemTypesGA",1);
                private static var configureAvailableCustomDimensions01GA = Lib.load("gameanalytics","configureAvailableCustomDimensions01GA",1);
                private static var configureAvailableCustomDimensions02GA = Lib.load("gameanalytics","configureAvailableCustomDimensions02GA",1);
                private static var configureAvailableCustomDimensions03GA = Lib.load("gameanalytics","configureAvailableCustomDimensions03GA",1);
                private static var setCustomDimension01GA = Lib.load("gameanalytics","setCustomDimension01GA",1);
                private static var setCustomDimension02GA = Lib.load("gameanalytics","setCustomDimension02GA",1);
                private static var setCustomDimension03GA = Lib.load("gameanalytics","setCustomDimension03GA",1);
                private static var setGenderGA = Lib.load("gameanalytics","setGenderGA",1);
                private static var setBirthYearGA = Lib.load("gameanalytics","setBirthYearGA",1);

                //events
                private static var addDesignEventGA = Lib.load("gameanalytics","addDesignEventGA",1);
                private static var addDesignEventWithAmountGA = Lib.load("gameanalytics","addDesignEventWithAmountGA",2);
                private static var setBusinessEventStringsGA = Lib.load("gameanalytics","setBusinessEventStrings",5);
                private static var setBusinessEventIntGA = Lib.load("gameanalytics","setBusinessEventInteger",1);
                private static var addBusinessEventGA = Lib.load("gameanalytics","addBusinessEventGA",0);
                private static var addResourceEventGA = Lib.load("gameanalytics","addResourceEventGA",5);
                private static var addProgressionEventGA = Lib.load("gameanalytics","addProgressionEventGA",5);
                private static var addErrorEventGA = Lib.load("gameanalytics","addErrorEventGA",2);

                //State
                private static var configureSdkVersionGA = Lib.load("gameanalytics","configureSdkVersionGA",1);
                private static var configureEngineVersionGA = Lib.load("gameanalytics","configureEngineVersionGA",1);

                //Manual session handling
                private static var setEnabledManualSessionHandlingGA = Lib.load("gameanalytics","setEnabledManualSessionHandlingGA",0);
                private static var startSessionGA = Lib.load("gameanalytics","startSessionGA",0);
                private static var endSessionGA = Lib.load("gameanalytics","endSessionGA",0);

                //Command Centre
                private static var isCommandCenterReadyGA = Lib.load("gameanalytics","isCommandCenterReadyGA",0);
                private static var getCommandCenterValueAsStringGA = Lib.load("gameanalytics","getCommandCenterValueAsStringGA",1);
                private static var getCommandCenterValueAsStringWithDefValGA = Lib.load("gameanalytics","getCommandCenterValueAsStringWithDefValGA",2);

                //utility
                private static var printGA = Lib.load("gameanalytics","printGA",1);

        #end
        #if android
                private static var initGA:Dynamic;
                private static var enableVerboseGA:Dynamic;
                private static var enableInfoGA:Dynamic;
                private static var configureUserIdGA:Dynamic;
                private static var configureBuildGA:Dynamic;
                private static var configureAvailableResourceCurrenciesGA:Dynamic;
                private static var configureAvailableResourceItemTypesGA:Dynamic;
                private static var configureAvailableCustomDimensions01GA:Dynamic;
                private static var configureAvailableCustomDimensions02GA:Dynamic;
                private static var configureAvailableCustomDimensions03GA:Dynamic;
                private static var setCustomDimension01GA:Dynamic;
                private static var setCustomDimension02GA:Dynamic;
                private static var setCustomDimension03GA:Dynamic;
                private static var setGenderGA:Dynamic;
                private static var setBirthYearGA:Dynamic;

                //events
                private static var addDesignEventGA:Dynamic;
                private static var addDesignEventWithAmountGA:Dynamic;
                private static var addBusinessEventGA:Dynamic;
                private static var addResourceEventGA:Dynamic;
                private static var addProgressionEventGA:Dynamic;
                private static var addErrorEventGA:Dynamic;

                //State
                private static var configureSdkVersionGA:Dynamic;
                private static var configureEngineVersionGA:Dynamic;

                //Manual session handling
                private static var setEnabledManualSessionHandlingGA:Dynamic;
                private static var startSessionGA:Dynamic;
                private static var endSessionGA:Dynamic;

                //Command center
                private static var isCommandCenterReadyGA:Dynamic;
                private static var getIsCommandCenterReadyGA:Dynamic;
                private static var getCommandCenterValueAsStringGA:Dynamic;
                private static var getCommandCenterValueAsStringWithDefValGA:Dynamic;
                private static var getFetchedConfigValueGA:Dynamic;
          #end
          #if cpp
          #end
          #if mac
          #end

  public static function initialise(gameKey:String, secretKey:String)
  {
    GameAnalytics.gameKey = gameKey;
    GameAnalytics.secretKey = secretKey;

    #if android
      initialiseWithGameKeyAndroid();
    #elseif (cpp && mobile && !android)
      initialiseWithGameKeyiOS();
    #elseif html5
      initialiseWithGameKeyJS();
    #end
  }

  private static function initialiseWithGameKeyiOS()
  {
    configureSdkVersion();
    configureEngineVersion();

    #if(cpp && mobile && !android)
    initGA(gameKey,secretKey);
    #end
  }

  private static function initialiseWithGameKeyAndroid()
  {
    configureSdkVersion();
    configureEngineVersion();

    #if android
    if(initGA == null)
    {
      initGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "initialise", "(Ljava/lang/String;Ljava/lang/String;)V", true);
    }

    initGA([gameKey, secretKey]);
    #end
  }

  private static function initialiseWithGameKeyJS()
  {
    #if(html5)
        GameAnalyticsJS.GameAnalytics("initialize",
            "1f50637264c54a0bd15a11ba2beaf9d9",
            "fedfbf1bf8bfac55d4d86d1ede81f84c91901a5f");
    #end    
  } 

  public static function enableVerbose(enableVerboseB:Bool)
  {
    GameAnalytics.enableVerboseB = enableVerboseB;
    enableVerboseLog();
  }

  private static function enableVerboseLog()
  {
    #if(cpp && mobile && !android)
    enableVerboseGA(enableVerboseB);
    #end
    #if android
    enableVerboseGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics","enableVerboseLog", "(Ljava/lang/String;)V", true);
    if(enableVerboseB)
    {
    enableVerboseGA(["true"]);
    }
    else
    {
    enableVerboseGA(["false"]);
    }
    #end
    #if(html5)
    GameAnalyticsJS.GameAnalytics("setEnabledInfoLog",enableVerboseB);
    #end
  }

  public static function enableInfo(enableInfoB:Bool)
  {
    GameAnalytics.enableInfoB = enableInfoB;
    enableInfoLog();
  }

  private static function enableInfoLog()
  {
    #if(cpp && mobile && !android)
    enableInfoGA(enableInfoB);
    #end
    #if android
    enableInfoGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "enableInfoLog", "(Ljava/lang/String;)V", true);
    if(enableInfoB)
    {
    enableInfoGA(["true"]);
    }
    else
    {
    enableInfoGA(["false"]);
    }
    #end
    #if(html5)
    GameAnalyticsJS.GameAnalytics("setEnabledInfoLog",enableInfoB);
    #end
  }

  public static function configureUserId(user_id:String)
  {
    GameAnalytics.user_id = user_id;
    configUserId();
  }

  private static function configUserId()
  {
    #if(cpp && mobile && !android)
    configureUserIdGA(user_id);
    #end
    #if android
    configureUserIdGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configUserId", "(Ljava/lang/String;)V", true);
    configureUserIdGA([user_id]);
    #end
    #if(html5)
    GameAnalyticsJS.GameAnalytics("configureUserId",user_id);
    #end
  }

  private static function configBuild(build:String)
  {
    GameAnalytics.build = build;
    #if(cpp && mobile && !android)
    configureBuildGA(build);
    #end
    #if android
    configureBuildGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configureBuild", "(Ljava/lang/String;)V", true);
    configureBuildGA([build]);
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("configureBuild",build);
    #end
  }

  public static function configureAvailableResourceCurrencies(_currencies:String)
  {
    GameAnalytics.currencies = _currencies;
    availableResourceCurrencies();
  }

  private static function availableResourceCurrencies()
  {
    #if(cpp && mobile && !android)
    configureAvailableResourceCurrenciesGA(currencies);
    #end
    #if android
    configureAvailableResourceCurrenciesGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configureAvailableResourceCurrencies", "(Ljava/lang/String;)V", true);
    configureAvailableResourceCurrenciesGA([currencies]);
    #end
    #if(html5)
      var data:Array<String> = currencies.split(',');
      GameAnalyticsJS.GameAnalytics("configureAvailableResourceCurrencies", data);
    #end
  }

  public static function configureAvailableResourceItemTypes(_itemTypes:String)
  {
  GameAnalytics.itemTypes = _itemTypes;
  availableResourceItemTypes();
  }

  private static function availableResourceItemTypes()
  {
  #if(cpp && mobile && !android)
  configureAvailableResourceItemTypesGA(itemTypes);
  #end
  #if android
  configureAvailableResourceItemTypesGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configureAvailableResourceItemTypes", "(Ljava/lang/String;)V", true);
  configureAvailableResourceItemTypesGA([itemTypes]);
  #end
  #if(html5)
    var data:Array<String> = itemTypes.split(',');
    GameAnalyticsJS.GameAnalytics("configureAvailableResourceItemTypes", data);
  #end
  }

  public static function configureAvailableCustomDimensions01(customDim:String)
  {
  GameAnalytics.customDimensions01 = customDim;
  availableCustomDimensions01();
  }

  private static function availableCustomDimensions01()
  {
  #if(cpp && mobile && !android)
  configureAvailableCustomDimensions01GA(customDimensions01);
  #end
  #if android
  configureAvailableCustomDimensions01GA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configureAvailableCustomDimensions01", "(Ljava/lang/String;)V", true);
  configureAvailableCustomDimensions01GA([customDimensions01]);
  #end
  #if(html5)
    var data:Array<String> = itemTypes.split(',');
    GameAnalyticsJS.GameAnalytics("configureAvailableCustomDimensions01", data);
  #end
  }

  public static function configureAvailableCustomDimensions02(customDim:String)
  {
  GameAnalytics.customDimensions02 = customDim;
  availableCustomDimensions02();
  }

  private static function availableCustomDimensions02()
  {
    #if(cpp && mobile && !android)
    configureAvailableCustomDimensions02GA(customDimensions02);
    #end
    #if android
    configureAvailableCustomDimensions02GA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configureAvailableCustomDimensions02", "(Ljava/lang/String;)V", true);
    configureAvailableCustomDimensions02GA([customDimensions02]);
    #end
    #if(html5)
      var data:Array<String> = itemTypes.split(',');
      GameAnalyticsJS.GameAnalytics("configureAvailableCustomDimensions02", data);
    #end
  }

  public static function configureAvailableCustomDimensions03(customDim:String)
  {
  GameAnalytics.customDimensions03 = customDim;
  availableCustomDimensions03();
  }

  private static function availableCustomDimensions03()
  {
    #if(cpp && mobile && !android)
    configureAvailableCustomDimensions03GA(customDimensions03);
    #end
    #if android
    configureAvailableCustomDimensions03GA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configureAvailableCustomDimensions03", "(Ljava/lang/String;)V", true);
    configureAvailableCustomDimensions03GA([customDimensions03]);
    #end
    #if(html5)
      var data:Array<String> = itemTypes.split(',');
      GameAnalyticsJS.GameAnalytics("configureAvailableCustomDimensions03", data);
    #end
  }

  public static function setCustomDimension01(customDim:String)
  {
    GameAnalytics.customDimension = customDim;
    setCustomDim01();
  }

  private static function setCustomDim01()
  {
    #if(cpp && mobile && !android)
    setCustomDimension01GA(customDimension);
    #end
    #if android
    setCustomDimension01GA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "setCustomDimension01", "(Ljava/lang/String;)V", true);
    setCustomDimension01GA([customDimension]);
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("setCustomDimension01", customDimension);
    #end
  }

  public static function setCustomDimension02(customDim:String)
  {
    GameAnalytics.customDimension = customDim;
    setCustomDim02();
  }

  private static function setCustomDim02()
  {
    #if(cpp && mobile && !android)
    setCustomDimension02GA(customDimension);
    #end
    #if android
    setCustomDimension02GA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "setCustomDimension02", "(Ljava/lang/String;)V", true);
    setCustomDimension02GA([customDimension]);
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("setCustomDimension02", customDimension);
    #end
  }

  public static function setCustomDimension03(customDim:String)
  {
    GameAnalytics.customDimension = customDim;
    setCustomDim03();
  }

  private static function setCustomDim03()
  {
  #if(cpp && mobile && !android)
  setCustomDimension03GA(customDimension);
  #end
  #if android
  setCustomDimension03GA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "setCustomDimension03", "(Ljava/lang/String;)V", true);
  setCustomDimension03GA([customDimension]);
  #end
  #if(html5)
    GameAnalyticsJS.GameAnalytics("setCustomDimension03", customDimension);
  #end
  }

  public static function setGender(gender:GAGender)
  {
    GameAnalytics.gender = gender;
    genderGA();
  }

  private static function genderGA()
  {
  #if(cpp && mobile && !android)
    var gstr = GADef.genderToString(gender);
    setGenderGA(gstr);
  #end
  #if android
    setGenderGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "setGender", "(I)V", true);
    var g:Int = cast gender;
    setGenderGA([g]);
  #end
  #if(html5)
    var gstr = GADef.genderToString(gender);
    GameAnalyticsJS.GameAnalytics("setGender", gstr);
  #end
  }

  public static function setBirthYear(birthYear:Int)
  {
    GameAnalytics.birthYear = birthYear;
    birthYearGA();
  }

  private static function birthYearGA()
  {
    #if(cpp && mobile && !android)
    setBirthYearGA(birthYear);
    #end
    #if android
    setBirthYearGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "setBirthYear", "(I)V", true);
    setBirthYearGA([birthYear]);
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("setBirthYear", birthYear);
    #end
  }

  //events
  public static function sendDesignEvent(eventId:String)
  {
    GameAnalytics.designEventId = eventId;
    designEvent();
  }

  private static function designEvent()
  {
    #if(cpp && mobile && !android)
    addDesignEventGA(designEventId);
    #end
    #if android
    if(addDesignEventGA == null)
    {
    addDesignEventGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "addDesignEventWithEventId", "(Ljava/lang/String;)V", true);
    }
    addDesignEventGA([designEventId]);
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("addDesignEvent", designEventId);
    #end
  }

  public static function sendDesignEventWithAmount(eventId:String, amount:Float)
  {
  GameAnalytics.designEventId = eventId;
  GameAnalytics.amount = amount;
  designEventWithAmount();
  }

  private static function designEventWithAmount()
  {
  #if(cpp && mobile && !android)
  addDesignEventWithAmountGA(designEventId, amount);
  #end
  #if android
  if(addDesignEventWithAmountGA == null)
  {
  addDesignEventWithAmountGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "addDesignEventWithAmountGA", "(Ljava/lang/String;F)V", true);
  }
  var args:Array<Dynamic> = [designEventId, amount];
  addDesignEventWithAmountGA(args);
  #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("addDesignEvent", designEventId, amount);
    #end
  }

  public static function sendBusinessEventIOS(currency:String, amountInCents:Int, itemType:String, itemId:String, cartType:String, receipt:String)
  {
  GameAnalytics.currency = currency;
  GameAnalytics.amountInCents = amountInCents;
  GameAnalytics.itemType = itemType;
  GameAnalytics.itemId = itemId;
  GameAnalytics.cartType = cartType;
  GameAnalytics.receipt = receipt;
  businessEvent();
  }

  public static function sendBusinessEventAndroid(currency:String, amountInCents:Int, itemType:String, itemId:String, cartType:String, receipt:String, signature:String)
  {
  GameAnalytics.currency = currency;
  GameAnalytics.amountInCents = amountInCents;
  GameAnalytics.itemType = itemType;
  GameAnalytics.itemId = itemId;
  GameAnalytics.cartType = cartType;
  GameAnalytics.receipt = receipt;
  GameAnalytics.signature = signature;
  businessEvent();
  }

  private static function businessEvent()
  {
  #if(cpp && mobile && !android)
  setBusinessEventStringsGA(currency,itemType,itemId,cartType,receipt);
  setBusinessEventIntGA(amountInCents);
  addBusinessEventGA();
  #end
  #if android
  addBusinessEventGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "addBusinessEvent",
   "(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
    true);
  var args:Array<Dynamic> = [currency, amountInCents, itemType, itemId, cartType, receipt, signature];
  addBusinessEventGA(args);
  #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("addBusinessEvent", amountInCents, currency, amount, itemType, itemId, cartType);
    #end
  }

  public static function sendResourceEvent(flowType:GAFlowType, currency:String, amount:Int, itemType:String, itemId:String)
  {
    GameAnalytics.flowType = flowType;
    GameAnalytics.currency = currency;
    GameAnalytics.amount = amount;
    GameAnalytics.itemType = itemType;
    GameAnalytics.itemId = itemId;
    resourceEvent();
  }

  private static function resourceEvent()
  {
    #if(cpp && mobile && !android)
    var ft:Int = cast flowType;
    addResourceEventGA(ft, currency, amount, itemType, itemId);
    #end
    #if android
    addResourceEventGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "addResourceEvent", "(ILjava/lang/String;FLjava/lang/String;Ljava/lang/String;)V", true);
    var args:Array<Dynamic> = [flowType, currency, amount, itemType, itemId];
    addResourceEventGA(args);
    #end
    #if(html5)
      // get flow string
      var flow:String = GADef.flowToString(flowType);
      GameAnalyticsJS.GameAnalytics("addResourceEvent", flow, currency, itemType, itemId);
    #end
  }

  public static function sendProgressionEvent(status:GAProgression, progression01:String, ?progression02:String, ?progression03:String, score:Int=0)
  {
    GameAnalytics.status = cast status; // Cast to Int
    GameAnalytics.progression01 = progression01;

#if html5
    GameAnalytics.progression02 = progression02;
    GameAnalytics.progression03 = progression03;
#else
    GameAnalytics.progression02 = (progression02 != null) ? progression02 : 'empty';
    GameAnalytics.progression03 = (progression03 != null) ? progression03 : 'empty';
#end

    GameAnalytics.score = score;
    progressionEvent();
  }

  private static function progressionEvent()
  {
    #if(cpp && mobile && !android)
    addProgressionEventGA(status, progression01, progression02, progression03, score);
    #end
    #if android
    addProgressionEventGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "addProgressionEvent", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V", true);
    var args:Array<Dynamic> = [status, progression01, progression02, progression03, score];
    addProgressionEventGA(args);
    #end
    #if(html5)
      trace("addProgressionEvent", status, progression01, progression02, progression03, score);
      GameAnalyticsJS.GameAnalytics("addProgressionEvent",status, progression01, progression02, progression03, score);
    #end
    }

  public static function sendErrorEvent(severity:GAErrorSeverity, message:String)
  {
    GameAnalytics.severity = severity;
    GameAnalytics.message = message;
    errorEvent();
  }

  private static function errorEvent()
  {
    #if(cpp && mobile && !android)
      var sev:Int = cast severity;
      addErrorEventGA(sev, message);
    #end
    #if android
      var sev:Int = cast severity;
      addErrorEventGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "addErrorEventWithSeverity", "(ILjava/lang/String;)V", true);
      var args:Array<Dynamic> = [sev, message];
      addErrorEventGA(args);
    #end
    #if(html5)
      var sev:String = GADef.errorToString(severity);
      GameAnalyticsJS.GameAnalytics("addErrorEvent", sev, message);
    #end
  }

  // SDK state
  private static function configureSdkVersion()
  {
    var _version:String = sdk_name+" " + sdk_version;
    #if(cpp && mobile && !android)
      _version = sdk_version_ios;
      configureSdkVersionGA(_version);
    #end
    #if android
      _version = sdk_version_android;
      configureSdkVersionGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configureSdkGameEngineVersion", "(Ljava/lang/String;)V", true);
      configureSdkVersionGA([_version]);
    #end
    #if(html5)
      _version = sdk_version_javascript;
      GameAnalyticsJS.GameAnalytics("configureSdkGameEngineVersion", _version);
    #end
  }

  private static function configureEngineVersion()
  {
    var engineVersion:String;

    // Get openfl Version
    engineVersion = "openfl "+haxe.macro.Compiler.getDefine("openfl");

    #if(cpp && mobile && !android)
    configureEngineVersionGA(engineVersion);
    #end
    #if android
    configureEngineVersionGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "configureGameEngineVersion", "(Ljava/lang/String;)V", true);
    configureEngineVersionGA([engineVersion]);
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("configureGameEngineVersion", engineVersion);
    #end
  }

  //Manual session handling
  public static function setEnableManualSessionHandling()
  {
    #if(cpp && mobile && !android)
      setEnabledManualSessionHandlingGA();
    #end
    #if android
      setEnabledManualSessionHandlingGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "enableManualSessionHandling", "()V", true);
      setEnabledManualSessionHandlingGA();
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("setEnabledManualSessionHandling", true);
    #end
  }

  public static function startSession()
  {
    #if(cpp && mobile && !android)
      startSessionGA();
    #end
    #if android
    startSessionGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "enableManualSessionHandling", "()V", true);
      startSessionGA();
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("startSession");
    #end
  }

  public static function endSession()
  {
    #if(cpp && mobile && !android)
      endSessionGA();
    #end
    #if android
      endSessionGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "startSession", "()V", true);
      endSessionGA();
    #end
    #if(html5)
      GameAnalyticsJS.GameAnalytics("endSession");
    #end
  }

  //Command Centre
  public static function isCommandCenterReady()
  {
    #if(cpp && mobile && !android)
      ready = isCommandCenterReadyGA();
    #end
    #if android
      if(isCommandCenterReadyGA == null)
      {
      isCommandCenterReadyGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "isCommandCenterReady", "()V");
      getIsCommandCenterReadyGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics", "getIsCommandCenterReady", "()Z");
      }
      isCommandCenterReadyGA();
      Sys.sleep(.05); // threads are parallel and we need to wait for UI thread in Android to finish the check
      ready = getIsCommandCenterReadyGA();
    #end
    #if(html5)
      ready = GameAnalyticsJS.GameAnalytics("isCommandCenterReady");
    #end
    return ready;
  }

  public static function getCommandCenterValueAsString(_key:String)
  {
    GameAnalytics.configKey = _key;
    configValue = _getCommandCenterValueAsString();
    return configValue;
  }

  private static function _getCommandCenterValueAsString()
  {
    var ret:String = "";
    #if(cpp && mobile && !android)
      ret = getCommandCenterValueAsStringGA(GameAnalytics.configKey);
    #end
    #if android
      if(getCommandCenterValueAsStringGA == null)
      {
      getCommandCenterValueAsStringGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics","getCommandCenterValueAsString","(Ljava/lang/String;)V");
      }
      if(getFetchedConfigValueGA == null)
      {
      getFetchedConfigValueGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics","getFetchedConfigValue","()Ljava/lang/String;");
      }
      getCommandCenterValueAsStringGA(GameAnalytics.configKey);
      Sys.sleep(.05); // threads are parallel and we need to wait for UI thread in Android to finish loading the config value
      ret = getFetchedConfigValueGA();
      trace(ret);
    #end
    #if(html5)
      ready = GameAnalyticsJS.GameAnalytics("getCommandCenterValueAsString", GameAnalytics.configKey);
    #end
    return ret;
  }

  public static function getCommandCenterValueAsStringWithDefVal(_key:String, _defaultValue:String)
  {
    GameAnalytics.configKey = _key;
    GameAnalytics.configDefaultValue = _defaultValue;
    configValue = _getCommandCenterValueAsStringWithDefVal();
    return configValue;
  }

  private static function _getCommandCenterValueAsStringWithDefVal()
  {
    var ret:String = "";
    #if(cpp && mobile && !android)
    ret = getCommandCenterValueAsStringWithDefValGA(GameAnalytics.configKey,GameAnalytics.configDefaultValue);
    #end
    #if android
    if(getCommandCenterValueAsStringWithDefValGA == null)
    {
    getCommandCenterValueAsStringWithDefValGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics","getCommandCenterValueAsStringWithDefVal","(Ljava/lang/String;Ljava/lang/String;)V");
    }
    if(getFetchedConfigValueGA == null)
    {
    getFetchedConfigValueGA = JNI.createStaticMethod("org/haxe/extension/gameanalytics/MyGameAnalytics","getFetchedConfigValue","()Ljava/lang/String;");
    }
    getCommandCenterValueAsStringWithDefValGA(GameAnalytics.configKey, GameAnalytics.configDefaultValue);
    Sys.sleep(.05); // threads are parallel and we need to wait for UI thread in Android to finish loading the config value
    ret = getFetchedConfigValueGA();
    #end
    #if(html5)
      ready = cast GameAnalyticsJS.GameAnalytics("getCommandCenterValueAsString", GameAnalytics.configKey, GameAnalytics.configDefaultValue);
    #end
    return ret;
  }

  //Utility
  private static function printMessage(message:String)
  {
    #if(cpp && mobile && !android)
      printGA(message);
    #end
  }
}
