#include "GameAnalytics.h"
#import <GameAnalytics/GameAnalytics.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>

using namespace gameanalytics;

namespace gameanalytics
{

  static bool isStringNullOrEmpty(const char* s)
  {
	   return s == NULL || strlen(s) == 0;
  }

  //init and settings
    void initializeWithGameKey(const char *gameKey, const char *secretKey)
    {
        [GameAnalytics initializeWithGameKey:[[NSString alloc]
        										 initWithUTF8String:gameKey] gameSecret:[[NSString alloc]
                             										 initWithUTF8String:secretKey]];
    }

    void enableVerboseLog(const bool enable)
    {
      if(enable == true)
      {
        [GameAnalytics setEnabledVerboseLog:YES];
      }
      else
      {
        [GameAnalytics setEnabledVerboseLog:NO];
      }
    }

    void enableInfoLog(const bool enable)
    {
      if(enable == true)
      {
        [GameAnalytics setEnabledInfoLog:YES];
      }
      else
      {
        [GameAnalytics setEnabledInfoLog:NO];
      }
    }

    void enableWarningLog(const bool enable)
    {
      if(enable == true)
      {
        [GameAnalytics setEnabledWarningLog:YES];
      }
      else
      {
        [GameAnalytics setEnabledWarningLog:NO];
      }
    }

    void enableErrorReporting(const bool enable)
    {
      if(enable == true)
      {
        [GameAnalytics setEnabledErrorReporting:YES];
      }
      else
      {
        [GameAnalytics setEnabledErrorReporting:NO];
      }
    }

    void enableEventSubmission(const bool enable)
    {
      if(enable == true)
      {
        [GameAnalytics setEnabledEventSubmission:YES];
      }
      else
      {
        [GameAnalytics setEnabledEventSubmission:NO];
      }
    }

    void configureBuild(const char *build)
    {
      [GameAnalytics configureBuild:[[NSString alloc]
                           initWithUTF8String:build]];
    }

    void configureUserId(const char* userId)
    {
      [GameAnalytics configureUserId:[[NSString alloc]
                           initWithUTF8String:userId]];
    }

    void configureAvailableResourceCurrencies(const char* _currencies)
    {
      NSString* currencies = [[NSString alloc] initWithUTF8String:_currencies];
      NSArray* currenciesArray  = [currencies componentsSeparatedByString:@","];
      [GameAnalytics configureAvailableResourceCurrencies:currenciesArray];
    }

    void configureAvailableResourceItemTypes(const char* _itemTypes)
    {
      NSString* itemTypes = [[NSString alloc] initWithUTF8String:_itemTypes];
      NSArray* itemTypesArray = [itemTypes componentsSeparatedByString:@","];
      [GameAnalytics configureAvailableResourceItemTypes:itemTypesArray];
    }

    void configureAvailableCustomDimensions01(const char* _dimensions)
    {
      NSString* dimensions = [[NSString alloc] initWithUTF8String:_dimensions];
      NSArray* dimensionsArray = [dimensions componentsSeparatedByString:@","];
      [GameAnalytics configureAvailableCustomDimensions01:dimensionsArray];
    }

    void configureAvailableCustomDimensions02(const char* _dimensions)
    {
      NSString* dimensions = [[NSString alloc] initWithUTF8String:_dimensions];
      NSArray* dimensionsArray = [dimensions componentsSeparatedByString:@","];
      [GameAnalytics configureAvailableCustomDimensions02:dimensionsArray];
    }

    void configureAvailableCustomDimensions03(const char* _dimensions)
    {
      NSString* dimensions = [[NSString alloc] initWithUTF8String:_dimensions];
      NSArray* dimensionsArray = [dimensions componentsSeparatedByString:@","];
      [GameAnalytics configureAvailableCustomDimensions03:dimensionsArray];
    }

    void setCustomDimension01(const char* _dimension)
    {
      NSString* dimension = [[NSString alloc] initWithUTF8String:_dimension];
      [GameAnalytics setCustomDimension01:dimension];
    }

    void setCustomDimension02(const char* _dimension)
    {
      NSString* dimension = [[NSString alloc] initWithUTF8String:_dimension];
      [GameAnalytics setCustomDimension02:dimension];
    }

    void setCustomDimension03(const char* _dimension)
    {
      NSString* dimension = [[NSString alloc] initWithUTF8String:_dimension];
      [GameAnalytics setCustomDimension03:dimension];
    }

    void setGender(const char* gender)
    {
      [GameAnalytics setGender:[[NSString alloc] initWithUTF8String:gender]];
    }

    void setBirthYear(const int birthYear)
    {
      NSInteger year = birthYear;
      [GameAnalytics setBirthYear:year];
    }

    //Events
    void addDesignEvent(const char *eventId)
    {
      [GameAnalytics addDesignEventWithEventId:[[NSString alloc]
                           initWithUTF8String:eventId]];
    }

    void addDesignEventWithAmount(const char* eventId, const float amount)
    {
      NSNumber* _amount = @(amount);
      [GameAnalytics addDesignEventWithEventId:[[NSString alloc]
                           initWithUTF8String:eventId] value:_amount];
    }

    void addBusinessEvent(const char* currency, const int amountInCents, const char* item, const char* itemId, const char* cartType, const char* receipt)
    {
      NSInteger _amount = amountInCents;
      [GameAnalytics addBusinessEventWithCurrency:[[NSString alloc] initWithUTF8String:currency]
                            amount:_amount
                            itemType:[[NSString alloc] initWithUTF8String:item]
                            itemId:[[NSString alloc] initWithUTF8String:itemId]
                            cartType:[[NSString alloc] initWithUTF8String:cartType]
                            receipt:[[NSString alloc] initWithUTF8String:receipt]];
    }

