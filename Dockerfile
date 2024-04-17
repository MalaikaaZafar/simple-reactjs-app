FROM node:14

WORKDIR /app

COPY . .

RUN npm install
# Expose the port that the application listens on.
EXPOSE 3000

# Run the application.
CMD npm start
