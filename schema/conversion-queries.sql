# Add some fields that will be used for report views
alter table Entries add EVENT_TYPE char;
alter table Entries add D_ABBV varchar(4) AFTER AGE_GROUP;
alter table Entries add division INT;

# Connect entry records to pre-built divisions
update Entries E
  join so_divisions D on E.EVENT like concat(D.level,'%') and E.AGE_GROUP = D.age_group
  set E.division = D.division_num;
update Entries
  set division = 20
  where EVENT LIKE 'Unified %';
update Entries E
  join so_divisions D on E.AGE_GROUP = D.age_group AND D.level = 'Level 2/3' and E.EVENT LIKE 'Level 2 / 3%'
  set E.division = D.division_num;
update Entries E
  join so_divisions D on D.age_group = '  8+   ' AND E.AGE_GROUP = '  8- 21' AND D.level = 'Level 2/3' and E.EVENT LIKE 'Level 2 / 3%'
  set E.division = D.division_num;
UPDATE Entries SET D_ABBV = upper(substring(DELEGATION,6,4));

# Check for duplicate delegations or "bad" abbreviations. The following UPDATE queries correct ones found in previous years.
select DELEGATION, D_ABBV, count(*) from Entries GROUP BY DELEGATION order by D_ABBV ;

UPDATE Entries SET D_ABBV = 'MCS' Where DELEGATION LIKE '% County - South';
UPDATE Entries SET D_ABBV = 'MCE' Where DELEGATION LIKE '% County - East';
UPDATE Entries SET D_ABBV = 'MCW' Where DELEGATION LIKE '% County - West';
UPDATE Entries SET D_ABBV = 'MCNE ' Where DELEGATION LIKE '% County - NE';
UPDATE Entries SET D_ABBV = 'WSHT' Where DELEGATION = '008. Washington Township';
UPDATE Entries SET D_ABBV = 'WSHC' Where DELEGATION = '002. Washington County';
UPDATE Entries SET D_ABBV = 'BBJ ' Where D_ABBV = 'BART';
UPDATE Entries SET D_ABBV = 'CLFL' Where D_ABBV = 'CLAR';
UPDATE Entries SET D_ABBV = 'KNDA' Where D_ABBV = 'KNOX';
UPDATE Entries SET D_ABBV = 'MAST' Where D_ABBV = 'MARS';
UPDATE Entries SET D_ABBV = 'ROD ' Where D_ABBV = 'RIPL';
UPDATE Entries SET D_ABBV = 'STJO' Where D_ABBV = 'ST. ';

# Double check
select DELEGATION, D_ABBV, count(*) from Entries GROUP BY DELEGATION order by D_ABBV ;

# Populate the EVENT_SHOR and EVENT_TYPE columns
UPDATE Entries SET EVENT_SHOR = '50'   WHERE EVENT LIKE '% 50 M %';
UPDATE Entries SET EVENT_SHOR = '100'  WHERE EVENT LIKE '% 100 M %';
UPDATE Entries SET EVENT_SHOR = '200'  WHERE EVENT LIKE '% 200 M %';
UPDATE Entries SET EVENT_SHOR = '400'  WHERE EVENT LIKE '% 400 M %';
UPDATE Entries SET EVENT_SHOR = '800'  WHERE EVENT LIKE '% 800 M %';
UPDATE Entries SET EVENT_SHOR = '1500' WHERE EVENT LIKE '% 1500 M %';
UPDATE Entries SET EVENT_SHOR = '400'  WHERE EVENT LIKE '% 4 x 100 M%';
UPDATE Entries SET EVENT_SHOR = '1600' WHERE EVENT LIKE '% 4 x 400 M%';
UPDATE Entries SET EVENT_SHOR = CONCAT(EVENT_SHOR,'W') WHERE EVENT LIKE '%Walk%';
UPDATE Entries SET EVENT_TYPE = 'D';
UPDATE Entries SET EVENT_TYPE = 'Q' WHERE EVENT LIKE '%Relay%';
