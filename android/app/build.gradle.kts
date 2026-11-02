plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // Requiere android/app/src/<flavor>/google-services.json (lo coloca `flutterfire configure`).
    id("com.google.gms.google-services")
}

android {
    namespace = "com.innerchildstudios.vinculo"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.innerchildstudios.vinculo"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildFeatures {
        // AGP 9 desactiva resValue por defecto; los flavors lo usan para app_name.
        resValues = true
    }

    flavorDimensions += "environment"
    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "Vínculo Dev")
        }
        create("prod") {
            dimension = "environment"
            resValue("string", "app_name", "Vínculo")
        }
    }

    buildTypes {
        release {
            // TODO(fase-6-keystore): firma con la clave de debug (default de la plantilla).
            // Antes de subir a Play hace falta un keystore de release; ver HANDOFF.md §5.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
