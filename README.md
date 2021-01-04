# AppClips
**AppClips** – technology that allows users to use the valuable functionality of an app, without having to install it first. It is a small part of the app (less than 10 Mb) that can be called up and used exactly when it comes in handy.

You can find more information in a [presentation](https://drive.google.com/file/d/1gDve6U5wsDtA8voAgUDaALYzpa0-MtbD/view?usp=sharing) and [video](https://web.microsoftstream.com/video/31d5bdb6-42de-4643-8524-6e8bc2802afa).

# Discovery
In order to use App Clip, it must be discovered.

**Default App Clip Experiences**
* Safari App Banner
* Links in Messages
* Recently Used App Clips

**Advanced App Clip Experience**
* Place Cards in Maps
* NFC Tags
* QR Codes
* App Clip Codes

**More information:**
* [App Clips](https://developer.apple.com/app-clips/)
* [Set up an App Clip Experience](https://help.apple.com/app-store-connect/#/dev5b665db74)

# Implementing
App Clip is implemented in the project as a new Target. Once added, you can share existing modules and resources from the project, for later use in App Clip, or you can create your own internally.

For proper operation, you need to link the application and the web server:

**Server Side**
![ServerSide](https://user-images.githubusercontent.com/67891065/103509029-e034f900-4e6a-11eb-9879-7aae1e87fed9.png)
Add an Associated Domain file (named apple-app-site-association) to the server and insert the following content where the first part is the Team ID and the second part is the Bundle ID App Clip of the Target.

You can also set up a Smart App Banner right away, which is a great way to redirect traffic from your site to the App Clip. If you have a full application, Smart App Banner calls it, not App Clip. To create the banner, you need to add the meta tag you see below:

```Ruby
<meta name="apple-itunes-app" content="app-id=myAppStoreID, app-clip-bundle-id=appClipBundleID, affiliate-data=myAffiliateData, app-argument=myAppArgument">
```

**App Side**

In Capabilities you need to add Associated Domains, where you need to list all the domains used with the service prefix "appclips:"

**More information:**
* [Creating an App Clip](https://developer.apple.com/documentation/app_clips/creating_an_app_clip_with_xcode)
* [Configuring Your App Clip’s Launch Experience](https://developer.apple.com/documentation/app_clips/configuring_your_app_clip_s_launch_experience)
* [Supporting Associated Domains](https://developer.apple.com/documentation/safariservices/supporting_associated_domains)

# Responding to Invocations
When the user launches App Clip, the application gets an NSUserActivity object that can be used to respond to the call. It can be caught in methods:

**SwiftUI’s life-cycle:**
```Ruby
onContinueUserActivity(_:perform:)
```

**SceneDelegate:**
```Ruby
scene(_:willConnectTo:options:)
scene(_:continue:)
```

**AppDelegate:**
```Ruby
application(_:continue:restorationHandler:)
```
**More information:**
* [Responding to Invocations](https://developer.apple.com/documentation/app_clips/responding_to_invocations)

# Additional Features
App Clip provides the ability to send notifications within 8 hours after each launch and check the user's location. When connected, an alert will appear in the App Clip card for the user. In turn, he can disable.

To connect the functions you need to change the variables in Info.plist that you see below:
![Additional Features](https://docs-assets.developer.apple.com/published/bd0a13fc90/rendered2x-1595291483.png)

**More information:**
* [Enabling Notifications](https://developer.apple.com/documentation/app_clips/enabling_notifications_in_app_clips)
* [APActivationPayload](https://developer.apple.com/documentation/app_clips/apactivationpayload)
* [Confirming the User’s Physical Location](https://developer.apple.com/documentation/app_clips/confirming_the_user_s_physical_location)

# Share Data Between the App Clip and the App
You need to use Groups to exchange data between App Clip and the corresponding application. The same Groups Capability is added for both application targets, for example:

```Ruby
group.exampleApp.appClipMigration
```
Once the group is created, the developer can use two ways to exchange data:
* FileManager Shared Container
* UserDefaults

**More information:**
* [Making Data Available to the App Clip’s Corresponding App](https://developer.apple.com/documentation/app_clips/making_data_available_to_the_app_clip_s_corresponding_app)

# Recommending an App Clip’s Corresponding App
App Clip allows you to recommend your app for download using SKOverlay.

**UIKit**
![Additional Features](https://user-images.githubusercontent.com/67891065/103511439-ba5e2300-4e6f-11eb-95e5-af54bc2ae2f2.png)
1. Create a configuration specifying the iTunes identifier of the application.
2. Create a SKOverlay object with the created configuration in mind.
3. Call the present method of SKOverlay.

**SwiftUI**

Use modifier:
```Ruby
appStoreOverlay(isPresented:configuration:)
```

**More information:**
* [Recommending an App Clip’s Corresponding App](https://developer.apple.com/documentation/app_clips/recommending_an_app_clip_s_corresponding_app)

# Limitations
App Clips use SwiftUI and UIKit and have access to the same frameworks as the full app. However, some technologies are limited. A list can be found in the [documentation](https://developer.apple.com/documentation/app_clips/choosing_the_right_functionality_for_your_app_clip).

Developed By
------------

* Kvasnetskyi Artem, Kosyi Vlad, CHI Software

License
--------

Copyright 2020 CHI Software.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
