CREAT TABLE customers (
	customer_id INT PRIMARY KEY,
	costumer_name VARCHAR(100),
	account_age_days INT,
	customer_segment VARCHAR(50),
	home_city VARCHAR(50),
	home_country VARCHAR(50)
);

CREAT TABLE transactions (
	transaction_id INT PRIMARY KEY,
	customer_id INT,
	amount NUMERIC,
	status VARCHAR(20),
	channel VARCHAR(20),
	city VARCHAR(50),
	country VARCHAR(50),
	is_international BOOLEAN,
	risk_signal VARCHAR(50)
);
