# Base image info
FROM node:alpine as build-phase
WORKDIR /usr/app

# Dependancies info
COPY ./package.json ./
RUN npm install
COPY ./ ./

# startup command
RUN npm run build

# run phase/ nginx phase
FROM nginx
EXPOSE 80
COPY --from=build-phase /usr/app/build /usr/share/nginx/html