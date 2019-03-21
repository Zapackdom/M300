# Lerndokumentation Amacher Leandro





[TOC]



## K1

#### Umgebung Einrichten

Zuerst musste ich folgende Dinge installieren:

1. VirtualBox
2. Vagrant
3. Visualstudio-Code
4. Git-Client
5. SSH-Key für Client erstellt

Diese Installationen erfolgten Problemlos. Jedoch muss man beim SSH-Key noch ein paar zusätzliche Schritte machen welche nachfolgend dokumentiert sind.

#### Github kofigurieren

###### SSH-Key für Client erstellen

1. Terminal öffnen

2. Befehl mit dem Account-E-Mail von GitHub einfügen:

   ```
     $  ssh-keygen -t rsa -b 4096 -C "leandroamacher@gmail.com"
   ```

3. SSH-Key mit folgendem Befehl erstellen:

   ```
     Generating public/private rsa key pair.
   ```

4. Bei der Abfrage, unter welchem Namen der Schlüssel gespeichert werden soll, die Enter-Taste drücken (für Standard):

   ```
     Enter a file in which to save the key (~/.ssh/id_rsa): [Press enter]
   ```

5. Nun kann ein Passwort für den Key festgelegt werden. Ich empfehle dieses zu setzen und anschliessend dem SSH-Agent zu hinterlegen, sodass keine erneute Eingabe (z.B. beim Pushen) notwendig ist:

   ```
     Enter passphrase (empty for no passphrase): [Passwort]
     Enter same passphrase again: [Passwort wiederholen]
   ```

Jetzt kann man im Github Konto unter Settings > SSH und GPG keys > New SSH key öffnen und den SSH key eintragen. Dieser findet man in Windows unter %HOME%/.ssh/id_rsa.pub
Man kann ihn dort hinein kopieren.

![1552576466042](C:\Users\leam_\AppData\Roaming\Typora\typora-user-images\1552576466042.png)

###### Client konfigurieren

Man muss Git mit dem login vom GitHub-Account konfigurieren:

1. Terminal (*Bash*) öffnen

   ```
     $ git config --global user.name "<username>"
     $ git config --global user.email "<e-mail>"
   ```

###### Repository klonen

Das Repository klont man in ein lokales Verzeichnis auf dem Computer, damit man aus der Verzeichnisstrukur  besser arbeiten kann.
Man muss jedoch immer manuell über die Konsole die Dokumente auf GitHub laden.

1. Terminal (*Bash*) öffnen

2. Repository klonen:

   ```
     $ git clone https://github.com/mc-b/M300
   ```

3. In das M300-Verzeichnis wechseln:

   ```
     $ cd M300
   ```

4. Repository aktualisieren und Status anzeigen:

   ```
     $ git pull
   
     Already up to date.
   
     $ git status
   
     Your branch is up to date with 'origin/master'.
   ```

Nun kann man mit folgenden Befehlen jeweils arbeiten:

Git pull = Von GitHub in den Ordner welcher mit GitHub geklont wurde Dateien holen

Git push = Dateien von dem Ordner ins GitHub laden
Aktuell liegt der Ordner im C:\Documents\M300

Hier noch eine ausführlichere Anleitung: https://github.com/mc-b/M300/tree/master/10-Toolumgebung



## K2

#### GitHub Account erstellt

Für dieses Modul musste ich zuerst einen Account erstellen, da ich GitHub zuvor noch nie verwendet habe.

![1553028031007](C:\Users\leam_\AppData\Roaming\Typora\typora-user-images\1553028031007.png)



#### GitHub Client wurde verwendet

Um die Arbeit mit GitHub zu erleichtern, habe ich den GitHub Client für Windows lokal installiert.

 

#### Mark down

Alle meine Arbeitsschritte sowie die Punkte zur Erfüllung der LB01 werden hier drin festgehalten.

Als Mark down-Editor verwende ich Typora damit ich eine bessere Übersicht habe.

Das Mark down wurde von mir sinnvoll nach den Lernzielen strukturiert.



#### Persönlicher Wissensstand

Mein Wissenstand zu folgenden Punkten:

- Linux
- Virtualisierung
- Vagrant
- GitHub
- Mark Down
- Systemsicherheit

**Linux**: Ich habe nun schon einige Male in der Schule sowie auf der Arbeit mit Linux gearbeitet. Mittlerweile verstehe ich das Prinzip und die Funktionalitäten von den meisten Linux basierenden Betriebssystemen. Die meiste Erfahrung habe ich jedoch mit Ubuntu. Ich kann noch nicht behaupten, dass ich ein Spezialist bin, aber ich kann damit umgehen.

