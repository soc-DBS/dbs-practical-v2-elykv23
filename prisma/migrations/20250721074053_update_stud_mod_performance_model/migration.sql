/*
  Warnings:

  - The primary key for the `stud_mod_performance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admin_no` on the `stud_mod_performance` table. All the data in the column will be lost.
  - You are about to drop the column `coursework_score` on the `stud_mod_performance` table. All the data in the column will be lost.
  - You are about to drop the column `exam_score` on the `stud_mod_performance` table. All the data in the column will be lost.
  - You are about to drop the column `mod_code` on the `stud_mod_performance` table. All the data in the column will be lost.
  - Added the required column `admNo` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `grade` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mark` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mod_registered` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_pkey",
DROP COLUMN "admin_no",
DROP COLUMN "coursework_score",
DROP COLUMN "exam_score",
DROP COLUMN "mod_code",
ADD COLUMN     "admNo" CHAR(4) NOT NULL,
ADD COLUMN     "grade" CHAR(2) NOT NULL,
ADD COLUMN     "mark" INTEGER NOT NULL,
ADD COLUMN     "mod_registered" CHAR(10) NOT NULL,
ADD CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("admNo", "mod_registered");
