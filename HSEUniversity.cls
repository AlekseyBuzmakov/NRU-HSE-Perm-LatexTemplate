\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HSEUniversity}[2019-06-15 Template for dessirtations and other artefacts]
%\LoadClass[a4paper]{extreport}
\LoadClass[fontsize=14bp]{scrreprt}
\RequirePackage{ifpdf}
\RequirePackage{kvoptions}
\RequirePackage[a4paper,left=3cm,right=15mm,top=20mm,bottom=20mm]{geometry}

\RequirePackage{cmap}						% Улучшенный поиск русских слов в полученном pdf-файле
\RequirePackage[T2A]{fontenc}				% Поддержка русских букв
\RequirePackage[utf8]{inputenc}				% Кодировка utf8
\RequirePackage{csquotes}
\RequirePackage[english,russian]{babel}	% Языки: русский, английский

%\usepackage{pscyr}						% Красивые русские шрифты
%\renewcommand{\rmdefault}{ftm} % Включаем Times New Roman

%%% Оформление абзацев %%%
\RequirePackage{indentfirst} % Красная строка

%%% Размер шрифатов у заголовков %%%
\RequirePackage{titlesec}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

\SetupKeyvalOptions{
	family=HSE,
	prefix=HSE@
}

\def\@facultyString{UNKNOWN FACULTY}
\def\@typeString{UNKNOWN WORK TYPE}
\def\@specName{UNKOWN SPECIALIZATION}
\def\@specCode{00.00.00.UNKOWN SPECIALIZATION}

% Available options for the specialiazation
% PI -- Software Engeneers
\DeclareVoidOption{PI}{
	\def\@facultyString{Факультет экономики, менеджмента и бизнес-информатики}
	\def\@specName{Программная инженерия}
	\def\@specCode{09.03.04 Программная инженерия}
}
% BI -- Бизнес информатика
\DeclareVoidOption{BI}{
	\def\@facultyString{Факультет экономики, менеджмента и бизнес-информатики}
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

\def\@year{1900}
\def\@supervisorTitle{}
\def\@supervisorName{I.I.~Ivanov}

\newcommand{\Year}[1]{\def\@year{#1}}
\newcommand{\supervisor}[2]{
	\def\@supervisorTitle{#1}
	\def\@suprevisorName{#2}
}

\renewcommand{\maketitle}{
  \thispagestyle{empty}
	\centering

	{
		Пермский филиал федерального государственного автономного \\
		образовательного учреждения высшего образования \\ 
		<<Национальный исследовательский университет \\ 
		<<Высшая школа экономики>>
	}

	\vfill

	\textit{\@facultyString}

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
  по направлению подготовки \textit{\underline{\@specCode}}

	\vfill
	\vfill
	\vfill

	\hfill\begin{minipage}{0.3\textwidth}
		Руководитель: \\
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