**Virtualisierung**: Mit dem Thema Virtualisierung bin ich nun schon oft in Kontakt gekommen. Ich beziehe das nun nicht nur auf Server sondern auch Services oder ganze Netzwerk Infrastrukturen welche man virtualisieren kann. Da wir im Geschäft auch alle Server virtuell haben, habe ich schon viel Erfahrung auf dem Gebiet.

**Vagrant**: Vagrant kannte ich bis zu diesem Modul noch gar nicht. Mir war diese Art von Technologie auch nicht bekannt. Jedoch hat mich das Ganze sehr erstaunt und meinen Interesse geweckt. Aber da ich noch kein Wissen habe muss ich von null beginnen.

**GitHub**: Ich habe schon vorher einiges von GitHub gehört und wurde mit der Funktionsweise belehrt. Selber habe ich es aber nie gebraucht. Ich habe also noch kein grosses Wissen, jedoch ist GitHub auch einfach zu bedienen und es geht meiner Meinung nach mehr um Routine statt um Wissen.

**Mark down**: Auch der Aufbau und die Struktur eines Mark downs ist mir neu. Jedoch fällt es mir mit dem Editor nicht schwer, eines zu verfassen. Ich finde die "raw" Struktur spannend anzusehen um zu schauen wie diese Datei formatiert wird. Bis jetzt erinnert es mich entfernt an Html.



## K3

#### Bestehende VM aus Vagrant-Cloud einrichten

Ich habe mich zuerst im Internet schlau gemacht und die Befehle kennen gelernt. Ich habe verschiedene Tutorials angeschaut und bin dann auf ein interessantes Projekt Names lamp-server gestossen.

Darunter versteht man folgendes:
Der ursprüngliche **LAMP Stack** besteht aus den vier Komponenten Linux (Betriebssystem), Apache (Webserver), MySQL (Datenbanksystem) und PHP (serverseitiger Skript-Interpreter).

Ich habe dann einen Arbeitskollegen bei mir um Hilfe gebeten, da er sich mit Vagrant gut auskennt und auch damit bereits gearbeitet hat.

Damit dieses Projekt funktioniert, musste ich noch ein Separates Script schreiben welches die einzelnen Konfigurationsschritte beinhaltet. Mir war zu beginn noch nicht ganz klar wie das funktioniert, aber ich habe dann einige Beispiele von anderen Projekten gesehen welche auch solche Scripte verfassen mussten wie meine Datei Setup.sh.

Folgende Konfigurationsschritte sind dort drin definiert:

- Standardkennwort für MySWL und Tools
- Basispakete für lamp server (vim, phython, git)
- PHP
- etc...

Damit das setup.sh script ausgeführt wird, musste ich dies im vagrant file angeben. Ansonsten wird im Vagrant nur das Betriebssystem, Netzwerkinfos, Name und Ordner für html angegeben.

Befehl für das Setup:

- config.vm.provision :shell, path: "setup.sh"

Ich habe die unbekannten Befehle im Internet gesucht und so gut wie möglich mir erklären lassen.

Viele Zusatzinfos bezüglich dem File wurden im ReadMe.md oder im Code selber kommentiert.

![1553124933302](C:\Users\leam_\AppData\Roaming\Typora\typora-user-images\1553124933302.png)

#### VM Angaben

IP: 192.168.33.10

Name: ubuntu-server-php

Pakete:

- PHP 7.1
- MySQL 5.5
- Git
- PhpMyAdmin
- Composer

RAM: 1 GB

Speicher: 50 GB

#### Testprotokoll

| Nr.  | Testfall                                | Ergebnis                                                     | Positiv/Negativ |
| ---- | --------------------------------------- | ------------------------------------------------------------ | --------------- |
| 1    | Vagrant up Fehlerfrei                   | VM setzt sich auf ohne in einen Error zu laufen              | Positiv         |
| 2    | Login möglich mit den richtigen Angaben | Man kann sich mit den gesetzten Daten einloggen.             | Positiv         |
| 3    | Webserver wurde installiert             | Webseite auf local host ist aufrufbar                        | Positiv         |
| 4    | Index.htm im richtigen Pfad gespeichert | Die Index Datei befindet sich wie geplant im www Ordner      | Positiv         |
| 5    | phpmyadmin erreichbar                   | Phpmyadmin wurde installiert und ist unter Port 8000/phpmyadmin aufrufbar | Positiv         |
| 6    | Login in phpmyadmin möglich             | Man kann sich mit dem selben Account wie auf der VM im phpmyadmin einloggen | Positiv         |
| 7    | MySQL Funktionsfähig                    | Man kann Datenbanken und alle weiteren Funktionen in MySQL benutzen | Positiv         |



