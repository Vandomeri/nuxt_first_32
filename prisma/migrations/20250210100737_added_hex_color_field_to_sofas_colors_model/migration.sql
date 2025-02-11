/*
  Warnings:

  - You are about to drop the column `sofasId` on the `sofas_colors` table. All the data in the column will be lost.
  - Added the required column `hex_color` to the `sofas_colors` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_sofas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "material" TEXT NOT NULL,
    "sofas_colorsId" INTEGER,
    CONSTRAINT "sofas_sofas_colorsId_fkey" FOREIGN KEY ("sofas_colorsId") REFERENCES "sofas_colors" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_sofas" ("id", "material", "price", "title") SELECT "id", "material", "price", "title" FROM "sofas";
DROP TABLE "sofas";
ALTER TABLE "new_sofas" RENAME TO "sofas";
CREATE TABLE "new_sofas_colors" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "hex_color" TEXT NOT NULL
);
INSERT INTO "new_sofas_colors" ("id", "name") SELECT "id", "name" FROM "sofas_colors";
DROP TABLE "sofas_colors";
ALTER TABLE "new_sofas_colors" RENAME TO "sofas_colors";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
