FROM texlive/texlive

WORKDIR "/doc"
ARG FILENAME=main
ARG DIR=.
COPY $DIR .
RUN latexmk -pdf -f -interaction=nonstopmode $FILENAME.tex
CMD ["sleep", "100"]
# CMD sh -c "latexmk -pdf -f -interaction=nonstopmode vkr.tex && sleep 100"
# docker run --rm -it $(docker build -q .)
