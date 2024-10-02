CREATE TABLE IF NOT EXISTS public."Regions"
(
    "Region_ID" integer NOT NULL,
    "Region_Name" character varying,
    "Country" character varying,
    "City" character varying,
    PRIMARY KEY ("Region_ID")
);

-- Create Customer Segment Table
CREATE TABLE IF NOT EXISTS public."Customer_Segment"
(
    "Segment_ID" integer NOT NULL,
    "Segment_Name" character varying NOT NULL,
    "Description" text NOT NULL,
    PRIMARY KEY ("Segment_ID")
);

-- Create Customers Table
CREATE TABLE IF NOT EXISTS public."Customers"
(
    "Customer_ID" bigint NOT NULL,
    "Customer_Name" character varying(50)[] NOT NULL,
    "Customer_Email" character varying(50)[] NOT NULL,
    "Customer_Age" integer NOT NULL,
    "Customer_Gender" character varying(10)[] NOT NULL,
    "Customer_Region" integer NOT NULL,
    "Customer_Segment" integer,
    PRIMARY KEY ("Customer_ID")
);

-- Create Orders Table
CREATE TABLE IF NOT EXISTS public."Orders"
(
    "Order_ID" integer NOT NULL,
    "Order_Date" date NOT NULL,
    "Customer_ID" integer NOT NULL,
    "Payment_ID" integer NOT NULL,
    "Shipping_ID" integer NOT NULL,
    "Sales_Channel" character varying NOT NULL,
    "Total_Revenue" double precision NOT NULL,
    "Discount_Applied" double precision NOT NULL,
    "Order_Status" character varying NOT NULL,
    PRIMARY KEY ("Order_ID")
);

-- Create Order Details Table
CREATE TABLE IF NOT EXISTS public."Order_Details"
(
    "Order_ID" integer NOT NULL,
    "Product_ID" integer NOT NULL,
    "Quantity" integer NOT NULL,
    "Price" double precision NOT NULL,
    "Total_Revenue" double precision NOT NULL,
    "Discount_Applied" double precision NOT NULL,
    PRIMARY KEY ("Order_ID", "Product_ID")
);

-- Create Products Table
CREATE TABLE IF NOT EXISTS public."Products"
(
    "Product_ID" integer NOT NULL,
    "Product_Name" character varying NOT NULL,
    "Product_Category" integer NOT NULL,
    "Unit_Price" double precision NOT NULL,
    "Supplier_ID" integer NOT NULL,
    "Stock_Availability" integer NOT NULL,
    PRIMARY KEY ("Product_ID")
);

-- Create Product Categories Table
CREATE TABLE IF NOT EXISTS public."Product_Categories"
(
    "Category_ID" integer NOT NULL,
    "Category_Name" character varying NOT NULL,
    "Parent_Category_ID" integer NOT NULL,
    PRIMARY KEY ("Category_ID")
);

-- Create Suppliers Table
CREATE TABLE IF NOT EXISTS public."Suppliers"
(
    "Supplier_ID" integer NOT NULL,
    "Supplier_Name" character varying NOT NULL,
    "Supplier_Region" integer NOT NULL,
    "Supplier_Contact" character varying NOT NULL,
    PRIMARY KEY ("Supplier_ID")
);

-- Create Payments Table
CREATE TABLE IF NOT EXISTS public."Payments"
(
    "Payment_ID" integer NOT NULL,
    "Order_ID" integer NOT NULL,
    "Payment_Method" character varying NOT NULL,
    "Payment_Date" date NOT NULL,
    "Payment_Status" character varying NOT NULL,
    "Total_Amount" double precision NOT NULL,
    PRIMARY KEY ("Payment_ID")
);

-- Create Shipping Table
CREATE TABLE IF NOT EXISTS public."Shipping"
(
    "Shipping_ID" integer NOT NULL,
    "Order_ID" integer NOT NULL,
    "Shipping_Method" character varying NOT NULL,
    "Shipping_Date" date NOT NULL,
    "Shipping_Cost" double precision NOT NULL,
    "Shipping_Status" character varying NOT NULL,
    PRIMARY KEY ("Shipping_ID")
);

