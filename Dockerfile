FROM node:20-alpine

# 安装所有依赖（构建 + 运行时）
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    python3 \
    make \
    g++

# npm 配置（加速 + 清理）
RUN npm config set registry https://registry.npmmirror.com/ && \
    npm cache clean --force

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /app

COPY package*.json ./

RUN npm install --production --verbose --legacy-peer-deps

COPY . .

CMD ["node", "index.js"]
