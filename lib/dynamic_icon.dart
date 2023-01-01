import 'dynamic_icon_method_channel.dart';
import 'dynamic_icon_platform_interface.dart';

class DynamicIcon {
  DynamicIcon({required List<String> iconList}) {
    final instance = DynamicIconPlatform.instance;
    if (instance is MethodChannelDynamicIcon) {
      instance.iconList = iconList;
    }
  }

  Future<bool?> setupAppIcon(String iconName) {
    return DynamicIconPlatform.instance.setupAppIcon(iconName);
  }
}