-- Create Discounts Table
CREATE TABLE IF NOT EXISTS public."Discounts"
(
    "Discount_ID" integer NOT NULL,
    "Discount_Type" character varying NOT NULL,
    "Discount_Description" text NOT NULL,
    "Discount_Percentage" double precision NOT NULL,
    "Start_Date" date NOT NULL,
    "End_Date" date NOT NULL,
    PRIMARY KEY ("Discount_ID")
);

-- Create Sales Reps Table
CREATE TABLE IF NOT EXISTS public."Sales_Reps"
(
    "SalesRep_ID" integer NOT NULL,
    "SalesRep_Name" character varying NOT NULL,
    "SalesRep_Region" integer NOT NULL,
    "Sales_Target" double precision NOT NULL,
    "Commission_Percentage" double precision NOT NULL,
    PRIMARY KEY ("SalesRep_ID")
);


INSERT INTO public."Regions" ("Region_ID", "Region_Name", "Country", "City") VALUES
(1, 'North', 'India', 'Delhi'),
(2, 'South', 'India', 'Chennai'),
(3, 'East', 'India', 'Kolkata'),
(4, 'West', 'India', 'Mumbai'),
(5, 'Central', 'India', 'Bhopal'),
(6, 'Northeast', 'India', 'Guwahati'),
(7, 'Northwest', 'India', 'Jaipur'),
(8, 'Southwest', 'India', 'Bengaluru'),
(9, 'Southeast', 'India', 'Hyderabad'),
(10, 'Midwest', 'India', 'Indore'),
(11, 'South-Central', 'India', 'Nagpur'),
(12, 'North-Central', 'India', 'Lucknow'),
(13, 'West-Central', 'India', 'Ahmedabad'),
(14, 'Northeast-Central', 'India', 'Agartala'),
(15, 'Southeast-Central', 'India', 'Visakhapatnam'),
(16, 'North-East-Region', 'India', 'Imphal'),
(17, 'South-East-Region', 'India', 'Coimbatore'),
(18, 'West-North-Region', 'India', 'Vadodara'),
(19, 'South-West-Region', 'India', 'Pune'),
(20, 'Central-East', 'India', 'Raipur');

INSERT INTO public."Discounts" ("Discount_ID", "Discount_Type", "Discount_Description", "Discount_Percentage", "Start_Date", "End_Date") VALUES
(1, 'Seasonal', 'Winter Sale', 10.00, '2024-01-01', '2024-02-01'),
(2, 'Clearance', 'End of Season Clearance', 20.00, '2024-03-01', '2024-04-01'),
(3, 'Festive', 'Diwali Festival Discount', 15.00, '2024-10-01', '2024-11-01'),
(4, 'Black Friday', 'Black Friday Sale', 25.00, '2024-11-01', '2024-11-30'),
(5, 'New Year', 'New Year Sale', 30.00, '2024-12-01', '2025-01-01'),
(6, 'Loyalty', 'Loyalty Reward Discount', 5.00, '2024-01-01', '2025-01-01'),
(7, 'Referral', 'Referral Program Discount', 10.00, '2024-01-01', '2025-01-01'),
(8, 'Bulk Purchase', 'Discount for Bulk Orders', 15.00, '2024-01-01', '2024-06-01'),
(9, 'Student', 'Student Discount', 10.00, '2024-01-01', '2025-01-01'),
(10, 'Birthday', 'Birthday Month Discount', 20.00, '2024-01-01', '2025-01-01'),
(11, 'Seasonal', 'Spring Sale', 12.00, '2024-02-01', '2024-03-01'),
(12, 'Clearance', 'Summer Clearance', 18.00, '2024-06-01', '2024-07-01'),
(13, 'Festive', 'Eid Discount', 15.00, '2024-04-01', '2024-05-01'),
(14, 'Black Friday', 'Black Friday Pre-Sale', 22.00, '2024-10-15', '2024-11-01'),
(15, 'New Year', 'End of Year Sale', 25.00, '2024-12-15', '2025-01-01'),
(16, 'Loyalty', 'VIP Loyalty Discount', 7.00, '2024-01-01', '2025-01-01'),
(17, 'Referral', 'Friend Referral Discount', 12.00, '2024-01-01', '2025-01-01'),
(18, 'Bulk Purchase', 'Wholesale Bulk Discount', 20.00, '2024-01-01', '2024-06-01'),
(19, 'Student', 'University Student Discount', 15.00, '2024-01-01', '2025-01-01'),
(20, 'Birthday', 'Birthday Surprise Discount', 18.00, '2024-01-01', '2025-01-01');

