INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `id`) VALUES
('casino', 'Казино', 0, 24)
;

INSERT INTO `items` (`name`, `label`, `limit`, `weight`, `rare`, `can_remove`, `id`) VALUES
('zetony', 'Фишки Казино', 500000, 1, 0, 500, 335);


INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(120, 'casino', 0, 'worker', 'Работник', 2000, '', ''),
(121, 'casino', 1, 'boss', 'Владелец', 3000, '', '');

