# my-docker-setups 🐋

A personal collection of stacks and utility scripts.

## Structure
```text
my-docker-setups/
├── scripts/
│   ├── linux/
│   └── windows/
├── stacks/
│   ├── app/
│   │   ├── docker-compose.yaml
│   │   └── .env.example
│   └── ...
├── LICENSE.md
└── README.md
```

The `stacks/` directory contains project folders. Each one includes a `docker-compose.yaml` but some may also include essential files like a `Dockerfile` for builds or a `.env.example` for environment secrets.

## Utility Scripts

Located in the `scripts/` folder for both Windows and Linux.

* **exec**: Interactive menu to select a running container and instantly attach a shell.
* **clean-up**: Safely frees disk space by removing unused images, networks and orphaned volumes (preserves stopped containers).

## Usage

1. **Move into** the desired project folder (e.g., `cd stacks/app-one`).
2. If a `.env.example` exists, rename it to `.env` and add your specific keys.
3. Run the project:
```bash
docker compose up --build -d
```