INSERT INTO public."Customer_Segment" ("Segment_ID", "Segment_Name", "Description") VALUES
(1, 'Retail', 'Retail Customers'),
(2, 'Wholesale', 'Wholesale Buyers'),
(3, 'Corporate', 'Corporate Clients'),
(4, 'Non-Profit', 'Non-Profit Organizations'),
(5, 'Educational', 'Educational Institutions'),
(6, 'Government', 'Government Agencies'),
(7, 'Individual', 'Individual Buyers'),
(8, 'Online', 'Online Shoppers'),
(9, 'Local', 'Local Community Buyers'),
(10, 'International', 'International Customers'),
(11, 'Luxury', 'Luxury Segment Customers'),
(12, 'Budget', 'Budget-Conscious Shoppers'),
(13, 'Eco-Friendly', 'Eco-Conscious Buyers'),
(14, 'Tech-Savvy', 'Technology Enthusiasts'),
(15, 'Bargain', 'Bargain Hunters'),
(16, 'Brand-Loyal', 'Brand-Loyal Customers'),
(17, 'Occasional', 'Occasional Shoppers'),
(18, 'Frequent', 'Frequent Buyers'),
(19, 'Seasonal', 'Seasonal Shoppers'),
(20, 'Value-Seeker', 'Value-Seeking Customers');


INSERT INTO public."Suppliers" ("Supplier_ID", "Supplier_Name", "Supplier_Region", "Supplier_Contact") VALUES
(1, 'ABC Electronics', 1, 'abc@electronics.com'),
(2, 'XYZ Furniture', 2, 'xyz@furniture.com'),
(3, '123 Clothing', 3, '123@clothing.com'),
(4, 'MNO Groceries', 4, 'mno@groceries.com'),
(5, 'PQR Tools', 5, 'pqr@tools.com'),
(6, 'LMN Appliances', 6, 'lmn@appliances.com'),
(7, 'JKL Toys', 7, 'jkl@toys.com'),
(8, 'TUV Cosmetics', 8, 'tuv@cosmetics.com'),
(9, 'GHI Stationery', 9, 'ghi@stationery.com'),
(10, 'RST Sports', 10, 'rst@sports.com'),
(11, 'CDE Jewelry', 1, 'cde@jewelry.com'),
(12, 'UVW Books', 2, 'uvw@books.com'),
(13, 'NOP Electronics', 3, 'nop@electronics.com'),
(14, 'DEF Fashion', 4, 'def@fashion.com'),
(15, 'WXY Home Decor', 5, 'wxy@homedecor.com'),
(16, 'ZAB Kitchenware', 6, 'zab@kitchenware.com'),
(17, 'CBA Health', 7, 'cba@health.com'),
(18, 'EFG Fitness', 8, 'efg@fitness.com'),
(19, 'HIJ Automotive', 9, 'hij@automotive.com'),
(20, 'KLM Musical Instruments', 10, 'klm@instruments.com');

INSERT INTO public."Product_Categories" ("Category_ID", "Category_Name", "Parent_Category_ID") VALUES
(1, 'Electronics', 0),
(2, 'Fashion', 0),
(3, 'Grocery', 0),
(4, 'Furniture', 0),
(5, 'Toys', 0),
(6, 'Books', 0),
(7, 'Cosmetics', 0),
(8, 'Hardware', 0),
(9, 'Appliances', 0),
(10, 'Sports', 0),
(11, 'Music', 0),
(12, 'Home Decor', 0),
(13, 'Stationery', 0),
(14, 'Garden Supplies', 0),
(15, 'Kitchenware', 0),
(16, 'Fitness', 0),
(17, 'Technology', 0),
(18, 'Automotive', 0),
(19, 'Pet Supplies', 0),
(20, 'Travel Accessories', 0);



