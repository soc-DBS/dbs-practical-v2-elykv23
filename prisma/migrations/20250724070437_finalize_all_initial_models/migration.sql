/*
  Warnings:

  - The primary key for the `staff_dependent` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `staffNo` on the `staff_dependent` table. All the data in the column will be lost.
  - The primary key for the `stud_mod_performance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admn` on the `stud_mod_performance` table. All the data in the column will be lost.
  - The primary key for the `student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `admin_no` on the `student` table. All the data in the column will be lost.
  - You are about to alter the column `stud_name` on the `student` table. The data in that column could be lost. The data in that column will be cast from `VarChar(100)` to `VarChar(30)`.
  - Added the required column `staff_no` to the `staff_dependent` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adm_no` to the `stud_mod_performance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adm_no` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "staff_dependent" DROP CONSTRAINT "staff_dependent_staff_no_fk";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_admin_fk";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_module_fk";

-- AlterTable
ALTER TABLE "staff_dependent" DROP CONSTRAINT "staff_dependent_pkey",
DROP COLUMN "staffNo",
ADD COLUMN     "staff_no" CHAR(4) NOT NULL,
ADD CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff_no", "dependent_name");

-- AlterTable
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_pkey",
DROP COLUMN "admn",
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ALTER COLUMN "grade" DROP NOT NULL,
ALTER COLUMN "mark" DROP NOT NULL,
ALTER COLUMN "mod_registered" SET DATA TYPE VARCHAR(10),
ADD CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("adm_no", "mod_registered");

-- AlterTable
ALTER TABLE "student" DROP CONSTRAINT "student_pkey",
DROP COLUMN "admin_no",
ADD COLUMN     "adm_no" CHAR(4) NOT NULL,
ALTER COLUMN "stud_name" SET DATA TYPE VARCHAR(30),
ALTER COLUMN "mobile_phone" DROP NOT NULL,
ADD CONSTRAINT "student_pkey" PRIMARY KEY ("adm_no");

-- RenameForeignKey
ALTER TABLE "course" RENAME CONSTRAINT "fk_course_offered_by" TO "course_offered_by_fk";

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "staff_dependent" ADD CONSTRAINT "staff_dependent_staff_no_fk" FOREIGN KEY ("staff_no") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
