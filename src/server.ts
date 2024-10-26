import express from "express";
import pg from "pg";
const { Pool } = pg;

const app = express();
const port = 3000;

const password = process.env.DB_PASSWORD;
const user = process.env.DB_USER;

async function startServer() {
  try {
    const { default: runMigration } = await import("./migrate");
    await runMigration();

    const pool = new Pool({
      database: "loxavi_db",
      host: "localhost",
      password: password,
      port: 5432,
      user: user,
    });

    app.get("/categories", (_req, res) => {
      pool
        .query("SELECT * FROM categories")
        .then((result) => res.json(result.rows))
        .catch((error: unknown) => {
          console.error(error);
          res.status(500).send("Ошипка при получении данных");
        });
    });

    app.listen(port, () => {
      console.log(`Категории на http://localhost:${port}/categories`);
    });
  } catch (error) {
    console.error("Миграция не выполнена. Сервер не запущен:", error);
  }
}

startServer();
