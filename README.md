# H5

Viidennessä harjoituksessä oli tarkoituksena tehdä moduuli git-varastoon ja raportoida harjoitus Markdownilla. Tein harjoituksen kotoani käsin Asus K56CM-läppärilläni. Boottasin läppärini USB-livetikulta, johon oli asennettu Xubuntu 16.04.1 LTS. Ajattelin hyödyntää edellisessä harjoituksessa tekemääni moduulia ja pushata sen GitHubiin.

## Alkutoimet

Päivitin paketinhallinnan ja asetin näppäimistön layoutin suomalaiseksi:
> $ setxkbmap fi

> $ sudo apt-get update

Tein käyttäjän 'xubuntu' kotihakemistoon hakemiston *koticonf* ja sinne moduulin vaatimat alihakemistot *manifests* ja *templates*. Sitten tein sudoeditillä alihakemistoon */modules/* tiedoston *init.pp*, jonne kopioin edellisen [harjoitukseni](https://mnuutinen.wordpress.com/2016/11/05/palvelinten-hallinta-harjoitus-4/) moduulin koodin. Asensin vielä SSH:n, jotta saisin moduulin vaatiman templaten kopioitua oikeaan paikkaan.

> $ sudo apt-get -y install ssh

> $ sudo cp /etc/ssh/sshd_config /home/xubuntu/koticonf/templates/

Editoin vielä templatea sudoeditillä, jotta SSH kuuntelisi porttia 666 oletuksen 22 sijaan.

## Moduulin pushaaminen GitHubiin

Aluksi loin webin kautta tämän kyseisen repositoryn, jonka readme-tiedostoa juuri luet. Sitten asensin gitin ja säädin hieman sen asetuksia (oma email, nimi ja salasanan muistaminen) kuntoon.

> $ sudo apt-get -y install git

> $ git config --global user.email "oma@email.com"

> $ git config --global user.name "Matti Nuutinen"

> $ git config --global credential.helper "cache --timeout=3600"

Sitten menin hakemiston *koticonf* juureen ja suoritin seuraavat komennot:

> $ sudo git init

> $ sudo add .

> $ sudo git commit -m "First commit"

> $ sudo git remote add origin https://github.com/masssimo/koticonf.git

> $ git push -u origin master

Tiedostot näyttivät siirtyvän annettuani käyttäjänimen ja salasanan, mutta eivät täysin ongelmitta:

Counting objects: 6, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 1.93 KiB | 0 bytes/s, done.
Total 6 (delta 0), reused 0 (delta 0)
To https://github.com/masssimo/koticonf.git
 * [new branch]      master -> master
error: could not lock config file .git/config: Permission denied
error: Unable to write upstream branch configuration
hint: 
hint: After fixing the error cause you may try to fix up
hint: the remote tracking information by invoking
hint: "git branch --set-upstream-to=origin/master".
error: update_ref failed for ref 'refs/remotes/origin/master': cannot lock ref 'refs/remotes/origin/master': unable to create directory for .git/refs/remotes/origin/master

Ajoin vielä seuraavat komennot:

> $ sudo git remote -v
origin	https://github.com/masssimo/koticonf.git (fetch)
origin	https://github.com/masssimo/koticonf.git (push)

> $ git push origin master
error: update_ref failed for ref 'refs/remotes/origin/master': cannot lock ref 'refs/remotes/origin/master': unable to create directory for .git/refs/remotes/origin/master
Everything up-to-date

Myöhemmin päättelin, että virheilmoitukset johtuivat mahdollisesti siitä, että unohdin push-komennon edestä sudon. Totesin kuitenkin webin kautta, että tiedostot olivat siirtyneet GitHubiin. Tässä vaiheessa huomasin, että README-tiedoston voi tehdä GitHubissa myös webin kautta ja aloitin raportin kirjoittamisen Firefoxilla.

https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/
http://terokarvinen.com/2016/publish-your-project-with-github
http://terokarvinen.com/2016/aikataulu-palvelinten-hallinta-ict4tn022-1-5-op-uusi-ops-loppusyksy-2016
https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

















`