INSERT INTO public."Sales_Reps" ("SalesRep_ID", "SalesRep_Name", "SalesRep_Region", "Sales_Target", "Commission_Percentage") VALUES
(1, 'Rahul Deshmukh', 1, 500000, 5.00),
(2, 'Nina Choudhury', 2, 400000, 6.00),
(3, 'Vikram Rao', 3, 450000, 7.00),
(4, 'Sanjay Gupta', 4, 550000, 5.50),
(5, 'Deepika Kapoor', 5, 350000, 4.00),
(6, 'Arjun Singh', 6, 300000, 5.00),
(7, 'Neha Reddy', 7, 600000, 6.50),
(8, 'Manish Sharma', 8, 480000, 5.75),
(9, 'Riya Menon', 9, 530000, 6.00),
(10, 'Ajay Yadav', 10, 510000, 5.25),
(11, 'Poonam Tyagi', 11, 490000, 5.80),
(12, 'Siddharth Varma', 12, 470000, 6.20),
(13, 'Kavita Joshi', 13, 550000, 6.30),
(14, 'Tarun Agarwal', 14, 600000, 5.90),
(15, 'Lata Iyer', 15, 430000, 4.50),
(16, 'Ramesh Singh', 16, 560000, 5.65),
(17, 'Sonia Malik', 17, 520000, 6.10),
(18, 'Rajiv Bansal', 18, 590000, 5.40),
(19, 'Priyanka Saini', 19, 640000, 6.70),
(20, 'Arvind Kumar', 20, 450000, 5.00);


INSERT INTO public."Customers" ("Customer_ID", "Customer_Name", "Customer_Email", "Customer_Age", "Customer_Gender", "Customer_Region", "Customer_Segment") VALUES
(1, '{Amit Sharma}', '{amit@example.com}', 30, '{Male}', 1, 1),
(2, '{Sneha Patel}', '{sneha@example.com}', 25, '{Female}', 2, 2),
(3, '{Rajesh Kumar}', '{rajesh@example.com}', 40, '{Male}', 3, 3),
(4, '{Priya Mehta}', '{priya@example.com}', 28, '{Female}', 4, 1),
(5, '{Vikram Singh}', '{vikram@example.com}', 35, '{Male}', 5, 2),
(6, '{Neha Gupta}', '{neha@example.com}', 22, '{Female}', 6, 3),
(7, '{Suresh Iyer}', '{suresh@example.com}', 45, '{Male}', 7, 4),
(8, '{Rani Verma}', '{rani@example.com}', 32, '{Female}', 8, 1),
(9, '{Karan Bansal}', '{karan@example.com}', 38, '{Male}', 9, 2),
(10, '{Anita Roy}', '{anita@example.com}', 29, '{Female}', 10, 3),
(11, '{Deepak Sharma}', '{deepak@example.com}', 36, '{Male}', 11, 4),
(12, '{Pooja Joshi}', '{pooja@example.com}', 27, '{Female}', 12, 1),
(13, '{Manoj Tiwari}', '{manoj@example.com}', 34, '{Male}', 13, 2),
(14, '{Shweta Saxena}', '{shweta@example.com}', 31, '{Female}', 14, 3),
(15, '{Aakash Singh}', '{aakash@example.com}', 23, '{Male}', 15, 4),
(16, '{Ritika Agarwal}', '{ritika@example.com}', 26, '{Female}', 16, 1),
(17, '{Kishore Nair}', '{kishore@example.com}', 37, '{Male}', 17, 2),
(18, '{Neeraj Jain}', '{neeraj@example.com}', 33, '{Male}', 18, 3),
(19, '{Sonali Mehta}', '{sonali@example.com}', 29, '{Female}', 19, 4),
(20, '{Anil Desai}', '{anil@example.com}', 41, '{Male}', 20, 1);


