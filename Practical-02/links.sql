-- Your life is hard if you don't give i\t name

-- https://searchoracle.techtarget.com/answer/Query-to-delete-duplicate-records-in-column

-- https://www.howtogeek.com/254401/34-useful-keyboard-shortcuts-for-the-windows-command-prompt/

select owner, table_name from all_tables where owner='FLOWER';

select constraint_name, column_name from user_cons_columns where table_name='BB';

-- to add constraint / modify constraint
ALTER TABLE surcharges MODIFY (amount NOT NULL);