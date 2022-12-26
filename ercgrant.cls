\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ercgrant}[2021/12/15 My custom ERCgrant class]

\let\@firstchapter\@empty

\newif\ifisBtwo

\DeclareOption{B2}{%
\isBtwotrue
\def\@firstchapter{1}%
}

\newcommand{\proposaltype}{Starting Grant}
\DeclareOption{STG}{\renewcommand{\proposaltype}{Starting Grant}}
\DeclareOption{COG}{\renewcommand{\proposaltype}{Consolidator Grant}}
\DeclareOption{ADG}{\renewcommand{\proposaltype}{Advanced Grant}}
\newcommand{\callyear}{2023}

\ProcessOptions

\LoadClass{scrreprt}
\KOMAoptions{fontsize=11pt}

%\ifx\@firstchapter\@empty \addtocounter{chapter}{1}\else\addtocounter{chapter}{\@firstchapter}\fi

\addtocounter{chapter}{1}

%%% PACKAGES %%%
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[english]{babel}
\RequirePackage[right]{eurosym}
\RequirePackage{soul}
\RequirePackage{tabularx}
\RequirePackage{marginnote}
\setlength{\footskip}{1.45\baselineskip}
\RequirePackage[left=2cm,top=1.5cm,bottom=1.5cm,right=2cm,includefoot,includehead]{geometry}
% \RequirePackage[utf8]{inputenc}
% \RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\setmainfont{Arial}

\RequirePackage{graphicx} 		% Add graphics capabilities
\RequirePackage{xspace}
\RequirePackage{blindtext}
\RequirePackage{amsmath}  		% Better maths support
% \RequirePackage{pslatex} %Times font
\RequirePackage[textsize=tiny, color=green]{todonotes}
\setlength{\marginparwidth}{1.5cm}
\RequirePackage{mdframed}

% for the open and filled star symbols
\RequirePackage{bbding}
\newcommand{\fstar}{\raisebox{-0.12em}{\begin{scriptsize}\FiveStar\end{scriptsize}}}
\newcommand{\ostar}{\raisebox{-0.12em}{\begin{scriptsize}\FiveStarOpen\end{scriptsize}}}

% ========= HYPERREF & Colors ===========
\definecolor{lightgray} {gray}{0.7}
\definecolor{darkgray}  {gray}{0.43}
\definecolor{darkblue}  {rgb} {0,0,.65}
\definecolor{citegreen} {rgb} {0.28,0.41,0.19}
\definecolor{darkgreen} {rgb} {0.37,0.72,0.17}
\definecolor{lightgreen}{rgb} {0.56,0.88,0.28}

% primary colors
\definecolor{goe_blue}{HTML}{003665}
\definecolor{obji}{HTML}{003665}
\definecolor{light_blue}{HTML}{BDCEE3}
\definecolor{neon_blue}{HTML}{04D9FF}
% secondary colors
\definecolor{sec_dark_blue}{HTML}{006597}
\definecolor{sec_mid_blue}{HTML}{0093c7}
\definecolor{objii}{HTML}{0093c7}
\definecolor{sec_sky_blue}{HTML}{84bfea}
\definecolor{objiv}{HTML}{84bfea}
\definecolor{sec_chamois}{HTML}{e9e1d7}
\definecolor{lila}{RGB}{178,91,247}

\definecolor{gold}{HTML}{fec615}
\definecolor{deeppink}{HTML}{ff1493}

\definecolor{cs_orange}{HTML}{E58143}
\definecolor{objiii}{HTML}{E58143}
\definecolor{grey_2}{HTML}{575556}
\definecolor{grey_1}{HTML}{3C3B39}
\definecolor{grey_3}{HTML}{878787}
\definecolor{grey_4}{HTML}{DADADA}

\RequirePackage[%
  pdfstartview=FitH,%
  breaklinks=true,%
  bookmarks=true,%
  colorlinks=true,%
  linkcolor= darkblue,
  anchorcolor=black,%
  citecolor=goe_blue,
  filecolor=black,%
  menucolor=black,%
  urlcolor=darkblue%
  ]{hyperref}


