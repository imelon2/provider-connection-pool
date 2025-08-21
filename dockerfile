FROM node:22

RUN apt-get update && apt install -y net-tools

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY src ./src
COPY tsconfig.json ./
COPY netstat.sh ./netstat.sh
RUN chmod +x ./netstat.sh 

ENTRYPOINT ["yarn","start"]
