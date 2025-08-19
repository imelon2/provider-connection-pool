import winston from "winston";
import dotenv from "dotenv"
dotenv.config()

export const logger = winston.createLogger({
  level: process.env.LOG_LEVEL || "info",
  format: winston.format.combine(
    winston.format.timestamp({
      format: "MM-DD|HH:mm:ss.SSS",
    }),
    winston.format.json()
  ),
  transports: [
    new winston.transports.Console(),
    new winston.transports.File({
      level:"error",
      filename: `./logs/provider_${new Date().getTime()}.log`,
    }),
  ],
});
