# NRU-HSE-Perm-LatexTemplate
A LaTeX template for bachelor and master thesis at HSE University (Perm)

## Подробнее

Пример оформления работы в [diss-short.pdf](https://github.com/Samoed/NRU-HSE-Perm-LatexTemplate/blob/master/diss-short.pdf).

Данный репозиторий содерижит шаблон LaTeX для написания курсовых и выпускных квалификационных работ, выполняющизся в Научно-исследовательском университете <<Высшая школа экономики>> (Пермь).

Первая версия шаблона создавалась в соответствии с [оффициальными требованиями](https://perm.hse.ru/ba/se/internships) бакалаврской программы <<Программная инженерия>> (2022/2023 учебный год).

## Советы
### Библиография
При указании источника в `*.bib` указывать `hyphenation={russian}` (или `language={russian}`) или `hyphenation={english}` в зависимости от языка работы.
#### Цитирования в стиле гост 2011
Для изменения стиля цитирования под 2008 гост убрать эти строки.
``` tex
  \ltx@iffilelater{biblatex-gost.def}{2017/05/03}%
  {\toggletrue{bbx:gostbibliography}%
  \renewcommand*{\revsdnamepunct}{\addcomma}}{}
```
#### Количество страниц и иллюстраций.
Для автоматического подсчета количества таблиц и иллюстраций указать:

``` tex
Количество страниц -- \pageref*{pg:end}, количество иллюстраций -- \TotalValue{totalfigures}, количетсво таблиц -- \TotalValue{totaltables}.
```

## Известные проблемы
### Длинный заголовок
Если будет длинный заголовок, как:
![](img/problem_heading.png)

то можно делать `chapter*`:
``` tex
\chapter*{ПРИЛОЖЕНИЕ А Техническое задание на разрабатываемую систему}
\stepcounter{chapter} % чтобы увеличить значение счетчика
```
Это происходит из-за того, что центрирует отдельно от счетчика.
