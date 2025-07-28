-- CreateTable
CREATE TABLE "stud_mod_performance" (
    "admin_no" VARCHAR(8) NOT NULL,
    "mod_code" VARCHAR(10) NOT NULL,
    "exam_score" DECIMAL(5,2),
    "coursework_score" DECIMAL(5,2),

    CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("admin_no","mod_code")
);
