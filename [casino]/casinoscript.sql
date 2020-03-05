INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `id`) VALUES
('casino', 'casino', 0, 24)
;

INSERT INTO `items` (`name`, `label`, `limit`, `weight`, `rare`, `can_remove`, `id`) VALUES
('zetony', 'Casino Chips', 500000, 1, 0, 500, 335);


INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(120, 'casino', 0, 'worker', 'Worker', 2000, '', ''),
(121, 'casino', 1, 'boss', 'Owner', 3000, '', '');