INSERT INTO public."Products" ("Product_ID", "Product_Name", "Product_Category", "Unit_Price", "Supplier_ID", "Stock_Availability") VALUES
(1, 'Laptop', 1, 699.99, 1, 50),
(2, 'Smartphone', 1, 499.99, 2, 100),
(3, 'Tablet', 1, 299.99, 3, 75),
(4, 'Smartwatch', 1, 199.99, 4, 150),
(5, 'Headphones', 2, 99.99, 5, 200),
(6, 'Bluetooth Speaker', 2, 79.99, 6, 80),
(7, 'Gaming Console', 3, 399.99, 7, 30),
(8, 'Monitor', 4, 199.99, 8, 60),
(9, 'Keyboard', 4, 49.99, 9, 120),
(10, 'Mouse', 4, 29.99, 10, 140),
(11, 'External Hard Drive', 5, 89.99, 11, 50),
(12, 'USB Flash Drive', 5, 19.99, 12, 200),
(13, 'Printer', 6, 129.99, 13, 40),
(14, 'Scanner', 6, 99.99, 14, 60),
(15, 'Webcam', 7, 49.99, 15, 80),
(16, 'Microphone', 7, 79.99, 16, 70),
(17, 'Router', 8, 69.99, 17, 90),
(18, 'Surge Protector', 8, 39.99, 18, 110),
(19, 'HDMI Cable', 9, 14.99, 19, 150),
(20, 'Graphics Card', 10, 299.99, 20, 25);



INSERT INTO public."Orders" ("Order_ID", "Order_Date", "Customer_ID", "Payment_ID", "Shipping_ID", "Sales_Channel", "Total_Revenue", "Discount_Applied", "Order_Status") VALUES
(1, '2024-01-01', 1, 1, 1, 'Online', 699.99, 0, 'Completed'),
(2, '2024-01-02', 2, 2, 2, 'Online', 499.99, 10, 'Completed'),
(3, '2024-01-03', 3, 3, 3, 'In-Store', 299.99, 5, 'Pending'),
(4, '2024-01-04', 4, 4, 4, 'Online', 199.99, 0, 'Completed'),
(5, '2024-01-05', 5, 5, 5, 'Online', 99.99, 5, 'Completed'),
(6, '2024-01-06', 6, 6, 6, 'In-Store', 79.99, 0, 'Shipped'),
(7, '2024-01-07', 7, 7, 7, 'Online', 399.99, 20, 'Completed'),
(8, '2024-01-08', 8, 8, 8, 'Online', 199.99, 0, 'Pending'),
(9, '2024-01-09', 9, 9, 9, 'In-Store', 49.99, 2, 'Completed'),
(10, '2024-01-10', 10, 10, 10, 'Online', 29.99, 0, 'Shipped'),
(11, '2024-01-11', 11, 11, 11, 'In-Store', 89.99, 0, 'Completed'),
(12, '2024-01-12', 12, 12, 12, 'Online', 19.99, 0, 'Pending'),
(13, '2024-01-13', 13, 13, 13, 'In-Store', 129.99, 0, 'Completed'),
(14, '2024-01-14', 14, 14, 14, 'Online', 99.99, 0, 'Shipped'),
(15, '2024-01-15', 15, 15, 15, 'In-Store', 49.99, 0, 'Completed'),
(16, '2024-01-16', 16, 16, 16, 'Online', 79.99, 0, 'Pending'),
(17, '2024-01-17', 17, 17, 17, 'Online', 69.99, 0, 'Completed'),
(18, '2024-01-18', 18, 18, 18, 'In-Store', 39.99, 0, 'Completed'),
(19, '2024-01-19', 19, 19, 19, 'Online', 14.99, 0, 'Pending'),
(20, '2024-01-20', 20, 20, 20, 'In-Store', 299.99, 0, 'Completed');


INSERT INTO public."Order_Details" ("Order_ID", "Product_ID", "Quantity", "Price", "Total_Revenue", "Discount_Applied") VALUES
(1, 1, 1, 699.99, 699.99, 0),
(2, 2, 1, 499.99, 499.99, 10),
(3, 3, 1, 299.99, 299.99, 5),
(4, 4, 1, 199.99, 199.99, 0),
(5, 5, 2, 199.99, 199.99, 5),
(6, 6, 1, 79.99, 79.99, 0),
(7, 7, 1, 399.99, 399.99, 20),
(8, 8, 1, 199.99, 199.99, 0),
(9, 9, 2, 49.99, 99.98, 2),
(10, 10, 3, 29.99, 89.97, 0),
(11, 11, 1, 89.99, 89.99, 0),
(12, 12, 5, 19.99, 99.95, 0),
(13, 13, 1, 129.99, 129.99, 0),
(14, 14, 1, 99.99, 99.99, 0),
(15, 15, 1, 49.99, 49.99, 0),
(16, 16, 2, 79.99, 159.98, 0),
(17, 17, 1, 69.99, 69.99, 0),
(18, 18, 1, 39.99, 39.99, 0),
(19, 19, 3, 14.99, 44.97, 0),
(20, 20, 1, 299.99, 299.99, 0);