\AtBeginDocument{%
  \hypersetup{%
    pdfauthor={\@author},%
    pdftitle={ERC proposal - \@title}%
  }
}

\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}

\RequirePackage[parfill]{parskip}

% ========== BIBLIOGRAPHY STUFF ============

% \RequirePackage{natbib}
\RequirePackage[style=authoryear]{biblatex}
\RequirePackage{csquotes}
% \bibpunct{(}{)}{;}{a}{,}{,}
\input{abbrev.tex}
% \setlength{\bibsep}{0.0cm}

% \newrobustcmd*{\parentexttrack}[1]{%
%   \begingroup
%   \blx@blxinit
%   \blx@setsfcodes
%   \blx@bibopenparen#1\blx@bibcloseparen
%   \endgroup}

% \AtEveryCite{%
%   \let\parentext=\parentexttrack%
%   \let\bibopenparen=\bibopenbracket%
%   \let\bibcloseparen=\bibclosebracket}

% ========== SECTION FORMATTING ============
% the sections have a,b,c numbering
\renewcommand\thesection{\alph{section}}
%###
\RedeclareSectionCommand[font=\bfseries\Large]{section}
\renewcommand*{\sectionformat}{Section \thesection:\enskip}
%###
% subsections are not numbered
\setcounter{secnumdepth}{1}

%###
% have the chapter on the same page
\RedeclareSectionCommand[style=section]{chapter}
% calling the chapters B1, B2, \ldots
\renewcommand{\thechapter}{B\arabic{chapter}}
\RedeclareSectionCommand[font=\bfseries\Large]{chapter}
\renewcommand*{\chapterformat}{Part \thechapter:\enskip}
%###
% 
% save space between section headings, and after figures
% 
%###
\setlength{\belowcaptionskip}{0.0cm}

\RedeclareSectionCommands[indent=0pt, beforeskip=0.2em, afterskip=0.3em]{chapter,section}
\RedeclareSectionCommands[indent=0pt, beforeskip=.2em, afterskip=0.2em]{subsection,subsubsection,paragraph}


%###

% === FIGURE AND CAPTION STUFF ====
\RequirePackage[font=small]{caption}
\RequirePackage{chngcntr}
% don't show the chapter part in the caption
%\counterwithout{figure}{chapter}
%\counterwithout{table}{chapter}

% for ``side-figures''
\RequirePackage{wrapfig}


