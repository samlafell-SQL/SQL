-- Enum and Set Types

/*
Column: Size
Only want small, medium and large...
*/

USE sql_store;

/* Go to design mode.. and add in SIZE Column with ENUM type..
ENUM('small', 'medium', 'large') */

ALTER TABLE `sql_store`.`products` 
ADD COLUMN `size` ENUM('small', 'medium', 'large') NULL AFTER `unit_price`;

UPDATE `sql_store`.`products` SET `size` = 'small' WHERE (`product_id` = '1');

/* Enum, in theory, is a good idea.

But it's expensive. If we decide to change what's possible to use in the ENUM
The whole table will rebuild.

- Also, we can't actually include the measurements for each size.
- If we want a drop down, that's harder than we think
- Also, we can't reuse the values and we'd have to apply changes

A better approach is to just have a table called sizes with all sizes and their information.

This is called a Lookup table.

payment_methods in SQL_invoicing is a Lookup table.

use lookup table for drop down lists */



/* Set

Set() specify list of values.

Also bad and causes issues */
