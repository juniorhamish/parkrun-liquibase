--liquibase formatted sql

--changeset David Johnston:1 context:prod
--comment: Add runners table
CREATE TABLE runners
(
    id   text PRIMARY KEY,
    name text
);
--rollback DROP TABLE runners;

--changeset David Johnston:2 context:prod
--comment: Add last scrape metadata table
CREATE TABLE last_scrape_metadata
(
    id                    UUID PRIMARY KEY     DEFAULT gen_random_uuid(),
    last_scrape_time      TIMESTAMPTZ NOT NULL,
    new_parkrunners_count INTEGER     NOT NULL DEFAULT 0,
    success               BOOLEAN     NOT NULL DEFAULT TRUE
);
--rollback DROP TABLE last_scrape_metadata;
