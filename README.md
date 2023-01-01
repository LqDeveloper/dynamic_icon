# dynamic_icon

Dynamically modify iOS and Android app icons

## Android Config 

It needs to be configured in the **AndroidManifest.xml** of the application,
where the name of activity-alias is the name of the application we modified, 
and enabled represents whether it is enabled

```xml

<application android:name="${applicationName}" android:icon="@mipmap/ic_launcher" android:label="dynamic_icon_example">
    <activity android:name=".MainActivity" android:exported="true" android:launchMode="singleTop" android:theme="@style/LaunchTheme"
        android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode" android:hardwareAccelerated="true"
        android:windowSoftInputMode="adjustResize">
        <meta-data android:name="io.flutter.embedding.android.NormalTheme" android:resource="@style/NormalTheme" />
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity>


    <activity-alias android:name=".MainActivity" android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
        android:enabled="true" android:exported="true" android:hardwareAccelerated="true" android:icon="@mipmap/ic_launcher" android:launchMode="singleTop" android:targetActivity=".MainActivity"
        android:theme="@style/LaunchTheme" android:windowSoftInputMode="adjustResize">
        <meta-data android:name="io.flutter.embedding.android.NormalTheme" android:resource="@style/NormalTheme" />
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity-alias>

    <activity-alias android:name=".icon2" android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
        android:enabled="false" android:exported="true" android:hardwareAccelerated="true" android:icon="@mipmap/icon2" android:launchMode="singleTop" android:targetActivity=".MainActivity"
        android:theme="@style/LaunchTheme" android:windowSoftInputMode="adjustResize">
        <meta-data android:name="io.flutter.embedding.android.NormalTheme" android:resource="@style/NormalTheme" />
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity-alias>


    <activity-alias android:name=".icon3" android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
        android:enabled="false" android:exported="true" android:hardwareAccelerated="true" android:icon="@mipmap/icon3" android:launchMode="singleTop" android:targetActivity=".MainActivity"
        android:theme="@style/LaunchTheme" android:windowSoftInputMode="adjustResize">
        <meta-data android:name="io.flutter.embedding.android.NormalTheme" android:resource="@style/NormalTheme" />
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
    </activity-alias>
    <meta-data android:name="flutterEmbedding" android:value="2" />
</application>

```
## iOS Config

info.plist -> Add Row (Icon files (iOS 5)) -> Add Row(CFBundleAlternateIcons) -> config AppIcon 

```xml
<key>CFBundleIcons</key>
	<dict>
        <!-- config Icon-->
		<key>CFBundleAlternateIcons</key>
		<dict>
			<key>icon2</key>
			<dict>
				<key>CFBundleIconFiles</key>
				<array>
					<string>icon2</string>
				</array>
				<key>UIPrerenderedIcon</key>
				<false/>
			</dict>
			<key>icon3</key>
			<dict>
				<key>CFBundleIconFiles</key>
				<array>
					<string>icon3</string>
				</array>
				<key>UIPrerenderedIcon</key>
				<false/>
			</dict>
		</dict>
        <!-- **************************** -->
		<key>CFBundlePrimaryIcon</key>
		<dict>
			<key>CFBundleIconFiles</key>
			<array>
				<string></string>
			</array>
			<key>CFBundleIconName</key>
			<string></string>
			<key>UIPrerenderedIcon</key>
			<false/>
		</dict>
		<key>UINewsstandIcon</key>
		<dict>
			<key>CFBundleIconFiles</key>
			<array>
				<string></string>
			</array>
			<key>UINewsstandBindingEdge</key>
			<string>UINewsstandBindingEdgeLeft</string>
			<key>UINewsstandBindingType</key>
			<string>UINewsstandBindingTypeMagazine</string>
		</dict>
	</dict>
```

## How to Use 

```dart
//iconList is the icon name you had config. the default icon name is 'default'.
final plugin = DynamicIcon(iconList: ['default', 'icon2', 'icon3']);
//setup app icon with name. if iconList not contain this name, will not work.
plugin.setupAppIcon('default');
```