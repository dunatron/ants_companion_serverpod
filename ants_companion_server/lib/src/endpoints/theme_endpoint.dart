import 'package:ants_companion_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ThemeEndpoint extends Endpoint {
  var dark = false;

  @override
  Future<void> streamOpened(StreamingSession session) async {
    /// this is bound the the current user
    sendStreamMessage(session, AntsTheme(dark: dark));
    session.messages.addListener('themeChange', (message) {
      // var theme = message as AntsTheme;
      sendStreamMessage(session, message);
    });
  }

  Future<void> changeTheme(Session session) async {
    dark = !dark;
    print('Theme darL $dark');
    session.messages.postMessage('themeChange', AntsTheme(dark: dark));
  }
}
