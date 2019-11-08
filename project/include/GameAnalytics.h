#ifndef GAMEANALYTICS_H
#define GAMEANALYTICS_H

#import <vector>
#import <string>

using namespace std;

namespace gameanalytics
{
    void initializeWithGameKey(const char* title, const char* message);
    void enableVerboseLog(const bool enable);
    void enableInfoLog(const bool enable);
    void enableWarningLog(const bool enable);
    void enableErrorReporting(const bool enable);
    void enableEventSubmission(const bool enable);
    void configureBuild(const char* build);
    void configureUserId(const char* userId);
    void configureAvailableResourceCurrencies(const char* _currencies);
    void configureAvailableResourceItemTypes(const char* _itemTypes);
    void configureAvailableCustomDimensions01(const char* _dimensions);
    void configureAvailableCustomDimensions02(const char* _dimensions);
    void configureAvailableCustomDimensions03(const char* _dimensions);
    void setCustomDimension01(const char* _dimension);
    void setCustomDimension02(const char* _dimension);
    void setCustomDimension03(const char* _dimension);
    void setGender(const char* gender);
    void setBirthYear(const int birthYear);

    //Events
    void addDesignEvent(const char* eventId);
    void addDesignEventWithAmount(const char* eventID, const float amount);
    void addBusinessEvent(const char* currency, const int amount, const char* item, const char* itemId, const char* cartType, const char* receipt);
    void addResourceEvent(const int _flowType, const char* currency, const int amount, const char* itemType, const char* itemId);
    void addProgressionEvent(const int _status, const char* _progression01, const char* _progression02, const char* _progression03, const int _score);
    void addErrorEvent(const int _severity, const char* _message);

    //State
    void configureSdkVersion(const char* sdkVersion);
    void configureEngineVersion(const char* engineVersion);

    //Manual session handling
    void setEnabledManualSessionHandling();
    void startSession();
    void endSession();

    //Command Centre
    bool isCommandCenterReady();
    const char* getCommandCenterValueAsString(const char *key);
    const char* getCommandCenterValueAsStringWithDefVal(const char *key, const char *defValue);

    //Utility
    void printNative(const char* message);
    void printNative(int message);
}

#endif
