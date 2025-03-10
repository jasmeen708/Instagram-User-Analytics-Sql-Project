CREATE DATABASE ig_clone;

CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Replaces AUTO_INCREMENT with IDENTITY
    username VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT GETDATE() -- Replaces TIMESTAMP and NOW() with DATETIME and GETDATE()
);

CREATE TABLE photos (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Replaces AUTO_INCREMENT with IDENTITY
    image_url VARCHAR(355) NOT NULL,
    user_id INT NOT NULL,
    created_dat DATETIME DEFAULT GETDATE(), -- Replaces TIMESTAMP and NOW() with DATETIME and GETDATE()
    FOREIGN KEY (user_id) REFERENCES users(id) -- References the users table
);

CREATE TABLE comments (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Replaces AUTO_INCREMENT with IDENTITY
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(), -- Replaces TIMESTAMP DEFAULT NOW() with DATETIME and GETDATE()
    FOREIGN KEY (user_id) REFERENCES users(id), -- References the users table
    FOREIGN KEY (photo_id) REFERENCES photos(id) -- References the photos table
);

CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(), -- Replaces TIMESTAMP DEFAULT NOW() with DATETIME and GETDATE()
    FOREIGN KEY (user_id) REFERENCES users(id), -- References the users table
    FOREIGN KEY (photo_id) REFERENCES photos(id), -- References the photos table
    PRIMARY KEY (user_id, photo_id) -- Composite primary key
);

CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO users (username, created_at) VALUES ('Kenton_Kirlin', '2017-02-16 18:22:10.846'),
('Andre_Purdy85', '2017-04-02 17:11:21.417'), 
('Harley_Lind18', '2017-02-21 11:12:32.574'), 
('Arely_Bogan63', '2016-08-13 01:28:43.085'),
('Aniya_Hackett', '2016-12-07 01:04:39.298'), 
('Travon.Waters', '2017-04-30 13:26:14.496'), ('Kasandra_Homenick', '2016-12-12 06:50:07.996'), 
('Tabitha_Schamberger11', '2016-08-20 02:19:45.512'), ('Gus93', '2016-06-24 19:36:30.978'),
('Presley_McClure', '2016-08-07 16:25:48.561'), ('Justina.Gaylord27', '2017-05-04 16:32:15.577'), 
('Dereck65', '2017-01-19 01:34:14.296'), ('Alexandro35', '2017-03-29 17:09:02.344'),
('Jaclyn81', '2017-02-06 23:29:16.394'), ('Billy52', '2016-10-05 14:10:20.453'), 
('Annalise.McKenzie16', '2016-08-02 21:32:45.646'), ('Norbert_Carroll35', '2017-02-06 22:05:43.425'), 
('Odessa2', '2016-10-21 18:16:56.390'), ('Hailee26', '2017-04-29 18:53:39.650'), 
('Delpha.Kihn', '2016-08-31 02:42:30.288'), ('Rocio33', '2017-01-23 11:51:15.467'),
('Kenneth64', '2016-12-27 09:48:17.380'), ('Eveline95', '2017-01-23 23:14:18.569'), 
('Maxwell.Halvorson', '2017-04-18 02:32:43.597'), ('Tierra.Trantow', '2016-10-03 12:49:20.774'),
('Josianne.Friesen', '2016-06-07 12:47:00.703'), ('Darwin29', '2017-03-18 03:10:07.047'), 
('Dario77', '2016-08-18 07:15:02.823'), ('Jaime53', '2016-09-11 18:51:56.965'),
('Kaley9', '2016-09-23 21:24:20.222'), ('Aiyana_Hoeger', '2016-09-29 20:28:12.457'),
('Irwin.Larson', '2016-08-26 19:36:22.199'), ('Yvette.Gottlieb91', '2016-11-14 12:32:01.405'),
('Pearl7', '2016-07-08 21:42:00.982'), ('Lennie_Hartmann40', '2017-03-30 03:25:21.937'),
('Ollie_Ledner37', '2016-08-04 15:42:20.322'), ('Yazmin_Mills95', '2016-07-27 00:56:44.310'),
('Jordyn.Jacobson2', '2016-05-14 07:56:25.835'), ('Kelsi26', '2016-06-08 17:48:08.478'),
('Rafael.Hickle2', '2016-05-19 09:51:25.779'), ('Mckenna17', '2016-07-17 17:25:44.855'),
('Maya.Farrell', '2016-12-11 18:04:45.344'), ('Janet.Armstrong', '2016-10-06 07:57:44.491'), 
('Seth46', '2016-07-07 11:40:26.557'), ('David.Osinski47', '2017-02-05 21:23:37.392'), 
('Malinda_Streich', '2016-07-09 21:37:07.610'), ('Harrison.Beatty50', '2016-09-02 03:48:38.340'),
('Granville_Kutch', '2016-06-26 03:10:22.202'), ('Morgan.Kassulke', '2016-10-30 12:42:31.387'),
('Gerard79', '2016-08-23 19:47:44.102'), ('Mariano_Koch3', '2017-04-17 14:14:45.662'), 
('Zack_Kemmer93', '2017-01-01 05:58:22.276'), ('Linnea59', '2017-02-07 07:49:33.830'),
('Duane60', '2016-12-21 04:43:37.761'), ('Meggie_Doyle', '2017-04-04 12:17:33.931'), 
('Peter.Stehr0', '2016-08-22 18:05:42.167'), ('Julien_Schmidt', '2017-02-02 23:12:48.451'),
('Aurelie71', '2016-05-31 06:20:56.909'), ('Cesar93', '2016-10-18 16:42:43.220'), 
('Sam52', '2017-03-30 22:03:45.159'), ('Jayson65', '2016-10-14 19:10:52.564'), 
('Ressie_Stanton46', '2016-12-20 15:09:08.721'), ('Elenor88', '2016-05-08 01:30:40.677'), 
('Florence99', '2016-10-06 23:08:30.626'), ('Adelle96', '2016-10-01 00:37:57.429'), 
('Mike.Auer39', '2016-07-01 17:36:14.714'), ('Emilio_Bernier52', '2016-05-06 13:04:29.960'), 
('Franco_Keebler64', '2016-11-13 20:09:26.855'), ('Karley_Bosco', '2016-06-24 23:38:52.138'), 
('Erick5', '2017-04-05 23:44:47.060'), ('Nia_Haag', '2016-05-14 15:38:50.230'), 
('Kathryn80', '2016-10-11 09:01:56.764'), ('Jaylan.Lakin', '2016-06-10 23:58:52.210'), 
('Hulda.Macejkovic', '2017-01-25 17:17:27.717'), ('Leslie67', '2016-09-21 05:14:01.207'), 
('Janelle.Nikolaus81', '2016-07-21 09:26:09.466'), ('Donald.Fritsch', '2017-01-07 10:05:41.165'), 
('Colten.Harris76', '2016-10-10 02:38:52.941'), ('Katarina.Dibbert', '2016-11-03 13:14:10.647'),
('Darby_Herzog', '2016-05-06 00:14:21.191'), ('Esther.Zulauf61', '2017-01-14 17:02:33.511'), 
('Aracely.Johnston98', '2016-07-25 18:49:09.996'), ('Bartholome.Bernhard', '2016-11-06 02:31:23.463'),
('Alysa22', '2017-01-01 17:44:42.980'), ('Milford_Gleichner42', '2017-04-30 07:50:51.280'),
('Delfina_VonRueden68', '2017-03-21 12:02:14.358'), ('Rick29', '2017-02-24 11:25:08.160'), 
('Clint27', '2016-06-02 21:40:09.555'), ('Jessyca_West', '2016-09-14 23:47:04.780'), 
('Esmeralda.Mraz57', '2017-03-03 11:52:27.469'), ('Bethany20', '2016-06-03 23:31:53.322'),
('Frederik_Rice', '2016-07-06 21:56:28.654'), ('Willie_Leuschke', '2017-02-15 01:40:53.310'),
('Damon35', '2016-10-31 14:44:27.239'), ('Nicole71', '2016-05-09 17:30:22.371'),
('Keenan.Schamberger60', '2016-08-28 14:57:28.221'), ('Tomas.Beatty93', '2017-02-11 11:38:55.026'), 
('Imani_Nicolas17', '2017-01-31 22:59:34.108'), ('Alek_Watsica', '2016-12-10 07:43:58.083'),
('Javonte83', '2017-03-27 22:06:37.433');


