FROM node:lts-alpine

RUN mkdir /app
WORKDIR /app

# install and cache app dependencies using yarn
ADD package.json /app/

# Copy all frontend stuff to new "app" folder
COPY . /app/

RUN npm install --global gatsby-cli

RUN npm install

RUN gatsby build

EXPOSE 9000
CMD ["gatsby", "serve", "-H", "0.0.0.0"]