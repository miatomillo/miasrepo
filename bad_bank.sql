DROP DATABASE IF EXISTS bad_bank;
CREATE DATABASE bad_bank;
USE bad_bank;

CREATE TABLE users (
    PRIMARY KEY (user_id),
    user_id         INT AUTO_INCREMENT,
    user_name       VARCHAR(32),
    user_balance    DECIMAL(16,3)  -- CHECK (user_balance >= 0)   -- Checked on update
);

INSERT INTO users (user_name, user_balance)
VALUES
        ('Ben Link',         10.000),
        ('John Lennon', 1009857.982);

SOURCE transfer_money.sql;
SOURCE ensure_non_negative.sql;
SELECT * FROM users;

-- Pay John $20 for Snacks
CALL transfer_money(1,2, 20.000);


SELECT * FROM users;
