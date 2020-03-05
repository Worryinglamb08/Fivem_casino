You need to add the SQL to your database. Open the SQL file and change the id in INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `id`) VALUES
to as ID that is NOT on your database 

same with 

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES

you also need to add this into your server 

#make a folder [casino]

Now add all the folder into that folder

Now add the following to your server.cfg 

#casino
start program-casino
start sloty
start ruletka
start program-blackjackOLD
start blackjackOLD
start casinoexterior
start casinointerior
start blackjack

