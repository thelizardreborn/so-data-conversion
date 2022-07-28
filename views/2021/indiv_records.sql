CREATE VIEW `indiv_records` AS
SELECT 
  'I' AS `type`,
  SUBSTRING_INDEX(`Entries`.`NAME`,',',1) AS `lastname`, 
  SUBSTRING_INDEX(`Entries`.`NAME`,',',-(1)) AS `firstname`,
  '' AS `initial`,
  `Entries`.`GENDER` AS `gender`, 
  DATE_FORMAT(`Entries`.`DOB`,'%m/%d/%Y') AS `birthdate`,
  `Entries`.`D_ABBV` AS `teamcode`,
  `Entries`.`DELEGATION` AS `teamname`,
  `Entries`.`AGE` AS `age`,
  '' AS `schoolyear`,
  '' AS `addr1`,
  '' AS `addr2`,
  '' AS `city`,
  '' AS `state`,
  '' AS `zip`,
  '' AS `country`,
  '' AS `cit_country`,
  '' AS `h_phone`,
  '' AS `o_phone`,
  '' AS `fax`,
  '' AS `shirt`,
  `Entries`.`ENTRANT` AS `registration`,
  `Entries`.`BIB` AS `bib`,
  '' AS `email`
FROM `Entries`
GROUP BY `Entries`.`BIB`
ORDER BY `Entries`.`BIB`