select * from users

INSERT INTO photos(image_url, user_id) VALUES ('http://elijah.biz', 1),
('https://shanon.org', 1), ('http://vicky.biz', 1), ('http://oleta.net', 1), 
('https://jennings.biz', 1), ('https://quinn.biz', 2), ('https://selina.name', 2), 
('http://malvina.org', 2), ('https://branson.biz', 2), ('https://elenor.name', 3), ('https://marcelino.com', 3), 
('http://felicity.name', 3), ('https://fred.com', 3), ('https://gerhard.biz', 4), ('https://sherwood.net', 4), 
('https://maudie.org', 4), ('http://annamae.name', 6), ('https://mac.org', 6), 
('http://miracle.info', 6), ('http://emmet.com', 6), ('https://lisa.com', 6), 
('https://brooklyn.name', 8), ('http://madison.net', 8), ('http://annie.name', 8), ('http://darron.info', 8), 
('http://saige.com', 9), ('https://reece.net', 9), ('http://vance.org', 9), ('http://ignacio.net', 9), 
('http://kenny.com', 10), ('http://remington.name', 10), ('http://kurtis.info', 10),
('https://alisha.com', 11), ('https://henderson.com', 11), ('http://bonnie.info', 11), ('http://kennith.net', 11), 
('http://camille.name', 11), ('http://alena.net', 12),
('http://ralph.name', 12), ('https://tyshawn.com', 12), 
('https://adella.net', 12), ('https://cielo.info', 13), 
('https://easter.net', 13), ('http://golden.org', 13), ('http://kendall.biz', 13), ('https://glenda.info', 13),
('http://dominic.biz', 15), ('http://tressie.info', 15), ('http://estevan.org', 15), ('http://zena.com', 15), 
('https://abagail.com', 16), ('https://hershel.com', 16), ('http://collin.com', 16), 
('https://clair.com', 16), ('https://deondre.com', 17), ('http://tristin.name', 17), 
('http://kirk.org', 17), ('https://modesta.info', 18), ('http://rylan.biz', 19),
('https://noemie.com', 19), ('https://dejon.name', 20),
('https://rigoberto.net', 22), ('http://megane.biz', 23), 
('http://emmalee.org', 23), ('http://nathan.net', 23), ('http://lionel.net', 23), 
('http://danyka.net', 23), ('https://woodrow.com', 23), ('http://harvey.info', 23),
('http://aiden.org', 23), ('https://tito.name', 23), ('https://julian.net', 23),
('https://mafalda.org', 23), ('http://verner.org', 23), ('https://elmore.org', 26),
('http://kasandra.com', 26), ('https://jarret.info', 26), ('http://einar.net', 26), 
('http://terry.info', 26), ('https://holden.com', 27), ('https://jacinto.org', 28), 
('https://geoffrey.info', 28), ('http://paxton.com', 28), ('https://trinity.biz', 28),
('http://fabiola.org', 29), ('https://bryce.org', 29), ('http://emery.net', 29), 
('https://marian.biz', 29), ('https://kennedi.org', 29), ('https://fanny.net', 29),
('http://lottie.net', 29), ('http://lacy.biz', 29), ('https://jensen.name', 30), ('http://virginia.org', 30),
('https://ariel.net', 31), ('http://roger.info', 32), ('https://carolanne.com', 32), ('https://margarita.info', 32),
('https://kayden.biz', 32), ('https://brook.com', 33), ('https://gust.net', 33), ('http://bridie.name', 33),
('http://barton.name', 33), ('https://karina.biz', 33), ('https://mariam.com', 35), ('https://trycia.com', 35),
('https://everette.biz', 37), ('http://boris.biz', 38), ('http://arthur.name', 38), ('https://cesar.com', 39),
('http://charlie.com', 40), ('https://lina.biz', 42), ('https://darwin.net', 42), ('https://aliyah.biz', 42), 
('http://euna.info', 43), ('https://maymie.net', 43), ('http://joanie.name', 43), ('http://whitney.net', 43),
('http://garrison.name', 43), ('https://olga.org', 44), ('https://donavon.org', 44), ('http://moses.biz', 44),
('http://shannon.org', 44), ('http://kendrick.net', 46), ('https://carey.com', 46), ('http://lia.biz', 46),
('https://celestine.name', 46), ('http://laila.info', 47), ('http://buddy.com', 47), ('http://americo.biz', 47), 
('http://lurline.info', 47), ('http://kailee.org', 47), ('https://edyth.com', 48), ('https://isaias.biz', 50),
('http://rosetta.net', 50), ('https://marianna.info', 50), ('https://roel.org', 51), ('http://julia.info', 51), 
('https://seamus.org', 51), ('https://earline.info', 51), ('http://quinten.info', 51), ('https://dolores.org', 52), 
('https://aimee.info', 52), ('https://roderick.name', 52), ('https://jarret.name', 52), ('https://cathrine.com', 52),
('https://adela.com', 55), ('https://demarco.com', 56), ('https://lila.biz', 58), ('http://ruben.net', 58),
('https://alia.name', 58), ('http://rickey.name', 58), ('http://janie.com', 58), ('http://myron.org', 58),
('http://pearl.info', 58), ('http://victoria.biz', 58), ('https://carmella.com', 59), ('http://leo.com', 59),
('http://jedediah.net', 59), ('http://sedrick.net', 59), ('https://clare.org', 59), ('https://malcolm.name', 59),
('https://lesly.com', 59), ('https://roberta.net', 59), ('https://estell.info', 59), ('http://kaleigh.biz', 59),
('http://blanca.org', 60), ('http://delpha.com', 60), ('http://annabelle.org', 61), ('http://ephraim.com', 62),
('https://dameon.name', 62), ('https://julianne.org', 63), ('https://jasmin.biz', 63), ('https://delbert.net', 63), 
('https://norval.com', 63), ('https://jessy.name', 64), ('https://nolan.name', 64), ('http://devon.info', 64),
('http://ora.net', 64), ('https://vivien.com', 64), ('https://hilda.info', 65), ('https://dorcas.biz', 65),
('http://hettie.net', 65), ('http://rico.biz', 65), ('http://jody.biz', 65), ('http://sheila.com', 67),
('http://germaine.name', 67), ('https://mariane.org', 67), ('http://reva.com', 69), ('https://llewellyn.info', 70),
('http://ellen.info', 72), ('https://anahi.info', 72), ('https://javonte.org', 72), ('http://florine.org', 72),
('http://marcellus.info', 72), ('http://stan.biz', 73), ('http://jarred.net', 77), ('http://jovanny.net', 77),
('http://linnie.com', 77), ('http://dino.name', 77), ('https://jane.net', 77), ('http://laney.name', 77), 
('http://trever.org', 78), ('http://emilie.net', 78), ('http://ted.info', 78), ('http://keshawn.org', 78), ('http://ole.info', 78), ('https://ford.biz', 79), ('https://humberto.org', 82), ('http://penelope.info', 82), ('https://dimitri.info', 84), ('http://cynthia.info', 84), ('http://princess.org', 85), ('https://ruthie.info', 85), ('https://evan.name', 86), ('http://deontae.org', 86), ('https://timmy.info', 86), ('http://susie.info', 86), ('http://hollis.com', 86), ('https://colt.org', 86), ('http://lucio.org', 86), ('http://germaine.org', 86), ('http://howard.net', 86), ('http://helena.name', 87), ('https://celestino.name', 87), ('http://violet.info', 87), ('http://nigel.biz', 87), ('https://noble.net', 88), ('https://emilia.org', 88), ('http://destini.net', 88), ('https://mariano.net', 88), ('https://brittany.org', 88), ('https://madaline.name', 88), ('https://devonte.name', 88), ('https://blanche.net', 88), ('http://cali.net', 88), ('http://mekhi.name', 88), ('http://adela.com', 88), ('https://devan.com', 92), ('https://jarrett.name', 92), ('https://sid.biz', 92), ('https://jadyn.name', 93), ('https://erik.com', 93), ('http://freeda.biz', 94), ('http://ayden.name', 95), ('https://kathleen.biz', 95), ('https://helmer.org', 96), ('https://maggie.info', 96), ('https://cecilia.net', 96), ('http://ayla.org', 97), ('https://elyssa.biz', 97), ('http://jennie.com', 98), ('http://ryleigh.info', 99), ('https://darien.name', 99), ('https://xzavier.org', 99), ('https://kaela.name', 100), ('http://dedrick.info', 100);

