-- 1. List all users
SELECT * FROM users;

-- 2. List all products
SELECT * FROM products;

-- 3. List all orders
SELECT * FROM orders;

-- 4. List all carts
SELECT * FROM cart;

-- 5. Select users with phone number
SELECT full_name, phone FROM users WHERE phone IS NOT NULL;

-- 6. Products with stock greater than 10
SELECT name, stock FROM products WHERE stock > 10;

-- 7. Orders with status 'pending'
SELECT * FROM orders WHERE status = 'pending';

-- 8. Latest 5 users
SELECT * FROM users ORDER BY created_at DESC LIMIT 5;

-- 9. Products sorted by price descending
SELECT name, price FROM products ORDER BY price DESC;

-- 10. Count total users
SELECT COUNT(*) AS total_users FROM users;

-- 11. Count total orders
SELECT COUNT(*) AS total_orders FROM orders;

-- 12. Sum total amount of all orders
SELECT SUM(total_amount) AS total_sales FROM orders;

-- 13. Average order amount
SELECT AVG(total_amount) AS avg_order_amount FROM orders;

-- 14. Max order amount
SELECT MAX(total_amount) AS max_order_amount FROM orders;

-- 15. Min order amount
SELECT MIN(total_amount) AS min_order_amount FROM orders;

-- 16. List products in 'Electronics' category
SELECT * FROM products WHERE category = 'Electronics';

-- 17. Orders above 50000
SELECT * FROM orders WHERE total_amount > 50000;

-- 18. Products with stock less than 5
SELECT * FROM products WHERE stock < 5;

-- 19. Users created in last 30 days
SELECT * FROM users WHERE created_at >= NOW() - INTERVAL 30 DAY;

-- 20. Orders in last 7 days
SELECT * FROM orders WHERE order_date >= NOW() - INTERVAL 7 DAY;

-- 21. Payments completed
SELECT * FROM payments WHERE status = 'completed';

-- 22. Payments pending
SELECT * FROM payments WHERE status = 'pending';

-- 23. Orders with status 'shipped'
SELECT * FROM orders WHERE status = 'shipped';

-- 24. Cart created before 2025
SELECT * FROM cart WHERE created_at < '2025-01-01';

-- 25. Cart items with quantity more than 2
SELECT * FROM cart_items WHERE quantity > 2;

-- 26. Orders with total_amount between 20000 and 80000
SELECT * FROM orders WHERE total_amount BETWEEN 20000 AND 80000;

-- 27. Products priced above 10000
SELECT * FROM products WHERE price > 10000;

-- 28. Users with no phone number
SELECT * FROM users WHERE phone IS NULL;

-- 29. Count orders by status
SELECT status, COUNT(*) AS count_orders FROM orders GROUP BY status;

-- 30. Count products by category
SELECT category, COUNT(*) AS total_products FROM products GROUP BY category;

-- 31. Maximum stock in products
SELECT MAX(stock) AS max_stock FROM products;

-- 32. Minimum stock in products
SELECT MIN(stock) AS min_stock FROM products;

-- 33. Average product price
SELECT AVG(price) AS avg_price FROM products;

-- 34. Sum of all payments
SELECT SUM(amount) AS total_payments FROM payments;

-- 35. Latest payment
SELECT * FROM payments ORDER BY payment_date DESC LIMIT 1;

-- 36. Users sorted by name
SELECT * FROM users ORDER BY full_name;

-- 37. Products sorted by name ascending
SELECT * FROM products ORDER BY name ASC;

-- 38. Orders with total_amount not null
SELECT * FROM orders WHERE total_amount IS NOT NULL;

-- 39. Cart items with quantity equal to 1
SELECT * FROM cart_items WHERE quantity = 1;

-- 40. Payments using UPI
SELECT * FROM payments WHERE method = 'upi';

-- 41. Payments using credit card
SELECT * FROM payments WHERE method = 'credit_card';

-- 42. Orders that are not cancelled
SELECT * FROM orders WHERE status != 'cancelled';

-- 43. Count users by address presence
SELECT CASE WHEN address IS NULL THEN 'No Address' ELSE 'Has Address' END AS address_status, COUNT(*) AS total_users FROM users GROUP BY address_status;

-- 44. Products with price less than average price
SELECT * FROM products WHERE price < (SELECT AVG(price) FROM products);

-- 45. Orders with total_amount greater than average order
SELECT * FROM orders WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- 46. Payments failed
SELECT * FROM payments WHERE status = 'failed';

-- 47. Users created before 2023
SELECT * FROM users WHERE created_at < '2023-01-01';

-- 48. Orders pending or processing
SELECT * FROM orders WHERE status IN ('pending','processing');

-- 49. Products in category 'Furniture'
SELECT * FROM products WHERE category = 'Furniture';

-- 50. Count of carts per user
SELECT user_id, COUNT(*) AS total_carts FROM cart GROUP BY user_id;
