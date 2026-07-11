plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.ireminder.ireminder"
    // file_picker's AAR requires compiling against API 36+.
    compileSdk = maxOf(36, flutter.compileSdkVersion)
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        // Required by flutter_local_notifications' AAR metadata.
        isCoreLibraryDesugaringEnabled = true
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.ireminder.ireminder"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        // flutter_local_notifications' exact-alarm scheduling needs API 23+.
        minSdk = maxOf(23, flutter.minSdkVersion)
        targetSdk = maxOf(36, flutter.targetSdkVersion)
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
            // R8 minification was crashing every scheduled notification at
            // fire time (Gson TypeToken reflection inside
            // flutter_local_notifications' persistence code loses its
            // generic signature once shrunk/obfuscated — see
            // proguard-rules.pro). Added targeted keep rules for that one
            // path, but the crash persisted on a real device retest,
            // meaning either that path or another R8-sensitive one is
            // still broken and there's no local Android toolchain here to
            // iterate on the exact rule set. For a personal-use, sideloaded
            // app the ~2x larger APK from skipping shrinking is a trivial
            // cost against a whole class of native reflection crashes —
            // simplest fix is turning R8 off entirely rather than
            // continuing to guess at keep rules blind.
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
