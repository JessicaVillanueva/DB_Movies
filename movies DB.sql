DROP DATABASE IF EXISTS MOVIES;
CREATE DATABASE MOVIES;
USE MOVIES;

CREATE TABLE movies(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    date_year DATE,
    synopsis VARCHAR(1024) NOT NULL,
    image VARCHAR(256) NOT NULL
);

CREATE TABLE users(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL UNIQUE,
    password CHAR(100) NOT NULL,
    name VARCHAR(45) NOT NULL,
    ln_paternal VARCHAR(45) NOT NULL,
    ln_maternal VARCHAR(45)
);

CREATE TABLE comments(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    comment VARCHAR(256) NOT NULL,
    date datetime NOT NULL,
    movie_id INT NOT NULL,
    CONSTRAINT FK_MOVIE_ID_MOVIE FOREIGN KEY(movie_id)
    REFERENCES movies(id) ON DELETE CASCADE,
    user_id INT NOT NULL,
    CONSTRAINT FK_USER_ID_USER FOREIGN KEY(user_id)
    REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE likes(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    likes INT,
    dislike INT,
    movie_id INT NOT NULL,
    CONSTRAINT FK_MOVIE_ID_MOVIE FOREIGN KEY(movie_id)
    REFERENCES movies(id) ON DELETE CASCADE,
    user_id INT NOT NULL,
    CONSTRAINT FK_USER_ID_USER FOREIGN KEY(user_id)
    REFERENCES users(id) ON DELETE CASCADE
);

/*DROP TRIGGER T_BI_USERS_PASSWORS;
DELIMITER $$
CREATE TRIGGER T_BI_USERS_PASSWORS
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    SET NEW.password = SHA1(NEW.password);
END$$
DELIMITER ;*/


INSERT INTO movies(title, date_year, synopsis, image) VALUES
('The SpongeBob Movie: Sponge on the Run', '2020-08-14', 'When his best friend Gary is suddenly snatched away, SpongeBob takes Patrick on a madcap
mission far beyond Bikini Bottom to save their pink-shelled pal.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/jlJ8nDhMhCYJuzOw3f52CP1W8MW.jpg'),

('Greyhound', '2020-07-10','The only thing more dangerous than the front lines was the fight to get there.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/kjMbDciooTbJPofVXgAoFjfX8Of.jpg'),

('Silver Linings Playbook', '2012-09-08', 'After spending eight months in a mental institution, a former teacher moves back in with his parents and tries
to reconcile with his ex-wife.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/y7iOVneBvITlBdhy6tVqXVOa1Js.jpg'),

('Greenland', '2020-07-29',
'John Garrity, his estranged wife and their young son embark on a perilous journey to find sanctuary as a planet-killing comet hurtles toward Earth.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/bNo2mcvSwIvnx8K6y1euAc1TLVq.jpg'),

('Chick Fight','2020-11-13', 'When Anna Wyncomb is introduced to an an underground, all-female fight club in order to turn the mess of her life
around, she discovers she is much more personally connected to the history of the club than she could ever imagine.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/4ZocdxnOO6q2UbdKye2wgofLFhB.jpg'),

('Unfortunate Stories','2020-11-19', 'Four interconnected plots starring Ramón, a young heir; Bermejo, a tourist obsessed with order; Ayoub, an African
immigrant pursuing his dream; and Alipio, a businessman addicted with gambling.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/sp4zXS3x4wHyL8wm8zLioiBrxuR.jpg'),

('Hard Kill', '2020-10-23', 'The work of billionaire tech CEO Donovan Chalmers is so valuable that he hires mercenaries to protect it, and a terrorist
group kidnaps his daughter just to get it.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg'),

('Fatman', '2020-11-26', 'A rowdy, unorthodox Santa Claus is fighting to save his declining business. Meanwhile, Billy, a neglected and precocious 12
year old, hires a hit man to kill Santa after receiving a lump of coal in his stocking.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/4n8QNNdk4BOX9Dslfbz5Dy6j1HK.jpg'),

('Rogue One', '2020-10-30', 'Caught in the crosshairs of police corruption and Marseille’s warring gangs, a loyal cop must protect his squad by taking
matters into his own hands.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/9HT9982bzgN5on1sLRmc1GMn6ZC.jpg'),

('Welcome to Sudden Death', '2020-09-29', 'Jesse Freeman is a former special forces officer and explosives expert now working a regular job as a security
guard in a state-of-the-art basketball arena.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/elZ6JCzSEvFOq4gNjNeZsnRFsvj.jpg'),

('Rogue Warfare: Death of a Nation', '2020-09-25', 'After rescuing Daniel from the terrorist Black Mask Organization, the team uncovers plans for a
deadly bomb set to detonate in 36 hours that threatens world order.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8GVpIEBqlRBvx28G0LfEX0U8D2k.jpg'),

('Roald Dahl´s The Witches', '2020-10-26', 'In late 1967, a young orphaned boy goes to live with his loving grandma in the rural Alabama town of
Demopolis.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/betExZlgK0l7CZ9CsCBVcwO1OjL.jpg'),

('Enola Holmes', '2020-09-23', 'While searching for her missing mother, intrepid teen Enola Holmes uses her sleuthing skills to outsmart big brother
Sherlock and help a runaway lord.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/riYInlsq2kf1AWoGm80JQW5dLKp.jpg'),

('Peninsula','2020-07-15', 'A soldier and his team battle hordes of post-apocalyptic zombies in the wastelands of the Korean Peninsula.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/sy6DvAu72kjoseZEjocnm2ZZ09i.jpg'),

('Joker','2019-10-04', 'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while
becoming an infamous psychopathic crime figure.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg'),

('Mulan', '2020-09-04', 'When the Emperor of China issues a decree that one man per family must serve in the Imperial Chinese Army to defend the
country from Huns, Hua Mulan, the eldest daughter of an honored warrior, steps in to take the place of her ailing father.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/aKx1ARwG55zZ0GpRvU2WrGrCG9o.jpg'),

('Alien Xmas', '2020-11-20', 'A young elf mistakes a tiny alien for a Christmas gift, not knowing her new plaything has plans to destroy Earth´s
gravity — and steal all the presents.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/3UGrAX6D1AMVra80jmUMUOLq8Qr.jpg'),

('Demon Slayer the Movie: Mugen Train', '2020-10-16', 'Tanjirō Kamado, joined with Inosuke Hashibira, a boy raised by boars who wears a boar´s head,
and Zenitsu Agatsuma, a scared boy who reveals his true power when he sleeps.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/h8Rb9gBr48ODIwYUttZNYeMWeUU.jpg'),

('Vampire Virus', '2020-06-27', 'A young woman contracts a deadly virus after an unusual sexual encounter, and soon develops a taste for human blood.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/xRyb5pjWdPSXvFpYUNibMPW91UE.jpg'),

('Ava', '2020-09-25', 'A black ops assassin is forced to fight for her own survival after a job goes dangerously wrong.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/qzA87Wf4jo1h8JMk9GilyIYvwsA.jpg'),

('Once Upon a Snowman', '2020-10-23', 'The previously untold origins of Olaf, the innocent and insightful, summer-loving snowman are revealed as we
follow Olaf’s first steps as he comes to life and searches for his identity in the snowy mountains outside Arendelle.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/hddzYJtfYYeMDOQVcH58n8m1W3A.jpg'),

('VFW', '2020-10-14', 'A typical night for veterans at a VFW turns into an all-out battle for survival when a desperate teen runs into the bar with a
bag of stolen drugs.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/AnVD7Gn14uOTQhcc5xYZGQ9DRvS.jpg'),

('After We Collided', '2020-09-02', 'Tessa finds herself struggling with her complicated relationship with Hardin; she faces a dilemma that could
change their lives forever.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/kiX7UYfOpYrMFSAGbI6j1pFkLzQ.jpg'),

('Money Plane', '2020-09-29', 'A professional thief with $40 million in debt and his family´s life on the line must commit one final heist - rob a
futuristic airborne casino filled with the world´s most dangerous criminals.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/6CoRTJTmijhBLJTUNoVSUNxZMEI.jpg'),

('Jiu Jitsu', '2020-11-20', 'Every six years, an ancient order of jiu-jitsu fighters joins forces to battle a vicious race of alien invaders.
But when a celebrated war hero goes down in defeat, the fate of the planet and mankind hangs in the balance.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/eLT8Cu357VOwBVTitkmlDEg32Fs.jpg'),

('Rogue', '2020-08-20', 'Battle-hardened O’Hara leads a lively mercenary team of soldiers on a daring mission: rescue hostages from their captors in
remote Africa. But as the mission goes awry and the team is stranded, O’Hara’s squad must face a bloody, brutal encounter with a gang of rebels.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/uOw5JD8IlD546feZ6oxbIjvN66P.jpg'),

('Tenet', '2020-09-03', 'Armed with only one word - Tenet - and fighting for the survival of the entire world, the Protagonist journeys through a
twilight world of international espionage on a mission that will unfold in something beyond real time.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/k68nPLbIST6NP96JmTxmZijEvCA.jpg'),

('Unknown Origins', '2020-08-28', 'In Madrid, Spain, a mysterious serial killer ruthlessly murders his victims by recreating the first appearance of
several comic book superheroes.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/vJHSParlylICnI7DuuI54nfTPRR.jpg'),

('The New Mutants', '2020-09-03', 'Five young mutants, just discovering their abilities while held in a secret facility against their will, fight to
escape their past sins and save themselves.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/xrI4EnZWftpo1B7tTvlMUXVOikd.jpg'),

('The Avenger', '2012-04-27', 'When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international
peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a
daring recruitment effort begins!',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg'),

('Avengers: Age of Ultron', '2015-04-30', 'When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and Earth’s Mightiest
Heroes are put to the ultimate test as the fate of the planet hangs in the balance. As the villainous Ultron emerges, it is up to The Avengers to stop
him from enacting his terrible plans, and soon uneasy alliances and unexpected action pave the way for an epic and unique global adventure.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/4ssDuvEDkSArWEdyBl2X5EHvYKU.jpg'),

('Avengers: Infinity War', '2018-04-27', 'As the Avengers and their allies have continued to protect the world from threats too large for any one hero
to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones,
artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this
moment - the fate of Earth and existence itself has never been more uncertain.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg'),

('Avengers: Endgame', '2019-04-26', 'After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad
Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos actions and restore order to the universe
once and for all, no matter what consequences may be in store.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/or06FN3Dka5tukK1e9sl16pB3iy.jpg'),

('The Hunger Games', '2012-03-23', 'Every year in the ruins of what was once North America, the nation of Panem forces each of its twelve districts to
send a teenage boy and girl to compete in the Hunger Games. Pitted against highly-trained Tributes who have prepared for these Games their entire lives,
 Katniss is forced to rely upon her sharp instincts as well as the mentorship of drunken former victor Haymitch Abernathy. If she’s ever to return home
 to District 12, Katniss must make impossible choices in the arena that weigh survival against humanity and life against love. The world will be watching.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/1ewwtjqAcwZ5abr2X7coGN0UwaI.jpg'),

('The Hunger Games: Catching Fire', '2013-11-22', 'Katniss Everdeen has returned home safe after winning the 74th Annual Hunger Games along with fellow
tribute Peeta Mellark. Winning means that they must turn around and leave their family and close friends, embarking on a "Victor´s Tour" of the districts.
Along the way Katniss senses that a rebellion is simmering, but the Capitol is still very much in control as President Snow prepares the 75th Annual
Hunger Games (The Quarter Quell) - a competition that could change Panem forever.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7c1JtraYsjMMnk8Md0IMoyRzqZJ.jpg'),

('The Hunger Games: Mockingjay - Part 1', '2014-11-21',
'Katniss Everdeen reluctantly becomes the symbol of a mass rebellion against the autocratic Capitol.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/ezHakxJHVXdPI6h3TKssEwXYtsg.jpg'),

('The Hunger Games: Mockingjay - Part 2', '2015-11-20',
'With the nation of Panem in a full scale war, Katniss confronts President Snow in the final showdown. Teamed with a group of her closest friends – including Gale, Finnick, and Peeta – Katniss goes off on a mission with the unit from District 13 as they risk their lives to stage an assassination attempt on President Snow who has become increasingly obsessed with destroying her. The mortal traps, enemies, and moral choices that await Katniss will challenge her more than any arena she faced in The Hunger Games.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/lImKHDfExAulp16grYm8zD5eONE.jpg'),

('Harry Potter and the Chamber of Secrets', '2002-11-29',
'Harry Potter and the Chamber of Secrets',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/sdEOH0992YZ0QSxgXNIGLq1ToUi.jpg'),

('Harry Potter and the Prisoner of Azkaban', '2004-06-04',
'Harry, Ron and Hermione return to Hogwarts for another magic-filled year. Harry comes face to face with danger yet again, this time in the form of escaped convict, Sirius Black—and turns to sympathetic Professor Lupin for help.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/v0wMKEEGaNc9evdqGYfIvoWXh24.jpg'),

('Harry Potter and the Goblet of Fire', '2005-11-18',
'Harry starts his fourth year at Hogwarts, competes in the treacherous Triwizard Tournament and faces the evil Lord Voldemort. Ron and Hermione help Harry manage the pressure – but Voldemort lurks, awaiting his chance to destroy Harry and all that he stands for.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/fECBtHlr0RB3foNHDiCBXeg9Bv9.jpg'),

('Fantastic Beasts and Where to Find Them', '2016-11-18',
'In 1926, Newt Scamander arrives at the Magical Congress of the United States of America with a magically expanded briefcase, which houses a number of dangerous creatures and their habitats. When the creatures escape from the briefcase, it sends the American wizarding authorities after Newt, and threatens to strain even further the state of magical and non-magical relations.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/fLsaFKExQt05yqjoAvKsmOMYvJR.jpg'),

('Fantastic Beasts: The Crimes of Grindelwald', '2018-11-16',
'Gellert Grindelwald has escaped imprisonment and has begun gathering followers to his cause—elevating wizards above all non-magical beings. The only one capable of putting a stop to him is the wizard he once called his closest friend, Albus Dumbledore. However, Dumbledore will need to seek help from the wizard who had thwarted Grindelwald once before, his former student Newt Scamander, who agrees to help, unaware of the dangers that lie ahead. Lines are drawn as love and loyalty are tested, even among the truest friends and family, in an increasingly divided wizarding world.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/fMMrl8fD9gRCFJvsx0SuFwkEOop.jpg'),

('Back to the Future ', '1985-12-25',
'Eighties teenager Marty McFly is accidentally sent back in time to 1955, inadvertently disrupting his parents first meeting and attracting his mother´s romantic interest. Marty must repair the damage to history by rekindling his parents romance and - with the help of his eccentric inventor friend Doc Brown - return to 1985.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/xlBivetfrtF84Yx0zISShnNtHYe.jpg'),

('Back to the Future Part II', '1989-11-22',
'Marty and Doc are at it again in this wacky sequel to the 1985 blockbuster as the time-traveling duo head to 2015 to nip some McFly family woes in the bud. But things go awry thanks to bully Biff Tannen and a pesky sports almanac. In a last-ditch attempt to set things straight, Marty finds himself bound for 1955 and face to face with his teenage parents -- again',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/hQq8xZe5uLjFzSBt4LanNP7SQjl.jpg'),

('Back to the Future Part III ', '2015-10-21',
'The final installment of the Back to the Future trilogy finds Marty digging the trusty DeLorean out of a mineshaft and looking for Doc in the Wild West of 1885. But when their time machine breaks down, the travelers are stranded in a land of spurs. More problems arise when Doc falls for pretty schoolteacher Clara Clayton, and Marty tangles with Buford Tannen.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/cZO1zLEFACR06FwpXN9urvmoulR.jpg'),

('Toy Story', '1995-11-22',
'Led by Woody, Andy´s toys live happily in his room until Andy´s birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy´s heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg'),

('Toy Story 2', '1999-11-24',
'Andy heads off to Cowboy Camp, leaving his toys to their own devices. Things shift into high gear when an obsessive toy collector named Al McWhiggen, owner of Al´s Toy Barn kidnaps Woody. Andy´s toys mount a daring rescue mission, Buzz Lightyear meets his match and Woody has to decide where he and his heart truly belong.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/yFWQkz2ynjwsazT6xQiIXEUsyuh.jpg'),

('Toy Story 3', '2010-06-18',
'Woody, Buzz, and the rest of Andy´s toys haven´t been played with in years. With Andy about to go to college, the gang find themselves accidentally left at a nefarious day care center. The toys must band together to escape and return home to Andy.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/4cpGytCB0eqvRks4FAlJoUJiFPG.jpg'),

('Toy Story 4', '2019-06-21',
'Woody has always been confident about his place in the world and that his priority is taking care of his kid, whether that´s Andy or Bonnie. But when Bonnie adds a reluctant new toy called "Forky" to her room, a road trip adventure alongside old and new friends will show Woody how big the world can be for a toy.',
'https://image.tmdb.org/t/p/w600_and_h900_bestv2/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg'),

('Santana', '2020-08-28', 'Two brothers — one a narcotics agent and the other a general — finally discover the identity of the drug lord who murdered
their parents decades ago.', 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/9Rj8l6gElLpRL7Kj17iZhrT5Zuw.jpg');

INSERT INTO users(email, password, name, ln_paternal, ln_maternal) VALUES
('software2@software.com', SHA1('123456'), 'software', 'software', null);

INSERT INTO comments(comment, date, movie_id, user_id) VALUES
('me encantar ATL', NOW(),'1', '1');

SELECT * FROM movies;
SELECT * FROM users;
SELECT * FROM comments;



-- Procedimiento almacenado para crear comentarios
DELIMITER $$
CREATE PROCEDURE ADD_COMMENT(IN comments VARCHAR(256), IN id_movie INT, IN id_user INT)
BEGIN
	INSERT INTO comments(comment, date, movie_id, user_id) VALUES (comments, NOW(), id_movie, id_user);
END $$
DELIMITER ;
-- Ejemplo de como se llama al procedimiento almacenado y los parametros que lleva
CALL ADD_COMMENT("no me gustó la peli", 3, 1);

select * from comments;


-- Vista para mostrar comentarios de la peli
DROP VIEW V_MOVIE_COMMENTS_DETAILS;
CREATE VIEW V_MOVIE_COMMENTS_DETAILS AS
SELECT c.id, c.comment, DATE_FORMAT(c.date,'%d/%m/%Y') AS "date_comment" , concat_ws(" ", u.name, u.ln_paternal) as "name_user", movie_id FROM comments c
INNER JOIN users u ON u.id = c.user_id;
-- Ejemplo de como llamar a la vista
SELECT * FROM V_MOVIE_COMMENTS_DETAILS;

