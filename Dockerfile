# 빌드 단계
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 실행 단계
FROM node:18
WORKDIR /app

# dist 폴더 복사
COPY --from=build /app/dist ./dist

# Express 설치 및 서버 스크립트 복사
RUN npm install express
COPY server.js .

# 포트 설정 및 실행 명령
EXPOSE 3000
CMD ["node", "server.js"]
