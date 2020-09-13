# Change App Launcher Name

## Android

进入到 **android/app/src/main/AndroidManifest.xml** 目录, 修改 `<application>` 标签下的 `android:label` 属性.

```xml
<application
  android:name="io.flutter.app.FlutterApplication"
  android:label="SukiChat"
  android:icon="@mipmap/launcher_icon">
```

## iOS

进入到 **ios/Runner/Info.plist** 目录, 修改 `CFBundleName` 属性.

```xml
<key>CFBundleName</key>
<string>WSukiChat</string>
```

## 扩展 1 - 修改 Launcher Icon

使用 [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) 这个库.
