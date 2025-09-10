-- Create Database
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Users table (Signup info)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Login table (optional: stores login activity, not credentials)
CREATE TABLE login_activity (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Cart table (temporary items before checkout)
CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Cart Items table
CREATE TABLE cart_items (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Order Items table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Payments table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    method ENUM('credit_card','debit_card','upi','net_banking','cod') NOT NULL,
    status ENUM('pending','completed','failed') DEFAULT 'pending',
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);
INSERT INTO users (full_name, email, password_hash, phone, address) VALUES
('Vipul Singh', 'vipul@example.com', 'hash123', '9876543210', '123 Main Street, Delhi'),
('Anita Sharma', 'anita@example.com', 'hash456', '9123456780', '45 MG Road, Mumbai'),
('Rohit Kumar', 'rohit@example.com', 'hash789', '9988776655', '22 Park Lane, Bangalore');
INSERT INTO login_activity (user_id, ip_address) VALUES
(1, '192.168.1.10'),
(2, '192.168.1.11'),
(3, '192.168.1.12');
INSERT INTO products (name, description, price, stock, category) VALUES
('Laptop', 'High-performance laptop', 75000.00, 10, 'Electronics'),
('Smartphone', 'Latest Android smartphone', 25000.00, 50, 'Electronics'),
('Headphones', 'Noise-cancelling headphones', 5000.00, 30, 'Accessories'),
('Office Chair', 'Ergonomic office chair', 8000.00, 15, 'Furniture');
INSERT INTO cart (user_id) VALUES
(1),
(2);
INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1);
INSERT INTO orders (user_id, status, total_amount) VALUES
(1, 'pending', 85000.00),
(2, 'processing', 25000.00);
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 75000.00),
(1, 3, 2, 5000.00),
(2, 2, 1, 25000.00);
INSERT INTO payments (order_id, amount, method, status) VALUES
(1, 85000.00, 'credit_card', 'completed'),
(2, 25000.00, 'upi', 'pending');
