package org.haxe.extension.gameanalytics;

import com.gameanalytics.sdk.*;

import org.haxe.extension.Extension;
import org.haxe.lime.HaxeObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.reflect.Constructor;
import java.util.HashMap;

import org.haxe.lime.*;

import android.app.*;
import android.content.*;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.media.SoundPool;
import android.net.Uri;
import android.os.*;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

public class MyGameAnalytics extends Extension
{
  private static MyGameAnalytics instance = null;

  private static boolean isCCready = false;
  private static String configValue = "Nothing";
  private static String configDefaultValue = "";

  static public MyGameAnalytics getInstance()
  {
    if(instance == null)
    {
      instance = new MyGameAnalytics();
    }
    return instance;
  }

  public static void initialise(final String gameKey, final String secretKey)
  {
    mainActivity.runOnUiThread
		(
			new Runnable()
			{
				public void run()
				{
          GameAnalytics.initializeWithGameKey(mainActivity, gameKey, secretKey);
				}
			}
		);
  }

  public static void enableVerboseLog(final String enable)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          if(enable.equals("true"))
          {
            GameAnalytics.setEnabledVerboseLog(true);
          }
          if(enable.equals("false"))
          {
            GameAnalytics.setEnabledVerboseLog(false);
          }
        }
      }
    );
  }

  public static void enableInfoLog(final String enable)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          if(enable.equals("true"))
          {
            GameAnalytics.setEnabledInfoLog(true);
          }
          if(enable.equals("false"))
          {
            GameAnalytics.setEnabledInfoLog(false);
          }
        }
      }
    );
  }

  public static void configUserId(final String user_id)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureUserId(user_id);
        }
      }
    );
  }

  public static void configureBuild(final String build)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureBuild(build);
        }
      }
    );
  }

  public static void configureAvailableResourceCurrencies(final String _currencies)
  {
    final String[] currencies = _currencies.split(",");

    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureAvailableResourceCurrencies(currencies);
        }
      }
    );
  }

  public static void configureAvailableResourceItemTypes(final String _itemTypes)
  {
    final String[] itemTypes = _itemTypes.split(",");

    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureAvailableResourceItemTypes(itemTypes);
        }
      }
    );
  }

  public static void configureAvailableCustomDimensions01(final String _dimensions01)
  {
    final String[] dimensions01 = _dimensions01.split(",");

    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureAvailableCustomDimensions01(dimensions01);
        }
      }
    );
  }

  public static void configureAvailableCustomDimensions02(final String _dimensions02)
  {
    final String[] dimensions02 = _dimensions02.split(",");

    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureAvailableCustomDimensions02(dimensions02);
        }
      }
    );
  }

  public static void configureAvailableCustomDimensions03(final String _dimensions03)
  {
    final String[] dimensions03 = _dimensions03.split(",");

    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureAvailableCustomDimensions03(dimensions03);
        }
      }
    );
  }

  public static void setCustomDimension01(final String dimension)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.setCustomDimension01(dimension);
        }
      }
    );
  }

  public static void setCustomDimension02(final String dimension)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.setCustomDimension02(dimension);
        }
      }
    );
  }

  public static void setCustomDimension03(final String dimension)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.setCustomDimension03(dimension);
        }
      }
    );
  }

  public static void setGender(final int gender)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.setGender(gender);
        }
      }
    );
  }

  public static void setBirthYear(final int year)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.setBirthYear(year);
        }
      }
    );
  }

  //Events
  public static void addDesignEventWithEventId(final String eventId)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.addDesignEventWithEventId(eventId);
        }
      }
    );
  }

  public static void addDesignEventWithAmountGA(final String eventId, final float value)
  {
    final double dvar=(double)value;
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.addDesignEventWithEventId(eventId, dvar);
        }
      }
    );
  }

  public static void addBusinessEvent(final String currency, final int amount, final String itemType, final String itemId, final String cartType, final String receipt, final String signature)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.addBusinessEventWithCurrency(currency, amount, itemType, itemId, cartType, receipt, "google_play", signature);
        }
      }
    );
  }

  public static void addResourceEvent(final int flowType, final String currency, final float amount, final String itemType, final String itemId)
  {
    final GAResourceFlowType type = GAResourceFlowType.valueOf(flowType);
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.addResourceEventWithFlowType(type, currency, amount, itemType, itemId);
        }
      }
    );
  }

  public static void addProgressionEvent(final int _status, final String progression01, final String progression02, final String progression03, final int score)
  {
    final GAProgressionStatus status = GAProgressionStatus.valueOf(_status);
    final double dvar=(double)score;
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          if(progression02.equals("empty") && progression03.equals("empty"))
          {
            if(score !=0)
            {
              GameAnalytics.addProgressionEventWithProgressionStatus(status, progression01, dvar);
            }
            else
            {
              GameAnalytics.addProgressionEventWithProgressionStatus(status, progression01);
            }
          }
          if(!progression02.equals("empty") && progression03.equals("empty"))
          {
            if(score !=0)
            {
              GameAnalytics.addProgressionEventWithProgressionStatus(status, progression01, progression02, dvar);
            }
            else
            {
              GameAnalytics.addProgressionEventWithProgressionStatus(status, progression01, progression02);
            }
          }
          if(!progression02.equals("empty") && !progression03.equals("empty"))
          {
            if(score !=0)
            {
              GameAnalytics.addProgressionEventWithProgressionStatus(status, progression01, progression02, progression03, dvar);
            }
            else
            {
              GameAnalytics.addProgressionEventWithProgressionStatus(status, progression01, progression02, progression03);
            }
          }
        }
      }
    );
  }

  public static void addErrorEventWithSeverity(final int _severity, final String message)
  {
    final GAErrorSeverity severity = GAErrorSeverity.valueOf(_severity);
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.addErrorEventWithSeverity(severity, message);
        }
      }
    );
  }

  //SDK settings
  public static void configureGameEngineVersion(final String version)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureGameEngineVersion(version);
        }
      }
    );
  }

  public static void configureSdkGameEngineVersion(final String version)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.configureSdkGameEngineVersion(version);
        }
      }
    );
  }

  //Manual session handling
  public static void enableManualSessionHandling()
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.setEnabledManualSessionHandling(true);
        }
      }
    );
  }

  public static void startSession()
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.startSession();
        }
      }
    );
  }

  public static void endSession()
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          GameAnalytics.endSession();
        }
      }
    );
  }

  //Command center
  static public void isCommandCenterReady()
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          isCCready = GameAnalytics.isCommandCenterReady();
        }
      }
    );
  }

  static public boolean getIsCommandCenterReady()
  {
    return isCCready;
  }


  static public void getCommandCenterValueAsString(final String key)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          configValue = GameAnalytics.getCommandCenterValueAsString(key);
        }
      }
    );
  }

  static public void getCommandCenterValueAsStringWithDefVal(final String key, final String defValue)
  {
    mainActivity.runOnUiThread
    (
      new Runnable()
      {
        public void run()
        {
          configValue = GameAnalytics.getCommandCenterValueAsString(key, defValue);
        }
      }
    );
  }

  static public String getFetchedConfigValue()
  {
    return configValue;
  }
}
