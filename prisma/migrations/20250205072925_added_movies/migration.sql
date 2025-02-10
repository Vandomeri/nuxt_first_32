-- CreateTable
CREATE TABLE "movies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "overview" TEXT NOT NULL,
    "release_date" DATETIME NOT NULL,
    "popularity" REAL NOT NULL,
    "vote_average" REAL NOT NULL,
    "vote_count" REAL NOT NULL
);
