CREATE TABLE Purchases(
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    retailer VARCHAR(30),
    category VARCHAR(30),
    amount DECIMAL(10,2),
    purchase_date DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE OrchardTrees(
    tree_id INT PRIMARY KEY AUTO_INCREMENT,
    species VARCHAR(30),
    variety VARCHAR(30),
    initial_cost DECIMAL(6,2),
    last_fertilized DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Equipment(
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_type VARCHAR(50),
    model VARCHAR(30),
    last_maintenance DATE,
    price DECIMAL(10,2),
    purchase_date DATE,
    purchase_id INT,
    FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Sales(
	sale_id INT PRIMARY KEY,
    category VARCHAR(100),
    amount DECIMAL(8,2),
    date_of_sale DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Livestock(
	livestock_id INT PRIMARY KEY AUTO_INCREMENT,
    date_of_birth DATE,
    livestock_type VARCHAR(8),
    gender VARCHAR(6),
    breed VARCHAR(25),
    sales_price DECIMAL(7,2),
    last_dewormer DATE,
    last_minerals DATE,
    purchase_id INT,
    FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id),
    sale_id INT,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Crops(
	crop_id INT PRIMARY KEY,
    crop_type VARCHAR(30),
    variety VARCHAR(30),
    quantity_planted INT,
    planting_date DATE,
    expected_harvest DATE,
    actual_harvest DATE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



