# flutter_local_notifications persists scheduled notifications to
# SharedPreferences via Gson, using generic TypeToken deserialization
# (FlutterLocalNotificationsPlugin.loadScheduledNotifications /
# saveScheduledNotification). Without these rules, R8 strips the generic
# signature Gson needs at runtime and every zonedSchedule() call crashes
# with "TypeToken must be created with a type argument" — this is exactly
# what happened on release builds before these rules were added.
-keep class com.dexterous.flutterlocalnotifications.models.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes InnerClasses
-dontwarn sun.misc.**

-keep class com.google.gson.stream.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
-keep,allowobfuscation,allowshrinking class com.google.gson.reflect.TypeToken
-keep,allowobfuscation,allowshrinking class * extends com.google.gson.reflect.TypeToken
