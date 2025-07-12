# Client Application

This directory contains the SvelteKit front end used in this repository.
It was bootstrapped using the official `create-svelte` scaffolding.

## Development

Install dependencies and start the development server:

```bash
npm install
npm run dev
```

Navigate to <http://localhost:5173> to view the application.

## Building for Production

Create an optimized production build and preview it locally:

```bash
npm run build
npm run preview
```

## Running with Docker

Build the container image and start the app using Docker:

```bash
docker build -t homelab-client .
docker run -p 4173:4173 homelab-client
```

Navigate to <http://localhost:4173> to view the application.
