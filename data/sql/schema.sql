CREATE TABLE category (id BIGINT AUTO_INCREMENT, name VARCHAR(50), description TEXT, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE comment (id BIGINT AUTO_INCREMENT, body LONGTEXT, user_id BIGINT, content_id BIGINT, INDEX content_id_idx (content_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE content (id BIGINT AUTO_INCREMENT, title VARCHAR(255), body LONGTEXT, view_count BIGINT, recommend_level VARCHAR(255) DEFAULT '2', category_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX category_id_idx (category_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE organizations (id BIGINT AUTO_INCREMENT, title VARCHAR(255), body LONGTEXT, view_count BIGINT, recommend_level VARCHAR(255) DEFAULT '2', category_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX category_id_idx (category_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE user (id BIGINT AUTO_INCREMENT, name VARCHAR(50), email VARCHAR(50), PRIMARY KEY(id)) ENGINE = INNODB;
ALTER TABLE comment ADD CONSTRAINT comment_content_id_organizations_id FOREIGN KEY (content_id) REFERENCES organizations(id);
ALTER TABLE content ADD CONSTRAINT content_category_id_user_id FOREIGN KEY (category_id) REFERENCES user(id);
ALTER TABLE organizations ADD CONSTRAINT organizations_category_id_user_id FOREIGN KEY (category_id) REFERENCES user(id);