BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "ant" ADD COLUMN "profilePictureUrl" text;

--
-- MIGRATION VERSION FOR ants_companion
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ants_companion', '20240710052927569', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240710052927569', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
