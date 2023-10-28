-- Add migration script here
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS projects CASCADE;
DROP TABLE IF EXISTS andi_contribution_log CASCADE;
DROP TABLE IF EXISTS clubs CASCADE;

CREATE TABLE IF NOT EXISTS clubs(
    club_id UUID PRIMARY KEY,
    club_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS users(
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    and_title VARCHAR(100) NOT NULL,
    club_id UUID REFERENCES clubs(club_id)
);

CREATE TABLE IF NOT EXISTS projects(
    project_id UUID PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    total_users BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS andi_contribution_log(
    log_id UUID PRIMARY KEY,
    project_id UUID REFERENCES projects(project_id),
    user_id UUID REFERENCES users(user_id)
);

INSERT INTO clubs (club_name) VALUES ('Babbage');
INSERT INTO clubs (club_name) VALUES ('Wangari');
INSERT INTO clubs (club_name) VALUES ('Jemison');
INSERT INTO clubs (club_name) VALUES ('Woods');
INSERT INTO clubs (club_name) VALUES ('Kilburn');
INSERT INTO clubs (club_name) VALUES ('Newton');
INSERT INTO clubs (club_name) VALUES ('Grace');
INSERT INTO clubs (club_name) VALUES ('Ada');
INSERT INTO clubs (club_name) VALUES ('Koolhaas');
INSERT INTO clubs (club_name) VALUES ('Almeida');

INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('Matthew', 'Gill', 'Matthew Gill', 'AND Aspiring Polymath', 1);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('Jack', 'McKelvey', 'Jack McKelvey', 'AND Indie Rocker', 3);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('Will', 'Cowen', 'Will Cowen', 'AND Marine Explorer', 2);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('Bradley', 'Gallagher', 'Bradley Gallagher', 'AND Space Orbiter', 1);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('Victoria', 'Igwemma', 'Victoria Igwemma', 'AND Knowledge Seeker', 3);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('Lucy', 'Upot', 'Lucy Upot', 'AND Sewing Bee', 1);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('Janice', 'OToole', 'Janice OToole', 'AND Espresso Martini Architect', 3);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('Fahra', 'Akhlaq', 'Fahra Akhlaq', 'AND Tooth Fairy', 4);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('User', 'Kilburn', 'Kilburn User', 'AND Knowledge Seeker', 5);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('User', 'Newton', 'Newton User', 'AND Knowledge Seeker', 6);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('User', 'Grace', 'Grace User', 'AND Knowledge Seeker', 7);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('User', 'Ada', 'Ada User', 'AND Knowledge Seeker', 8);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('User', 'Koolhaas', 'Koolhaas User', 'AND Knowledge Seeker', 9);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('User', 'Almeida', 'Almeida User', 'AND Knowledge Seeker', 10);
INSERT INTO users (first_name, last_name, full_name, and_title, club_id) VALUES ('User', 'Woods', 'Woods User', 'AND Knowledge Seeker', 4);

INSERT INTO projects (project_name, total_users) VALUES ('Very', 900000);
INSERT INTO projects (project_name, total_users) VALUES ('British Airways', 1900000);
INSERT INTO projects (project_name, total_users) VALUES ('Lloyds Bank', 1670000);
INSERT INTO projects (project_name, total_users) VALUES ('Vodafone', 32400000);
INSERT INTO projects (project_name, total_users) VALUES ('Gousto', 10000000);
INSERT INTO projects (project_name, total_users) VALUES ('DFE', 1860000);
INSERT INTO projects (project_name, total_users) VALUES ('British Gas', 1420000);

INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 1);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (3, 1);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (5, 1);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (2, 2);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (4, 2);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 3);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (4, 3);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (5, 3);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 4);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (2, 4);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (3, 4);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (4, 4);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (5, 4);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (7, 5);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (6, 5);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 5);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 6);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (7, 6);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (2, 6);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 7);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (5, 7);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 7);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (3, 8);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (6, 8);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (2, 9);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (3, 9);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (4, 9);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (7, 9);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (5, 10);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 10);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (4, 10);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (7, 11);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (6, 11);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (2, 11);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 11);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (5, 11);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (1, 12);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (7, 12);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (4, 13);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (5, 13);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (6, 13);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (2, 14);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (4, 14);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (4, 15);
INSERT INTO andi_contribution_log (project_id, user_id) VALUES (3, 15);