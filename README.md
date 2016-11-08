## H5

Viidennessä harjoituksessä oli tarkoituksena tehdä moduuli git-varastoon ja raportoida harjoitus Markdownilla. Tein harjoituksen kotoani käsin Asus K56CM-läppärilläni. Boottasin läppärini USB-livetikulta, johon oli asennettu Xubuntu 16.04.1 LTS. Ajattelin hyödyntää edellisessä harjoituksessa tekemääni moduulia ja pushata sen GitHubiin.

# Alkutoimet

Päivitin paketinhallinnan ja asetin näppäimistön layoutin suomalaiseksi:
> $ setxkbmap fi
> $ sudo apt-get update

Tein käyttäjän 'xubuntu' kotihakemistoon moduulin vaatimat alihakemistot. Sitten tein sudoeditillä alihakemistoon */modules/* tiedoston *init.pp*, jonne kopioin edellisen harjoitukseni https://mnuutinen.wordpress.com/2016/11/05/palvelinten-hallinta-harjoitus-4/ moduulin koodin. Asensin vielä SSH:n, jotta saisin moduulin vaatiman templaten kopioitua oikeaan paikkaan.

$ sudo apt-get -y install ssh
$ sudo cp /etc/ssh/sshd_config /home/xubuntu/koticonf/templates/

Lopputulos näytti seuraavalta:
├── koticonf
│   ├── manifests
│   │   └── init.pp
│   └── templates
│       └── sshd_config








