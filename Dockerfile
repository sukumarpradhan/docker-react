# Base image info

FROM node:alpine

WORKDIR /usr/app

# Dependancies info

COPY ./package.json ./

RUN npm install

COPY ./ ./

# startup command

CMD ["npm", "run", "build"]


# run phase/ nginx phase

FROM nginx

EXPOSE 80

COPY --from=0 /usr/app/build /usr/share/nginx/html