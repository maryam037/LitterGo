import type { RectReturn } from '@wdio/protocols';
export type Location = Pick<RectReturn, 'x' | 'y'>;
export declare function getLocation(this: WebdriverIO.Element): Promise<Location>;
export declare function getLocation(this: WebdriverIO.Element, prop: keyof Location): Promise<number>;
//# sourceMappingURL=getLocation.d.ts.map