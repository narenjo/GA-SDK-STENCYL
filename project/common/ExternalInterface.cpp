#ifndef IPHONE
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include "GameAnalytics.h"
#include <stdio.h>
#include <string>
#include <vector>

#define CURRENCIES 20

using namespace gameanalytics;
using namespace std;

//--------------------------------------------------
// Glues Haxe to native code.
//--------------------------------------------------

void initGA(value gameKey, value secretKey)
{
	initializeWithGameKey(val_string(gameKey), val_string(secretKey));
}
DEFINE_PRIM(initGA, 2);

void enableVerboseGA(value enable)
{
	enableVerboseLog(val_bool(enable));
}
DEFINE_PRIM(enableVerboseGA, 1);

void enableInfoGA(value enable)
{
	enableInfoLog(val_bool(enable));
}
DEFINE_PRIM(enableInfoGA,1);

void enableWarningLogGA(value enable)
{
	enableWarningLog(val_bool(enable));
}
DEFINE_PRIM(enableWarningLogGA,1);

void enableErrorReportingGA(value enable)
{
	enableErrorReporting(val_bool(enable));
}
DEFINE_PRIM(enableErrorReportingGA,1);

void enableEventSubmissionGA(value enable)
{
	enableEventSubmission(val_bool(enable));
}
DEFINE_PRIM(enableEventSubmissionGA,1);

void configureUserIdGA(value user_id)
{
	configureUserId(val_string(user_id));
}
DEFINE_PRIM(configureUserIdGA,1);

void configureBuildGA(value build)
{
	configureBuild(val_string(build));
}
DEFINE_PRIM(configureBuildGA,1);

void configureAvailableResourceCurrenciesGA(value currencies)
{
	configureAvailableResourceCurrencies(val_string(currencies));
}
DEFINE_PRIM(configureAvailableResourceCurrenciesGA,1);

void configureAvailableResourceItemTypesGA(value itemTypes)
{
	configureAvailableResourceItemTypes(val_string(itemTypes));
}
DEFINE_PRIM(configureAvailableResourceItemTypesGA,1);

void configureAvailableCustomDimensions01GA(value dimensions)
{
	configureAvailableCustomDimensions01(val_string(dimensions));
}
DEFINE_PRIM(configureAvailableCustomDimensions01GA,1);

void configureAvailableCustomDimensions02GA(value dimensions)
{
	configureAvailableCustomDimensions02(val_string(dimensions));
}
DEFINE_PRIM(configureAvailableCustomDimensions02GA,1);

void configureAvailableCustomDimensions03GA(value dimensions)
{
	configureAvailableCustomDimensions03(val_string(dimensions));
}
DEFINE_PRIM(configureAvailableCustomDimensions03GA,1);

void setCustomDimension01GA(value dimension)
{
	setCustomDimension01(val_string(dimension));
}
DEFINE_PRIM(setCustomDimension01GA,1);

void setCustomDimension02GA(value dimension)
{
	setCustomDimension02(val_string(dimension));
}
DEFINE_PRIM(setCustomDimension02GA,1);

void setCustomDimension03GA(value dimension)
{
	setCustomDimension03(val_string(dimension));
}
DEFINE_PRIM(setCustomDimension03GA,1);

//Events
void addDesignEventGA(value eventId)
{
	addDesignEvent(val_string(eventId));
}
DEFINE_PRIM(addDesignEventGA,1);

void addDesignEventWithAmountGA(value eventId, value amount)
{
	addDesignEventWithAmount(val_string(eventId), val_float(amount));
}
DEFINE_PRIM(addDesignEventWithAmountGA,2);

//Business event
value currency;
value amount;
value itemType;
value itemId;
value cartType;
value receipt;

void setBusinessEventStrings(value _currency, value _itemType, value _itemId, value _cartType, value _receipt)
{
	currency = _currency;
	itemType = _itemType;
	itemId = _itemId;
	cartType = _cartType;
	receipt = _receipt;
}
DEFINE_PRIM(setBusinessEventStrings,5);

void setBusinessEventInteger(value _amount)
{
	amount = _amount;
}
DEFINE_PRIM(setBusinessEventInteger,1);

void addBusinessEventGA()
{
	addBusinessEvent(val_string(currency), val_int(amount), val_string(itemId), val_string(itemType), val_string(cartType), val_string(receipt));
}
DEFINE_PRIM(addBusinessEventGA,0);

void addResourceEventGA(value flowType, value currency, value amount, value itemType, value itemId)
{
	addResourceEvent(val_int(flowType), val_string(currency), val_int(amount), val_string(itemType), val_string(itemId));
}
DEFINE_PRIM(addResourceEventGA,5);

void addProgressionEventGA(value status, value progression01, value progression02, value progression03, value score)
{
	addProgressionEvent(val_int(status), val_string(progression01), val_string(progression02), val_string(progression03), val_int(score));
}
DEFINE_PRIM(addProgressionEventGA,5);

void addErrorEventGA(value severity, value message)
{
	addErrorEvent(val_int(severity), val_string(message));
}
DEFINE_PRIM(addErrorEventGA,2);

void setGenderGA(value gender)
{
	setGender(val_string(gender));
}
DEFINE_PRIM(setGenderGA,1);

void setBirthYearGA(value year)
{
	setBirthYear(val_int(year));
}
DEFINE_PRIM(setBirthYearGA,1);
//-----------------------------

//State
void configureSdkVersionGA(value sdkVersion)
{
	configureSdkVersion(val_string(sdkVersion));
}
DEFINE_PRIM(configureSdkVersionGA,1);

void configureEngineVersionGA(value engineVersion)
{
	configureEngineVersion(val_string(engineVersion));
}
DEFINE_PRIM(configureEngineVersionGA,1);

//Manual session handling
void setEnabledManualSessionHandlingGA()
{
	setEnabledManualSessionHandling();
}
DEFINE_PRIM(setEnabledManualSessionHandlingGA,0);

void startSessionGA()
{
	startSession();
}
DEFINE_PRIM(startSessionGA,0);

void endSessionGA()
{
	endSession();
}
DEFINE_PRIM(endSessionGA,0);

//Command centre
static value isCommandCenterReadyGA()
{
	return (isCommandCenterReady() ? val_true : val_false);
}
DEFINE_PRIM(isCommandCenterReadyGA,0);

static value getCommandCenterValueAsStringGA(value key)
{
	return alloc_string(getCommandCenterValueAsString(val_string(key)));
}
DEFINE_PRIM(getCommandCenterValueAsStringGA,1);

static value getCommandCenterValueAsStringWithDefValGA(value key, value defaultValue)
{
	return alloc_string(getCommandCenterValueAsStringWithDefVal(val_string(key), val_string(defaultValue)));
}
DEFINE_PRIM(getCommandCenterValueAsStringWithDefValGA,2);

//Utility
void printGA(value message)
{
	printNative(val_string(message));
}
DEFINE_PRIM(printGA,1);

extern "C" void gameanalytics_main()
{
}
DEFINE_ENTRY_POINT(gamea_main);

extern "C" int gameanalytics_register_prims()
{
    return 0;
}




//--------------------------------------------------
// IGNORE STUFF BELOW THIS LINE
//--------------------------------------------------
