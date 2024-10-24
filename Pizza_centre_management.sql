-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(255)  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    `item_id` varchar(255)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `cust_id` int  NOT NULL ,
    `delivery` boolean  NOT NULL ,
    `add_id` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Customers` (
    `cust_id` int  NOT NULL ,
    `customer_firstname` varchar(255)  NOT NULL ,
    `customer_lasttname` varchar(255)  NOT NULL ,
    PRIMARY KEY (
        `cust_id`
    )
);

CREATE TABLE `Address` (
    `add_id` int  NOT NULL ,
    `delivery_address1` varchar(255)  NOT NULL ,
    `delivery_address2` varchar(255)  NULL ,
    `delivery_city` varchar(255)  NOT NULL ,
    `delivery_zipcode` varchar(255)  NOT NULL ,
    PRIMARY KEY (
        `add_id`
    )
);

CREATE TABLE `Item` (
    `item_id` varchar(255)  NOT NULL ,
    `sku` varchar(255)  NOT NULL ,
    `item_name` varchar(255)  NOT NULL ,
    `item_cat` varchar(255)  NOT NULL ,
    `item_size` varchar(255)  NOT NULL ,
    `item_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    )
);

CREATE TABLE `Ingredient` (
    `ing_id` varchar(255)  NOT NULL ,
    `ing_name` varchar(255)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_meas` varchar(255)  NOT NULL ,
    `ing_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

CREATE TABLE `Recipe` (
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(255)  NOT NULL ,
    `ing_id` varchar(255)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Inventory` (
    `inv_id` int  NOT NULL ,
    `item_id` varchar(255)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `inv_id`
    )
);

CREATE TABLE `Rota` (
    `row_id` int  NOT NULL ,
    `rota_id` varchar(255)  NOT NULL ,
    `date` datetime  NOT NULL ,
    `shift_id` varchar(255)  NOT NULL ,
    `staff_id` varchar(255)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Staff` (
    `staff_id` varchar(255)  NOT NULL ,
    `firstname` varchar(255)  NOT NULL ,
    `lastname` varchar(255)  NOT NULL ,
    `position` varchar(255)  NOT NULL ,
    `hourly_rate` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

CREATE TABLE `Shift` (
    `shift_id` varchar(255)  NOT NULL ,
    `day_of_week` varchar(255)  NOT NULL ,
    `start_time` time  NOT NULL ,
    `end_time` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

ALTER TABLE `Customers` ADD CONSTRAINT `fk_Customers_cust_id` FOREIGN KEY(`cust_id`)
REFERENCES `Orders` (`cust_id`);

ALTER TABLE `Address` ADD CONSTRAINT `fk_Address_add_id` FOREIGN KEY(`add_id`)
REFERENCES `Orders` (`add_id`);

ALTER TABLE `Item` ADD CONSTRAINT `fk_Item_item_id` FOREIGN KEY(`item_id`)
REFERENCES `Orders` (`item_id`);

ALTER TABLE `Recipe` ADD CONSTRAINT `fk_Recipe_recipe_id` FOREIGN KEY(`recipe_id`)
REFERENCES `Item` (`sku`);

ALTER TABLE `Recipe` ADD CONSTRAINT `fk_Recipe_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `Ingredient` (`ing_id`);

ALTER TABLE `Inventory` ADD CONSTRAINT `fk_Inventory_item_id` FOREIGN KEY(`item_id`)
REFERENCES `Recipe` (`ing_id`);

ALTER TABLE `Rota` ADD CONSTRAINT `fk_Rota_date` FOREIGN KEY(`date`)
REFERENCES `Orders` (`created_at`);

ALTER TABLE `Rota` ADD CONSTRAINT `fk_Rota_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `Staff` (`staff_id`);

ALTER TABLE `Shift` ADD CONSTRAINT `fk_Shift_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `Rota` (`shift_id`);

