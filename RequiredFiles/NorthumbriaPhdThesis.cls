%%%%%
%% This is file `NorthumbriaPhdThesis.cls',
%%
%% This file is a LaTeX document class file for creating 
%% PhD theses according to Northumbria University's style guide
%% which is outline at: https://bit.ly/2DSAnfB
%% 
%% Author: Graham Coulby
%% Author Url: http://grahamcoulby.uk/
%% Version: 0.4.1
%%%%% 

%%
% Define Class
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{NorthumbriaPhdThesis}
              [2019/02/05 v0.4.1 Northumbria University Thesis Document Class. Created by Graham Coulby http://grahamcoulby.uk/]

%%
% Support spacing required by the university
%%
\newif\if@onehalfspacing
\DeclareOption{onehalfspacing}{\@onehalfspacingtrue}
\DeclareOption{doublespacing}{\@onehalfspacingfalse} 
\ExecuteOptions{doublespacing}

\newif\if@uncited
\DeclareOption{uncited}{\@uncitedtrue}
\DeclareOption{citedonly}{\@uncitedfalse}
\ExecuteOptions{citedonly}

\newif\if@fontlg
\DeclareOption{fontlg}{\@fontlgtrue}
\DeclareOption{fontsml}{\@fontlgfalse}
\ExecuteOptions{fontsml}
\ProcessOptions\relax


\if@fontlg
    \LoadClass[12pt, a4paper, oneside]{book}
\else
    \LoadClass[11pt, a4paper, oneside]{book}
\fi

\RequirePackage[left=4cm, right=2cm, top=3cm, bottom=3cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{times}
\RequirePackage{atbegshi}
\RequirePackage{graphicx}
\RequirePackage{natbib}
\RequirePackage[titletoc]{appendix} 
\RequirePackage[UKenglish]{datetime}
\RequirePackage{lipsum}
\RequirePackage{emptypage}
\RequirePackage[raggedbottom]{ragged2e}
\RequirePackage[parfill]{parskip}
\RequirePackage[utf8]{inputenc}
\RequirePackage{chngcntr}
\RequirePackage{imakeidx}
\RequirePackage[hyphens]{url}
\RequirePackage[hidelinks,breaklinks]{hyperref}
\RequirePackage[acronym]{glossaries-extra}


%%
% META DATA
%%
\newcommand{\degreetype}[1]{\def\@degreetype{#1}}
\newcommand{\degreetitle}[1]{\def\@degreetitle{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\wordcount}[1]{\def\@wordcount{#1}}
\newcommand{\words}{\@wordcount}
\newcommand{\name}{\@author}

%%%%%%%%
% FRONT MATTER
%%%%%%%%

%%
% TITLE PAGE
%%
\renewcommand{\maketitle}{%
   \begin{titlepage}
      \vspace*{15mm}
      \thispagestyle{empty}
      \centering
      \fontsize{24pt}{24pt}\selectfont
      \centering{\includegraphics[width=0.5\columnwidth]{Images/NorthumbriaLogo.jpg}} \par
      \vfill
      \textbf{\MakeUppercase{\@title}}\par
      \vfill
      \MakeUppercase{\@author}\par
      \vfill
      \@degreetitle\par
      \vfill
      \the\year
      \vspace*{35mm}
   \end{titlepage}

  \begin{titlepage}
      \vspace*{15mm}
      \pagestyle{empty}
      \centering
      \fontsize{24pt}{24pt}\selectfont
      \textbf{\MakeUppercase{\@title}}\par
      \vfill
      \MakeUppercase{\@author}\par
      \vfill
      A thesis submitted in partial fulfilment of the requirements of the University of Northumbria at Newcastle for the degree of \@degreetype\\
      \vfill
      Faculty of \@faculty\\
      \vfill
      \monthname~\the\year\par
      \vspace*{15mm}
  \end{titlepage}
}

%%
% Front matter section is for prefaces, acknowledgements, abstracts etc.
%%
\newenvironment{frontmattersection}[1][Insert Title]{%
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
    \thispagestyle{plain}
    \@beginparpenalty\@lowpenalty
    \begin{center}%
    % \bfseries #1
    \addcontentsline{toc}{chapter}{#1} 
    \section*{#1
        \@mkboth{%
          \MakeUppercase#1}{\MakeUppercase#1}}%
    
    \@endparpenalty\@M
    \end{center}}{\par\vfil\null\pagestyle{fancy}}


%%
% Table of Contents and Lists of Figures/Tables
%%

\renewcommand\tableofcontents{%
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
    \pagestyle{plain}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \section*{\contentsname
        \@mkboth{%
          \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }{\pagestyle{fancy}}

\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }{\pagestyle{fancy}}

\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }{\pagestyle{fancy}}



%%%%%%%%
%  Setup
%%%%%%%%

%%
% Glossary options
%%
\setglossarystyle{long}
\setabbreviationstyle[acronym]{long-short}
\glssetcategoryattribute{acronym}{glossdesc}{firstuc}
\setlength\LTleft{0pt}
\setlength\LTright{0pt}
\setlength\glsdescwidth{1.6\hsize}
\input{RequiredFiles/Glossaries.tex} %%% This file MUST exist

%%
% Multi Bib support
%%
\if@uncited
    \RequirePackage{multibib}
    \newcites{other}{Bibliography}
    \nociteother{*}
\fi

%%
% Initialisation
%%
\makeindex
\urlstyle{same}
\raggedbottom
\if@onehalfspacing
    \RequirePackage[onehalfspacing]{setspace}
\else
    \RequirePackage[doublespacing]{setspace}
\fi
\renewcommand\bibname{References}
\renewcommand{\today}{\the\day~\monthname~\the\year}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\graphicspath{ {Images/} } %%% This folder must exist

\endinput
%%
%% End of file `NorthumbriaPhdThesis.cls'