## K4

#### Firewall mit Rules

Die Firewall wurde wie folgt ins Vagrant implementiert:

**Installation**

```
    $ sudo apt-get install ufw
```

**Start **

```
    $ sudo ufw enable
```

**Firewall-Regeln**

```
   sudo ufw allow 80/tcp
   sudo ufw allow 8080
   sudo ufw allow 8000
   sudo ufw allow from [Meine-IP] to any port 22
```

#### Reverse Proxy

Der Apache-Webserver wird als Reverse Proxy eingerichtet.

Alle folgende Schritte wurden im Setup.sh Script eingetragen.

**Installation** Dazu müssen folgende Module installiert werden:

```
    $ sudo apt-get install libapache2-mod-proxy-html
    $ sudo apt-get install libxml2-dev
```

Anschliessend die Module in Apache aktivieren:

```
    $ sudo a2enmod proxy
    $ sudo a2enmod proxy_html
    $ sudo a2enmod proxy_http 
```

Apache-Webserver neu starten:

```
    $ sudo service apache2 restart
```





**Individuelle Konfiguration** 

Folgende Einstellungen sind immer unterschiedlich und sollten im nachhinein auf dem Server eingetragen werden. Hier ein Beispiel:

Die Weiterleitungen sind z.B. in `sites-enabled/001-reverseproxy.conf` eingetragen:

```
    # Allgemeine Proxy Einstellungen
    ProxyRequests Off
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>

    # Weiterleitungen master
    ProxyPass /master http://master
    ProxyPassReverse /master http://master
```



#### Benutzer und Rechtevergabe

**Webserver**

| Benutzer | Funktion                       | Rechte         |
| -------- | ------------------------------ | -------------- |
| root     | Admin unter Linux              | Vollrechte     |
| www-data | Benutzer des Webservers Apache | read / execute |

**Datebank**

| Benutzer | Funktion                                       | Rechte         |
| -------- | ---------------------------------------------- | -------------- |
| root     | Admin unter Linux                              | Vollrechte     |
| mysql    | Benutzer von der MySQL Datenbank in Phpmyadmin | Execute rechte |

**Benutzer der Virtuellen Maschine**

| Benutzer | Funktion          | Rechte     |
| -------- | ----------------- | ---------- |
| lamacher | Normaler Benutzer | Read/Write |





## K5

#### Vergleich Vorwissen - Wissenszuwachs

**Beginn vom Projekt:**

Zu Beginn von diesem Projekt, hatte ich noch keine Ahnung von Vagrant und der Funktionen. Ich hatte schliesslich noch nie damit gearbeitet. Auch auf der Plattform Github war ich noch nicht oft unterwegs und hatte keine Erfahrung.

**Nach dem Projekt:**

Mittlerweile habe ich eine menge dazugelernt was Vagrant angeht. Ich habe nicht nur die einzelnen Befehle verstanden, sondern auch die Funktion dahinter und was eigentlich hinter der Technologie steckt. Dazu gehört zum Beispiel wie Vagrant mit dem System kommuniziert. Ich weiss nun auch, dass man mit Vagrant eine komplexe Virtuelle Umgebung innerhalb von wenigen Minuten aufsetzen und fertig installieren und das so oft wie man will wenn man das Vagrant File erst mal geschrieben hat.

Bei GitHub konnte ich auch viel dazulernen. Ich weiss nun wie man hier die Dokumente in einem Mark down verfasst und kann wichtige Sicherheitsvorkehrungen wie einen SSH Key für die Verbindung zum Lokalen Repository bilden. Ansonsten ist die Plattform sehr Benutzerfreundlich und selbsterklärend.

#### Reflexion

Mir hat die Arbeit bis hierhin sehr gefallen. Ich konnte meinen Rucksack mit neuem Wissen füllen und habe das Gefühl das ich von nun öfters mit Vagrant arbeiten werde. Die Arbeit hat mir spass gemacht, da Vagrant einen simplen Code Aufbau hat und man sich nicht zuerst Tage lang hinein steigern muss wie bei einer Programmiersprache. Ich bin mit der Arbeit auch sehr gut voran gekommen jedoch nehme ich für den weitern Verlauf des Modules mit, dass ich etwas früher mit der Arbeit beginnen sollte, da es mehr Zeit in Anspruch nahm als geplant war.