select * from photos

INSERT INTO follows(follower_id, followee_id) VALUES  (91, 1), (91, 2), (91, 3), (91, 4), (91, 5), (91, 6), (91, 7), (91, 8), (91, 9), (91, 10), (91, 11), (91, 12), (91, 13), (91, 14), (91, 15), (91, 16), (91, 17), (91, 18), (91, 19), (91, 20), (91, 21), (91, 22), (91, 23), (91, 24), (91, 25), (91, 26), (91, 27), (91, 28), (91, 29), (91, 30), (91, 31), (91, 32), (91, 33), (91, 34), (91, 35), (91, 36), (91, 37), (91, 38), (91, 39), (91, 40), (91, 41), (91, 42), (91, 43), (91, 44), (91, 45), (91, 46), (91, 47), (91, 48), (91, 49), (91, 50), (91, 51), (91, 52), (91, 53), (91, 54), (91, 55), (91, 56), (91, 57), (91, 58), (91, 59), (91, 60), (91, 61), (91, 62), (91, 63), (91, 64), (91, 65), (91, 66), (91, 67), (91, 68), (91, 69), (91, 70), (91, 71), (91, 72), (91, 73), (91, 74), (91, 75), (91, 76), (91, 77), (91, 78), (91, 79), (91, 80), (91, 81), (91, 82), (91, 83), (91, 84), (91, 85), (91, 86), (91, 87), (91, 88), (91, 89), (91, 90), (91, 92), (91, 93), (91, 94), (91, 95), (91, 96), (91, 97), (91, 98), (91, 99), (91, 100), (92, 1), (92, 2), (92, 3), (92, 4), (92, 5), (92, 6), (92, 7), (92, 8), (92, 9), (92, 10), (92, 11), (92, 12), (92, 13), (92, 14), (92, 15), (92, 16), (92, 17), (92, 18), (92, 19), (92, 20), (92, 21), (92, 22), (92, 23), (92, 24), (92, 25), (92, 26), (92, 27), (92, 28), (92, 29), (92, 30), (92, 31), (92, 32), (92, 33), (92, 34), (92, 35), (92, 36), (92, 37), (92, 38), (92, 39), (92, 40), (92, 41), (92, 42), (92, 43), (92, 44), (92, 45), (92, 46), (92, 47), (92, 48), (92, 49), (92, 50), (92, 51), (92, 52), (92, 53), (92, 54), (92, 55), (92, 56), (92, 57), (92, 58), (92, 59), (92, 60), (92, 61), (92, 62), (92, 63), (92, 64), (92, 65), (92, 66), (92, 67), (92, 68), (92, 69), (92, 70), (92, 71), (92, 72), (92, 73), (92, 74), (92, 75), (92, 76), (92, 77), (92, 78), (92, 79), (92, 80), (92, 81), (92, 82), (92, 83), (92, 84), (92, 85), (92, 86), (92, 87), (92, 88), (92, 89), (92, 90), (92, 91), (92, 93), (92, 94), (92, 95), (92, 96), (92, 97), (92, 98), (92, 99), (92, 100), (93, 1), (93, 2), (93, 3), (93, 4), (93, 5), (93, 6), (93, 7), (93, 8), (93, 9), (93, 10), (93, 11), (93, 12), (93, 13), (93, 14), (93, 15), (93, 16), (93, 17), (93, 18), (93, 19), (93, 20), (93, 21), (93, 22), (93, 23), (93, 24), (93, 25), (93, 26), (93, 27), (93, 28), (93, 29), (93, 30), (93, 31), (93, 32), (93, 33), (93, 34), (93, 35), (93, 36), (93, 37), (93, 38), (93, 39), (93, 40), (93, 41), (93, 42), (93, 43), (93, 44), (93, 45), (93, 46), (93, 47), (93, 48), (93, 49), (93, 50), (93, 51), (93, 52), (93, 53), (93, 54), (93, 55), (93, 56), (93, 57), (93, 58), (93, 59), (93, 60), (93, 61), (93, 62), (93, 63), (93, 64), (93, 65), (93, 66), (93, 67), (93, 68), (93, 69), (93, 70), (93, 71), (93, 72), (93, 73), (93, 74), (93, 75), (93, 76), (93, 77), (93, 78), (93, 79), (93, 80), (93, 81), (93, 82), (93, 83), (93, 84), (93, 85), (93, 86), (93, 87), (93, 88), (93, 89), (93, 90), (93, 91), (93, 92), (93, 94), (93, 95), (93, 96), (93, 97), (93, 98), (93, 99), (93, 100), (94, 1), (94, 2), (94, 3), (94, 4), (94, 5), (94, 6), (94, 7), (94, 8), (94, 9), (94, 10), (94, 11), (94, 12), (94, 13), (94, 14), (94, 15), (94, 16), (94, 17), (94, 18), (94, 19), (94, 20), (94, 21), (94, 22), (94, 23), (94, 24), (94, 25), (94, 26), (94, 27), (94, 28), (94, 29), (94, 30), (94, 31), (94, 32), (94, 33), (94, 34), (94, 35), (94, 36), (94, 37), (94, 38), (94, 39), (94, 40), (94, 41), (94, 42), (94, 43), (94, 44), (94, 45), (94, 46), (94, 47), (94, 48), (94, 49), (94, 50), (94, 51), (94, 52), (94, 53), (94, 54), (94, 55), (94, 56), (94, 57), (94, 58), (94, 59), (94, 60), (94, 61), (94, 62), (94, 63), (94, 64), (94, 65), (94, 66), (94, 67), (94, 68), (94, 69), (94, 70), (94, 71), (94, 72), (94, 73), (94, 74), (94, 75), (94, 76), (94, 77), (94, 78), (94, 79), (94, 80), (94, 81), (94, 82), (94, 83), (94, 84), (94, 85), (94, 86), (94, 87), (94, 88), (94, 89), (94, 90), (94, 91), (94, 92), (94, 93), (94, 95), (94, 96), (94, 97), (94, 98), (94, 99), (94, 100), (95, 1), (95, 2), (95, 3), (95, 4), (95, 5), (95, 6), (95, 7), (95, 8), (95, 9), (95, 10), (95, 11), (95, 12), (95, 13), (95, 14), (95, 15), (95, 16), (95, 17), (95, 18), (95, 19), (95, 20), (95, 21), (95, 22), (95, 23), (95, 24), (95, 25), (95, 26), (95, 27), (95, 28), (95, 29), (95, 30), (95, 31), (95, 32), (95, 33), (95, 34), (95, 35), (95, 36), (95, 37), (95, 38), (95, 39), (95, 40), (95, 41), (95, 42), (95, 43), (95, 44), (95, 45), (95, 46), (95, 47), (95, 48), (95, 49), (95, 50), (95, 51), (95, 52), (95, 53), (95, 54), (95, 55), (95, 56), (95, 57), (95, 58), (95, 59), (95, 60), (95, 61), (95, 62), (95, 63), (95, 64), (95, 65), (95, 66), (95, 67), (95, 68), (95, 69), (95, 70), (95, 71), (95, 72), (95, 73), (95, 74), (95, 75), (95, 76), (95, 77), (95, 78), (95, 79), (95, 80), (95, 81), (95, 82), (95, 83), (95, 84), (95, 85), (95, 86), (95, 87), (95, 88), (95, 89), (95, 90), (95, 91), (95, 92), (95, 93), (95, 94), (95, 96), (95, 97), (95, 98), (95, 99), (95, 100), (96, 1), (96, 2), (96, 3), (96, 4), (96, 5), (96, 6), (96, 7), (96, 8), (96, 9), (96, 10), (96, 11), (96, 12), (96, 13), (96, 14), (96, 15), (96, 16), (96, 17), (96, 18), (96, 19), (96, 20), (96, 21), (96, 22), (96, 23), (96, 24), (96, 25), (96, 26), (96, 27), (96, 28), (96, 29), (96, 30), (96, 31), (96, 32), (96, 33), (96, 34), (96, 35), (96, 36), (96, 37), (96, 38), (96, 39), (96, 40), (96, 41), (96, 42), (96, 43), (96, 44), (96, 45), (96, 46), (96, 47), (96, 48), (96, 49), (96, 50), (96, 51), (96, 52), (96, 53), (96, 54), (96, 55), (96, 56), (96, 57), (96, 58), (96, 59), (96, 60), (96, 61), (96, 62), (96, 63), (96, 64), (96, 65), (96, 66), (96, 67), (96, 68), (96, 69), (96, 70), (96, 71), (96, 72), (96, 73), (96, 74), (96, 75), (96, 76), (96, 77), (96, 78), (96, 79), (96, 80), (96, 81), (96, 82), (96, 83), (96, 84), (96, 85), (96, 86), (96, 87), (96, 88), (96, 89), (96, 90), (96, 91), (96, 92), (96, 93), (96, 94), (96, 95), (96, 97), (96, 98), (96, 99), (96, 100), (97, 1), (97, 2), (97, 3), (97, 4), (97, 5), (97, 6), (97, 7), (97, 8), (97, 9), (97, 10), (97, 11), (97, 12), (97, 13), (97, 14), (97, 15), (97, 16), (97, 17), (97, 18), (97, 19), (97, 20), (97, 21), (97, 22), (97, 23), (97, 24), (97, 25), (97, 26), (97, 27), (97, 28), (97, 29), (97, 30), (97, 31), (97, 32), (97, 33), (97, 34), (97, 35), (97, 36), (97, 37), (97, 38), (97, 39), (97, 40), (97, 41), (97, 42), (97, 43), (97, 44), (97, 45), (97, 46), (97, 47), (97, 48), (97, 49), (97, 50), (97, 51), (97, 52), (97, 53), (97, 54), (97, 55), (97, 56), (97, 57), (97, 58), (97, 59), (97, 60), (97, 61), (97, 62), (97, 63), (97, 64), (97, 65), (97, 66), (97, 67), (97, 68), (97, 69), (97, 70), (97, 71), (97, 72), (97, 73), (97, 74), (97, 75), (97, 76), (97, 77), (97, 78), (97, 79), (97, 80), (97, 81), (97, 82), (97, 83), (97, 84), (97, 85), (97, 86), (97, 87), (97, 88), (97, 89), (97, 90), (97, 91), (97, 92), (97, 93), (97, 94), (97, 95), (97, 96), (97, 98), (97, 99), (97, 100), (98, 1), (98, 2), (98, 3), (98, 4), (98, 5), (98, 6), (98, 7), (98, 8), (98, 9), (98, 10), (98, 11), (98, 12), (98, 13), (98, 14), (98, 15), (98, 16), (98, 17), (98, 18), (98, 19), (98, 20), (98, 21), (98, 22), (98, 23), (98, 24), (98, 25), (98, 26), (98, 27), (98, 28), (98, 29), (98, 30), (98, 31), (98, 32), (98, 33), (98, 34), (98, 35), (98, 36), (98, 37), (98, 38), (98, 39), (98, 40), (98, 41), (98, 42), (98, 43), (98, 44), (98, 45), (98, 46), (98, 47), (98, 48), (98, 49), (98, 50), (98, 51), (98, 52), (98, 53), (98, 54), (98, 55), (98, 56), (98, 57), (98, 58), (98, 59), (98, 60), (98, 61), (98, 62), (98, 63), (98, 64), (98, 65), (98, 66), (98, 67), (98, 68), (98, 69), (98, 70), (98, 71), (98, 72), (98, 73), (98, 74), (98, 75), (98, 76), (98, 77), (98, 78), (98, 79), (98, 80), (98, 81), (98, 82), (98, 83), (98, 84), (98, 85), (98, 86), (98, 87), (98, 88), (98, 89), (98, 90), (98, 91), (98, 92), (98, 93), (98, 94), (98, 95), (98, 96), (98, 97), (98, 99), (98, 100), (99, 1), (99, 2), (99, 3), (99, 4), (99, 5), (99, 6), (99, 7), (99, 8), (99, 9), (99, 10), (99, 11), (99, 12), (99, 13), (99, 14), (99, 15), (99, 16), (99, 17), (99, 18), (99, 19), (99, 20), (99, 21), (99, 22), (99, 23), (99, 24), (99, 25), (99, 26), (99, 27), (99, 28), (99, 29), (99, 30), (99, 31), (99, 32), (99, 33), (99, 34), (99, 35), (99, 36), (99, 37), (99, 38), (99, 39), (99, 40), (99, 41), (99, 42), (99, 43), (99, 44), (99, 45), (99, 46), (99, 47), (99, 48), (99, 49), (99, 50), (99, 51), (99, 52), (99, 53), (99, 54), (99, 55), (99, 56), (99, 57), (99, 58), (99, 59), (99, 60), (99, 61), (99, 62), (99, 63), (99, 64), (99, 65), (99, 66), (99, 67), (99, 68), (99, 69), (99, 70), (99, 71), (99, 72), (99, 73), (99, 74), (99, 75), (99, 76), (99, 77), (99, 78), (99, 79), (99, 80), (99, 81), (99, 82), (99, 83), (99, 84), (99, 85), (99, 86), (99, 87), (99, 88), (99, 89), (99, 90), (99, 91), (99, 92), (99, 93), (99, 94), (99, 95), (99, 96), (99, 97), (99, 98), (99, 100), (100, 1), (100, 2), (100, 3), (100, 4), (100, 5), (100, 6), (100, 7), (100, 8), (100, 9), (100, 10), (100, 11), (100, 12), (100, 13), (100, 14), (100, 15), (100, 16), (100, 17), (100, 18), (100, 19), (100, 20), (100, 21), (100, 22), (100, 23), (100, 24), (100, 25), (100, 26), (100, 27), (100, 28), (100, 29), (100, 30), (100, 31), (100, 32), (100, 33), (100, 34), (100, 35), (100, 36), (100, 37), (100, 38), (100, 39), (100, 40), (100, 41), (100, 42), (100, 43), (100, 44), (100, 45), (100, 46), (100, 47), (100, 48), (100, 49), (100, 50), (100, 51), (100, 52), (100, 53), (100, 54), (100, 55), (100, 56), (100, 57), (100, 58), (100, 59), (100, 60), (100, 61), (100, 62), (100, 63), (100, 64), (100, 65), (100, 66), (100, 67), (100, 68), (100, 69), (100, 70), (100, 71), (100, 72), (100, 73), (100, 74), (100, 75), (100, 76), (100, 77), (100, 78), (100, 79), (100, 80), (100, 81), (100, 82), (100, 83), (100, 84), (100, 85), (100, 86), (100, 87), (100, 88), (100, 89), (100, 90), (100, 91), (100, 92), (100, 93), (100, 94), (100, 95), (100, 96), (100, 97), (100, 98), (100, 99);

