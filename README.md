EXTENSION-GA
==========

GameAnalytics extension library forked from Stencyl SDK.

Update SDK for Android + added Javascript support via GA Command queues

Documentation can be found [here](https://gameanalytics.com/docs/stencyl-sdk).

Specific platform documentation can be found on related platform SDK.

If you have any issues or feedback regarding the SDK, please contact our friendly support team [here](https://gameanalytics.com/contact).

> :information_source:
> The Stencyl SDK includes support for **iOS** and **Android**.
>   
> **Build size:**   
> Note that download size differ from the actual build size.   
>   
> **Android:**   
> SDK V4.4.0
> The SDK build size in a native Android app is only around **49Kb** and the dependecies take up to **820Kb** depending if your app already uses some of the same dependencies.   
>   
> **iOS:**   
> SDK V3.2.1
> The SDK build size in a native iOS app is only around **242Kb** (armv7) / **259Kb** (armv8).
>   
> **JAVASCRIPT:**   
> SDK V3.1.2
> Use of GameAnalytics Javascript
>   
>   Add this code to your HTML template 

	<!-- GameAnalytics -->
	<script>
		window.GameAnalytics=window.GameAnalytics||function(){(GameAnalytics.q=GameAnalytics.q||[]).push(arguments)};
	</script>
	<script async src='http://download.gameanalytics.com/js/GameAnalytics-3.1.2.min.js'></script>
	<!-- End GameAnalytics -->

Changelog
---------
** Fork modifications **
* Adpatation of SDK to Haxelib
* Updated Android SDK
* Added Javascript bindings

<!--(CHANGELOG_TOP)-->
**2.1.0**
* included compatibility with x86_64 simulator (iOS)

**2.0.0**
* added Command Center functionality

**1.0.1**
* fixed compilation issue (iOS)

**1.0.0**
* initial release
