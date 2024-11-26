import { Flyway } from "node-flyway";
import "dotenv/config";

const flyway = new Flyway({
  defaultSchema: "public",
  migrationLocations: ["flyway/sql"],
  password: process.env.DB_PASSWORD,
  url: process.env.DB_URL!,
  user: process.env.DB_USER!,
});

export default async function runMigration() {
  return flyway
    .migrate()
    .then((response) => {
      if (!response.success) {
        console.error("Migration failed with error:", response.error);
      } else {
        console.log("Migration successful:", response);
      }
    })
    .catch((error: unknown) => {
      throw error;
    });
}