select * from follows

INSERT INTO comments(comment_text, user_id, photo_id) VALUES ('et ullam error', 98, 248), ('quia vero repellendus', 3, 249), ('iure sit qui', 5, 249), ('dolorum quo asperiores', 12, 249), ('aspernatur voluptatem assumenda', 14, 249), ('quasi velit necessitatibus', 18, 249), ('minima beatae totam', 19, 249), ('excepturi id explicabo', 20, 249), ('dolores dolore officiis', 21, 249), ('labore mollitia aut', 24, 249), ('vel quis placeat', 27, 249), ('deleniti libero dolores', 30, 249), ('distinctio ad quas', 33, 249), ('qui et est', 36, 249), ('sint cum expedita', 41, 249), ('ullam dolorum sit', 44, 249), ('fugiat in rem', 48, 249), ('dolorem aperiam aperiam', 50, 249), ('veritatis rerum est', 54, 249), ('reiciendis qui consequatur', 55, 249), ('mollitia perspiciatis officia', 56, 249), ('ducimus ullam ut', 57, 249), ('ea et quia', 60, 249), ('qui pariatur eum', 62, 249), ('ea autem esse', 63, 249), ('expedita dolorem assumenda', 66, 249), ('officia odit veniam', 69, 249), ('consectetur velit consectetur', 71, 249), ('iusto veritatis repellendus', 73, 249), ('ad omnis recusandae', 75, 249), ('qui est nihil', 76, 249), ('culpa dolor quos', 84, 249), ('consequatur tenetur enim', 91, 249), ('alias dolorum nihil', 92, 249), ('iusto id aliquid', 99, 249), ('assumenda velit est', 4, 250), ('mollitia mollitia distinctio', 5, 250), ('veniam ea architecto', 6, 250), ('iure quibusdam eligendi', 8, 250), ('natus sunt ut', 9, 250), ('occaecati mollitia molestiae', 10, 250), ('maiores rerum eaque', 11, 250), ('nulla animi quo', 14, 250), ('repudiandae et aut', 21, 250), ('nam aperiam totam', 24, 250), ('aut velit molestiae', 36, 250), ('nostrum id dignissimos', 39, 250), ('et nulla cupiditate', 41, 250), ('eveniet sed amet', 46, 250), ('eaque labore dignissimos', 47, 250), ('a et voluptatem', 54, 250), ('eum quia amet', 57, 250), ('molestiae autem debitis', 66, 250), ('ullam iure autem', 71, 250), ('consequatur iusto delectus', 75, 250), ('illum occaecati et', 76, 250), ('rerum molestiae non', 85, 250), ('consectetur voluptatibus dicta', 91, 250), ('iure dolores molestias', 5, 251), ('eos explicabo recusandae', 8, 251), ('hic ut reiciendis', 10, 251), ('voluptatem nihil voluptatibus', 14, 251), ('omnis sit vitae', 15, 251), ('provident dolorem sed', 21, 251), ('quo facilis voluptas', 24, 251), ('eveniet nemo officiis', 36, 251), ('aspernatur quia porro', 37, 251), ('aliquid fuga facere', 40, 251), ('nobis blanditiis magnam', 41, 251), ('culpa rerum consequatur', 44, 251), ('ipsam dolore eos', 48, 251), ('modi placeat vero', 54, 251), ('aut dolore ullam', 57, 251), ('error id ut', 61, 251), ('accusamus sit omnis', 66, 251), ('quam sint architecto', 71, 251), ('ullam rerum ut', 75, 251), ('quaerat autem quibusdam', 76, 251), ('quos quibusdam eaque', 91, 251), ('voluptatem delectus non', 94, 251), ('consectetur non aut', 98, 251), ('consequatur nulla repellat', 99, 251), ('sed ab esse', 4, 252), ('tenetur sint dolorum', 5, 252), ('ipsum et sint', 14, 252), ('deserunt dolores quia', 15, 252), ('aut ut voluptatem', 21, 252), ('inventore reprehenderit voluptates', 24, 252), ('blanditiis praesentium placeat', 26, 252), ('nisi maxime recusandae', 35, 252), ('delectus asperiores et', 36, 252), ('dolore sit eum', 41, 252), ('quia dolorem voluptas', 44, 252), ('ipsum at nam', 46, 252), ('eaque non vel', 54, 252), ('animi eos et', 56, 252), ('molestias dicta cupiditate', 57, 252), ('consequatur explicabo maxime', 66, 252), ('sequi iure nostrum', 71, 252), ('consectetur et ut', 72, 252), ('sequi alias sed', 75, 252), ('eveniet saepe eius', 76, 252), ('amet quaerat dolores', 79, 252), ('veritatis cupiditate cupiditate', 82, 252), ('deserunt vero ullam', 91, 252), ('ex molestias quo', 99, 252), ('in omnis explicabo', 5, 253), ('aut repellat a', 8, 253), ('libero occaecati debitis', 14, 253), ('ut est sunt', 15, 253), ('voluptatibus mollitia fugiat', 21, 253), ('quia et minima', 22, 253), ('sint voluptatum assumenda', 24, 253), ('libero ut quo', 27, 253), ('adipisci impedit nobis', 36, 253), ('in et explicabo', 37, 253), ('et est maxime', 38, 253), ('quas aut iusto', 39, 253), ('voluptatibus soluta enim', 41, 253), ('libero voluptate distinctio', 42, 253), ('accusamus et aliquam', 47, 253), ('omnis rerum ipsam', 54, 253), ('et possimus esse', 55, 253), ('fugiat magni sequi', 57, 253), ('quis nobis debitis', 66, 253), ('vitae aperiam facere', 71, 253), ('sunt sint quas', 75, 253), ('consequatur deleniti dolore', 76, 253), ('aut accusantium omnis', 79, 253), ('ad veritatis magni', 91, 253), ('a nisi eveniet', 95, 253), ('eveniet quis non', 98, 253), ('corrupti ut quaerat', 2, 254), ('nam voluptas nemo', 5, 254), ('quam sit ullam', 12, 254), ('est ullam qui', 13, 254), ('ut optio rerum', 14, 254), ('velit vitae dolores', 17, 254), ('aut sunt quidem', 21, 254), ('quo maiores atque', 24, 254), ('dolorem architecto voluptatem', 35, 254), ('cum praesentium facere', 36, 254), ('ipsa ab tempore', 38, 254), ('dolores rerum tenetur', 41, 254), ('blanditiis saepe ullam', 52, 254), ('sed porro maxime', 54, 254), ('eos cupiditate quisquam', 57, 254), ('molestias laborum provident', 60, 254), ('eius sed voluptatem', 65, 254), ('nam atque et', 66, 254), ('commodi dolorum ipsam', 69, 254), ('quae cupiditate minima', 71, 254), ('eius nam aut', 75, 254), ('itaque aut ut', 76, 254), ('nihil doloremque eligendi', 91, 254), ('ex tempora est', 93, 254), ('repellendus harum et', 96, 254), ('reprehenderit repellat exercitationem', 98, 254), ('delectus eum fugit', 4, 255), ('est aut animi', 5, 255), ('ut aut cumque', 10, 255), ('officia voluptate voluptatem', 11, 255), ('molestias itaque molestiae', 14, 255), ('voluptatem necessitatibus aut', 16, 255), ('quidem sapiente ex', 20, 255), ('recusandae cum aspernatur', 21, 255), ('nisi nobis quo', 24, 255), ('est unde quia', 27, 255), ('accusamus veritatis non', 30, 255), ('ut id nulla', 31, 255), ('culpa odit eveniet', 32, 255), ('beatae repellat hic', 36, 255), ('vel quia aliquid', 41, 255), ('quis enim provident', 43, 255), ('sit quia aut', 54, 255), ('aut dignissimos aspernatur', 57, 255), ('recusandae et velit', 65, 255), ('cumque eligendi neque', 66, 255), ('eos aperiam eaque', 71, 255), ('voluptatem consequatur quae', 75, 255), ('optio necessitatibus ducimus', 76, 255), ('dolorem iste velit', 79, 255), ('aut voluptas a', 91, 255), ('et et qui', 92, 255), ('hic eligendi quia', 94, 255), ('ratione suscipit temporibus', 95, 255), ('sit quidem quos', 96, 255), ('odit nihil soluta', 5, 256), ('itaque voluptas tempora', 12, 256), ('distinctio qui ratione', 14, 256), ('quidem quia consequatur', 18, 256), ('quaerat doloremque aut', 20, 256), ('beatae quae et', 21, 256), ('delectus mollitia qui', 24, 256), ('voluptatum quos voluptatibus', 30, 256), ('necessitatibus similique veritatis', 31, 256), ('minima odio facilis', 36, 256), ('odio enim autem', 39, 256), ('culpa vitae sit', 40, 256), ('autem sint minima', 41, 256), ('voluptatem quod quasi', 43, 256), ('sint quia et', 50, 256), ('cumque similique voluptatem', 52, 256), ('enim inventore dolorem', 54, 256), ('rem voluptatibus et', 57, 256), ('facere repellat velit', 61, 256), ('commodi nesciunt dolor', 62, 256), ('fuga nulla vitae', 65, 256), ('autem ut vel', 66, 256), ('natus et ex', 69, 256), ('aut omnis provident', 71, 256), ('impedit non dicta', 75, 256), ('veritatis excepturi qui', 76, 256), ('eius hic et', 87, 256), ('quos eligendi eum', 91, 256), ('expedita ut aspernatur', 94, 256), ('tenetur accusantium officiis', 3, 257), ('in autem incidunt', 5, 257), ('cupiditate eaque minima', 13, 257), ('velit et aut', 14, 257), ('animi velit possimus', 15, 257), ('cupiditate qui consequatur', 21, 257), ('inventore amet sequi', 24, 257), ('soluta dolores quam', 26, 257), ('officia distinctio dolores', 36, 257), ('magnam est autem', 41, 257), ('et dolores distinctio', 54, 257), ('ut ipsam dolores', 57, 257), ('qui veritatis eligendi', 62, 257), ('illo cumque omnis', 63, 257), ('est non tempore', 66, 257), ('eum mollitia odit', 69, 257), ('quis aliquam deleniti', 71, 257), ('qui voluptas quia', 75, 257), ('quaerat provident iste', 76, 257), ('accusamus vel est', 82, 257), ('sit nulla qui', 91, 257), ('sed quidem vitae', 93, 257), ('dolorem eveniet rerum', 95, 257), ('dolores nihil voluptas', 96, 257);

