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
        db.execute(''' INSERT INTO training (id, name, session, duration, done, predefined) VALUES (1,?,3,3,0,1) ''',['Entrainements jambes']);
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

        //add default exercices
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (1,?,?,?,3,10,0,120) ''',['pompes',"La pompe est un exercice physique de musculation qui sollicite principalement le grand pectoral, le deltoïde et les triceps. La posture de départ est la suivante : face au sol, le corps repose uniquement sur les deux pieds et les deux mains. Les pieds sont joints, et les mains écartées un peu plus loin que l'envergure des épaules. Le but de l'exercice est d'abaisser tout le corps en restant droit, grâce à l'unique travail des bras. Le corps descend jusqu'à ce que la poitrine (ou le menton) frôle le sol. Un abaissement et une remontée constituent une pompe. Cet exercice physique est fréquemment employé dans la plupart des armées du monde.",'chest']);
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (2,?,?,?,3,10,0,120) ''',['squat',"Le squat est un mouvement d'accroupi qui constitue un exercice poly-articulaire de force et de musculation ciblant les muscles de la cuisse (principalement quadriceps, adducteurs et ischio-jambiers) et les fessiers. Il sollicite aussi secondairement les mollets, les lombaires et les abdominaux. C'est un des trois mouvements de base de la force athlétique avec le développé couché et le soulevé de terre. La flexion sur jambes, plus connue sous le nom de squat, consiste à effectuer des flexions des membres inférieurs avec une barre chargée reposant sur l'arrière des épaules.",'chest']);
        db.execute(''' INSERT INTO exercices_default (id, name, description, area, series, repetitions, weight, rest) VALUES (3,?,?,?,3,10,0,120) ''',['crunch',"Le crunch, ou enroulement vertébral, est l'un des exercices de musculation des abdominaux les plus pratiqués. Il fait surtout travailler le muscle droit de l'abdomen. Pour réaliser un crunch, on s'allonge au sol sur le dos avec les genoux pliés. On commence par courber les coudes vers le bassin. Les mains doivent être croisées sur le thorax. Le risque, cependant, est de se blesser au niveau des vertèbres cervicales en tirant la tête ou la nuque avec ses mains, ou au niveau des vertèbres lombaires en essayant de redresser le buste trop haut.",'chest']);
      },
    );
  }
}