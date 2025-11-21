# Koristimo gotovu sliku koja već ima Jupyter
FROM jupyter/base-notebook:latest

# Prelazimo na 'root' (admin) korisnika da možemo instalirati stvari
USER root

# Instaliramo curl i unzip (alati potrebni da bi se skinuo Deno)
RUN apt-get update && apt-get install -y curl unzip

# Instaliramo Deno u mapu dostupnu svima (/usr/local)
ENV DENO_INSTALL=/usr/local
RUN curl -fsSL https://deno.land/install.sh | sh

# Vraćamo se na običnog korisnika (Jupyter ne voli raditi kao root)
USER ${NB_UID}

# Govorimo Denu da instalira svoj kernel u Jupyter
RUN deno jupyter --unstable --install
