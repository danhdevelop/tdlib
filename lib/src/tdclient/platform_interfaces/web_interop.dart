@JS()
library tdlib.web_interop;

import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:js/js.dart';

@visibleForTesting
@JS()
abstract class Promise<T> {
  external factory Promise(void Function(void Function(T result) resolve, Function reject) executor);
  external Promise then(void Function(T result) onFulfilled, [Function onRejected]);
}

/**
 * Create TdClient.
 * @param {Object} options - Options for TDLib instance creation.
 * @param {TdClient~updateCallback} options.onUpdate - Callback for all incoming updates.
 * @param {string} [options.instanceName=tdlib] - Name of the TDLib instance. Currently only one instance of TdClient with a given name is allowed. All but one instances with the same name will be automatically closed. Usually, the newest non-background instance is kept alive. Files will be stored in an IndexedDb table with the same name.
 * @param {boolean} [options.isBackground=false] - Pass true if the instance is opened from the background.
 * @param {string} [options.jsLogVerbosityLevel=info] - The initial verbosity level of the JavaScript part of the code (one of 'error', 'warning', 'info', 'log', 'debug').
 * @param {number} [options.logVerbosityLevel=2] - The initial verbosity level for the TDLib internal logging (0-1023).
 * @param {boolean} [options.useDatabase=true] - Pass false to use TDLib without database and secret chats. It will significantly improve loading time, but some functionality will be unavailable.
 * @param {boolean} [options.readOnly=false] - For debug only. Pass true to open TDLib database in read-only mode
 * @param {string} [options.mode=auto] - For debug only. The type of the TDLib build to use. 'asmjs' for asm.js and 'wasm' for WebAssembly. If mode == 'auto' WebAbassembly will be used if supported by browser, asm.js otherwise.
 */

@JS("tdweb.default")
class TdWebPlatform {
  external factory TdWebPlatform(Map options);
  external bool wasInit;
  // external Promise<void> initialize([String? libPath]);
  external int createClientId();
  external String? receive();
  external void send(int clientId, String query);
  external String? execute(String query);
  external num getTimeout();
}
