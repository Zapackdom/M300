# Vagrant-Setup

LAMP-Server > Der ursprüngliche **LAMP Stack** besteht aus den vier Komponenten Linux (Betriebssystem), Apache (Webserver), MySQL (Datenbanksystem) und PHP 

Vagrant-Konfiguration (mit Bereitstellung in Shell Script) zum Erstellen einer virtuellen Maschine (Ubuntu Server 14.04 64 Bits) in PHP.

Pakete:

- PHP 7.1
- MySQL 5.5
- Git
- PhpMyAdmin
- Composer

## Was man benötigt:

- Virtualbox - <https://www.virtualbox.org/>
- Vagrant - <http://www.vagrantup.com/>
- Git - [http://git-scm.com](http://git-scm.com/) 
- Internet Zugang

Installieren Sie Virtualbox und Vagrant entsprechend Ihrem Betriebssystem.

## Nutzung

Die Erstinstallation erfolgt auf folgende Art:

- Wenn Sie Git auf Ihrem Rechner installiert haben, gehen Sie wie folgt vor:
- Klonen Sie dieses Repository für Ihren Computer: https://github.com/Zapackdom/M300
- Immer noch in der Eingabeaufforderung / Terminal Geben Sie das Verzeichnis vagrant-setup-php ein.
- Starten sie die VM mit folgendem Befehl:

```
Vagrant up
```

Nach dem 'vagrant up'-Befehl ist Vagrant dafür verantwortlich, das Betriebssystem herunterzuladen, die virtuelle Maschine in VirtualBox zu konfigurieren und später alle Pakete im Skript' setup.sh 'herunterzuladen, zu installieren und zu konfigurieren. Das erste Mal ist  etwas zeitraubend.

Wenn alles fertig ist, steht unter http://localhost:8080 ein Webserver zur Verfügung. Die Installation von PHPMyAdmin erfolgt unter http://localhost:8080/phpmyadmin. 

- Login: root
- PW: vagrant

Geben Sie Ihren Code in das Verzeichnis "www" ein. Der gesamte Inhalt wird unter http://localhost:8080 verfügbar sein. (Zum Test gibt es bereits eine index.php-Datei, die die Funktion phpinfo () aufruft).

Um die virtuelle Maschine auszuschalten, verwenden Sie den Befehl:

- vagrant halt

Um die Verbindung wieder herzustellen, verwenden Sie:

- vagrant up

Wenn Sie die virtuelle Maschine zerstören möchten (der Inhalt des WWW wird nicht ausgeschlossen):

- vagrant destroy

   