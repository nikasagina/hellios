-- Create the users table
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(255) NOT NULL,
                       register_date DATE NOT NULL
);

-- Create the posts table
CREATE TABLE posts (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       creator_id INT NOT NULL,
                       num_contributors INT DEFAULT 0,
                       num_stars INT DEFAULT 0,
                       tag_id INT,
                       created_date DATE,
                       FOREIGN KEY (creator_id) REFERENCES users(id),
                       FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- Create the tags table
CREATE TABLE tags (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      tag VARCHAR(255) NOT NULL
);

-- Create the skills table
CREATE TABLE skills (
                        user_id INT,
                        skill VARCHAR(255),
                        FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create the creator_posts table
CREATE TABLE creator_posts (
                               user_id INT,
                               post_id INT,
                               FOREIGN KEY (user_id) REFERENCES users(id),
                               FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- Create the contributor_posts table
CREATE TABLE contributor_posts (
                                   user_id INT,
                                   post_id INT,
                                   FOREIGN KEY (user_id) REFERENCES users(id),
                                   FOREIGN KEY (post_id) REFERENCES posts(id)
);