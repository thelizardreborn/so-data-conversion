CREATE VIEW `entry_records` AS
SELECT 
  'D' AS `type`,
  SUBSTRING_INDEX(`Entries`.`NAME`,',',1) AS `lastname`,
  SUBSTRING_INDEX(`Entries`.`NAME`,',',-(1)) AS `firstname`,
  '' AS `initial`,`Entries`.`GENDER` AS `gender`,
  DATE_FORMAT(`Entries`.`DOB`,'%m/%d/%Y') AS `birthdate`,
  `Entries`.`D_ABBV` AS `teamcode`,`Entries`.`DELEGATION` AS `teamname`,
  `Entries`.`AGE` AS `age`,
  '' AS `schoolyear`,
  `Entries`.`EVENT_SHOR` AS `eventcode`,
  CONCAT(TIME_FORMAT(SEC_TO_TIME(FLOOR(`Entries`.`QUALIFYING`)),'%i:%s'),'.', LEFT(SUBSTRING_INDEX(`Entries`.`QUALIFYING`,'.',-(1)),2)) AS `seed`,
  'M' AS `eventmeasure`,
  `Entries`.`division` AS `division`,
  `Entries`.`BIB` AS `bib`,
  '' AS `finishplace`,
  '' AS `status`,
  '' AS `note`
FROM `Entries`
WHERE (`Entries`.`EVENT_TYPE` = 'D')
