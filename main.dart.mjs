// Returns whether the `js-string` built-in is supported.
function detectJsStringBuiltins() {
  let bytes = [
    0,   97,  115, 109, 1,   0,   0,  0,   1,   4,   1,   96,  0,
    0,   2,   23,  1,   14,  119, 97, 115, 109, 58,  106, 115, 45,
    115, 116, 114, 105, 110, 103, 4,  99,  97,  115, 116, 0,   0
  ];
  return WebAssembly.validate(
    new Uint8Array(bytes), {builtins: ['js-string']});
}

// Compiles a dart2wasm-generated main module from `source` which can then
// instantiatable via the `instantiate` method.
//
// `source` needs to be a `Response` object (or promise thereof) e.g. created
// via the `fetch()` JS API.
export async function compileStreaming(source) {
  const builtins = detectJsStringBuiltins()
      ? {builtins: ['js-string']} : {};
  return new CompiledApp(
      await WebAssembly.compileStreaming(source, builtins), builtins);
}

// Compiles a dart2wasm-generated wasm modules from `bytes` which is then
// instantiatable via the `instantiate` method.
export async function compile(bytes) {
  const builtins = detectJsStringBuiltins()
      ? {builtins: ['js-string']} : {};
  return new CompiledApp(await WebAssembly.compile(bytes, builtins), builtins);
}

// DEPRECATED: Please use `compile` or `compileStreaming` to get a compiled app,
// use `instantiate` method to get an instantiated app and then call
// `invokeMain` to invoke the main function.
export async function instantiate(modulePromise, importObjectPromise) {
  var moduleOrCompiledApp = await modulePromise;
  if (!(moduleOrCompiledApp instanceof CompiledApp)) {
    moduleOrCompiledApp = new CompiledApp(moduleOrCompiledApp);
  }
  const instantiatedApp = await moduleOrCompiledApp.instantiate(await importObjectPromise);
  return instantiatedApp.instantiatedModule;
}

// DEPRECATED: Please use `compile` or `compileStreaming` to get a compiled app,
// use `instantiate` method to get an instantiated app and then call
// `invokeMain` to invoke the main function.
export const invoke = (moduleInstance, ...args) => {
  moduleInstance.exports.$invokeMain(args);
}

class CompiledApp {
  constructor(module, builtins) {
    this.module = module;
    this.builtins = builtins;
  }

