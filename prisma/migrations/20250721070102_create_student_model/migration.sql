-- CreateTable
CREATE TABLE "student" (
    "admin_no" VARCHAR(8) NOT NULL,
    "stud_name" VARCHAR(100) NOT NULL,
    "gender" CHAR(1) NOT NULL,
    "dob" DATE NOT NULL,
    "crse_code" VARCHAR(5) NOT NULL,
    "nationality" VARCHAR(30) NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("admin_no")
);
