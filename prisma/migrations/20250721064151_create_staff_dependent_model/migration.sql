-- CreateTable
CREATE TABLE "staff_dependent" (
    "staffNo" CHAR(4) NOT NULL,
    "dependent_name" VARCHAR(30) NOT NULL,
    "relationship" VARCHAR(20) NOT NULL,

    CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staffNo","dependent_name")
);

-- AddForeignKey
ALTER TABLE "staff_dependent" ADD CONSTRAINT "staff_dependent_staff_no_fk" FOREIGN KEY ("staffNo") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;
