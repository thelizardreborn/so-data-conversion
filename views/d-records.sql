CREATE OR REPLACE VIEW `entries` AS
SELECT
   'd' AS record_type,
   SUBSTRING_INDEX(ENTRANT_NA, ',', 1) AS 'last_name',
   IF (
      LOCATE(' ', TRIM(SUBSTRING_INDEX(ENTRANT_NA, ',', -1))) = 0,
      TRIM(SUBSTRING_INDEX(ENTRANT_NA, ',', -1)), 
      LEFT(
         TRIM(SUBSTRING_INDEX(ENTRANT_NA, ',', -1)), 
         LENGTH(TRIM(SUBSTRING_INDEX(ENTRANT_NA, ',', -1))) - LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING_INDEX(ENTRANT_NA, ',', -1)),' ',-1))-1
      )
   ) AS 'first_name',
   IF (
      LOCATE(' ', TRIM(SUBSTRING_INDEX(ENTRANT_NA, ',', -1))) = 0,
      '',
      LEFT(SUBSTRING_INDEX(TRIM(SUBSTRING_INDEX(ENTRANT_NA, ',', -1)), ' ', -1),1)
   ) AS 'initial',
   GENDER AS 'gender',
   DOB AS 'birth_date',
   D_ABBV AS 'team_code',
   DELEGATION AS 'team_name',
   AGE AS 'age',
   '' AS 'school_year',
   EVENT_SHOR AS 'event_code',
   QUAL_S AS 'entry_mark',
   'M' AS 'event_measure', -- M for Metric
   division AS 'division',
   `BIB__` AS 'bib',
   '' AS 'finish_place',
   '' AS 'declaration',
   '' AS 'notes',
   '' AS 'blank',
   '' AS 'alternate'
FROM Entries
WHERE event_type = 'D'
;
