FROM node:22-slim

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm prune --omit-dev

EXPOSE 5173

RUN useradd -m containeruser
RUN chown -R containeruser /app
USER containeruser


CMD [ "npm","run","dev","--","host"]