select * from comments

INSERT INTO likes(user_id,photo_id) VALUES(66, 250), (67, 250), (70, 250), (71, 250), (75, 250), (76, 250), (84, 250), (91, 250), (92, 250), (95, 250), (96, 250), (5, 251), (11, 251), (13, 251), (14, 251), (18, 251), (19, 251), (21, 251), (22, 251), (24, 251), (28, 251), (32, 251), (36, 251), (38, 251), (39, 251), (41, 251), (42, 251), (54, 251), (56, 251), (57, 251), (66, 251), (71, 251), (72, 251), (75, 251), (76, 251), (79, 251), (91, 251), (94, 251), (98, 251), (4, 252), (5, 252), (6, 252), (9, 252), (12, 252), (14, 252), (16, 252), (19, 252), (21, 252), (24, 252), (27, 252), (30, 252), (31, 252), (36, 252), (38, 252), (41, 252), (47, 252), (52, 252), (54, 252), (56, 252), (57, 252), (61, 252), (62, 252), (65, 252), (66, 252), (67, 252), (70, 252), (71, 252), (73, 252), (75, 252), (76, 252), (82, 252), (91, 252), (95, 252), (3, 253), (4, 253), (5, 253), (9, 253), (11, 253), (12, 253), (13, 253), (14, 253), (21, 253), (24, 253), (26, 253), (28, 253), (30, 253), (31, 253), (35, 253), (36, 253), (38, 253), (41, 253), (50, 253), (52, 253), (54, 253), (57, 253), (65, 253), (66, 253), (69, 253), (70, 253), (71, 253), (75, 253), (76, 253), (91, 253), (93, 253), (95, 253), (5, 254), (6, 254), (10, 254), (11, 254), (14, 254), (16, 254), (21, 254), (22, 254), (24, 254), (30, 254), (36, 254), (38, 254), (39, 254), (41, 254), (44, 254), (50, 254), (54, 254), (57, 254), (66, 254), (69, 254), (70, 254), (71, 254), (73, 254), (75, 254), (76, 254), (79, 254), (85, 254), (91, 254), (96, 254), (97, 254), (98, 254), (5, 255), (6, 255), (10, 255), (11, 255), (12, 255), (13, 255), (14, 255), (19, 255), (21, 255), (22, 255), (24, 255), (27, 255), (35, 255), (36, 255), (38, 255), (41, 255), (42, 255), (52, 255), (54, 255), (57, 255), (60, 255), (62, 255), (65, 255), (66, 255), (70, 255), (71, 255), (75, 255), (76, 255), (82, 255), (84, 255), (91, 255), (94, 255), (100, 255), (3, 256), (4, 256), (5, 256), (12, 256), (13, 256), (14, 256), (16, 256), (19, 256), (20, 256), (21, 256), (22, 256), (24, 256), (27, 256), (28, 256), (35, 256), (36, 256), (38, 256), (39, 256), (41, 256), (43, 256), (44, 256), (46, 256), (48, 256), (54, 256), (57, 256), (60, 256), (62, 256), (63, 256), (65, 256), (66, 256), (71, 256), (75, 256), (76, 256), (79, 256), (84, 256), (91, 256), (92, 256), (93, 256), (97, 256), (98, 256), (99, 256), (3, 257), (5, 257), (10, 257), (12, 257), (14, 257), (15, 257), (18, 257), (20, 257), (21, 257), (24, 257), (26, 257), (31, 257), (33, 257), (35, 257), (36, 257), (39, 257), (41, 257), (43, 257), (47, 257), (48, 257), (54, 257), (57, 257), (60, 257), (61, 257), (65, 257), (66, 257), (70, 257), (71, 257), (73, 257), (75, 257), (76, 257), (82, 257), (91, 257), (92, 257), (95, 257), (97, 257);

