\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HSEUniversityPractice}[2019-06-15 Template for dessirtations and other artefacts]
%\LoadClass[a4paper]{extreport}
\LoadClass[fontsize=13bp]{scrreprt}
\RequirePackage{ifpdf}
\RequirePackage{kvoptions}
\RequirePackage[a4paper,left=30mm,right=15mm,top=20mm,bottom=20mm,footskip=15mm]{geometry}

\RequirePackage{cmap}                 % Улучшенный поиск русских слов в полученном pdf-файле
\RequirePackage[T2A]{fontenc}         % Поддержка русских букв
\RequirePackage[utf8]{inputenc}       % Кодировка utf8
\RequirePackage{csquotes}
\RequirePackage[russian]{babel}       % Языки: русский, английский
\RequirePackage{amsmath}

\RequirePackage[font=small,skip=4pt]{caption}
\RequirePackage{graphicx}

%\RequirePackage{fontspec}
%\setmainfont{Times New Roman} % Times New Roman

%\usepackage{pscyr}             % Красивые русские шрифты
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
%   \map{
%   \step[fieldset=hyphenation,fieldvalue={english}]
%   }
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

\sloppy        % Избавляемся от переполнений
\clubpenalty=10000    % Запрещаем разрыв страницы после первой строки абзаца
\widowpenalty=10000   % Запрещаем разрыв страницы после последней строки абзаца

\linespread{1.5} % Полуторный интервал
\setlength{\parindent}{12.5mm} % Отступ красной строки

% Подпись к таблице и рисункам
\captionsetup[table]{position=t, singlelinecheck=false, justification=raggedright,labelsep=endash, name=Таблица}
\captionsetup[figure]{labelfont={bf,it}, textfont={bf,it}, position=b, singlelinecheck=false, justification=centering, labelsep=endash, name=Рисунок}

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
  {\bfseries\centering}
  {\thesubsubsection.}{3pt}{}
\titlespacing*{\subsubsection}{0pt}{8pt}{4pt}

%% Маркированые списки
\renewcommand\labelitemi{--}
\renewcommand\labelitemii{--}
\renewcommand\labelitemiii{--}
\renewcommand\labelitemiv{--}

\RequirePackage{enumitem}   % Для отступов
\setlist{leftmargin=15mm}


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
  \def\@facultyString{Факультет социально-экономических и компьютерных наук}
  \def\@specName{Программная инженерия}
  \def\@specCode{09.03.04 Программная инженерия}
}
% BI -- Бизнес информатика
\DeclareVoidOption{BI}{
  \def\@facultyString{Факультет социально-экономических и компьютерных наук}
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
\def\@reviewerTitle{}
\def\@reviewerName{I.I.~Ivanov}
\def\@abstract{TODO}
\def\@group{Unknown-00-0}
\def\@companyReviewerTitle{}
\def\@companyReviewerName{I.I.~Ivanov}
\def\@supervisorTitle{}
\def\@supervisorName{I.I.~Ivanov}

\newcommand{\Year}[1]{\def\@year{#1}}
\newcommand{\Group}[1]{\def\@group{#1}}
\newcommand{\supervisor}[2]{
  \def\@supervisorTitle{#1}
  \def\@supervisorName{#2}
}
\newcommand{\company}[2]{
  \def\@companyReviewerTitle{#1}
  \def\@companyReviewerName{#2}
}
\newcommand{\Abstract}[1]{
  \def\@abstract{#1}
}

\renewcommand{\maketitle}{
{
  \thispagestyle{empty}

  \centering{
    Пермский филиал федерального государственного автономного образовательного \\
    учреждения высшего образования <<Национальный исследовательский университет \\
    <<Высшая школа экономики>>
  }

  \@facultyString

  Образовательная программа бакалавриата <<\@specName>>

  \vfill

  \centering{
    \textbf{\MakeUppercase{Отчет}} \\
    \textbf{по производственной практике}
  }

  \vfill

  \hfill\begin{minipage}[c]{0.5\textwidth}
    Выполнил студент группы~ \underline{\makebox[0.37\textwidth][l]{\@group}}\\
    %$\underset{\text{name}}{\underline{some text\hspace{4cm}}}$ \\
    \underline{\makebox[\textwidth][l]{\@author}}\\
    \hrule
  \end{minipage}

  %\vfill

  \raggedright
  \begin{minipage}{0.5\textwidth}
    Проверели:\\
    Руководитель практики\\
    от Предприятия:\\
    \@companyReviewerTitle

    \@supervisorName

    % \underline{\makebox[\textwidth][l]{\@companyReviewerTitle}}\\
    %\underline{\makebox[\textwidth][l]{\@companyReviewerName}}\\
    \underline{\makebox[0.25\textwidth][l]{}} \hspace{0.25\textwidth} \underline{\makebox[0.5\textwidth][r]{\hfill}}\\
    \hfill\underline{\makebox[0.4\textwidth][r]{}} %TODO
  \end{minipage}

  \vfill

  \raggedright
  \begin{minipage}{0.5\textwidth}
    Руководитель практики\\
    от НИУ ВШЭ -- Пермь:\\
    \@supervisorTitle

    \@supervisorName

    %\underline{\makebox[\textwidth][l]{\@supervisorTitle}}\\
    %\underline{\makebox[\textwidth][l]{\@supervisorName}}\\
    \underline{\makebox[0.25\textwidth][l]{}} \hspace{0.25\textwidth} \underline{\makebox[0.5\textwidth][r]{\hfill}}\\
    \hfill\underline{\makebox[0.4\textwidth][r]{}} %TODO
  \end{minipage}\hfill

  \vfill

  \centering{\textbf{Пермь, \@year{}}}

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
\newcommand{\reftable}[1]{см.~таблицу~\ref{#1}}
\newcommand{\reffig}[1]{Рисунок~\ref{#1}}
