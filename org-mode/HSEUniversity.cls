\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HSEUniversity}[2022-11-13 Template for dessirtations and other artefacts]
%\LoadClass[a4paper]{extreport}
\LoadClass[fontsize=13bp]{scrreprt} % Times New Roman 13 size
\RequirePackage{ifpdf}
\RequirePackage{kvoptions}
\RequirePackage[a4paper,left=30mm,right=15mm,top=20mm,bottom=25mm,footskip=15mm]{geometry}

\RequirePackage{cmap}            % Улучшенный поиск русских слов в полученном pdf-файле
\RequirePackage[T2A]{fontenc}    % Поддержка русских букв
\RequirePackage[utf8]{inputenc}  % Кодировка utf8
\RequirePackage{csquotes}
\RequirePackage[russian]{babel}  % Языки: русский, английский


\RequirePackage[font=small,skip=4pt]{caption}
\RequirePackage{graphicx}

%\usepackage{pscyr}    % Красивые русские шрифты
%\renewcommand{\rmdefault}{ftm} % Включаем Times New Roman

%%% Оформление абзацев %%%
\RequirePackage{indentfirst} % Красная строка

%%% Размер шрифатов у заголовков %%%
\RequirePackage{titlesec}

%%% Table of Contents %%%
\RequirePackage{tocloft}
\RequirePackage{titletoc}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}


\RequirePackage[linktocpage=true,plainpages=false,pdfpagelabels=false]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Библиография %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
  style=gost-numeric-min,
  language=russian,
  babel=other,
  backend=biber,
  defernumbers=true,% Нумерация начинается как только встречается группа.
  sorting=none,
  url=false,
  doi=false,
  isbn=false,
  movenames=false,
  maxnames=100
]{biblatex}
\renewcommand*{\multicitedelim}{\addcomma\space}

%\usepackage{cite} % Красивые ссылки на литературу
% Настройки языка в списке литературы.
\DeclareSourcemap{
  \maps[datatype=bibtex,overwrite=false]{
    \map{
      \step[fieldset=language,fieldvalue=english]
    }
    \map{
      \step[fieldsource=language,match=\regexp{English},replace=\regexp{english}]
    }
    \map{
      \step[fieldsource=language]
      \step[fieldset=hyphenation,origfieldval]
    }
% \map{
%   \step[fieldset=hyphenation,fieldvalue={english}]
% }
  }
}
%%%%%%%%%%%%%%%%%%%%%%
% ошибка в russian.lbx
\NewBibliographyString{langjapanese}
\NewBibliographyString{fromjapanese}

