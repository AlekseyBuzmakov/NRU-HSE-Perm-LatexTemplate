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

\RequirePackage{listings}
\RequirePackage{xcolor}

\RequirePackage[font=small,skip=4pt]{caption}
\RequirePackage{graphicx}
\RequirePackage{hyphenat} % чтобы не было переноса

%\usepackage{pscyr}    % Красивые русские шрифты
%\renewcommand{\rmdefault}{ftm} % Включаем Times New Roman

%%% Оформление абзацев %%%
\RequirePackage{indentfirst} % Красная строка

%%% Размер шрифатов у заголовков %%%
\RequirePackage{titlesec}

%%% Table of Contents %%%
\RequirePackage[toc,titletoc,title]{appendix}
\RequirePackage{tocloft}
\RequirePackage{titletoc}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

\RequirePackage{tabularx} % авто лайнбрейки при достижении лимита в таблице
\RequirePackage{pdflscape} % горизонтал для приложений



\RequirePackage[linktocpage=true,plainpages=false,pdfpagelabels=false]{hyperref}

%%%%% Listing %%%%
%New colors defined below
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{listingstyle}{
  backgroundcolor=\color{backcolour},   commentstyle=\color{codegreen},
  keywordstyle=\color{magenta},
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,         
  breaklines=true,                 
  captionpos=b,                    
  keepspaces=true,                 
  numbers=left,                    
  numbersep=5pt,                  
  showspaces=false,  
  showstringspaces=false,
  showtabs=false,                  
  tabsize=2,
      inputencoding=utf8,
    extendedchars=true,
    literate=
    {а}{{\cyra}}1
    {б}{{\cyrb}}1
    {в}{{\cyrv}}1
    {г}{{\cyrg}}1
    {д}{{\cyrd}}1
    {е}{{\cyre}}1
    {ё}{\"{\cyre}}1
    {ж}{{\cyrzh}}1
    {з}{{\cyrz}}1
    {и}{{\cyri}}1
    {й}{{\cyrishrt}}1
    {к}{{\cyrk}}1
    {л}{{\cyrl}}1
    {м}{{\cyrm}}1
    {н}{{\cyrn}}1
    {о}{{\cyro}}1
    {п}{{\cyrp}}1
    {р}{{\cyrr}}1
    {с}{{\cyrs}}1
    {т}{{\cyrt}}1
    {у}{{\cyru}}1
    {ф}{{\cyrf}}1
    {х}{{\cyrh}}1
    {ц}{{\cyrc}}1
    {ч}{{\cyrch}}1
    {ш}{{\cyrsh}}1
    {щ}{{\cyrshch}}1
    {ъ}{{\cyrhrdsn}}1
    {ы}{{\cyrery}}1
    {ь}{{\cyrsftsn}}1
    {э}{{\cyrerev}}1
    {ю}{{\cyryu}}1
    {я}{{\cyrya}}1
    {А}{{\CYRA}}1
    {Б}{{\CYRB}}1
    {В}{{\CYRV}}1
    {Г}{{\CYRG}}1
    {Д}{{\CYR96}}1
    {Е}{{\CYRE}}1
    {Ё}{{\"{\CYRE}}}1
    {Ж}{{\CYRZH}}1
    {З}{{\CYRZ}}1
    {И}{{\CYRI}}1
    {Й}{{\CYRISHRT}}1
    {К}{{\CYRK}}1
    {Л}{{\CYRL}}1
    {М}{{\CYRM}}1
    {Н}{{\CYRN}}1
    {О}{{\CYRO}}1
    {П}{{\CYRP}}1
    {Р}{{\CYRR}}1
    {С}{{\CYRS}}1
    {Т}{{\CYRT}}1
    {У}{{\CYRU}}1
    {Ф}{{\CYRF}}1
    {Х}{{\CYRH}}1
    {Ц}{{\CYRC}}1
    {Ч}{{\CYRCH}}1
    {Ш}{{\CYRSH}}1
    {Щ}{{\CYRSHCH}}1
    {Ъ}{{\CYRHRDSN}}1
    {Ы}{{\CYRERY}}1
    {Ь}{{\CYRSFTSN}}1
    {Э}{{\CYREREV}}1
    {Ю}{{\CYRYU}}1
    {Я}{{\CYRYA}}1
}


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
\captionsetup[table]{position=t, singlelinecheck=false, justification=raggedleft, labelsep=endash, name=Таблица}
\captionsetup[figure]{labelfont={bf, it}, textfont={bf, it}, position=b, singlelinecheck=false, labelsep=endash, justification=centering, name=Рисунок}

%%% Главы и разделы %%%
\titleformat{\chapter}%[display]
  {\Large\bfseries\centering}
  {\chaptertitlename\ \thechapter}{4pt}{}
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
  {\chaptername\ \thecontentslabel\enskip}% <numbered-entry-format>
  {}% <numberless-entry-format>
  {\dotfill\contentspage}% <filler-page-format>


% author @makspepe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Таблица на несколько страниц %%%%%

\RequirePackage{tabularray} % собственно лонгтейбл, но из пака tabulararray (https://ctan.math.illinois.edu/macros/latex/contrib/tabularray/tabularray.pdf)
\RequirePackage{xcolor} % чтобы можно было красить таблицы

\ExplSyntaxOn
% выравнивание подписи таблицы по правому краю
\DefTblrTemplate { caption } { normal }
{
  \hbox_set:Nn \l__tblr_caption_box
  {
    \UseTblrTemplate { caption-tag } { default }
    \UseTblrTemplate { caption-sep } { custom } {~} {--} {~} % ~ как замена space в expl syntax
    \UseTblrTemplate { caption-text } { default }
  }
  \dim_compare:nNnTF { \box_wd:N \l__tblr_caption_box } > { \hsize }
  {
    \UseTblrAlign { caption }
    \UseTblrIndent { caption }
    \hbox_set:Nn \l__tblr_caption_left_box
    {
      \UseTblrTemplate { caption-tag } { default }
      \UseTblrTemplate { caption-sep } { custom } {~} {--} {~}
    }
    \hangindent = \box_wd:N \l__tblr_caption_left_box
    \hangafter = 1
    \UseTblrHang { caption }
    \leavevmode
    \hbox_unpack:N \l__tblr_caption_box
    \par
  }
  {
    \centering
    \makebox [\hsize] [r] { \box_use:N \l__tblr_caption_box } % смени r на l, c, или j чтобы не по правому
    \par
  }
}

% выравнивание продолжения подписи таблицы по правому
\DefTblrTemplate { capcont } { normal }
{
  \hbox_set:Nn \l__tblr_caption_box
  {
    \UseTblrTemplate { caption-tag } { default }
    \UseTblrTemplate { caption-sep } { custom } {~} {--} {~}
    \UseTblrTemplate { caption-text } { default }
    \space
    \UseTblrTemplate { conthead-text } { default }
  }
  \dim_compare:nNnTF { \box_wd:N \l__tblr_caption_box } > { \hsize }
  {
    \UseTblrAlign { capcont }
    \UseTblrIndent { capcont }
    \hbox_set:Nn \l__tblr_caption_left_box
    {
      \UseTblrTemplate { caption-tag } { default }
      \UseTblrTemplate { caption-sep } { custom } {~} {--} {~}
    }
    \hangindent = \box_wd:N \l__tblr_caption_left_box
    \hangafter = 1
    \UseTblrHang { capcont }
    \leavevmode
    \hbox_unpack:N \l__tblr_caption_box
    \par
  }
  {
    \centering
    \makebox [\hsize] [r] { \box_use:N \l__tblr_caption_box } % смени r на l, c, или j чтобы не по правому
    \par
  }
}


\SetTblrTemplate{caption}{normal} % применяем изменения
\SetTblrTemplate{capcont}{normal}
\ExplSyntaxOff



% подписи на русском
\DefTblrTemplate{conthead-text}{fancy}{(Продолжение)}
    \SetTblrTemplate{conthead-text}{fancy}

\DefTblrTemplate{contfoot-text}{fancy}{Продолжение на следующей странице}
    \SetTblrTemplate{contfoot-text}{fancy}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Для ротации номеров в горизонт позиции страницы %%%%%
\RequirePackage{pdflscape}

\AddToHook{env/landscape/begin}
 {
  \clearpage
  \pagestyle{empty}
  \AddToHook{shipout/background}[sven/page]
    {
     \put(0.9\paperwidth,-0.5\paperheight)%adapt values
      {\rotatebox{90}{\thepage}}
    }
 }

\AddToHook{env/landscape/after}
{\RemoveFromHook{shipout/background}[sven/page]}

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
  \def\@specCode{09.03.04 Программная инженерия}
}
% Available options for the type
\DeclareVoidOption{KR}{
  \def\@typeString{Курсовая работа}
}
\DeclareVoidOption{VKR}{
  \def\@typeString{Выпускная квалификационная работа}
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

\def\@year{\the\year{}}
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
  \HasReviewertrue
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
  по направлению подготовки \underline{\@specCode}

  \vfill
  \vfill
  \vfill

  \ifHasReviewer
  \begin{minipage}[t]{0.4\textwidth}
    Рецензент \\
    \nohyphens{\@reviewerTitle}

    \vspace{2mm}

    \@reviewerName
  \end{minipage}
  \fi
  \hfill
  \begin{minipage}[t]{0.4\textwidth}
    Руководитель \\
    \nohyphens{\@supervisorTitle}

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
\thispagestyle{empty}
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

% какие буквы можно юзать в TOC, тк буквы Ё, З, Й, О, Ч, Ъ, Ы, Ь не должны встречаться
\def\cyrtoc#1{\ifcase #1\or А\or Б\or В\or Г\or Д\or Е\or Ж\or И\or К\or Л\or М\or Н\or П\or Р\or С\or Т\or У\or Ф\or Х\or Ц\or Ш\or Щ\or Э\or Ю\or Я\else \@ctrerr \fi}

\newcommand\originalappendix{}
\let\originalappendix\appendix
\renewcommand{\appendix}{%
  \originalappendix
  %\renewcommand{\thechapter}{\Asbuk{chapter}}
  \renewcommand{\thechapter}{\cyrtoc{\value{chapter}}}
  \renewcommand{\appendixname}{ПРИЛОЖЕНИЕ} % Можно не менять и заменить на команду с \MakeUppercase в \renewcommand у меня локально не компилит, а в overleaf все нормально
  \titleformat{\chapter}
    {\Large\bfseries\centering}
    {\MakeUppercase{\chaptertitlename}\ \thechapter}{4pt}{}

  \addtocontents{toc}{\protect\value{tocdepth}=\chaptertocdepth}
  \renewcommand\addchaptertocentry[2]{%
    \addtocentrydefault{chapter}{}{\appendixname~##1 ##2}
    %\addtocentrydefault{chapter}{}{\MakeUppercase{\appendixname~##1} ##2}
  }
}


\newcommand{\reftable}[1]{см. таблицу ~\ref{#1}}
\newcommand{\reffig}[1]{Рисунок ~\ref{#1}}
