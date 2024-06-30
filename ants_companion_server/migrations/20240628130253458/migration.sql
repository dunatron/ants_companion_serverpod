BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ant" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tier_tag" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "antId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "tier_tag"
    ADD CONSTRAINT "tier_tag_fk_0"
    FOREIGN KEY("antId")
    REFERENCES "ant"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR ants_companion
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ants_companion', '20240628130253458', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240628130253458', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
