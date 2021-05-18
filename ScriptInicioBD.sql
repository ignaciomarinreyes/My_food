INSERT INTO my_food.user (fullName, nickName, password) VALUES('jesus', 'vlarez', '1234');


ALTER TABLE my_food.MenuAndItem DROP FOREIGN KEY fk_MenuAndItem_to_menu;
ALTER TABLE my_food.MenuAndItem DROP FOREIGN KEY fk_MenuAndItem_to_item;

ALTER TABLE my_food.MenuAndItem ADD FOREIGN KEY fk_MenuAndItem_to_item(id_item) REFERENCES item(id) on delete cascade ON UPDATE CASCADE; 
ALTER TABLE my_food.MenuAndItem ADD FOREIGN KEY fk_MenuAndItem_to_menu(id_menu) REFERENCES menu(id) on delete cascade ON UPDATE CASCADE; 

ALTER TABLE my_food.ItemAndSection DROP FOREIGN KEY fk_ItemAndSection_to_item;
ALTER TABLE my_food.ItemAndSection DROP FOREIGN KEY fk_ItemAndSection_to_section;

ALTER TABLE my_food.ItemAndSection ADD FOREIGN KEY fk_ItemAndSection_to_item(id_item) REFERENCES item(id) on delete cascade ON UPDATE CASCADE; 
ALTER TABLE my_food.ItemAndSection ADD FOREIGN KEY fk_ItemAndSection_to_section(id_section) REFERENCES section_(id) on delete cascade ON UPDATE CASCADE; 

ALTER TABLE my_food.ItemAndIngredient DROP FOREIGN KEY fk_ItemAndIngredient_to_ingredient;
ALTER TABLE my_food.ItemAndIngredient DROP FOREIGN KEY fk_ItemAndIngredient_to_item;

ALTER TABLE my_food.ItemAndIngredient ADD FOREIGN KEY fk_ItemAndIngredient_to_ingredient(id_ingredient) REFERENCES ingredient(id) on delete cascade ON UPDATE CASCADE; 
ALTER TABLE my_food.ItemAndIngredient ADD FOREIGN KEY fk_ItemAndIngredient_to_item(id_item) REFERENCES item(id) on delete cascade ON UPDATE CASCADE; 

ALTER TABLE my_food.ItemAndAllergen DROP FOREIGN KEY fk_ItemAndAllergen_to_allergen;
ALTER TABLE my_food.ItemAndAllergen DROP FOREIGN KEY fk_ItemAndAllergen_to_item;

ALTER TABLE my_food.ItemAndAllergen ADD FOREIGN KEY fk_ItemAndAllergen_to_allergen(id_allergen) REFERENCES allergen(id) on delete cascade ON UPDATE CASCADE; 
ALTER TABLE my_food.ItemAndAllergen ADD FOREIGN KEY fk_ItemAndAllergen_to_item(id_item) REFERENCES item(id) on delete cascade ON UPDATE CASCADE; 