  // The second argument is an options object containing:
  // `loadDeferredWasm` is a JS function that takes a module name matching a
  //   wasm file produced by the dart2wasm compiler and returns the bytes to
  //   load the module. These bytes can be in either a format supported by
  //   `WebAssembly.compile` or `WebAssembly.compileStreaming`.
  async instantiate(additionalImports, {loadDeferredWasm} = {}) {
    let dartInstance;

    // Prints to the console
    function printToConsole(value) {
      if (typeof dartPrint == "function") {
        dartPrint(value);
        return;
      }
      if (typeof console == "object" && typeof console.log != "undefined") {
        console.log(value);
        return;
      }
      if (typeof print == "function") {
        print(value);
        return;
      }

      throw "Unable to print message: " + js;
    }

    // Converts a Dart List to a JS array. Any Dart objects will be converted, but
    // this will be cheap for JSValues.
    function arrayFromDartList(constructor, list) {
      const exports = dartInstance.exports;
      const read = exports.$listRead;
      const length = exports.$listLength(list);
      const array = new constructor(length);
      for (let i = 0; i < length; i++) {
        array[i] = read(list, i);
      }
      return array;
    }

    // A special symbol attached to functions that wrap Dart functions.
    const jsWrappedDartFunctionSymbol = Symbol("JSWrappedDartFunction");

    function finalizeWrapper(dartFunction, wrapped) {
      wrapped.dartFunction = dartFunction;
      wrapped[jsWrappedDartFunctionSymbol] = true;
      return wrapped;
    }

    // Imports
    const dart2wasm = {

      _1: (x0,x1,x2) => x0.set(x1,x2),
      _2: (x0,x1,x2) => x0.set(x1,x2),
      _6: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._6(f,arguments.length,x0) }),
      _7: x0 => new window.FinalizationRegistry(x0),
      _8: (x0,x1,x2,x3) => x0.register(x1,x2,x3),
      _9: (x0,x1) => x0.unregister(x1),
      _10: (x0,x1,x2) => x0.slice(x1,x2),
      _11: (x0,x1) => x0.decode(x1),
      _12: (x0,x1) => x0.segment(x1),
      _13: () => new TextDecoder(),
      _14: x0 => x0.buffer,
      _15: x0 => x0.wasmMemory,
      _16: () => globalThis.window._flutter_skwasmInstance,
      _17: x0 => x0.rasterStartMilliseconds,
      _18: x0 => x0.rasterEndMilliseconds,
      _19: x0 => x0.imageBitmaps,
      _192: x0 => x0.select(),
      _193: (x0,x1) => x0.append(x1),
      _194: x0 => x0.remove(),
      _197: x0 => x0.unlock(),
      _202: x0 => x0.getReader(),
      _211: x0 => new MutationObserver(x0),
      _222: (x0,x1,x2) => x0.addEventListener(x1,x2),
      _223: (x0,x1,x2) => x0.removeEventListener(x1,x2),
      _226: x0 => new ResizeObserver(x0),
      _229: (x0,x1) => new Intl.Segmenter(x0,x1),
      _230: x0 => x0.next(),
      _231: (x0,x1) => new Intl.v8BreakIterator(x0,x1),
      _308: x0 => x0.close(),
      _309: (x0,x1,x2,x3,x4) => ({type: x0,data: x1,premultiplyAlpha: x2,colorSpaceConversion: x3,preferAnimation: x4}),
      _310: x0 => new window.ImageDecoder(x0),
      _311: x0 => x0.close(),
      _312: x0 => ({frameIndex: x0}),
      _313: (x0,x1) => x0.decode(x1),
      _316: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._316(f,arguments.length,x0) }),
      _317: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._317(f,arguments.length,x0) }),
      _318: (x0,x1) => ({addView: x0,removeView: x1}),
      _319: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._319(f,arguments.length,x0) }),
      _320: f => finalizeWrapper(f, function() { return dartInstance.exports._320(f,arguments.length) }),
      _321: (x0,x1) => ({initializeEngine: x0,autoStart: x1}),
      _322: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._322(f,arguments.length,x0) }),
      _323: x0 => ({runApp: x0}),
      _324: x0 => new Uint8Array(x0),
      _326: x0 => x0.preventDefault(),
      _327: x0 => x0.stopPropagation(),
      _328: (x0,x1) => x0.addListener(x1),
      _329: (x0,x1) => x0.removeListener(x1),
      _330: (x0,x1) => x0.prepend(x1),
      _331: x0 => x0.remove(),
      _332: x0 => x0.disconnect(),
      _333: (x0,x1) => x0.addListener(x1),
      _334: (x0,x1) => x0.removeListener(x1),
      _336: (x0,x1) => x0.append(x1),
      _337: x0 => x0.remove(),
      _338: x0 => x0.stopPropagation(),
      _342: x0 => x0.preventDefault(),
      _343: (x0,x1) => x0.append(x1),
      _344: x0 => x0.remove(),
      _345: x0 => x0.preventDefault(),
      _350: (x0,x1) => x0.removeChild(x1),
      _351: (x0,x1) => x0.appendChild(x1),
      _352: (x0,x1,x2) => x0.insertBefore(x1,x2),
      _353: (x0,x1) => x0.appendChild(x1),
      _354: (x0,x1) => x0.transferFromImageBitmap(x1),
      _355: (x0,x1) => x0.appendChild(x1),
      _356: (x0,x1) => x0.append(x1),
      _357: (x0,x1) => x0.append(x1),
      _358: (x0,x1) => x0.append(x1),
      _359: x0 => x0.remove(),
      _360: x0 => x0.remove(),
      _361: x0 => x0.remove(),
      _362: (x0,x1) => x0.appendChild(x1),
      _363: (x0,x1) => x0.appendChild(x1),
      _364: x0 => x0.remove(),
      _365: (x0,x1) => x0.append(x1),
      _366: (x0,x1) => x0.append(x1),
      _367: x0 => x0.remove(),
      _368: (x0,x1) => x0.append(x1),
      _369: (x0,x1) => x0.append(x1),
      _370: (x0,x1,x2) => x0.insertBefore(x1,x2),
      _371: (x0,x1) => x0.append(x1),
      _372: (x0,x1,x2) => x0.insertBefore(x1,x2),
      _373: x0 => x0.remove(),
      _374: x0 => x0.remove(),
      _375: (x0,x1) => x0.append(x1),
      _376: x0 => x0.remove(),
      _377: (x0,x1) => x0.append(x1),
      _378: x0 => x0.remove(),
      _379: x0 => x0.remove(),
      _380: x0 => x0.getBoundingClientRect(),
      _381: x0 => x0.remove(),
      _394: (x0,x1) => x0.append(x1),
      _395: x0 => x0.remove(),
      _396: (x0,x1) => x0.append(x1),
      _397: (x0,x1,x2) => x0.insertBefore(x1,x2),
      _398: x0 => x0.preventDefault(),
      _399: x0 => x0.preventDefault(),
      _400: x0 => x0.preventDefault(),
      _401: x0 => x0.preventDefault(),
      _402: x0 => x0.remove(),
      _403: (x0,x1) => x0.observe(x1),
      _404: x0 => x0.disconnect(),
      _405: (x0,x1) => x0.appendChild(x1),
      _406: (x0,x1) => x0.appendChild(x1),
      _407: (x0,x1) => x0.appendChild(x1),
      _408: (x0,x1) => x0.append(x1),
      _409: x0 => x0.remove(),
      _410: (x0,x1) => x0.append(x1),
      _411: (x0,x1) => x0.append(x1),
      _412: (x0,x1) => x0.appendChild(x1),
      _413: (x0,x1) => x0.append(x1),
      _414: x0 => x0.remove(),
      _415: (x0,x1) => x0.append(x1),
      _419: (x0,x1) => x0.appendChild(x1),
      _420: x0 => x0.remove(),
      _979: () => globalThis.window.flutterConfiguration,
      _980: x0 => x0.assetBase,
      _985: x0 => x0.debugShowSemanticsNodes,
      _986: x0 => x0.hostElement,
      _987: x0 => x0.multiViewEnabled,
      _988: x0 => x0.nonce,
      _990: x0 => x0.fontFallbackBaseUrl,
      _991: x0 => x0.useColorEmoji,
      _996: x0 => x0.console,
      _997: x0 => x0.devicePixelRatio,
      _998: x0 => x0.document,
      _999: x0 => x0.history,
      _1000: x0 => x0.innerHeight,
      _1001: x0 => x0.innerWidth,
      _1002: x0 => x0.location,
      _1003: x0 => x0.navigator,
      _1004: x0 => x0.visualViewport,
      _1005: x0 => x0.performance,
      _1008: (x0,x1) => x0.dispatchEvent(x1),
      _1009: (x0,x1) => x0.matchMedia(x1),
      _1011: (x0,x1) => x0.getComputedStyle(x1),
      _1012: x0 => x0.screen,
      _1013: (x0,x1) => x0.requestAnimationFrame(x1),
      _1014: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1014(f,arguments.length,x0) }),
      _1019: (x0,x1) => x0.warn(x1),
      _1021: (x0,x1) => x0.debug(x1),
      _1022: () => globalThis.window,
      _1023: () => globalThis.Intl,
      _1024: () => globalThis.Symbol,
      _1027: x0 => x0.clipboard,
      _1028: x0 => x0.maxTouchPoints,
      _1029: x0 => x0.vendor,
      _1030: x0 => x0.language,
      _1031: x0 => x0.platform,
      _1032: x0 => x0.userAgent,
      _1033: x0 => x0.languages,
      _1034: x0 => x0.documentElement,
      _1035: (x0,x1) => x0.querySelector(x1),
      _1038: (x0,x1) => x0.createElement(x1),
      _1039: (x0,x1) => x0.execCommand(x1),
      _1043: (x0,x1) => x0.createTextNode(x1),
      _1044: (x0,x1) => x0.createEvent(x1),
      _1048: x0 => x0.head,
      _1049: x0 => x0.body,
      _1050: (x0,x1) => x0.title = x1,
      _1053: x0 => x0.activeElement,
      _1055: x0 => x0.visibilityState,
      _1057: x0 => x0.hasFocus(),
      _1058: () => globalThis.document,
      _1059: (x0,x1,x2,x3) => x0.addEventListener(x1,x2,x3),
      _1060: (x0,x1,x2,x3) => x0.addEventListener(x1,x2,x3),
      _1063: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1063(f,arguments.length,x0) }),
      _1064: x0 => x0.target,
      _1066: x0 => x0.timeStamp,
      _1067: x0 => x0.type,
      _1069: x0 => x0.preventDefault(),
      _1071: (x0,x1,x2,x3) => x0.initEvent(x1,x2,x3),
      _1078: x0 => x0.firstChild,
      _1083: x0 => x0.parentElement,
      _1085: x0 => x0.parentNode,
      _1088: (x0,x1) => x0.removeChild(x1),
      _1089: (x0,x1) => x0.removeChild(x1),
      _1090: x0 => x0.isConnected,
      _1091: (x0,x1) => x0.textContent = x1,
      _1093: (x0,x1) => x0.contains(x1),
      _1099: x0 => x0.firstElementChild,
      _1101: x0 => x0.nextElementSibling,
      _1102: x0 => x0.clientHeight,
      _1103: x0 => x0.clientWidth,
      _1104: x0 => x0.offsetHeight,
      _1105: x0 => x0.offsetWidth,
      _1106: x0 => x0.id,
      _1107: (x0,x1) => x0.id = x1,
      _1110: (x0,x1) => x0.spellcheck = x1,
      _1111: x0 => x0.tagName,
      _1112: x0 => x0.style,
      _1114: (x0,x1) => x0.append(x1),
      _1115: (x0,x1) => x0.getAttribute(x1),
      _1116: x0 => x0.getBoundingClientRect(),
      _1119: (x0,x1) => x0.closest(x1),
      _1122: (x0,x1) => x0.querySelectorAll(x1),
      _1124: x0 => x0.remove(),
      _1125: (x0,x1,x2) => x0.setAttribute(x1,x2),
      _1126: (x0,x1) => x0.removeAttribute(x1),
      _1127: (x0,x1) => x0.tabIndex = x1,
      _1129: (x0,x1) => x0.focus(x1),
      _1130: x0 => x0.scrollTop,
      _1131: (x0,x1) => x0.scrollTop = x1,
      _1132: x0 => x0.scrollLeft,
      _1133: (x0,x1) => x0.scrollLeft = x1,
      _1134: x0 => x0.classList,
      _1135: (x0,x1) => x0.className = x1,
      _1140: (x0,x1) => x0.getElementsByClassName(x1),
      _1142: x0 => x0.click(),
      _1144: (x0,x1) => x0.hasAttribute(x1),
      _1147: (x0,x1) => x0.attachShadow(x1),
      _1152: (x0,x1) => x0.getPropertyValue(x1),
      _1154: (x0,x1,x2,x3) => x0.setProperty(x1,x2,x3),
      _1156: (x0,x1) => x0.removeProperty(x1),
      _1158: x0 => x0.offsetLeft,
      _1159: x0 => x0.offsetTop,
      _1160: x0 => x0.offsetParent,
      _1162: (x0,x1) => x0.name = x1,
      _1163: x0 => x0.content,
      _1164: (x0,x1) => x0.content = x1,
      _1182: (x0,x1) => x0.nonce = x1,
      _1187: x0 => x0.now(),
      _1189: (x0,x1) => x0.width = x1,
      _1191: (x0,x1) => x0.height = x1,
      _1196: (x0,x1) => x0.getContext(x1),
      _1273: (x0,x1) => x0.fetch(x1),
      _1274: x0 => x0.status,
      _1275: x0 => x0.headers,
      _1276: x0 => x0.body,
      _1278: x0 => x0.arrayBuffer(),
      _1281: (x0,x1) => x0.get(x1),
      _1283: x0 => x0.read(),
      _1284: x0 => x0.value,
      _1285: x0 => x0.done,
      _1287: x0 => x0.name,
      _1288: x0 => x0.x,
      _1289: x0 => x0.y,
      _1292: x0 => x0.top,
      _1293: x0 => x0.right,
      _1294: x0 => x0.bottom,
      _1295: x0 => x0.left,
      _1304: x0 => x0.height,
      _1305: x0 => x0.width,
      _1306: (x0,x1) => x0.value = x1,
      _1308: (x0,x1) => x0.placeholder = x1,
      _1309: (x0,x1) => x0.name = x1,
      _1310: x0 => x0.selectionDirection,
      _1311: x0 => x0.selectionStart,
      _1312: x0 => x0.selectionEnd,
      _1315: x0 => x0.value,
      _1317: (x0,x1,x2) => x0.setSelectionRange(x1,x2),
      _1321: x0 => x0.readText(),
      _1322: (x0,x1) => x0.writeText(x1),
      _1323: x0 => x0.altKey,
      _1324: x0 => x0.code,
      _1325: x0 => x0.ctrlKey,
      _1326: x0 => x0.key,
      _1327: x0 => x0.keyCode,
      _1328: x0 => x0.location,
      _1329: x0 => x0.metaKey,
      _1330: x0 => x0.repeat,
      _1331: x0 => x0.shiftKey,
      _1332: x0 => x0.isComposing,
      _1333: (x0,x1) => x0.getModifierState(x1),
      _1335: x0 => x0.state,
      _1336: (x0,x1) => x0.go(x1),
      _1338: (x0,x1,x2,x3) => x0.pushState(x1,x2,x3),
      _1339: (x0,x1,x2,x3) => x0.replaceState(x1,x2,x3),
      _1340: x0 => x0.pathname,
      _1341: x0 => x0.search,
      _1342: x0 => x0.hash,
      _1346: x0 => x0.state,
      _1352: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1352(f,arguments.length,x0,x1) }),
      _1354: (x0,x1,x2) => x0.observe(x1,x2),
      _1357: x0 => x0.attributeName,
      _1358: x0 => x0.type,
      _1359: x0 => x0.matches,
      _1362: x0 => x0.matches,
      _1364: x0 => x0.relatedTarget,
      _1365: x0 => x0.clientX,
      _1366: x0 => x0.clientY,
      _1367: x0 => x0.offsetX,
      _1368: x0 => x0.offsetY,
      _1371: x0 => x0.button,
      _1372: x0 => x0.buttons,
      _1373: x0 => x0.ctrlKey,
      _1374: (x0,x1) => x0.getModifierState(x1),
      _1377: x0 => x0.pointerId,
      _1378: x0 => x0.pointerType,
      _1379: x0 => x0.pressure,
      _1380: x0 => x0.tiltX,
      _1381: x0 => x0.tiltY,
      _1382: x0 => x0.getCoalescedEvents(),
      _1384: x0 => x0.deltaX,
      _1385: x0 => x0.deltaY,
      _1386: x0 => x0.wheelDeltaX,
      _1387: x0 => x0.wheelDeltaY,
      _1388: x0 => x0.deltaMode,
      _1394: x0 => x0.changedTouches,
      _1396: x0 => x0.clientX,
      _1397: x0 => x0.clientY,
      _1399: x0 => x0.data,
      _1402: (x0,x1) => x0.disabled = x1,
      _1403: (x0,x1) => x0.type = x1,
      _1404: (x0,x1) => x0.max = x1,
      _1405: (x0,x1) => x0.min = x1,
      _1406: (x0,x1) => x0.value = x1,
      _1407: x0 => x0.value,
      _1408: x0 => x0.disabled,
      _1409: (x0,x1) => x0.disabled = x1,
      _1410: (x0,x1) => x0.placeholder = x1,
      _1411: (x0,x1) => x0.name = x1,
      _1412: (x0,x1) => x0.autocomplete = x1,
      _1413: x0 => x0.selectionDirection,
      _1414: x0 => x0.selectionStart,
      _1415: x0 => x0.selectionEnd,
      _1419: (x0,x1,x2) => x0.setSelectionRange(x1,x2),
      _1424: (x0,x1) => x0.add(x1),
      _1427: (x0,x1) => x0.noValidate = x1,
      _1428: (x0,x1) => x0.method = x1,
      _1429: (x0,x1) => x0.action = x1,
      _1454: x0 => x0.orientation,
      _1455: x0 => x0.width,
      _1456: x0 => x0.height,
      _1457: (x0,x1) => x0.lock(x1),
      _1475: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1475(f,arguments.length,x0,x1) }),
      _1486: x0 => x0.length,
      _1487: (x0,x1) => x0.item(x1),
      _1488: x0 => x0.length,
      _1489: (x0,x1) => x0.item(x1),
      _1490: x0 => x0.iterator,
      _1491: x0 => x0.Segmenter,
      _1492: x0 => x0.v8BreakIterator,
      _1495: x0 => x0.done,
      _1496: x0 => x0.value,
      _1497: x0 => x0.index,
      _1501: (x0,x1) => x0.adoptText(x1),
      _1502: x0 => x0.first(),
      _1503: x0 => x0.next(),
      _1504: x0 => x0.current(),
      _1516: x0 => x0.hostElement,
      _1517: x0 => x0.viewConstraints,
      _1519: x0 => x0.maxHeight,
      _1520: x0 => x0.maxWidth,
      _1521: x0 => x0.minHeight,
      _1522: x0 => x0.minWidth,
      _1523: x0 => x0.loader,
      _1524: () => globalThis._flutter,
      _1525: (x0,x1) => x0.didCreateEngineInitializer(x1),
      _1526: (x0,x1,x2) => x0.call(x1,x2),
      _1527: () => globalThis.Promise,
      _1528: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1528(f,arguments.length,x0,x1) }),
      _1532: x0 => x0.length,
      _1535: x0 => x0.tracks,
      _1539: x0 => x0.image,
      _1544: x0 => x0.codedWidth,
      _1545: x0 => x0.codedHeight,
      _1548: x0 => x0.duration,
      _1552: x0 => x0.ready,
      _1553: x0 => x0.selectedTrack,
      _1554: x0 => x0.repetitionCount,
      _1555: x0 => x0.frameCount,
      _1599: (x0,x1,x2,x3) => x0.open(x1,x2,x3),
      _1600: (x0,x1,x2) => x0.setRequestHeader(x1,x2),
      _1601: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1601(f,arguments.length,x0) }),
      _1602: (x0,x1,x2) => x0.addEventListener(x1,x2),
      _1603: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1603(f,arguments.length,x0) }),
      _1604: x0 => x0.send(),
      _1605: () => new XMLHttpRequest(),
      _1616: (x0,x1,x2,x3) => x0.addEventListener(x1,x2,x3),
      _1617: (x0,x1,x2) => x0.addEventListener(x1,x2),
      _1618: (x0,x1) => x0.createElement(x1),
      _1625: (x0,x1,x2) => x0.removeEventListener(x1,x2),
      _1626: (x0,x1,x2,x3) => x0.removeEventListener(x1,x2,x3),
      _1629: (x0,x1,x2,x3) => x0.open(x1,x2,x3),
      _1630: (x0,x1) => x0.append(x1),
      _1631: (x0,x1) => x0.append(x1),
      _1632: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1632(f,arguments.length,x0) }),
      _1633: f => finalizeWrapper(f, function() { return dartInstance.exports._1633(f,arguments.length) }),
      _1634: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1634(f,arguments.length,x0) }),
      _1635: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1635(f,arguments.length,x0) }),
      _1636: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1636(f,arguments.length,x0,x1) }),
      _1637: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1637(f,arguments.length,x0,x1) }),
      _1638: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1638(f,arguments.length,x0,x1) }),
      _1639: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1639(f,arguments.length,x0,x1) }),
      _1640: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1640(f,arguments.length,x0,x1) }),
      _1641: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1641(f,arguments.length,x0,x1) }),
      _1642: f => finalizeWrapper(f, function(x0,x1) { return dartInstance.exports._1642(f,arguments.length,x0,x1) }),
      _1643: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1643(f,arguments.length,x0) }),
      _1644: (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11) => globalThis.flutter_dropzone_web.create(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11),
      _1645: (x0,x1) => globalThis.flutter_dropzone_web.setMIME(x0,x1),
      _1657: x0 => x0.arrayBuffer(),
      _1664: (x0,x1) => x0.querySelector(x1),
      _1665: (x0,x1) => x0.querySelector(x1),
      _1666: (x0,x1) => x0.item(x1),
      _1669: () => new FileReader(),
      _1670: (x0,x1) => x0.readAsArrayBuffer(x1),
      _1671: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1671(f,arguments.length,x0) }),
      _1672: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1672(f,arguments.length,x0) }),
      _1673: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1673(f,arguments.length,x0) }),
      _1674: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1674(f,arguments.length,x0) }),
      _1675: (x0,x1) => x0.removeChild(x1),
      _1676: x0 => x0.click(),
      _1677: (x0,x1) => x0.removeChild(x1),
      _1680: (x0,x1) => x0.removeItem(x1),
      _1684: (x0,x1,x2,x3,x4,x5) => x0.importKey(x1,x2,x3,x4,x5),
      _1685: (x0,x1,x2,x3) => x0.generateKey(x1,x2,x3),
      _1686: (x0,x1,x2) => x0.exportKey(x1,x2),
      _1687: (x0,x1) => x0.getRandomValues(x1),
      _1688: (x0,x1,x2,x3) => x0.encrypt(x1,x2,x3),
      _1689: (x0,x1,x2,x3) => x0.decrypt(x1,x2,x3),
      _1690: x0 => ({type: x0}),
      _1691: (x0,x1) => new Blob(x0,x1),
      _1692: x0 => globalThis.URL.createObjectURL(x0),
      _1693: x0 => x0.click(),
      _1694: x0 => x0.remove(),
      _1705: x0 => new Array(x0),
      _1707: x0 => x0.length,
      _1709: (x0,x1) => x0[x1],
      _1710: (x0,x1,x2) => x0[x1] = x2,
      _1713: (x0,x1,x2) => new DataView(x0,x1,x2),
      _1715: x0 => new Int8Array(x0),
      _1716: (x0,x1,x2) => new Uint8Array(x0,x1,x2),
      _1717: x0 => new Uint8Array(x0),
      _1721: x0 => new Int16Array(x0),
      _1723: x0 => new Uint16Array(x0),
      _1725: x0 => new Int32Array(x0),
      _1727: x0 => new Uint32Array(x0),
      _1729: x0 => new Float32Array(x0),
      _1731: x0 => new Float64Array(x0),
      _1737: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1737(f,arguments.length,x0) }),
      _1738: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1738(f,arguments.length,x0) }),
      _1743: (o, a) => o + a,
      _1764: (decoder, codeUnits) => decoder.decode(codeUnits),
      _1765: () => new TextDecoder("utf-8", {fatal: true}),
      _1766: () => new TextDecoder("utf-8", {fatal: false}),
      _1767: x0 => new WeakRef(x0),
      _1768: x0 => x0.deref(),
      _1774: Date.now,
      _1776: s => new Date(s * 1000).getTimezoneOffset() * 60,
      _1777: s => {
        if (!/^\s*[+-]?(?:Infinity|NaN|(?:\.\d+|\d+(?:\.\d*)?)(?:[eE][+-]?\d+)?)\s*$/.test(s)) {
          return NaN;
        }
        return parseFloat(s);
      },
      _1778: () => {
        let stackString = new Error().stack.toString();
        let frames = stackString.split('\n');
        let drop = 2;
        if (frames[0] === 'Error') {
            drop += 1;
        }
        return frames.slice(drop).join('\n');
      },
      _1779: () => typeof dartUseDateNowForTicks !== "undefined",
      _1780: () => 1000 * performance.now(),
      _1781: () => Date.now(),
      _1782: () => {
        // On browsers return `globalThis.location.href`
        if (globalThis.location != null) {
          return globalThis.location.href;
        }
        return null;
      },
      _1783: () => {
        return typeof process != "undefined" &&
               Object.prototype.toString.call(process) == "[object process]" &&
               process.platform == "win32"
      },
      _1784: () => new WeakMap(),
      _1785: (map, o) => map.get(o),
      _1786: (map, o, v) => map.set(o, v),
      _1787: () => globalThis.WeakRef,
      _1797: s => JSON.stringify(s),
      _1798: s => printToConsole(s),
      _1799: a => a.join(''),
      _1800: (o, a, b) => o.replace(a, b),
      _1802: (s, t) => s.split(t),
      _1803: s => s.toLowerCase(),
      _1804: s => s.toUpperCase(),
      _1805: s => s.trim(),
      _1806: s => s.trimLeft(),
      _1807: s => s.trimRight(),
      _1809: (s, p, i) => s.indexOf(p, i),
      _1810: (s, p, i) => s.lastIndexOf(p, i),
      _1811: (s) => s.replace(/\$/g, "$$$$"),
      _1812: Object.is,
      _1813: s => s.toUpperCase(),
      _1814: s => s.toLowerCase(),
      _1815: (a, i) => a.push(i),
      _1819: a => a.pop(),
      _1820: (a, i) => a.splice(i, 1),
      _1822: (a, s) => a.join(s),
      _1823: (a, s, e) => a.slice(s, e),
      _1825: (a, b) => a == b ? 0 : (a > b ? 1 : -1),
      _1826: a => a.length,
      _1828: (a, i) => a[i],
      _1829: (a, i, v) => a[i] = v,
      _1831: (o, offsetInBytes, lengthInBytes) => {
        var dst = new ArrayBuffer(lengthInBytes);
        new Uint8Array(dst).set(new Uint8Array(o, offsetInBytes, lengthInBytes));
        return new DataView(dst);
      },
      _1832: (o, start, length) => new Uint8Array(o.buffer, o.byteOffset + start, length),
      _1833: (o, start, length) => new Int8Array(o.buffer, o.byteOffset + start, length),
      _1834: (o, start, length) => new Uint8ClampedArray(o.buffer, o.byteOffset + start, length),
      _1835: (o, start, length) => new Uint16Array(o.buffer, o.byteOffset + start, length),
      _1836: (o, start, length) => new Int16Array(o.buffer, o.byteOffset + start, length),
      _1837: (o, start, length) => new Uint32Array(o.buffer, o.byteOffset + start, length),
      _1838: (o, start, length) => new Int32Array(o.buffer, o.byteOffset + start, length),
      _1840: (o, start, length) => new BigInt64Array(o.buffer, o.byteOffset + start, length),
      _1841: (o, start, length) => new Float32Array(o.buffer, o.byteOffset + start, length),
      _1842: (o, start, length) => new Float64Array(o.buffer, o.byteOffset + start, length),
      _1843: (t, s) => t.set(s),
      _1845: (o) => new DataView(o.buffer, o.byteOffset, o.byteLength),
      _1846: o => o.byteLength,
      _1847: o => o.buffer,
      _1848: o => o.byteOffset,
      _1849: Function.prototype.call.bind(Object.getOwnPropertyDescriptor(DataView.prototype, 'byteLength').get),
      _1850: (b, o) => new DataView(b, o),
      _1851: (b, o, l) => new DataView(b, o, l),
      _1852: Function.prototype.call.bind(DataView.prototype.getUint8),
      _1853: Function.prototype.call.bind(DataView.prototype.setUint8),
      _1854: Function.prototype.call.bind(DataView.prototype.getInt8),
      _1855: Function.prototype.call.bind(DataView.prototype.setInt8),
      _1856: Function.prototype.call.bind(DataView.prototype.getUint16),
      _1857: Function.prototype.call.bind(DataView.prototype.setUint16),
      _1858: Function.prototype.call.bind(DataView.prototype.getInt16),
      _1859: Function.prototype.call.bind(DataView.prototype.setInt16),
      _1860: Function.prototype.call.bind(DataView.prototype.getUint32),
      _1861: Function.prototype.call.bind(DataView.prototype.setUint32),
      _1862: Function.prototype.call.bind(DataView.prototype.getInt32),
      _1863: Function.prototype.call.bind(DataView.prototype.setInt32),
      _1866: Function.prototype.call.bind(DataView.prototype.getBigInt64),
      _1867: Function.prototype.call.bind(DataView.prototype.setBigInt64),
      _1868: Function.prototype.call.bind(DataView.prototype.getFloat32),
      _1869: Function.prototype.call.bind(DataView.prototype.setFloat32),
      _1870: Function.prototype.call.bind(DataView.prototype.getFloat64),
      _1871: Function.prototype.call.bind(DataView.prototype.setFloat64),
      _1892: (x0,x1) => x0.send(x1),
      _1896: (o, t) => o instanceof t,
      _1898: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1898(f,arguments.length,x0) }),
      _1899: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1899(f,arguments.length,x0) }),
      _1900: o => Object.keys(o),
      _1901: (ms, c) =>
      setTimeout(() => dartInstance.exports.$invokeCallback(c),ms),
      _1902: (handle) => clearTimeout(handle),
      _1903: (ms, c) =>
      setInterval(() => dartInstance.exports.$invokeCallback(c), ms),
      _1904: (handle) => clearInterval(handle),
      _1905: (c) =>
      queueMicrotask(() => dartInstance.exports.$invokeCallback(c)),
      _1906: () => Date.now(),
      _1907: () => new XMLHttpRequest(),
      _1908: (x0,x1,x2,x3) => x0.open(x1,x2,x3),
      _1909: (x0,x1,x2) => x0.setRequestHeader(x1,x2),
      _1910: x0 => x0.abort(),
      _1911: x0 => x0.getAllResponseHeaders(),
      _1925: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1925(f,arguments.length,x0) }),
      _1926: f => finalizeWrapper(f, function(x0) { return dartInstance.exports._1926(f,arguments.length,x0) }),
      _1948: (x0,x1) => x0.getItem(x1),
      _1949: (x0,x1,x2) => x0.setItem(x1,x2),
      _1951: (s, m) => {
        try {
          return new RegExp(s, m);
        } catch (e) {
          return String(e);
        }
      },
      _1952: (x0,x1) => x0.exec(x1),
      _1953: (x0,x1) => x0.test(x1),
      _1954: (x0,x1) => x0.exec(x1),
      _1955: (x0,x1) => x0.exec(x1),
      _1956: x0 => x0.pop(),
      _1958: o => o === undefined,
      _1977: o => typeof o === 'function' && o[jsWrappedDartFunctionSymbol] === true,
      _1979: o => {
        const proto = Object.getPrototypeOf(o);
        return proto === Object.prototype || proto === null;
      },
      _1980: o => o instanceof RegExp,
      _1981: (l, r) => l === r,
      _1982: o => o,
      _1983: o => o,
      _1984: o => o,
      _1985: b => !!b,
      _1986: o => o.length,
      _1989: (o, i) => o[i],
      _1990: f => f.dartFunction,
      _1991: l => arrayFromDartList(Int8Array, l),
      _1992: l => arrayFromDartList(Uint8Array, l),
      _1993: l => arrayFromDartList(Uint8ClampedArray, l),
      _1994: l => arrayFromDartList(Int16Array, l),
      _1995: l => arrayFromDartList(Uint16Array, l),
      _1996: l => arrayFromDartList(Int32Array, l),
      _1997: l => arrayFromDartList(Uint32Array, l),
      _1998: l => arrayFromDartList(Float32Array, l),
      _1999: l => arrayFromDartList(Float64Array, l),
      _2000: x0 => new ArrayBuffer(x0),
      _2001: (data, length) => {
        const getValue = dartInstance.exports.$byteDataGetUint8;
        const view = new DataView(new ArrayBuffer(length));
        for (let i = 0; i < length; i++) {
          view.setUint8(i, getValue(data, i));
        }
        return view;
      },
      _2002: l => arrayFromDartList(Array, l),
      _2003: (s, length) => {
        if (length == 0) return '';
      
        const read = dartInstance.exports.$stringRead1;
        let result = '';
        let index = 0;
        const chunkLength = Math.min(length - index, 500);
        let array = new Array(chunkLength);
        while (index < length) {
          const newChunkLength = Math.min(length - index, 500);
          for (let i = 0; i < newChunkLength; i++) {
            array[i] = read(s, index++);
          }
          if (newChunkLength < chunkLength) {
            array = array.slice(0, newChunkLength);
          }
          result += String.fromCharCode(...array);
        }
        return result;
      },
      _2004: (s, length) => {
        if (length == 0) return '';
      
        const read = dartInstance.exports.$stringRead2;
        let result = '';
        let index = 0;
        const chunkLength = Math.min(length - index, 500);
        let array = new Array(chunkLength);
        while (index < length) {
          const newChunkLength = Math.min(length - index, 500);
          for (let i = 0; i < newChunkLength; i++) {
            array[i] = read(s, index++);
          }
          if (newChunkLength < chunkLength) {
            array = array.slice(0, newChunkLength);
          }
          result += String.fromCharCode(...array);
        }
        return result;
      },
      _2005: (s) => {
        let length = s.length;
        let range = 0;
        for (let i = 0; i < length; i++) {
          range |= s.codePointAt(i);
        }
        const exports = dartInstance.exports;
        if (range < 256) {
          if (length <= 10) {
            if (length == 1) {
              return exports.$stringAllocate1_1(s.codePointAt(0));
            }
            if (length == 2) {
              return exports.$stringAllocate1_2(s.codePointAt(0), s.codePointAt(1));
            }
            if (length == 3) {
              return exports.$stringAllocate1_3(s.codePointAt(0), s.codePointAt(1), s.codePointAt(2));
            }
            if (length == 4) {
              return exports.$stringAllocate1_4(s.codePointAt(0), s.codePointAt(1), s.codePointAt(2), s.codePointAt(3));
            }
            if (length == 5) {
              return exports.$stringAllocate1_5(s.codePointAt(0), s.codePointAt(1), s.codePointAt(2), s.codePointAt(3), s.codePointAt(4));
            }
            if (length == 6) {
              return exports.$stringAllocate1_6(s.codePointAt(0), s.codePointAt(1), s.codePointAt(2), s.codePointAt(3), s.codePointAt(4), s.codePointAt(5));
            }
            if (length == 7) {
              return exports.$stringAllocate1_7(s.codePointAt(0), s.codePointAt(1), s.codePointAt(2), s.codePointAt(3), s.codePointAt(4), s.codePointAt(5), s.codePointAt(6));
            }
            if (length == 8) {
              return exports.$stringAllocate1_8(s.codePointAt(0), s.codePointAt(1), s.codePointAt(2), s.codePointAt(3), s.codePointAt(4), s.codePointAt(5), s.codePointAt(6), s.codePointAt(7));
            }
            if (length == 9) {
              return exports.$stringAllocate1_9(s.codePointAt(0), s.codePointAt(1), s.codePointAt(2), s.codePointAt(3), s.codePointAt(4), s.codePointAt(5), s.codePointAt(6), s.codePointAt(7), s.codePointAt(8));
            }
            if (length == 10) {
              return exports.$stringAllocate1_10(s.codePointAt(0), s.codePointAt(1), s.codePointAt(2), s.codePointAt(3), s.codePointAt(4), s.codePointAt(5), s.codePointAt(6), s.codePointAt(7), s.codePointAt(8), s.codePointAt(9));
            }
          }
          const dartString = exports.$stringAllocate1(length);
          const write = exports.$stringWrite1;
          for (let i = 0; i < length; i++) {
            write(dartString, i, s.codePointAt(i));
          }
          return dartString;
        } else {
          const dartString = exports.$stringAllocate2(length);
          const write = exports.$stringWrite2;
          for (let i = 0; i < length; i++) {
            write(dartString, i, s.charCodeAt(i));
          }
          return dartString;
        }
      },
      _2006: () => ({}),
      _2007: () => [],
      _2008: l => new Array(l),
      _2009: () => globalThis,
      _2010: (constructor, args) => {
        const factoryFunction = constructor.bind.apply(
            constructor, [null, ...args]);
        return new factoryFunction();
      },
      _2011: (o, p) => p in o,
      _2012: (o, p) => o[p],
      _2013: (o, p, v) => o[p] = v,
      _2014: (o, m, a) => o[m].apply(o, a),
      _2016: o => String(o),
      _2017: (p, s, f) => p.then(s, f),
      _2018: o => {
        if (o === undefined) return 1;
        var type = typeof o;
        if (type === 'boolean') return 2;
        if (type === 'number') return 3;
        if (type === 'string') return 4;
        if (o instanceof Array) return 5;
        if (ArrayBuffer.isView(o)) {
          if (o instanceof Int8Array) return 6;
          if (o instanceof Uint8Array) return 7;
          if (o instanceof Uint8ClampedArray) return 8;
          if (o instanceof Int16Array) return 9;
          if (o instanceof Uint16Array) return 10;
          if (o instanceof Int32Array) return 11;
          if (o instanceof Uint32Array) return 12;
          if (o instanceof Float32Array) return 13;
          if (o instanceof Float64Array) return 14;
          if (o instanceof DataView) return 15;
        }
        if (o instanceof ArrayBuffer) return 16;
        return 17;
      },
      _2019: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI8ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      _2020: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI8ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      _2021: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI16ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      _2022: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI16ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      _2023: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmI32ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      _2024: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmI32ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      _2025: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmF32ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      _2026: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmF32ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      _2027: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const getValue = dartInstance.exports.$wasmF64ArrayGet;
        for (let i = 0; i < length; i++) {
          jsArray[jsArrayOffset + i] = getValue(wasmArray, wasmArrayOffset + i);
        }
      },
      _2028: (jsArray, jsArrayOffset, wasmArray, wasmArrayOffset, length) => {
        const setValue = dartInstance.exports.$wasmF64ArraySet;
        for (let i = 0; i < length; i++) {
          setValue(wasmArray, wasmArrayOffset + i, jsArray[jsArrayOffset + i]);
        }
      },
      _2029: s => {
        if (/[[\]{}()*+?.\\^$|]/.test(s)) {
            s = s.replace(/[[\]{}()*+?.\\^$|]/g, '\\$&');
        }
        return s;
      },
      _2032: x0 => x0.index,
      _2033: x0 => x0.groups,
      _2036: (x0,x1) => x0.exec(x1),
      _2038: x0 => x0.flags,
      _2039: x0 => x0.multiline,
      _2040: x0 => x0.ignoreCase,
      _2041: x0 => x0.unicode,
      _2042: x0 => x0.dotAll,
      _2043: (x0,x1) => x0.lastIndex = x1,
      _2044: (o, p) => p in o,
      _2045: (o, p) => o[p],
      _2048: v => v.toString(),
      _2049: (d, digits) => d.toFixed(digits),
      _2053: x0 => x0.random(),
      _2054: x0 => x0.random(),
      _2058: () => globalThis.Math,
      _2098: x0 => x0.status,
      _2099: (x0,x1) => x0.responseType = x1,
      _2101: x0 => x0.response,
      _2105: () => globalThis.window.flutterCanvasKit,
      _2106: () => globalThis.window._flutter_skwasmInstance,
      _2158: (x0,x1) => x0.withCredentials = x1,
      _2160: x0 => x0.responseURL,
      _2161: x0 => x0.status,
      _2162: x0 => x0.statusText,
      _2164: (x0,x1) => x0.responseType = x1,
      _2165: x0 => x0.response,
      _2229: (x0,x1) => x0.draggable = x1,
      _2235: (x0,x1) => x0.innerText = x1,
      _2245: x0 => x0.style,
      _2604: (x0,x1) => x0.download = x1,
      _2629: (x0,x1) => x0.href = x1,
      _3177: (x0,x1) => x0.accept = x1,
      _3191: x0 => x0.files,
      _3217: (x0,x1) => x0.multiple = x1,
      _3235: (x0,x1) => x0.type = x1,
      _3490: (x0,x1) => x0.src = x1,
      _3492: (x0,x1) => x0.type = x1,
      _3498: (x0,x1) => x0.defer = x1,
      _3977: () => globalThis.window,
      _4042: x0 => x0.navigator,
      _4300: x0 => x0.crypto,
      _4306: x0 => x0.localStorage,
      _4433: x0 => x0.userAgent,
      _6748: x0 => x0.firstChild,
      _6759: () => globalThis.document,
      _6852: x0 => x0.body,
      _7203: (x0,x1) => x0.id = x1,
      _7230: x0 => x0.children,
      _8772: x0 => x0.size,
      _8780: x0 => x0.name,
      _8787: x0 => x0.length,
      _8798: x0 => x0.result,
      _11387: (x0,x1) => x0.animationDuration = x1,
      _11393: (x0,x1) => x0.animationName = x1,
      _11469: (x0,x1) => x0.border = x1,
      _11747: (x0,x1) => x0.display = x1,
      _11911: (x0,x1) => x0.height = x1,
      _12235: (x0,x1) => x0.pointerEvents = x1,
      _12601: (x0,x1) => x0.width = x1,
      _12984: x0 => x0.subtle,

    };

    const baseImports = {
      dart2wasm: dart2wasm,


      Math: Math,
      Date: Date,
      Object: Object,
      Array: Array,
      Reflect: Reflect,
    };

    const jsStringPolyfill = {
      "charCodeAt": (s, i) => s.charCodeAt(i),
      "compare": (s1, s2) => {
        if (s1 < s2) return -1;
        if (s1 > s2) return 1;
        return 0;
      },
      "concat": (s1, s2) => s1 + s2,
      "equals": (s1, s2) => s1 === s2,
      "fromCharCode": (i) => String.fromCharCode(i),
      "length": (s) => s.length,
      "substring": (s, a, b) => s.substring(a, b),
    };

    const deferredLibraryHelper = {
      "loadModule": async (moduleName) => {
        if (!loadDeferredWasm) {
          throw "No implementation of loadDeferredWasm provided.";
        }
        const source = await Promise.resolve(loadDeferredWasm(moduleName));
        const module = await ((source instanceof Response)
            ? WebAssembly.compileStreaming(source, this.builtins)
            : WebAssembly.compile(source, this.builtins));
        return await WebAssembly.instantiate(module, {
          ...baseImports,
          ...additionalImports,
          "wasm:js-string": jsStringPolyfill,
          "module0": dartInstance.exports,
        });
      },
    };

    dartInstance = await WebAssembly.instantiate(this.module, {
      ...baseImports,
      ...additionalImports,
      "deferredLibraryHelper": deferredLibraryHelper,
      "wasm:js-string": jsStringPolyfill,
    });

    return new InstantiatedApp(this, dartInstance);
  }
}

class InstantiatedApp {
  constructor(compiledApp, instantiatedModule) {
    this.compiledApp = compiledApp;
    this.instantiatedModule = instantiatedModule;
  }

  // Call the main function with the given arguments.
  invokeMain(...args) {
    this.instantiatedModule.exports.$invokeMain(args);
  }
}

