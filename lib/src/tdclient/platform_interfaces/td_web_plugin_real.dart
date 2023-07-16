import 'td_plugin.dart';
import 'web_interop.dart';
import 'package:js/js_util.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// TDLib Web Library Instance.
class TdPluginImpl extends TdPlugin {
  late final TdWebPlatform _platform;

  // This class is set to be the default [TdPlugin].web instance.
  static void registerWith([Registrar? registrar]) {
    TdPlugin.initialize = initialize;
  }

  static Future<void> initialize([String? libPath]) async {
    TdWebPlatform platform = TdWebPlatform(jsify({
      'jsLogVerbosityLevel': 'info',
      'logVerbosityLevel': 2,
    }));
    // await promiseToFuture(platform.initialize(libPath));
    TdPlugin.instance = TdPluginImpl(platform);
  }

  TdPluginImpl(TdWebPlatform platform) : _platform = platform;

  @override
  int tdCreate() => _platform.createClientId();

  @override
  String? tdReceive([double? timeout]) => _platform.receive();

  @override
  void tdSend(int clientId, String event) => _platform.send(clientId, event);

  @override
  String? tdExecute(String event) => _platform.execute(event);

  @override
  num tdGetTimeout() => _platform.getTimeout();

  @override
  int tdJsonClientCreate() {
    throw UnsupportedError("tdJsonClientCreate not supported in web platform");
  }

  @override
  String? tdJsonClientExecute(String event) {
    throw UnsupportedError("tdJsonClientExecute not supported in web platform");
  }

  @override
  String? tdJsonClientReceive(int clientId, [double timeout = 0]) {
    throw UnsupportedError("tdJsonClientReceive is not supported in web platform");
  }

  @override
  void tdJsonClientSend(int clientId, String event) {
    throw UnsupportedError("tdJsonClientSend is not supported in web platform");
  }

  @override
  void tdJsonClientDestroy(int clientId) {
    throw UnsupportedError("tdJsonClientDestroy is not supported in web platform");
  }

  @override
  void removeLogMessageCallback() {
    throw UnsupportedError("removeLogMessageCallback is not supported in web platform");
  }

  @override
  void setLogMessageCallback(int maxVerbosityLevel, callback) {
    throw UnsupportedError("setLogMessageCallback is not supported in web platform");
  }
}
