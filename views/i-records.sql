-- ENTRANT_NA is in the format `LastName, FirstName MiddleName` possibly multiple names grouped as First Name (Smith, Mary Jane Ann)
-- This structure complies with Hy-Tek semi-colon import format for idividual data records (except column headers will need removed)

CREATE OR REPLACE VIEW `indiv` AS
SELECT
   'I' AS record_type,
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
   DATE_FORMAT(DOB, '%m/%d/%Y') AS 'birth_date',
   D_ABBV AS 'team_code',
   DELEGATION AS 'team_name',
   AGE AS 'age',
   '' AS 'school_year',
   '' AS 'address1',
   '' AS 'address2',
   '' AS 'city',
   '' AS 'state',
   '' AS 'zip',
   '' AS 'country',
   '' AS 'citizen_country',
   '' AS 'home_phone',
   '' AS 'office_phone',
   '' AS 'fax',
   '' AS 'shirt_size',
   '' AS 'registration',
   `BIB__` AS 'bib',
   '' AS 'email',
   '' AS 'disabled_classification'
FROM Entries
GROUP BY `BIB__`
;