INSERT INTO public."Payments" ("Payment_ID", "Order_ID", "Payment_Method", "Payment_Date", "Payment_Status", "Total_Amount") VALUES
(1, 1, 'Credit Card', '2024-01-01', 'Completed', 699.99),
(2, 2, 'Credit Card', '2024-01-02', 'Completed', 499.99),
(3, 3, 'PayPal', '2024-01-03', 'Pending', 299.99),
(4, 4, 'Debit Card', '2024-01-04', 'Completed', 199.99),
(5, 5, 'Credit Card', '2024-01-05', 'Completed', 99.99),
(6, 6, 'PayPal', '2024-01-06', 'Shipped', 79.99),
(7, 7, 'Credit Card', '2024-01-07', 'Completed', 399.99),
(8, 8, 'Debit Card', '2024-01-08', 'Pending', 199.99),
(9, 9, 'Credit Card', '2024-01-09', 'Completed', 49.99),
(10, 10, 'PayPal', '2024-01-10', 'Shipped', 29.99),
(11, 11, 'Credit Card', '2024-01-11', 'Completed', 89.99),
(12, 12, 'Debit Card', '2024-01-12', 'Pending', 19.99),
(13, 13, 'PayPal', '2024-01-13', 'Completed', 129.99),
(14, 14, 'Credit Card', '2024-01-14', 'Shipped', 99.99),
(15, 15, 'Debit Card', '2024-01-15', 'Completed', 49.99),
(16, 16, 'PayPal', '2024-01-16', 'Pending', 79.99),
(17, 17, 'Credit Card', '2024-01-17', 'Completed', 69.99),
(18, 18, 'Debit Card', '2024-01-18', 'Completed', 39.99),
(19, 19, 'Credit Card', '2024-01-19', 'Pending', 14.99),
(20, 20, 'PayPal', '2024-01-20', 'Completed', 299.99);


INSERT INTO public."Shipping" ("Shipping_ID", "Order_ID", "Shipping_Method", "Shipping_Date", "Shipping_Status", "Shipping_Cost") VALUES
(1, 1, 'Standard', '2024-01-02', 'Delivered', 10.00),
(2, 2, 'Express', '2024-01-03', 'Delivered', 15.00),
(3, 3, 'Standard', '2024-01-04', 'Pending', 10.00),
(4, 4, 'Express', '2024-01-05', 'Delivered', 15.00),
(5, 5, 'Standard', '2024-01-06', 'Delivered', 5.00),
(6, 6, 'Express', '2024-01-07', 'Shipped', 15.00),
(7, 7, 'Standard', '2024-01-08', 'Delivered', 10.00),
(8, 8, 'Express', '2024-01-09', 'Pending', 15.00),
(9, 9, 'Standard', '2024-01-10', 'Delivered', 5.00),
(10, 10, 'Express', '2024-01-11', 'Shipped', 15.00),
(11, 11, 'Standard', '2024-01-12', 'Delivered', 10.00),
(12, 12, 'Express', '2024-01-13', 'Pending', 15.00),
(13, 13, 'Standard', '2024-01-14', 'Delivered', 10.00),
(14, 14, 'Express', '2024-01-15', 'Shipped', 15.00),
(15, 15, 'Standard', '2024-01-16', 'Delivered', 5.00),
(16, 16, 'Express', '2024-01-17', 'Pending', 15.00),
(17, 17, 'Standard', '2024-01-18', 'Delivered', 10.00),
(18, 18, 'Express', '2024-01-19', 'Delivered', 15.00),
(19, 19, 'Standard', '2024-01-20', 'Pending', 5.00),
(20, 20, 'Express', '2024-01-21', 'Delivered', 15.00);



-- relation ship 

