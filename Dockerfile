FROM node:22.16-alpine as build

RUN mkdir -p /var/www/my-nextjs-app
WORKDIR /var/www/my-nextjs-app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]
