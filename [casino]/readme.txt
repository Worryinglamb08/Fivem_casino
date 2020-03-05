Первый источник ресурса|The first source of the resource: https://forum.cfx.re/t/full-working-casino-esx/1048426?__cf_chl_captcha_tk__=fd103a16b9038913e076c5e294011516f7f268b3-1583425571-0-AQsYSZGHzKCRmiCckdIL0lWXwd8QQJHsNZA6rvqVT5nlISonGwV_SnEwmlrOujKFY4lgsSSEvBcZQAjXpwKZcd199Vmol5O97EMhIa9ny2PZx11jgwPPFUqgK-mX_1vI_3_vKbzNfcQT1JYX2k-NDa1IEtja8XjckuOmuTytNOX31nDUFses1Xc8AChtFp-6ui-NRTjztvI8feMaU1O17OksU2wj9zFPsoW5awn1UKezEg3I2LWd_vrtspSaML2xDHqPnVr_Xu4wBfBRnpJ2oi00y3k19qEk4ZWpV1H8tVTV6ndEjaaECkfrRNljd8RURott6a3F2JBkOgsycw6ZDQ19sL8yCaCDyn9qIQX29xmqstQjXeLcyYL-nBiXGG6soV0nSUvVoPQpr7hiiRyuRbwW6g5OWpNEzz6R-IWQ05E02wYJJrkhJcgpvNm1YaBL6R5BRTxUTijJLwZXmsAmS9wStX7JRlISSBYkz0f3kNFZ

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