SELECT * FROM LIKES

INSERT INTO tags(tag_name) VALUES ('sunset'), ('photography'), ('sunrise'), ('landscape'), ('food'), ('foodie'), ('delicious'), ('beauty'), ('stunning'), ('dreamy'), ('lol'), ('happy'), ('fun'), ('style'), ('hair'), ('fashion'), ('party'), ('concert'), ('drunk'), ('beach'), ('smile');

SELECT * FROM TAGS

INSERT INTO photo_tags(photo_id, tag_id) VALUES (1, 18), (1, 17), (1, 21), (1, 13), (1, 19), (2, 4), (2, 3), (2, 20), (2, 2), (3, 8), (4, 12), (4, 11), (4, 21), (4, 13), (5, 15), (5, 14), (5, 17), (5, 16), (6, 19), (6, 13), (6, 17), (6, 21), (7, 11), (7, 12), (7, 21), (7, 13), (8, 17), (8, 21), (8, 13), (8, 19), (9, 18), (10, 2), (11, 12), (11, 21), (11, 11), (12, 4), (13, 13), (13, 19), (14, 1), (14, 20), (17, 19), (17, 13), (17, 18), (19, 5), (21, 20), (21, 3), (21, 1), (21, 4), (22, 7), (22, 5), (22, 6), (23, 18), (23, 19), (23, 13), (23, 21), (24, 12), (24, 13), (24, 21), (25, 8), (25, 21), (25, 10), (26, 20), (26, 21), (26, 8), (26, 9), (26, 10), (28, 9), (28, 10), (29, 8), (29, 21), (29, 9), (29, 20), (30, 7), (30, 6), (30, 5), (31, 7), (31, 5), (32, 10), (32, 9), (32, 21), (32, 8), (32, 20), (34, 11), (34, 13), (34, 12), (35, 6), (35, 7), (35, 5), (36, 5), (36, 7), (36, 6), (37, 18), (37, 21), (37, 13), (38, 3), (38, 2), (43, 11), (43, 21), (43, 12), (44, 20), (44, 10), (45, 3), (45, 1), (47, 20), (49, 21), (49, 18), (50, 5), (51, 21), (51, 8), (51, 20), (53, 8), (55, 12), (56, 11), (57, 13), (57, 18), (57, 21), (57, 19), (57, 17), (58, 8), (59, 20), (59, 9), (59, 10), (59, 21), (60, 16), (60, 15), (60, 17), (61, 20), (61, 10), (62, 2), (63, 6), (64, 12), (64, 13), (64, 21), (64, 11), (65, 7), (65, 5), (66, 15), (66, 17), (68, 11), (68, 21), (70, 21), (70, 12), (70, 11), (71, 14), (71, 15), (71, 16), (72, 20), (72, 8), (72, 21), (73, 13), (73, 21), (74, 16), (74, 15), (75, 1), (75, 20), (75, 4), (76, 11), (76, 12), (78, 16), (78, 17), (78, 15), (79, 6), (79, 5), (79, 7), (83, 1), (83, 3), (84, 17), (84, 18), (84, 13), (85, 20), (85, 1), (85, 3), (86, 13), (87, 12), (87, 13), (87, 21), (88, 18), (88, 17), (90, 14), (90, 17), (91, 3), (91, 4), (91, 1), (92, 19), (93, 17), (93, 21), (93, 13), (93, 18), (94, 19), (94, 18), (94, 13), (94, 17), (94, 21), (95, 18), (95, 19), (95, 17), (95, 21), (95, 13), (96, 15), (96, 17), (97, 7), (97, 5), (97, 6), (98, 16), (98, 15), (98, 14), (98, 17), (100, 20), (101, 14), (101, 16), (102, 14), (102, 16), (102, 15), (103, 5), (107, 11), (107, 12), (107, 21), (108, 11), (109, 9), (109, 8), (109, 10), (110, 2), (111, 17), (111, 15), (111, 14), (111, 16), (112, 21), (112, 9), (112, 20), (116, 7), (117, 21), (118, 20), (118, 4), (118, 1), (120, 21), (120, 19), (120, 17), (121, 21), (121, 13), (121, 11), (121, 12), (122, 15), (123, 17), (123, 14), (123, 15), (124, 15), (124, 16), (124, 17), (125, 11), (125, 12), (126, 2), (126, 3), (126, 4), (127, 21), (131, 5), (132, 19), (132, 17), (132, 13), (132, 18), (132, 21), (133, 15), (133, 17), (133, 16), (133, 14), (134, 21), (134, 11), (134, 12), (134, 13), (135, 17), (136, 8), (136, 9), (136, 21), (136, 20), (136, 10), (137, 11), (137, 13), (137, 21), (137, 12), (138, 9), (138, 20), (138, 10), (139, 5), (140, 11), (140, 12), (141, 17), (142, 21), (142, 20), (145, 18), (145, 13), (145, 19), (145, 17), (145, 21), (147, 5), (148, 11), (149, 20), (149, 4), (149, 1), (149, 2), (152, 16), (152, 17), (152, 15), (152, 14), (153, 15), (153, 16), (153, 17), (153, 14), (154, 21), (155, 10), (155, 21), (155, 20), (155, 9), (155, 8), (156, 6), (156, 5), (157, 13), (157, 11), (157, 12), (157, 21), (158, 15), (159, 5), (160, 5), (161, 11), (162, 15), (162, 14), (162, 17), (163, 21), (163, 13), (163, 19), (166, 13), (166, 17), (168, 6), (168, 5), (169, 12), (171, 10), (171, 21), (171, 9), (171, 8), (171, 20), (172, 15), (172, 16), (172, 14), (173, 16), (173, 15), (173, 17), (174, 5), (175, 17), (175, 18), (177, 15), (177, 17), (178, 16), (181, 5), (181, 7), (182, 8), (182, 10), (182, 20), (182, 21), (183, 5), (184, 13), (184, 21), (184, 12), (185, 20), (185, 8), (185, 21), (185, 9), (185, 10), (188, 13), (188, 21), (188, 11), (189, 10), (189, 8), (189, 20), (190, 17), (190, 18), (191, 5), (191, 6), (194, 1), (197, 13), (197, 18), (197, 21), (197, 19), (199, 11), (199, 13), (201, 3), (201, 4), (201, 2), (201, 1), (201, 20), (202, 21), (202, 18), (202, 19), (202, 17), (203, 17), (203, 19), (203, 18), (205, 18), (205, 21), (205, 17), (206, 14), (207, 13), (207, 21), (208, 4), (208, 20), (209, 20), (209, 3), (209, 2), (210, 2), (210, 1), (211, 18), (211, 13), (212, 8), (212, 21), (212, 20), (212, 9), (214, 14), (214, 15), (214, 17), (214, 16), (216, 3), (216, 1), (218, 8), (218, 20), (219, 17), (219, 19), (219, 13), (219, 21), (219, 18), (220, 2), (220, 3), (220, 20), (220, 4), (221, 12), (221, 13), (221, 21), (222, 7), (225, 7), (226, 12), (226, 13), (226, 21), (226, 11), (227, 2), (227, 3), (227, 4), (227, 1), (227, 20), (228, 20), (230, 10), (230, 21), (230, 9), (230, 8), (230, 20), (231, 3), (231, 4), (231, 1), (232, 8), (232, 10), (232, 20), (232, 21), (232, 9), (233, 3), (233, 1), (233, 2), (233, 20), (235, 10), (237, 10), (237, 20), (238, 1), (238, 4), (238, 3), (238, 2), (238, 20), (239, 17), (239, 21), (239, 18), (240, 20), (240, 4), (242, 1), (242, 20), (242, 4), (242, 2), (243, 1), (244, 7), (244, 5), (244, 6), (247, 16), (247, 14), (248, 10), (248, 9), (249, 7), (249, 5), (250, 14), (250, 16), (250, 15), (251, 11), (253, 7), (254, 4), (254, 2), (254, 20), (254, 3), (257, 13), (257, 19), (257, 18)

