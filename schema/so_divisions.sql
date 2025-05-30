CREATE TABLE `so_divisions` (
  `division_num` int(11) NOT NULL,
  `level` varchar(30) DEFAULT NULL,
  `age_group` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`division_num`)
);

insert into so_divisions (division_num, level, age_group) VALUES
(1, 'Level 2', '  8- 11'),
(2, 'Level 2', '  8- 15'),
(3, 'Level 2', '  8- 21'),
(4, 'Level 2', ' 12- 15'),
(5, 'Level 2', ' 16- 21'),
(6, 'Level 2', ' 22- 29'),
(7, 'Level 2', ' 22+   '),
(8, 'Level 2', ' 30+   '),
(9, 'Level 2/3', '  8- 15'),
(10, 'Level 2/3', '  8+   '),
(11, 'Level 2/3', ' 16- 21'),
(12, 'Level 2/3', ' 22+   '),
(13, 'Level 3', '  8- 11'),
(14, 'Level 3', '  8- 15'),
(15, 'Level 3', ' 12- 15'),
(16, 'Level 3', ' 16- 21'),
(17, 'Level 3', ' 22- 29'),
(18, 'Level 3', ' 22+   '),
(19, 'Level 3', ' 30+   '),
(20, 'Unified', '  8+   '),
(21, 'Level 1D', '  8+   ');
