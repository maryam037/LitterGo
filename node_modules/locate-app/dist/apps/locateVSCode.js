"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.locateVSCode = void 0;
const locateApp_1 = require("../locateApp");
function locateVSCode() {
    return (0, locateApp_1.locateApp)({
        appName: 'Code',
        linuxWhich: 'code',
        windowsSuffix: '\\Microsoft VS Code\\Code.exe',
        macOsName: 'Code',
    });
}
exports.locateVSCode = locateVSCode;
//# sourceMappingURL=locateVSCode.js.map