SELECT * FROM PHOTO_TAGS






--QUESTION 1-Identify the five oldest users on Instagram from the provided database.
SELECT TOP 5 ID,USERNAME,CREATED_AT FROM USERS
ORDER BY CREATED_AT ASC












--QUESTION 2-Identify users who have never posted a single photo on Instagram.
SELECT U.ID,U.USERNAME
FROM USERS U 
LEFT JOIN 
PHOTOS P ON U.ID=P.USER_ID
WHERE P.ID IS NULL









--QUESTION 3-Determine the winner of the contest and provide their details to the team.
SELECT TOP 1 U.USERNAME,P.ID,P.USER_ID,COUNT(L.USER_ID) AS TOTAL_LIKES
FROM LIKES L INNER JOIN PHOTOS P ON L.PHOTO_ID=P.ID
INNER JOIN USERS U ON P.USER_ID=U.ID
GROUP BY U.USERNAME,P.ID,P.USER_ID
ORDER BY TOTAL_LIKES DESC







--QUESTION 4- Identify and suggest the top five most commonly used hashtags on the platform.
SELECT TOP 5 T.TAG_NAME,COUNT(PT.PHOTO_ID) AS TOTAL
FROM TAGS T FULL OUTER JOIN PHOTO_TAGS PT ON T.ID=PT.TAG_ID
GROUP BY T.TAG_NAME
ORDER BY TOTAL DESC








-- QUESTION 5- Determine the day of the week when most users register on Instagram. 
SELECT TOP 1 DATENAME(WEEKDAY,CREATED_AT) AS DAYS ,COUNT(ID) AS COUNT_OF_ID  FROM USERS 
GROUP BY DATENAME(WEEKDAY,CREATED_AT)
ORDER BY COUNT(ID)  DESC







--QUESTION 6- Calculate the average number of posts per user on Instagram. 
SELECT COUNT(P.ID) AS TOTAL_POSTS,
COUNT(DISTINCT U.ID) AS TOTAL_USERS,
COUNT(P.ID)/COUNT(DISTINCT U.ID) AS AVG_POSTS_PER_USER
FROM USERS U  LEFT JOIN  PHOTOS P ON U.ID=P.USER_ID












--QUESTION 7 Identify users (potential bots) who have liked every single photo on the site,
SELECT USER_ID,COUNT(PHOTO_ID) AS COUNTS
FROM LIKES
GROUP BY USER_ID
HAVING COUNT(USER_ID)=(SELECT COUNT(ID) FROM PHOTOS)