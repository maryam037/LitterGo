import type { Capabilities, Options } from '@wdio/types';
import type { BrowserstackConfig, UserConfigforReporting } from './types.js';
type Dict = Record<string, any>;
export default class CrashReporter {
    static userConfigForReporting: UserConfigforReporting;
    private static credentialsForCrashReportUpload;
    static setCredentialsForCrashReportUpload(options: BrowserstackConfig & Options.Testrunner, config: Options.Testrunner): void;
    static setConfigDetails(userConfig: Options.Testrunner, capabilities: Capabilities.RemoteCapability, options: BrowserstackConfig & Options.Testrunner): void;
    static uploadCrashReport(exception: any, stackTrace: string): Promise<void>;
    static recursivelyRedactKeysFromObject(obj: Dict | Array<Dict>, keys: string[]): void;
    static deletePIIKeysFromObject(obj: {
        [key: string]: any;
    }): void;
    static filterCapabilities(capabilities: Capabilities.RemoteCapability): any;
    static filterPII(userConfig: Options.Testrunner): any;
}
export {};
//# sourceMappingURL=crash-reporter.d.ts.map