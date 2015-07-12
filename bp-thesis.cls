\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bp-thesis}[2015/07/12 Bachelor Thesis Class for Bachelorprojects at the Hasso Plattner Institute]

\LoadClass{scrbook}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax

\RequirePackage{standalone}
\RequirePackage{import}
\RequirePackage{scrhack}

% Text and page layout
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman,english]{babel}
\RequirePackage[a4paper]{geometry}
\RequirePackage{microtype}
\RequirePackage{hyphenat}

% Typesetting
\RequirePackage{setspace}
\parindent=0pt
\parskip=4pt
\RequirePackage{relsize}
\RequirePackage{xcolor}
\RequirePackage[autostyle]{csquotes}
\RequirePackage{xspace}

% Bibliography
\RequirePackage[backref,backrefstyle=three+,style=trad-abbrv,backend=biber]{biblatex}
\DeclareBibliographyDriver{software}{%
	\usebibmacro{bibindex}%
	\usebibmacro{begentry}%
	\usebibmacro{author/translator+others}%
	\setunit{\labelnamepunct}\newblock
	\usebibmacro{title}%
	\newunit
	\printlist{language}%
	\newunit\newblock
	\usebibmacro{byauthor}%
	\newunit\newblock
	\usebibmacro{bytranslator+others}%
	\newunit\newblock
	\printfield{version}%
	\newunit\newblock
	\usebibmacro{journal+issuetitle}%
	\newunit
	\usebibmacro{byeditor+others}%
	\newunit
	\printfield{note}%
	\newunit\newblock
	\iftoggle{bbx:isbn}
	{\printfield{issn}}
	{}%
	\newunit\newblock
	\usebibmacro{doi+eprint+url}%
	\newunit\newblock
	\usebibmacro{addendum+pubstate}%
	\setunit{\bibpagerefpunct}\newblock
	\usebibmacro{pageref}%
	\newunit\newblock
	\usebibmacro{related}%
	\usebibmacro{finentry}
}
\addbibresource{references.bib}

\makeatletter
\newcommand*{\currentname}{\@currentlabelname}
\newcommand{\writtenby}[1]{%
	\edef\@temp{\csname WB@@#1@out\endcsname}%
	\@ifundefined{WB@@#1@out}{%
		\expandafter\newwrite\@temp%
		\immediate\openout\@temp=\jobname.writtenby.#1%
	}{\immediate\write\@temp{\ and \relax}}%
	\immediate\write\@temp{"\currentname" \relax}%
}
\newcommand{\printwrittenby}[1]{%
	\edef\@temp{\csname WB@@#1@out\endcsname}%
	\@ifundefined{WB@@#1@out}{}{%
		\immediate\closeout\@temp%
		\@input{\jobname.writtenby.#1}%
	}%
}
\makeatother

% Lists
\RequirePackage{enumitem}
\setitemize{itemsep=0pt, topsep=1pt}
\setenumerate{itemsep=0pt, topsep=1pt}

% Math and symbols
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{textcomp}

% Graphics and figures
\RequirePackage{wrapfig}
\RequirePackage{subfig}
\RequirePackage{float}
\RequirePackage{graphicx}
\graphicspath{{images/}}

% Drawings
\RequirePackage{tikz}
\usetikzlibrary{positioning,fit,calc}
\RequirePackage{images/uml}
\RequirePackage{pgfplots}
\usepgfplotslibrary{external}
\tikzexternalize
\pgfplotsset{compat=1.12}

% Algorithms and pseudocode
\RequirePackage {algorithm}
\RequirePackage {algorithmic}

% Links, tables, listings, ...
\RequirePackage{url}
\RequirePackage{booktabs}
\RequirePackage{sourcecodepro}
\RequirePackage{listings}
\lstset{tabsize=2,basicstyle=\ttfamily}

% Custom commands
\newcommand{\ToDo}[1]{\textit{\textbf{$<$ToDo: #1$>$}}}
\newcommand{\AddFigure}[1]{\begin{center}\tikz \node[draw, minimum width=0.9\linewidth] {#1};\end{center}}

\newcommand{\SymbReg}{\textsuperscript{\textregistered}}
\newcommand{\lego}{LEGO\SymbReg\xspace}

% Special word styles
\newcommand{\name}[1]{\textit{#1}}
\newcommand{\brickify}{\name{brickify}\xspace}
\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\filename}[1]{\path|#1|}
\newcommand{\button}[1]{\textit{#1} button}

% References (should be last RequirePackages!)
\RequirePackage[hidelinks,pdfusetitle,pdfpagelabels,pdfstartview=FitH,bookmarksopen,bookmarksnumbered]{hyperref}
\RequirePackage[page,title,header]{appendix}
\RequirePackage{cleveref}
