
FROM node:14
RUN apt-get update && apt-get install -y curl
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install -g serve
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["serve", "-s", "build"]