# Phoenix Gym

Phoenix Gym est une application mobile native qui permet aux utilisateurs de gérer leurs entrainements sportifs.

## Installation de l'émulateur

Télécharger d'abord le projet phoenyx_gym sur github.

Pour pouvoir utiliser l'application, il faut d'abord installer l'éditeur de code Android Studio pour pouvoir lancer l'application sur son téléphone ou un émulateur.

Quand c'est installé, lancer l'éditeur de code.

Une fois lancée, la première chose à faire est d'installer l'émulateur.

Rendez vous dans:
Tools -> SDK Manager -> SDK Platforms -> Checker la box a coté de Android 9.0 -> Apply -> Accepter l'installer des composants

Vous n'êtes pas obligé d'utiliser Android 9.0 mais c'est la version avec laquelle je lance l'application et qui ne devrait poser aucun problèmes.

La deuxième chose à faire est d'installer l'appareil android qu'on veut

Allez alors dans:
Tools -> AVD Manager -> Create Virtual Device -> Nexus 4 -> Next -> Pie Android 9.0 (ce qu'on a installé à l'étape précédente) -> Next 
-> Finish

Encore une fois vous pouvez choisir autre chose que le Nexus 4 mais c'est l'appareil sur laquel je travaillais avec un émulateur

Après la création, vous êtes renvoyées sur la page AVD Manager:

Cliquer sur la flèche verte dans le menu des actions -> Attendez un moment l'émulateur va se lancer et s'installer

## Installation des plugins

Aller dans Files -> Settings -> Plugins et Installer les plugins "Flutter" et "Dart"

## Lancer l'application sur l'émulateur

Une fois l'installation de l'émulateur terminée,

Aller dans:

File -> Open -> Choissisez le dossier phoenyx_gym que vous avez téléchargés

En haut au milieu de l'écran, il y a plusieurs champs ou vous pouvez selectionner l'émulateur et le fichier à faire tourner:

Premier champ emulateur -> Choisir AOSP on IA Emulator (mobile)

Deuxième champ app -> Choisir main.dart

Maintenant cliquer sur la flèche verte pour lancer l'application

Attendez quelques instants et normalement l'application devrait se lancer.

## Lancer l'application sur son téléphone Android

Il faut d'abord activer sur votre téléphone le mode Déboguage USB et permettre à votre ordinateur d'effectuer des modifications sur votre téléphone.

Pour l'activer cela dépend de votre appareil mobile. 

Une recherche rapide sur google du mode Deboguage USB et de votre appareil et c'est vite trouvé.

Pas besoin d'installer un émulateur dans ce cas la.

Meme étape que dans la section précédente à quelques choses pret.

Aller dans:

File -> Open -> Choissisez le dossier phoenyx_gym que vous avez téléchargés

Reliez votre téléphone et votre pc à l'aide d'un cable

En haut au milieu de l'écran, il y a plusieurs champs ou vous pouvez selectionner l'appareil et le fichier à faire tourner:

Premier champ appareil -> Choisir votre téléphone ( il ne devrait y avoir qu'une possibilité )

Deuxième champ app -> Choisir main.dart

Maintenant cliquer sur la flèche verte pour lancer l'application

Attendez quelques instants et normalement l'application devrait se lancer sur votre téléphone.

- [Un autre tutoriel en anglais pour faire tourner l'application sur un émulateur](https://developer.android.com/studio/run/emulator)
