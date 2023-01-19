\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ProjectProposal}[2022-11-13 Template for project proposal]
%\LoadClass[a4paper]{extreport}
\LoadClass[fontsize=13bp]{scrreprt} % Times New Roman 13 size
\RequirePackage{ifpdf}
\RequirePackage{kvoptions}
\RequirePackage[a4paper,left=25mm,right=25mm,top=25mm,bottom=25mm,footskip=25mm]{geometry}

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

\setlength{\footskip}{20pt} % change postion of page number

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Библиография %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
  style=apa,
  language=russian,
  babel=other,
  backend=biber,
  sorting=anyvt, % sorts entries by alphabetic label, name, year, volume, title;
  url=false,
  doi=false,
  isbn=false,
  %movenames=false,
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
% \bibliographystyle{apacite}
\newcommand{\putbibliography}{
  \chapter*{Reference}

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
\RequirePackage{titlesec}
\titleclass{\chapter}{straight}
\titleformat{\chapter}%[display]
  {\bfseries\centering}
  {}{}{}
\titlespacing*{\chapter}{1pt}{1pt}{1pt}
\titleformat{\section}
  {\bfseries\centering}
  {}{3pt}{}
\titlespacing*{\section}{0pt}{8pt}{4pt}
\titleformat{\subsection}
  {\bfseries\centering}
  {}{3pt}{}
\titlespacing*{\subsection}{0pt}{8pt}{4pt}
\titleformat{\subsubsection}
  {\centering}
  {}{3pt}{}
\titlespacing*{\subsubsection}{0pt}{8pt}{4pt}
\RequirePackage{titletoc}
\titlecontents{chapter}[1em]{}
{\thecontentslabel\enspace}
{}
{\titlerule*[1pc]{.}\quad\contentspage}[\vskip 4pt]

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
%%%%%%%%%%%%%%%%%%%%%%%%
% Обработка опций пакета

\SetupKeyvalOptions{
  family=HSE,
  prefix=HSE@
}

\def\@facultyString{UNKNOWN FACULTY}
\def\@typeString{UNKNOWN WORK TYPE}
%\def\@specName{UNKOWN SPECIALIZATION}
%\def\@specCode{00.00.00.UNKOWN SPECIALIZATION}
%\newif\ifHasReviewer
%\HasReviewerfalse

% Available options for the specialiazation
% PI -- Software Engeneers
\DeclareVoidOption{PI}{
  \def\@facultyString{Faculty of Socio-Economic and Computer Sciences}
  \def\@specName{Software engineering}
  %\def\@specCode{09.03.04 Программная инженерия}
}
% BI -- Бизнес информатика
\DeclareVoidOption{BI}{
  \def\@facultyString{Faculty of Socio-Economic and Computer Sciences}
  \def\@specName{Business informatics}
  %\def\@specCode{38.03.05 Бизнес-информатика}
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
\def\@groupTitle{UNKNOWN GROUP}
% \def\@reviewerTitle{}
% \def\@reviewerName{I.I.~Ivanov}
% \def\@abstract{TODO}

\newcommand{\Group}[1]{\def\@groupTitle{#1}}
\newcommand{\Year}[1]{\def\@year{#1}}
\newcommand{\supervisor}[2]{
  \def\@supervisorTitle{#1}
  \def\@supervisorName{#2}
}

\renewcommand{\maketitle}{
{
  \thispagestyle{empty}

  \centering

  \textbf{NATIONAL RESEARCH UNIVERSITY HIGHER SCHOOL OF ECONOMICS}

  \vfill

  \textbf{\@facultyString}

  \vfill
  \vfill
  \vfill


  \vfill
  \vfill

  \textbf{\@title}

  {\bfseries PROJECT PROPOSAL}

  \vfill


  \vfill
  \vfill
  \vfill

  \hfill
  \begin{minipage}[t]{0.4\textwidth}
    \text{\@author}  \@groupTitle
  \end{minipage}

  \hfill
  \begin{minipage}[t]{0.4\textwidth}
    \textbf{Supervisor} \@supervisorTitle \@supervisorName
  \end{minipage}

  \vfill
  \vfill
  \vfill

  Perm

  \@year{}

  \newpage
}

\chapter**{TOC}

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

\newcommand{\appendixsection}[1]{\section{#1}\addcontentsline{toc}{section}{Приложение \thesection. \currentname}} % не уверен что работает
\newcommand{\reftable}[1]{см. таблицу ~\ref{#1}}
\newcommand{\reffig}[1]{Рисунок ~\ref{#1}}
