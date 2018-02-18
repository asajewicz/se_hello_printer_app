Simple Flask App
================

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Rozpocząnając pracę z projektem (wykorzystując virtualenv). Hermetyczne środowisko dla pojedyńczej aplikacji w python-ie:

  ::

    source /usr/bin/virtualenvwrapper.sh
    mkvirtualenv wsb-simple-flask-app
    pip install -r requirements.txt
    pip install -r test_requirements.txt

- Uruchamianie aplikacji:

  ::

    # jako zwykły program
    python main.py

    # albo:
    PYTHONPATH=. FLASK_APP=hello_world flask run

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ::

    PYTHONPATH=. py.test
    PYTHONPATH=. py.test  --verbose -s

- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ::

    source /usr/bin/virtualenvwrapper.sh
    workon wsb-simple-flask-app

- Integracja z TravisCI:

.. image:: https://travis-ci.org/asajewicz/se_hello_printer_app.svg?branch=master
    :target: https://travis-ci.org/asajewicz/se_hello_printer_app


- Monitoring StatusCake. Utworzono nowy test na stronie StatusCake uzywając URL z Heroku.com

.. image:: https://app.statuscake.com/button/index.php?Track=paJYD1Rj5f&Days=1&Design=1
     :target: https://www.statuscake.com

  Jeśli plik się nazywa README.md to można wkleić cały link:

  ::

    <a href="https://www.statuscake.com" title="Website Uptime Monitoring"><img src="https://app.statuscake.com/button/index.php?Track=paJYD1Rj5f&Days=1&Design=1" /></a>


Pomocnicze
==========

- Instalacja python virtualenv i virtualenvwrapper:

  ::

    yum install -y python-pip
    pip install -U pip
    pip install virtualenv
    pip install virtualenvwrapper

- Instalacja docker-a:

  ::

    yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

    yum install -y yum-utils

    yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

    yum makecache fast
    yum install docker-ce
    systemctl start docker

Materiały
=========

- https://virtualenvwrapper.readthedocs.io/en/latest/

Konfiguracja na świeżej maszynie wirtualnej
=========

1. Stwórz katalog asajewicz (nazwa githuba).
2. Sklonuj repozytorium.
3. Zrób:
	git config --global user.name "asajewicz"
	git config --global user.email "asajewicz@users.noreply.github.com"
	git config --global core.editor "atom --wait"
4. Sprawdź konfigurację: git config -l
5. Teraz możesz pushować (git status, git add nazwa_kolejnych_plików, git commit -m "nazwa", git push origin master).
6. Wejść na root (su).
7. Instalacja:
    yum install -y python-pip
    pip install -U pip
    pip install virtualenv
    pip install virtualenvwrapper
8. Wróć na tester (exit)
9. Otwórz atom ~/.bashrc i dodaj na końcu: source /usr/bin/virtualenvwrapper.sh
10. Wejdź do katalogu se_hello_printer_app i wykonaj w terminalu :
    source /usr/bin/virtualenvwrapper.sh
    mkvirtualenv wsb-simple-flask-app
    pip install -r requirements.txt
    pip install -r test_requirements.txt
11. Wykonaj w terminalu:
	make run
	make test
12. (Opcjonalne) Dodaj do Makefile (w terminalu: atom Makefile):
	test_smoke:
		curl -I --fail 127.0.0.1:5000
13. Konfiguracja dockera:
	na root (su) uruchom komendę: make docker_build (w drugim oknie terminalu)
	na root: make docker_run (w pierwszym oknie terminalu)
	w razie potrzeby zakończenie procesu: docker stop hello_wordl_printer(nazwa jego)
	usunięcie procesu (po zastopowaniu): docker remove nazwa_dockera
	sprawdź status: docker ps lub docker ps -a
14. listowanie: ls
15. zaciągnięcie na maszynę: git pull

16. Uruchomienie maszyny workon wsb-simple-flask-app
17. Ustaw monitoring na stronie StatusCake (nowy test) używając URL zaciągnięty z Heroku.com
18. Dodaj obrazek i link z travis i statuscake do dokumentacji (sekcja Integracja z Travis, Monitoring StatusCake)
