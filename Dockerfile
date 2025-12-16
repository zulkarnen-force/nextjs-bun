FROM oven/bun:1 AS base
WORKDIR /usr/src/app

FROM base AS build
COPY . .
RUN bun install
RUN bun run build

FROM base AS development
COPY --from=build /usr/src/app .
CMD ["bun", "run", "dev"]
ENV HOSTNAME=0.0.0.0
EXPOSE 3000

