# dynamic_icon

动态修改iOS和安卓应用图标

## Getting Started

## Android 配置

需要在应用的AndroidManifest.xml中配置，其中activity-alias的name就是我们修改的应用名称，enabled代表是否启用 例如：

```xml

<application android:name="${applicationName}" android:icon="@mipmap/ic_launcher" android:label="dynamic_icon_example">
    <activity android:name=".MainActivity" android:exported="true" android:launchMode="singleTop" android:theme="@style/LaunchTheme"
        android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode" android:hardwareAccelerated="true"
        android:windowSoftInputMode="adjustResize">
        <!-- Specifies an Android theme to apply to this Activity as soon as
             the Android process has started. This theme is visible to the user
             while the Flutter UI initializes. After that, this theme continues
             to determine the Window background behind the Flutter UI. -->
        <meta-data android:name="io.flutter.embedding.android.NormalTheme" android:resource="@style/NormalTheme" />
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity>


    <activity-alias android:name=".MainActivity" android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
        android:enabled="true" android:exported="true" android:hardwareAccelerated="true" android:icon="@mipmap/ic_launcher" android:launchMode="singleTop" android:targetActivity=".MainActivity"
        android:theme="@style/LaunchTheme" android:windowSoftInputMode="adjustResize">
        <!-- Specifies an Android theme to apply to this Activity as soon as
             the Android process has started. This theme is visible to the user
             while the Flutter UI initializes. After that, this theme continues
             to determine the Window background behind the Flutter UI. -->
        <meta-data android:name="io.flutter.embedding.android.NormalTheme" android:resource="@style/NormalTheme" />
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity-alias>

    <activity-alias android:name=".icon2" android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
        android:enabled="false" android:exported="true" android:hardwareAccelerated="true" android:icon="@mipmap/icon2" android:launchMode="singleTop" android:targetActivity=".MainActivity"
        android:theme="@style/LaunchTheme" android:windowSoftInputMode="adjustResize">
        <!-- Specifies an Android theme to apply to this Activity as soon as
             the Android process has started. This theme is visible to the user
             while the Flutter UI initializes. After that, this theme continues
             to determine the Window background behind the Flutter UI. -->
        <meta-data android:name="io.flutter.embedding.android.NormalTheme" android:resource="@style/NormalTheme" />
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity-alias>


    <activity-alias android:name=".icon3" android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
        android:enabled="false" android:exported="true" android:hardwareAccelerated="true" android:icon="@mipmap/icon3" android:launchMode="singleTop" android:targetActivity=".MainActivity"
        android:theme="@style/LaunchTheme" android:windowSoftInputMode="adjustResize">
        <!-- Specifies an Android theme to apply to this Activity as soon as
             the Android process has started. This theme is visible to the user
             while the Flutter UI initializes. After that, this theme continues
             to determine the Window background behind the Flutter UI. -->
        <meta-data android:name="io.flutter.embedding.android.NormalTheme" android:resource="@style/NormalTheme" />
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity-alias>
    <!-- Don't delete the meta-data below.
         This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
    <meta-data android:name="flutterEmbedding" android:value="2" />
</application>


```

## iOS配置

需要再info.plist中配置 在info.plist中右键 -> Add Row ： 输入Icon... 会有提示，选择Icon files（iOS 5）
<img src="https://img-blog.csdnimg.cn/img_convert/73884f4c51ef2f103e9c69af740b6fa0.png" />

<img src="https://img-blog.csdnimg.cn/img_convert/89dc96595a438e9c27b71022e6c4c0db.png" />


这里的Icon files（iOS 5）是个字典，其中可包含的Key值有CFBundlePrimaryIcon -> Primary Icon CFBundleAlternateIcons UINewsstandIcon -> Newsstand Icon

这里的Primary Icon是设置app的主icon，可以在这里的Icon files数组内添加，有多个的话，依次添加，也可以这里不用填写，直接在Assets.xcassets 里配置；

下面的Newsstand Icon，暂时用不到，不用管，也可以删除。 在 Icon files（iOS 5）内添加一个Key： CFBundleAlternateIcons ，类型为字典，在这个字典里配置我们所有需要动态修改的icon：键为icon的名称，
值为一个字典（这个字典里包含两个键：CFBundleIconFiles，其值类型为Array，内容为icon的名称；UIPrerenderedIcon， 其值类型为bool，内容为NO，也可以不加此key），例如：
<img src="https://img-blog.csdnimg.cn/img_convert/6a58e9dd18d9ff5e8120a46ed61597f8.png" />

<img src="https://img-blog.csdnimg.cn/img_convert/79ab8911398594fa834805c0f31c57d4.png" />


如果是添加了多个尺寸icon，也要在这里分别配置，以上面添加的sunshine图标为例：
<img src="https://img-blog.csdnimg.cn/img_convert/1cd7d98e1d369d54a729c4304d997452.png" />

## 使用

```dart
final plugin = DynamicIcon(iconList: ['default', 'icon2', 'icon3']);
plugin.setupAppIcon('default');
```
