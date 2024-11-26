import express from "express";
import pg from "pg";
import "dotenv/config";

const { Pool } = pg;

const app = express();

async function startServer() {
  try {
    const { default: runMigration } = await import("./migrate");
    await runMigration();

    const pool = new Pool({
      database: "loxavi_db",
      host: "localhost",
      password: process.env.DB_PASSWORD,
      port: 5432,
      user: process.env.DB_USER,
    });

    app.get("/categories", (_req, res) => {
      pool
        .query("SELECT * FROM categories")
        .then((result) => res.json(result.rows))
        .catch((error: unknown) => {
          console.error(error);
        });
    });
  } catch (error) {
    console.error("Миграция не выполнена. Сервер не запущен:", error);
  }
}

startServer();