\newcommand{\putbibliography}{
  \chapter**{Библиографический список}
  \addcontentsline{toc}{chapter}{Библиографический список}

  \printbibliography[heading=none] %title={Библиографический список}, env=gostbibliography,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Установка основных характеристик текста

\sloppy   % Избавляемся от переполнений
\clubpenalty=10000    % Запрещаем разрыв страницы после первой строки абзаца
\widowpenalty=10000   % Запрещаем разрыв страницы после последней строки абзаца

\linespread{1.5} % Полуторный интервал
\setlength{\parindent}{12.5mm} % Отступ красной строки

% Попись таблицы и рисунка
\captionsetup[table]{position=t, singlelinecheck=false, justification=raggedright, labelsep=endash, name=Таблица}
\captionsetup[figure]{labelfont={bf, it}, textfont={bf, it}, position=b, singlelinecheck=false, labelsep=endash, justification=centering, name=Рисунок}

%%% Главы и разделы %%%
\titleformat{\chapter}%[display]
  {\Large\bfseries\centering}
  {\chaptertitlename\ \thechapter.}{4pt}{}
\titlespacing*{\chapter}{0pt}{0pt}{12pt}
\titleformat{\section}
  {\large\bfseries\centering}
  {\thesection.}{4pt}{}
\titlespacing*{\section}{0pt}{12pt}{6pt}
\titleformat{\subsection}
  {\bfseries\centering}
  {\thesubsection.}{3pt}{}
\titlespacing*{\subsection}{0pt}{8pt}{4pt}
\titleformat{\subsubsection}
  {\centering}
  {\thesubsubsection.}{3pt}{}
\titlespacing*{\subsubsection}{0pt}{8pt}{4pt}

%%% Маркированные списки %%%
\renewcommand\labelitemi{--}
\renewcommand\labelitemii{--}
\renewcommand\labelitemiii{--}
\renewcommand\labelitemiv{--}
\RequirePackage{enumitem}
\setlist{leftmargin=15mm}
\setlist{nosep}
%%% Оглавление %%%
\renewcommand{\cftchapdotsep}{\cftdotsep}
\let\@originalchapter\chapter
\def\chapter{
  \@ifstar\chapterstar\@originalchapter
 }
 \def\chapterstar{
   \@ifstar\chapter@nonum@notoc\chapter@nonum
 }
\newcommand\chapter@nonum@notoc[2][]{
   \@originalchapter*{#2}
}
\newcommand\chapter@nonum[2][]{
   \@originalchapter*{#2}
   \addcontentsline{toc}{chapter}{#2}
}
\titlecontents{chapter}% <section-type>
  [0pt]% <left>
  {}% <above-code>
  {\bfseries\chaptername\ \thecontentslabel.\enskip}% <numbered-entry-format>
  {}% <numberless-entry-format>
  {\bfseries\dotfill\contentspage}% <filler-page-format>
%%%%%%%%%%%%%%%%%%%%%%%%
% Обработка опций пакета

\SetupKeyvalOptions{
  family=HSE,
  prefix=HSE@
}

\def\@facultyString{UNKNOWN FACULTY}
\def\@typeString{UNKNOWN WORK TYPE}
\def\@specName{UNKOWN SPECIALIZATION}
\def\@specCode{00.00.00.UNKOWN SPECIALIZATION}
\newif\ifHasReviewer
\HasReviewerfalse

% Available options for the specialiazation
% PI -- Software Engeneers
\DeclareVoidOption{PI}{
  \def\@facultyString{Факультет социально-экономических и компьютерных науки}
  \def\@specName{Программная инженерия}
  \def\@specCode{09.03.04 Программная инженерия}
}
% BI -- Бизнес информатика
\DeclareVoidOption{BI}{
  \def\@facultyString{Факультет социально-экономических и компьютерных науки}
  \def\@specName{Бизнес информатика}
  \def\@specCode{38.03.05 Бизнес-информатика}
}
% Available options for the type
\DeclareVoidOption{KR}{
  \def\@typeString{Курсовая работа}
}
\DeclareVoidOption{VKR}{
  \def\@typeString{Выпускная квалификационная работа}
  \HasReviewertrue
}

\DeclareDefaultOption{%
  \PackageWarningNoLine{\@currname}{%
    Unknown option `\CurrentOption'\MessageBreak
    is passed to class `report'%
  }%
  % Pass the option to class report
  \expandafter\PassOptionToClass
  \expandafter{\CurrentOption}{report}%
}
\ProcessKeyvalOptions*

\def\@year{1900}
\def\@supervisorTitle{}
\def\@supervisorName{I.I.~Ivanov}
\def\@reviewerTitle{}
\def\@reviewerName{I.I.~Ivanov}
\def\@abstract{TODO}

\newcommand{\Year}[1]{\def\@year{#1}}
\newcommand{\supervisor}[2]{
  \def\@supervisorTitle{#1}
  \def\@supervisorName{#2}
}
\newcommand{\reviewer}[2]{
  \def\@reviewerTitle{#1}
  \def\@reviewerName{#2}
}
\newcommand{\Abstract}[1]{
  \def\@abstract{#1}
}

\renewcommand{\maketitle}{
{
  \thispagestyle{empty}

  \centering

  {
    Пермский филиал федерального государственного автономного \\
    образовательного учреждения высшего образования \\
    Национальный исследовательский университет \\
    <<Высшая школа экономики>>
  }

  \vfill

  \@facultyString

  \vfill
  \vfill
  \vfill

  \@author

  \vfill
  \vfill

  \textbf{\MakeUppercase{\@title}}

  \textit{\@typeString}

  \vfill

  студента образовательной программы <<\@specName>> \\
  по направлению подготовки {\underline{\@specCode}}

  \vfill
  \vfill
  \vfill

  \ifHasReviewer
  \begin{minipage}[t]{0.4\textwidth}
    Рецензент \\
    \@reviewerTitle

    \vspace{2mm}

    \@reviewerName
  \end{minipage}
  \fi
  \hfill
  \begin{minipage}[t]{0.4\textwidth}
    Руководитель \\
    \@supervisorTitle

    \vspace{10mm}

    \hrule
    \vspace{3mm}

    \@supervisorName
  \end{minipage}

  \vfill
  \vfill
  \vfill

  Пермь, \@year{} год

  \newpage
}

\chapter**{Аннотация}

\@abstract

\chapter**{Оглавление}

\@starttoc{toc}

\newpage

}

\newsavebox{\TABLEbox}
\newenvironment{TABLE}[2][t]
{
  \def\@tableCaption{#2}
  \begin{table}[#1]
  \begin{lrbox}{\TABLEbox}
  \small
}{
  \end{lrbox}

  \centering
  \captionbox[l]{\@tableCaption}{
    \usebox{\TABLEbox}
  }
  \end{table}
}


\newsavebox{\FIGUREbox}
\newenvironment{FIGURE}[2][t]
{
  \def\@figureCaption{#2}
  \begin{figure}[#1]
  \begin{lrbox}{\FIGUREbox}
}{
  \end{lrbox}

  \centering
  \usebox{\FIGUREbox}

  \caption{\@figureCaption}
  \end{figure}
}

\newcommand{\appendixsection}[1]{\section{#1}\addcontentsline{toc}{chapter}{Приложение \thesection. \currentname}} % не уверен что работает
\newcommand{\reftable}[1]{см. таблицу ~\ref{#1}}
\newcommand{\reffig}[1]{Рисунок ~\ref{#1}}
