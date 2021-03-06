import 'package:sqflite/sqflite.dart';

class AllDatabase {
  Database db;
  initDB() async {
    db = await openDatabase('phoenix_database.db',
      version: 1,
      onCreate: (db, version) {
      //create tables
        db.execute(
          "CREATE TABLE exercices(id INTEGER PRIMARY KEY, name TEXT, series INTEGER, repetitions INTEGER, weight INTEGER, rest INTEGER, exerciceOrder INTEGER, trainingId INTEGER, sessionId INTEGER)",
        );
        db.execute(
          "CREATE TABLE user(id INTEGER PRIMARY KEY, birthday INTEGER, size INTEGER, weight INTEGER, gender TEXT, sessions INTEGER)",
        );
        db.execute(
          "CREATE TABLE training(id INTEGER PRIMARY KEY, name TEXT, session INTEGER, duration INTEGER, done INTEGER, predefined INTEGER)",
        );
        db.execute(
          "CREATE TABLE seance(id INTEGER PRIMARY KEY, trainingId INTEGER)",
        );
        db.execute(
          "CREATE TABLE session(id INTEGER PRIMARY KEY, seance INTEGER, week INTEGER, sessionNumber INTEGER, date INTEGER, startAt INTEGER, endAt INTEGER, trainingId INTEGER, seanceId INTEGER, done BOOLEAN)",
        );
        db.execute(
          "CREATE TABLE exercices_default(id INTEGER PRIMARY KEY, name TEXT, description TEXT, area TEXT, series INTEGER, repetitions INTEGER, weight INTEGER, rest INTEGER)",
        );
        //add user
        db.execute(''' INSERT INTO user (id, birthday, size, weight, gender, sessions) VALUES (1,null,null,null,null,null) ''');
        //add predefined program
        //training
        db.execute(''' INSERT INTO training (id, name, session, duration, done, predefined) VALUES (1,?,3,3,0,1) ''',['Entrainements de base']);
        //seances
        db.execute(''' INSERT INTO seance (id, trainingId) VALUES (1,1) ''');
        db.execute(''' INSERT INTO seance (id, trainingId) VALUES (2,1) ''');
        db.execute(''' INSERT INTO seance (id, trainingId) VALUES (3,1) ''');
        //sessions
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (1,1,1,1,null,null,null,1,1,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (2,2,1,1,null,null,null,1,2,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (3,3,1,1,null,null,null,1,3,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (4,1,2,2,null,null,null,1,1,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (5,2,2,2,null,null,null,1,2,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (6,3,2,2,null,null,null,1,3,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (7,1,3,3,null,null,null,1,1,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (8,2,3,3,null,null,null,1,2,0) ''');
        db.execute(''' INSERT INTO session (id, seance, week, sessionNumber, date, startAt, endAt, trainingId, seanceId, done) VALUES (9,3,3,3,null,null,null,1,3,0) ''');
        //exercices
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (1,?,3,10,0,120,1,1,1) ''', ['pompes']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (2,?,3,10,0,120,2,1,1) ''', ['squat']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (3,?,3,10,0,120,1,1,2) ''', ['crunch']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (4,?,3,10,0,120,2,1,2) ''', ['developpe couche']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (5,?,3,10,0,120,1,1,3) ''', ['elevation laterale']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (6,?,3,10,0,120,2,1,3) ''', ['developpe militaire']);

        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (7,?,3,15,0,120,1,1,4) ''', ['pompes']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (8,?,3,10,10,120,2,1,4) ''', ['squat']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (9,?,3,15,0,120,1,1,5) ''', ['crunch']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (10,?,3,10,20,120,2,1,5) ''', ['developpe couche']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (11,?,3,10,2,120,1,1,6) ''', ['elevation laterale']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (12,?,3,10,5,120,2,1,6) ''', ['developpe militaire']);

        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (13,?,3,20,0,120,1,1,7) ''', ['pompes']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (14,?,3,10,20,120,2,1,7) ''', ['squat']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (15,?,3,20,0,120,1,1,8) ''', ['crunch']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (16,?,3,10,30,120,2,1,8) ''', ['developpe couche']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (17,?,3,10,4,120,1,1,9) ''', ['elevation laterale']);
        db.execute(''' INSERT INTO exercices (id, name, series, repetitions, weight, rest, exerciceOrder, trainingId, sessionId) VALUES (18,?,3,10,10,120,2,1,9) ''', ['developpe militaire']);

        //add default exercices
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (1,?,?,?,3,10,0,120) ''',['pompes',"La pompe est un exercice physique de musculation qui sollicite principalement le grand pectoral, le deltoïde et les triceps. La posture de départ est la suivante : face au sol, le corps repose uniquement sur les deux pieds et les deux mains. Les pieds sont joints, et les mains écartées un peu plus loin que l'envergure des épaules. Le but de l'exercice est d'abaisser tout le corps en restant droit, grâce à l'unique travail des bras. Le corps descend jusqu'à ce que la poitrine (ou le menton) frôle le sol. Un abaissement et une remontée constituent une pompe. Cet exercice physique est fréquemment employé dans la plupart des armées du monde.",'chest']);
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (2,?,?,?,3,10,0,120) ''',['squat',"Le squat est un mouvement d'accroupi qui constitue un exercice poly-articulaire de force et de musculation ciblant les muscles de la cuisse (principalement quadriceps, adducteurs et ischio-jambiers) et les fessiers. Il sollicite aussi secondairement les mollets, les lombaires et les abdominaux. C'est un des trois mouvements de base de la force athlétique avec le développé couché et le soulevé de terre. La flexion sur jambes, plus connue sous le nom de squat, consiste à effectuer des flexions des membres inférieurs avec une barre chargée reposant sur l'arrière des épaules.",'chest']);
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (3,?,?,?,3,10,0,120) ''',['crunch',"Le crunch, ou enroulement vertébral, est l'un des exercices de musculation des abdominaux les plus pratiqués. Il fait surtout travailler le muscle droit de l'abdomen. Pour réaliser un crunch, on s'allonge au sol sur le dos avec les genoux pliés. On commence par courber les coudes vers le bassin. Les mains doivent être croisées sur le thorax. Le risque, cependant, est de se blesser au niveau des vertèbres cervicales en tirant la tête ou la nuque avec ses mains, ou au niveau des vertèbres lombaires en essayant de redresser le buste trop haut.",'chest']);
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (4,?,?,?,3,10,0,120) ''',['developpe couche',"Le développé couché est un exercice poly-articulaire de force et de musculation qui consiste à soulever et abaisser une barre d'haltères, développant principalement les pectoraux et les triceps, mais qui sollicite également d'autres muscles comme le grand dorsal, le grand rond, les trapèzes, les deltoïdes antérieurs et les biceps. C'est un des trois mouvements de base de la force athlétique avec les flexions sur jambe et le soulevé de terre.",'chest']);
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (5,?,?,?,3,10,0,120) ''',['elevation laterale',"L'élévation latérale est un exercice de musculation qui développe et élargit les épaules, surtout les faisceaux moyens des deltoïdes, et dans un moindre degré les autres muscles des épaules. L'élévation latérale se fait en général avec des haltères (ou des charges de fortune), mais il serait possible de reproduire le même mouvement avec des câbles. Le pratiquant commence l'exercice les bras le long du corps, tenant dans chaque main un haltère. Il lève ses bras, raides ou légèrement fléchis, traçant un quart de cercle de chaque côté jusqu'à ce qu'ils soient horizontaux, puis les redescend doucement à la position de départ, retraçant ce mouvement à l'envers.",'chest']);
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (6,?,?,?,3,10,0,120) ''',['developpe militaire',"Le développé militaire est un mouvement de musculation de base qui fait travailler les épaules, plus précisément les faisceaux antérieur et moyen du deltoïde, et indirectement les triceps (arrière du bras), les trapèzes, le haut de la poitrine et le dentelé antérieur. L'exercice se fait à la machine ou aux haltères (une barre tend à restreindre la liberté de mouvement et ne cible pas les mêmes parties de l'épaule - ce mouvement est classé développé militaire). Ordinairement assis, le pratiquant démarre les mains au niveau des épaules, les lève en étendant les bras à une position au-dessus de la tête, avant de descendre sans rebondir au point bas du cycle.",'chest']);
      },
    );
  }
}