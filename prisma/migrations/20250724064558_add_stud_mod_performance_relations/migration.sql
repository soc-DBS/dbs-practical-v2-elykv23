/*
  Warnings:

  - The primary key for the `stud_mod_performance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admNo` on the `stud_mod_performance` table. All the data in the column will be lost.
  - Added the required column `admn` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_pkey",
DROP COLUMN "admNo",
ADD COLUMN     "admn" CHAR(4) NOT NULL,
ADD CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("admn", "mod_registered");

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_admin_fk" FOREIGN KEY ("admn") REFERENCES "student"("admin_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_module_fk" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
