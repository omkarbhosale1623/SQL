CREATE DATABASE IF NOT EXISTS auth_system;
use auth_system;
CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE permissions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE role_permissions (
    role_id INT,
    permission_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);


CREATE TABLE login_log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    success BOOLEAN NOT NULL,
    ip_address VARCHAR(45),
    user_agent TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_login_log_user_id ON login_log(user_id);
CREATE INDEX idx_login_log_time ON login_log(login_time); 

INSERT INTO roles (name, description) VALUES
('admin', 'Administrator with full access'),
('user', 'Regular user with basic access'),
('moderator', 'Moderator with limited admin access');

INSERT INTO permissions (name, description) VALUES
('read_users', 'Can view user list'),
('create_users', 'Can create new users'),
('update_users', 'Can update user information'),
('delete_users', 'Can delete users'),
('read_logs', 'Can view login logs'),
('manage_roles', 'Can manage roles and permissions'),
('access_admin', 'Can access admin panel');

select * from permissions;
select * from roles;
INSERT INTO role_permissions (role_id, permission_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7);
INSERT INTO role_permissions (role_id, permission_id) VALUES
(2, 1);
INSERT INTO role_permissions (role_id, permission_id) VALUES
(3, 1), (3, 2), (3, 3), (3, 5); 
select * from role_permissions;


DELIMITER //
CREATE PROCEDURE sp_log_login(
    IN p_user_id INT,
    IN p_success BOOLEAN,
    IN p_ip_address VARCHAR(45),
    IN p_user_agent TEXT
)
BEGIN
    INSERT INTO login_log (user_id, success, ip_address, user_agent)
    VALUES (p_user_id, p_success, p_ip_address, p_user_agent);
    
    SELECT LAST_INSERT_ID() as log_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_get_user_permissions(
    IN p_user_id INT
)
BEGIN
    SELECT DISTINCT p.id, p.name, p.description
    FROM permissions p
    JOIN role_permissions rp ON p.id = rp.permission_id
    JOIN users u ON u.role_id = rp.role_id
    WHERE u.id = p_user_id AND u.is_active = TRUE;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_create_user(
    IN p_username VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_password_hash VARCHAR(255),
    IN p_role_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    INSERT INTO users (username, email, password_hash, role_id)
    VALUES (p_username, p_email, p_password_hash, p_role_id);
    
    SELECT LAST_INSERT_ID() as user_id;
    
    COMMIT;
END //
DELIMITER ; 


select * from users ;
select * from login_log;

