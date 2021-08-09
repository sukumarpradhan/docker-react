# Base image info

FROM node:alpine as build-phase

WORKDIR /usr/app

# Dependancies info

COPY ./package.json ./

RUN npm install

COPY ./ ./

# startup command

CMD ["npm", "run", "build"]


# run phase/ nginx phase

FROM nginx

COPY --from=build-phase /usr/app/build /usr/share/nginx/html
