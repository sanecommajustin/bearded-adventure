use CHINESE_FRIDAY;

/*Referencing tables*/
DROP TABLE IF EXISTS MEAL_OPTIONS;
DROP TABLE IF EXISTS SELECTED_MEAL_OPTIONS;
DROP TABLE IF EXISTS ORDERS;

/*Base tables*/
DROP TABLE IF EXISTS MEAL_OPTIONS_BASE;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS MEALS;
DROP TABLE IF EXISTS RICE;

CREATE TABLE MEAL_OPTIONS_BASE(
	MOB_ID INT UNSIGNED AUTO_INCREMENT,
	MOB_OPTION VARCHAR(30) NOT NULL,
	PRIMARY KEY(MOB_ID)
);

CREATE TABLE USERS(
	USER_ID INT UNSIGNED AUTO_INCREMENT,
	USER_NAME VARCHAR(30) NOT NULL UNIQUE,
	PRIMARY KEY(USER_ID)
);

CREATE TABLE MEALS(
	MEAL_ID INT UNSIGNED AUTO_INCREMENT,
	MEAL_NAME VARCHAR(30) NOT NULL,
	MEAL_PRICE NUMERIC(5,2),
	PRIMARY KEY(MEAL_ID)
);

CREATE TABLE RICE(
	RICE_ID INT UNSIGNED AUTO_INCREMENT,
	RICE_TYPE VARCHAR(10) NOT NULL UNIQUE,
	PRIMARY KEY(RICE_ID)
);

CREATE TABLE MEAL_OPTIONS(
	MO_MOB_ID INT UNSIGNED NOT NULL,
	MO_MEAL_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY(MO_MOB_ID, MO_MEAL_ID),
	FOREIGN KEY(MO_MOB_ID) REFERENCES MEAL_OPTIONS_BASE(MOB_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(MO_MEAL_ID) REFERENCES MEALS(MEAL_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE ORDERS(
	ORDER_ID INT UNSIGNED AUTO_INCREMENT,
	ORDER_DATE DATE NOT NULL,
	ORDER_USER_ID INT UNSIGNED NOT NULL,
	ORDER_MEAL_ID INT UNSIGNED NOT NULL,
	ORDER_RICE INT UNSIGNED NOT NULL,
	PRIMARY KEY(ORDER_ID),
	FOREIGN KEY(ORDER_USER_ID) REFERENCES USERS(USER_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(ORDER_MEAL_ID) REFERENCES MEALS(MEAL_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(ORDER_RICE) REFERENCES RICE(RICE_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE SELECTED_MEAL_OPTIONS(
	SMO_MOB_ID INT UNSIGNED NOT NULL,
	SMO_ORDER_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY(SMO_MOB_ID, SMO_ORDER_ID),
	FOREIGN KEY(SMO_MOB_ID) REFERENCES MEAL_OPTIONS_BASE(MOB_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(SMO_ORDER_ID) REFERENCES ORDERS(ORDER_ID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

/* Create User list */
INSERT INTO MEAL_OPTIONS_BASE VALUES(null, 'No veggies'), (null, 'Add Chopsticks');

INSERT INTO USERS VALUES(null, 'Justin Walrath'),(null, 'Jered Berge'),(null, 'Tracy Buck'),(null, 'Cliff Torpy'),(null, 'Tessa Seiders'),(null, 'Nathan Palmer'),(null, 'Jared Barden');

INSERT INTO MEALS VALUES(null, 'L25 General Tso\'s Chicken', 4.95), (null, 'L25 General Tso\'s Shrimp', 4.95);

INSERT INTO RICE VALUES(null, 'Fried Rice'), (null, 'White Rice'), (null, 'Roast Pork');

INSERT INTO MEAL_OPTIONS VALUES(1, 1), (1, 2), (2, 1), (2, 2);

INSERT INTO ORDERS VALUES(null, NOW(), 1, 1, 2), (null, NOW(), 2, 1, 1);

INSERT INTO SELECTED_MEAL_OPTIONS VALUES(1, 1), (2, 1), (1, 2);

select U.USER_NAME, M.MEAL_NAME, MOB.MOB_OPTION, R.RICE_TYPE, M.MEAL_PRICE from ORDERS O inner join SELECTED_MEAL_OPTIONS SMO on O.ORDER_ID = SMO.SMO_ORDER_ID inner join MEAL_OPTIONS_BASE MOB on MOB.MOB_ID = SMO.SMO_MOB_ID inner join MEALS M on M.MEAL_ID = O.ORDER_MEAL_ID inner join USERS U on U.USER_ID = O.ORDER_USER_ID inner join RICE R on R.RICE_ID = O.ORDER_RICE WHERE O.ORDER_DATE = CURDATE() order by U.USER_NAME, M.MEAL_NAME, MOB.MOB_OPTION, R.RICE_TYPE, M.MEAL_PRICE;
