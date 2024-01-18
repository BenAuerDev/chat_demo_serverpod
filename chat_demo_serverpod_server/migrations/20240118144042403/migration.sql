BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "demo_chat_message" (
    "id" serial PRIMARY KEY,
    "text" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR chat_demo_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('chat_demo_serverpod', '20240118144042403', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240118144042403', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
