import Transport from 'winston-transport';
declare class logPatcher extends Transport {
    constructor(opts: any);
    logToTestOps: (level?: string, message?: string[]) => void;
    trace: (...message: any) => void;
    debug: (...message: any) => void;
    info: (...message: any) => void;
    warn: (...message: any) => void;
    error: (...message: any) => void;
    log: (...message: any) => void;
}
export default logPatcher;
//# sourceMappingURL=logPatcher.d.ts.map