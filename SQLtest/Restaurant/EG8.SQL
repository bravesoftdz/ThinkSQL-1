SELECT 
	CHECK_NO, LINE_NO, MENU_ITEM_NAME, QTY, PRICE, QTY*PRICE AS EXTENSION
FROM 
	MENU_ITEM M CROSS JOIN CHECK_DETAIL D 
WHERE 
	D.MENU_ITEM_NO=M.MENU_ITEM_NO