# For build phase
FROM node:19-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#For Run Phase
FROM nginx

COPY --chown=node:node --from=builder /app/build /usr/share/nginx/html



