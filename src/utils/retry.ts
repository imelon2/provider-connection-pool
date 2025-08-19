import { logger } from "./loggers";

export const retry = async (
  delay: number = 100,
  count: number = 0, // 0
  func: () => Promise<any>
) => {

  let attempts = 0;
  for (;;) {
    try {
      const result = await func();
      logger.debug(`return result: ${result}`)
      attempts++;
    } catch (error) {
      // Log the error and continue
      logger.error(`${error}`);
    }

    if (count > 0 && attempts >= count) {
      break;
    }
    if (delay > 0) {
      await new Promise((f) => setTimeout(f, delay));
    }
  }
};
