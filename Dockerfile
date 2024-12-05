FROM bitnami/node:18 as builder
WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

FROM bitnami/node:18
WORKDIR /app

COPY --from=builder /app /app

ENV NODE_ENV="production"
ENV PORT=3000
EXPOSE 3000

CMD ["npm", "start"]