-- Add Foreign Key Constraints (after ensuring tables exist)
ALTER TABLE IF EXISTS public."Customers"
    ADD FOREIGN KEY ("Customer_Region")
    REFERENCES public."Regions" ("Region_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Customers"
    ADD FOREIGN KEY ("Customer_Segment")
    REFERENCES public."Customer_Segment" ("Segment_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Orders"
    ADD FOREIGN KEY ("Customer_ID")
    REFERENCES public."Customers" ("Customer_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Orders"
    ADD FOREIGN KEY ("Payment_ID")
    REFERENCES public."Payments" ("Payment_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Orders"
    ADD FOREIGN KEY ("Shipping_ID")
    REFERENCES public."Shipping" ("Shipping_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Order_Details"
    ADD FOREIGN KEY ("Order_ID")
    REFERENCES public."Orders" ("Order_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Order_Details"
    ADD FOREIGN KEY ("Product_ID")
    REFERENCES public."Products" ("Product_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Products"
    ADD FOREIGN KEY ("Product_Category")
    REFERENCES public."Product_Categories" ("Category_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Products"
    ADD FOREIGN KEY ("Supplier_ID")
    REFERENCES public."Suppliers" ("Supplier_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Suppliers"
    ADD FOREIGN KEY ("Supplier_Region")
    REFERENCES public."Regions" ("Region_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Payments"
    ADD FOREIGN KEY ("Order_ID")
    REFERENCES public."Orders" ("Order_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Shipping"
    ADD FOREIGN KEY ("Order_ID")
    REFERENCES public."Orders" ("Order_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public."Sales_Reps"
    ADD FOREIGN KEY ("SalesRep_Region")
    REFERENCES public."Regions" ("Region_ID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;



-- Write a SQL query to select all columns from the Customers table. 
SELECT * FROM "Customers" ;

-- Write a SQL query to retrieve customers whose age is greater than 30.

SELECT "Customer_Name"
FROM "Customers"
WHERE "Customer_Age" > 30 ;

-- Write a SQL query to select all products and order them by Unit_Price in descending order.

select * from "Products" ;

select "Product_Name" 
from "Products"
order by "Unit_Price" DESC ;


-- Write a SQL query to calculate the total revenue generated from all orders in the Orders table.
select * from "Orders" ;

select sum("Total_Revenue")
from "Orders" ;

-- Write a SQL query to count the number of orders placed by each customer and display the customer names along with their order counts.
select * from "Customers" ;

select c."Customer_Name"[1] , count(o."Order_ID")
from "Customers" c 
join 
"Orders" o on c."Customer_ID" = o."Customer_ID" 
group by 
c."Customer_Name"[1] ;

-- Write a SQL query to retrieve the first 10 records from the Orders table.
select * from 
"Orders"
limit 10 ;

-- Write a SQL query to find all unique regions from the Regions table.

select * from "Regions" ;

select distinct("Region_Name") 
from "Regions" ;

-- Write a SQL query to count the total number of orders in the Orders table. 
select * from "Orders" ;

select count("Order_ID") 
from "Orders" ;

-- Write a SQL query to count the number of customers in each region.
select * from "Regions" ;
SELECT * FROM "Customers" ;

select count(c."Customer_ID") , r."Region_Name" 
from "Customers" c 
join "Regions" r on c."Customer_Region" = r."Region_ID" 
group by r."Region_Name" ;

-- Write a SQL query to find regions with more than 5 customers.
select count(c."Customer_ID") as "Customer_Count" , r."Region_Name" 
from "Customers" c 
join "Regions" r on c."Customer_Region" = r."Region_ID" 
group by r."Region_Name" 
having count(c."Customer_ID") >= 5 ;

-- Write a SQL query to retrieve order details along with the corresponding product names.

 select * from "Order_Details" ;
 select * from "Products" ;

select o."Order_ID" , o."Product_ID" , o."Quantity" , o."Price" , o."Total_Revenue" , o."Discount_Applied" ,  p."Product_ID"
from "Order_Details" o 
join "Products" p on o."Product_ID" = p."Product_ID" ;


-- Write a SQL query to find orders placed by customers from the "West" region. 
select * from "Orders" ;
select * from "Customers" ; 
select * from "Regions" ;

select c."Customer_Name"  , r."Region_Name" , o."Order_ID"
from "Customers" c 
join "Orders" o on c."Customer_ID" = o."Customer_ID"
join "Regions" r on c."Customer_Region" = r."Region_ID" 
where r."Region_Name" = 'West' ;


-- Write a SQL query to find customers who have placed orders worth more than $1000.
select * from "Customers" ; 
select * from "Orders" ;

select c."Customer_Name" 
from "Customers" c 
where c."Customer_ID" in (
select "Customer_ID" from 
"Orders" where "Total_Revenue" > 500 
);


-- Write a SQL query to find products that have been ordered more than their stock availability.

select * from "Products" ;
select * from "Order_Details" ;

select p."Product_Name"  , p."Stock_Availability" 
from "Products" p 
where p."Product_ID" in (
select od."Product_ID" 
from "Order_Details" od 
group by od."Product_ID" 
having sum(od."Quantity") > p."Stock_Availability" 
);

-- Write a SQL query to update the Stock_Availability of a product. 

update "Products" 
set "Stock_Availability" = 1000 
where "Product_ID" = 1 ;

select * from "Products" ;


-- Write a SQL query to delete a customer who has not placed any orders. 

select * from "Customers" ;
select * from "Orders" ;

delete from "Customers" c 
where not exists ( 
select 1 
from "Orders" o 
where c."Customer_ID" = o."Customer_ID" 
) ;

-- Write a SQL query to calculate the running total of sales for each month.

select * from "Order_Details" ;
select 
DATE_TRUNC('MONTH' ,  "Order_Date" ) as "month"  , 
SUM("Total_Revenue") as "Monthly Sale" 
from "Orders" 
group by date_Trunc('MONTH' ,  "Order_Date" )
order by "month" ;


-- Write a SQL query using a CTE to find the average order value per customer.
select * from "Orders" ;
with customerordertotal as 
(
select "Customer_ID" , 
sum("Total_Revenue") as "Total_Order"
from "Orders" 
group by "Customer_ID"
)
select "Customer_ID" , avg("Total_Order")  as average
from "customerordertotal" 
group by "Customer_ID" ;


-- Write a SQL query to retrieve customers and their total order values, including those with no orders.

select c."Customer_Name" , 
sum(o."Total_Revenue") 
from "Customers" c 
left join "Orders" o on c."Customer_ID" = o."Customer_ID" 
group by c."Customer_Name" ;

-- Write a SQL query to transform the Discounts data to show discount types along with their total amounts.

select "Discount_Type" , sum("Discount_Percentage")
from "Discounts" 
group by "Discount_Type" ;


-- Describe how to create a stored procedure that retrieves a customer’s details by Customer_ID.

drop procedure get_customer_details ;

CREATE OR REPLACE PROCEDURE get_customer_details(
    P_Customer_ID integer 
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
   update "Customers" 
   set "Customer_Name" = '{Sachin}'
   where "Customer_ID" = 2 ;
END; 
$$;


call get_customer_details(1) ;

select * from "Customers" ;


-- Explain how to create a trigger that updates stock availability after an order is placed.


select * from "Products"

CREATE OR REPLACE FUNCTION stock_update()
returns trigger as $$
begin 
update "Products"
set "Stock_Availability" = "Stock_Availability" - New."Quantity" 
where "Product_ID" = new."Product_ID" ;

if (select "Stock_Availability" from "Products" where "Product_ID" = new."Product_ID" ) < 0 then
raise exception 'Out OF stock :%' , new."Product_ID" ;
end if ; 
return new ;
end ; 
$$ language plpgsql ;


create or replace trigger after_insert
after insert on "Order_Details"
for each row
execute function stock_update();
END;
/

INSERT INTO "Order_Details" ("Order_ID", "Product_ID", "Quantity", "Price", "Total_Revenue", "Discount_Applied")
VALUES (18, 2, 3, 100.00 , 0 , 0);


--  create an index on the Product_Name column.

create index index_product_name 
on "Products" ("Product_Name");

select * from "Products" 
where "Product_Name" = 'Laptop' ;

-- create a transaction that updates order status and stock availability.

begin ;

update "Orders" 
set "Order_Status" = 'Shipped' 
where "Order_ID" = 10 ;

update "Products" 
set "Stock_Availability" = "Stock_Availability" - od."Quantity"
from "Order_Details" od 
where od."Product_ID" = "Products"."Product_ID"
and od."Order_ID" = 10 ;

commit ;
Rollback ;
-- Write a SQL query to analyze the total revenue generated from each sales channel.

select * from "Payments" ;

select "Payment_Method" , sum("Total_Amount") 
from "Payments"
group by "Payment_Method" ;


 



