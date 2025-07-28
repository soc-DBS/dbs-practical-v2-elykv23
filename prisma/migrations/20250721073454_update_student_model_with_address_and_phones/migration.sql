/*
  Warnings:

  - Added the required column `address` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mobile_phone` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "student" ADD COLUMN     "address" VARCHAR(100) NOT NULL,
ADD COLUMN     "home_phone" CHAR(8),
ADD COLUMN     "mobile_phone" CHAR(8) NOT NULL;
