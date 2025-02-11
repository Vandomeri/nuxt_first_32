-- CreateTable
CREATE TABLE "sofas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "material" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "sofas_colors" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "sofasId" INTEGER,
    CONSTRAINT "sofas_colors_sofasId_fkey" FOREIGN KEY ("sofasId") REFERENCES "sofas" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
