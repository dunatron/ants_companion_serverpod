BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "ant" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ant" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "type" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR ants_companion
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ants_companion', '20240629013438097', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240629013438097', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