% ==== COLORED BOXES ========
\RequirePackage{tcolorbox}
% add 'sharp corners' as option to have sharp corners
\newtcolorbox{cbox}[2][]{colback=#2!7!white,colframe=#2!75!black,fonttitle=\bfseries,title=#1,coltitle=white}
\newtcolorbox{redbox}[1]{colback=red!7!white,colframe=red!75!black,fonttitle=\bfseries,title=#1}
\newtcolorbox{greenbox}[1]{colback=Green!7!white,colframe=Green!75!black,fonttitle=\bfseries,title=#1}
\newtcolorbox{bluebox}[1]{colback=Blue!7!white,colframe=Blue!75!black,fonttitle=\bfseries,title=#1}

% ==== TABLE STUFF ===========
\RequirePackage{makecell}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{colortbl}
\definecolor{kugray5}{RGB}{224,224,224}
\newcommand{\specialcell}[2][c]{%
  \begin{tabular}[#1]{@{}c@{}}#2\end{tabular}}

% to hide a table column
\RequirePackage{array}
\newcolumntype{H}{>{\setbox0=\hbox\bgroup}c<{\egroup}@{}}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{B}[1]{>{\columncolor{lightgreen}\bf\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% align digits in tables
\RequirePackage{dcolumn}
\newcolumntype{d}[1]{D{.}{.}{#1}}

% change font size of captions
\RequirePackage[font=small]{caption}

%========== Math stuff ====================
\renewcommand{\vec}[1]{\boldsymbol{#1}}
\newcommand{\z}{\vec{z}}

% ======== To fix list things ============ 
\RequirePackage{enumitem}
\RequirePackage{tikz}

\newcommand\bboxed[2]{%
  \tikz[baseline=(X.base)] 
    \node (X) [draw=none, inner sep=0, fill=#2, text=white] {\strut \footnotesize~#1\;};%
}
\newcommand{\obji}{\bboxed{\hyperref[sub:obji]{\color{white}O-1}}{obji}}
\newcommand{\objii}{\bboxed{\hyperref[sub:objii]{\color{white}O-2}}{objii}}
\newcommand{\objiii}{\bboxed{\hyperref[sub:objiii]{\color{white}O-3}}{objiii}}
\newcommand{\objiv}{\bboxed{\hyperref[sub:objiv]{O-4}}{objiv}}
% \newcommand{\objii}{\bboxed{Obj.~2}{objii}}
% \newcommand{\objiii}{\bboxed{Obj.~3}{objiii}}
% \newcommand{\objiv}{\bboxed{\color{black}Obj.~4}{objiv}}

\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
            \node[shape=circle,fill=grey_4,draw=black,inner sep=1pt] (char) {\footnotesize #1};}}

\newcommand*\circledpri[1]{\tikz[baseline=(char.base)]{%
            \node[shape=circle,fill=goe_blue,draw=goe_blue,inner sep=1pt] (char) {\color{white}#1};}}
\newcommand*\circledsec[1]{\tikz[baseline=(char.base)]{%
            \node[shape=circle,fill=sec_mid_blue,draw=sec_mid_blue,inner sep=1pt] (char) {\color{white}#1};}}

\setitemize{noitemsep,topsep=0ex,parsep=0.25ex,partopsep=0pt,leftmargin=*}
\setenumerate{topsep=0pt,parsep=0pt,partopsep=0pt,leftmargin=*}
\RequirePackage{amssymb}
% \renewcommand{\labelitemi}{\tiny$\blacksquare$}
\RequirePackage{nopageno}
\RequirePackage{enumitem}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt} % Remove line at top
 \newcommand{\topicsentence}[1]{{\color{sec_mid_blue}#1}}
\lhead{\emph{\@author}}
\chead{Part \thechapter}
\rhead{\theacro}
\cfoot{\thepage}

\newenvironment{itemize*}%
  {\begin{itemize}%
    \setlength{\itemsep}{0pt}%
    \setlength{\parskip}{0pt}}%
  {\end{itemize}}

% ============== SOME MACROS ===============

\newcommand{\cont}{\textcolor{red}{\textbf{continue}}\xspace}
\renewcommand{\comment}[1]{\textcolor{red}{\textbf{#1}}\xspace}
\newcommand{\x}{\textcolor{red}{XXX}\xspace}
\let\@acro\empty
\newcommand{\acro}[1]{\def\@acro{#1}}
\newcommand{\theacro}{\textsc{\@acro}\xspace}
\newcommand{\proposal@duration}{60 Months}
\let\@institution\empty
\newcommand{\institution}[1]{\def\@institution{#1}}

% ========= DEFINE TITLE, AUTHOR, DATE =========
\title{\@acro}

% ========= Format title page =========


\ifisBtwo
\renewcommand{\maketitle}{%
\begin{center}
\LARGE{\textbf{ERC \proposaltype~\callyear\\
Research proposal [Part B2] }
}
\end{center}
\vspace{1cm}
}
\else
\renewcommand{\maketitle}{%
\begin{center}
\makeatletter
\LARGE{\textbf{ERC \proposaltype~\callyear\\
Research proposal [Part B1] }
}
\vfill
%
\LARGE{\textsc{\@title}}
%
\vfill
%
\LARGE{\textsc{---~\@acro~---}}
%
\vfill
\makeatother
\end{center}
%
\vfill
%
\begin{itemize}
\makeatletter
\item Principal investigator (PI): \@author
\item Host institution: \@institution
\item Proposal full title: \@title
\item Proposal short name: \theacro
\item Proposal duration: \proposal@duration
\makeatother
\end{itemize}
\vfill
}
\fi

\renewenvironment{abstract}{%
\begin{mdframed}
}{%
\end{mdframed}
\vfill
\newpage
}
