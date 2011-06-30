CREATE TABLE asset_record (id BIGINT AUTO_INCREMENT, year BIGINT, amount BIGINT, organization_id BIGINT, INDEX organization_id_idx (organization_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE category (id BIGINT AUTO_INCREMENT, name VARCHAR(50), description TEXT, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE comment (id BIGINT AUTO_INCREMENT, body LONGTEXT, user_id BIGINT, content_id BIGINT, INDEX content_id_idx (content_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE contact_person (id BIGINT AUTO_INCREMENT, name VARCHAR(255), title VARCHAR(255), email VARCHAR(255), address VARCHAR(255), phone VARCHAR(255), organization_id BIGINT, INDEX organization_id_idx (organization_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE content (id BIGINT AUTO_INCREMENT, title VARCHAR(255), body LONGTEXT, view_count BIGINT, recommend_level VARCHAR(255) DEFAULT '2', category_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX category_id_idx (category_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE giving_record (id BIGINT AUTO_INCREMENT, year BIGINT, amount BIGINT, organization_id BIGINT, INDEX organization_id_idx (organization_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE grant_event (id BIGINT AUTO_INCREMENT, comment LONGTEXT, collector_id BIGINT, reviewer_id BIGINT, organization_id BIGINT, INDEX organization_id_idx (organization_id), INDEX reviewer_id_idx (reviewer_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE grants (id BIGINT AUTO_INCREMENT, comment LONGTEXT, collector_id BIGINT, reviewer_id BIGINT, organization_id BIGINT, INDEX organization_id_idx (organization_id), INDEX reviewer_id_idx (reviewer_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE member (id BIGINT AUTO_INCREMENT, name VARCHAR(50), email VARCHAR(50), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE organization (id BIGINT AUTO_INCREMENT, engname VARCHAR(255), chnname VARCHAR(255), website VARCHAR(255), status VARCHAR(255) DEFAULT 'To be reviewer', comment LONGTEXT, collector_id BIGINT, reviewer_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX reviewer_id_idx (reviewer_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE organizations (id BIGINT AUTO_INCREMENT, engname VARCHAR(255), chnname VARCHAR(255), website VARCHAR(255), status VARCHAR(255) DEFAULT '2', comment LONGTEXT, collector_id BIGINT, reviewer_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX reviewer_id_idx (reviewer_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE the_grants (id BIGINT AUTO_INCREMENT, comment LONGTEXT, collector_id BIGINT, reviewer_id BIGINT, organization_id BIGINT, INDEX organization_id_idx (organization_id), INDEX reviewer_id_idx (reviewer_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE user (id BIGINT AUTO_INCREMENT, name VARCHAR(50), email VARCHAR(50), PRIMARY KEY(id)) ENGINE = INNODB;
ALTER TABLE asset_record ADD CONSTRAINT asset_record_organization_id_organization_id FOREIGN KEY (organization_id) REFERENCES organization(id);
ALTER TABLE comment ADD CONSTRAINT comment_content_id_organizations_id FOREIGN KEY (content_id) REFERENCES organizations(id);
ALTER TABLE contact_person ADD CONSTRAINT contact_person_organization_id_organization_id FOREIGN KEY (organization_id) REFERENCES organization(id);
ALTER TABLE content ADD CONSTRAINT content_category_id_user_id FOREIGN KEY (category_id) REFERENCES user(id);
ALTER TABLE giving_record ADD CONSTRAINT giving_record_organization_id_organization_id FOREIGN KEY (organization_id) REFERENCES organization(id);
ALTER TABLE grant_event ADD CONSTRAINT grant_event_reviewer_id_member_id FOREIGN KEY (reviewer_id) REFERENCES member(id);
ALTER TABLE grant_event ADD CONSTRAINT grant_event_organization_id_organization_id FOREIGN KEY (organization_id) REFERENCES organization(id);
ALTER TABLE grants ADD CONSTRAINT grants_reviewer_id_member_id FOREIGN KEY (reviewer_id) REFERENCES member(id);
ALTER TABLE grants ADD CONSTRAINT grants_organization_id_organization_id FOREIGN KEY (organization_id) REFERENCES organization(id);
ALTER TABLE organization ADD CONSTRAINT organization_reviewer_id_member_id FOREIGN KEY (reviewer_id) REFERENCES member(id);
ALTER TABLE organizations ADD CONSTRAINT organizations_reviewer_id_member_id FOREIGN KEY (reviewer_id) REFERENCES member(id);
ALTER TABLE the_grants ADD CONSTRAINT the_grants_reviewer_id_member_id FOREIGN KEY (reviewer_id) REFERENCES member(id);
ALTER TABLE the_grants ADD CONSTRAINT the_grants_organization_id_organization_id FOREIGN KEY (organization_id) REFERENCES organization(id);
