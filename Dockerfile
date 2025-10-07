FROM node:22.16-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM node:22.16-alpine AS prod
WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
COPY --from=build /app/next.config.js ./

EXPOSE 3000
CMD ["npm", "start"]
