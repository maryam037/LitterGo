import Transport from 'winston-transport';
declare class logReportingAPI extends Transport {
    log(info: any, callback?: undefined | Function): void;
    logToTestOps: (level?: string, message?: string, consoleLog?: boolean) => void;
    trace: (message: any) => void;
    debug: (message: any) => void;
    info: (message: any) => void;
    warn: (message: any) => void;
    error: (message: any) => void;
}
export default logReportingAPI;
//# sourceMappingURL=logReportingAPI.d.ts.map