    void addResourceEvent(const int _flowType, const char* currency, const int amount, const char* itemType, const char* itemId)
    {
      NSInteger flowType = _flowType;
      NSNumber* _amount = @(amount);
      if(flowType == 1)
      {
      [GameAnalytics addResourceEventWithFlowType:GAResourceFlowTypeSource
       currency:[[NSString alloc] initWithUTF8String:currency]
       amount:_amount
       itemType:[[NSString alloc] initWithUTF8String:itemType]
       itemId:[[NSString alloc] initWithUTF8String:itemId]];
      }
      if(flowType == 2)
      {
        [GameAnalytics addResourceEventWithFlowType:GAResourceFlowTypeSink
         currency:[[NSString alloc] initWithUTF8String:currency]
         amount:_amount
         itemType:[[NSString alloc] initWithUTF8String:itemType]
         itemId:[[NSString alloc] initWithUTF8String:itemId]];
      }
    }

    void addProgressionEvent(const int _status, const char* _progression01, const char* _progression02, const char* _progression03, const int _score)
    {
      NSInteger _statusNumber = _status;
      GAProgressionStatus status;
      switch (_statusNumber) {
        case 1: status = GAProgressionStatusStart; break;
        case 2: status = GAProgressionStatusComplete; break;
        case 3: status = GAProgressionStatusFail; break;
      }

      NSString* progression01 = [[NSString alloc] initWithUTF8String:_progression01];
      NSString* progression02 = [[NSString alloc] initWithUTF8String:_progression02];
      NSString* progression03 = [[NSString alloc] initWithUTF8String:_progression03];
      NSInteger score = _score;

      if([progression02 isEqualToString:@"empty"] && [progression03 isEqualToString:@"empty"])
      {
        if(score != 0)
        {
          [GameAnalytics addProgressionEventWithProgressionStatus:status progression01:progression01 progression02:nil progression03:nil score:score];
        }
        else
        {
          [GameAnalytics addProgressionEventWithProgressionStatus:status progression01:progression01 progression02:nil progression03:nil];
        }
      }
      if(![progression02 isEqualToString:@"empty"] && [progression03 isEqualToString:@"empty"])
      {
        if(score != 0)
        {
          [GameAnalytics addProgressionEventWithProgressionStatus:status progression01:progression01 progression02:progression02 progression03:nil score:score];
        }
        else
        {
          [GameAnalytics addProgressionEventWithProgressionStatus:status progression01:progression01 progression02:progression02 progression03:nil];
        }
      }
      if(![progression02 isEqualToString:@"empty"] && ![progression03 isEqualToString:@"empty"])
      {
        if(score != 0)
        {
          [GameAnalytics addProgressionEventWithProgressionStatus:status progression01:progression01 progression02:progression02 progression03:progression03 score:score];
        }
        else
        {
          [GameAnalytics addProgressionEventWithProgressionStatus:status progression01:progression01 progression02:progression02 progression03:progression03];
        }
      }
    }

    void addErrorEvent(const int _severity, const char* _message)
    {
      NSInteger severity = _severity;
      GAErrorSeverity errorSeverity;
      switch (severity) {
        case 1: errorSeverity = GAErrorSeverityDebug; break;
        case 2: errorSeverity = GAErrorSeverityInfo; break;
        case 3: errorSeverity = GAErrorSeverityWarning; break;
        case 4: errorSeverity = GAErrorSeverityError; break;
        case 5: errorSeverity = GAErrorSeverityCritical; break;
      }

      NSString* message = [[NSString alloc] initWithUTF8String:_message];
      [GameAnalytics addErrorEventWithSeverity:errorSeverity message:message];
    }

    //Manual session handling
    void setEnabledManualSessionHandling()
    {
      [GameAnalytics setEnabledManualSessionHandling:YES];
    }

    void startSession()
    {
      [GameAnalytics startSession];
    }

    void endSession()
    {
      [GameAnalytics endSession];
    }

    //Command centre
    bool isCommandCenterReady()
    {
      return [GameAnalytics isCommandCenterReady];
    }

    const char* getCommandCenterValueAsString(const char *key)
    {
      NSString* _key = [[NSString alloc] initWithUTF8String:key];
      NSString* value = [GameAnalytics getCommandCenterValueAsString:_key];
      const char* ret = [value UTF8String];
      return ret;
    }

    const char* getCommandCenterValueAsStringWithDefVal(const char *key, const char *defValue)
    {
      NSString* _key = [[NSString alloc] initWithUTF8String:key];
      NSString* _defValue = [[NSString alloc] initWithUTF8String:defValue];
      NSString* value = [GameAnalytics getCommandCenterValueAsString:_key defaultValue:_defValue];
      const char* ret = [value UTF8String];
      return ret;
    }

    //State
    void configureSdkVersion(const char *version)
    {
      [GameAnalytics configureSdkVersion:[[NSString alloc]
                           initWithUTF8String:version]];
    }

    void configureEngineVersion(const char *version)
    {
      [GameAnalytics configureEngineVersion:[[NSString alloc]
                           initWithUTF8String:version]];
    }

    //Utility
    void printNative(const char* message)
    {
      NSLog(@"%@", [[NSString alloc]
                           initWithUTF8String:message]);
    }
    void printNative(char *message)
    {
      NSLog(@"%@", [[NSString alloc]
                           initWithUTF8String:message]);
    }
    void printNative(int message)
    {
      NSLog(@"%ld", (long) message);
    }
}
