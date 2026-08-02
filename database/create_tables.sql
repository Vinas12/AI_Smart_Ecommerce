CREATE DATABASE ai_ecommerce;

USE ai_ecommerce;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(200),
    category varchar(100),
    description TEXT,
    price DECIMAL(10,2),
    stock INT,
    image_url varchar(300),
    rating FLOAT
    );
    
    CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(50) DEFAULT 'Pending',
    payment_status VARCHAR(50) DEFAULT 'Pending',
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT DEFAULT 1,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE,

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
    ON DELETE CASCADE
);



CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON DELETE CASCADE,

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
    ON DELETE CASCADE
);

CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
    ON DELETE CASCADE,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);

CREATE TABLE wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE,

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
    ON DELETE CASCADE
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON DELETE CASCADE
);

SHOW TABLES;

