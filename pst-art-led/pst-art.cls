%===============================================================================
% region header
%-------------------------------------------------------------------------------
% File Name     : pst-icon.cls
% File Created  : 2026-04-10 18:44 UTC +02:00
% Description   : LaTeX class for articles by Amit M. Manthanwar
%-------------------------------------------------------------------------------
% Author        : Amit Manohar Manthanwar
% Address       : Pune, Maharashtra, India
% Email         : manthanwar@hotmail.com
% Website       : https://manthanwar.github.io
%-------------------------------------------------------------------------------
% Copyright     : ©2022-2026 Amit Manohar Manthanwar
% License       : Restricted
% License       : LaTeX Project Public License
%-------------------------------------------------------------------------------
% This program can be redistributed and/or modified under the terms
% of the LaTeX Project Public License Distributed from CTAN archives
% in directory macros/latex/base/lppl.txt.
%---------------+---------+-----------------------------------------------------
% Revision Log  | Author  | Description
%---------------+---------+-----------------------------------------------------
% 30-Apr-2022   | AMM     | Initial Version
%---------------+---------+-----------------------------------------------------
% 10-Apr-2026   | AMM     | Initial Version
%---------------+---------+-----------------------------------------------------
% endregion header
%===============================================================================

%===============================================================================
% region provide class + declare Options
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pst-icon}[2022/10/29 Article Class (c) Amit M. Manthanwar]
%-------------------------------------------------------------------------------
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%-------------------------------------------------------------------------------
\newif\ifPageLandscape
\PageLandscapefalse % Default state

% 1. Set default behavior
\newcommand{\@paperFormat}{4} % Default to 4 (e.g., standard a4paper)
\newcommand{\paperFormatCmd}{a4paper loaded}

% 2. Declare options

\DeclareOption{a0paper}{\renewcommand{\@paperFormat}{0}}
\DeclareOption{a1paper}{\renewcommand{\@paperFormat}{1}}
\DeclareOption{a2paper}{\renewcommand{\@paperFormat}{2}}
\DeclareOption{a3paper}{\renewcommand{\@paperFormat}{3}}
% \DeclareOption{a4paper}{\renewcommand{\@paperFormat}{4}}

\DeclareOption{landscape}{\PageLandscapetrue\typeout{Option `landscape' called}}

% 3. Process options
\ProcessOptions\relax
\LoadClass[a4paper]{article}
%-------------------------------------------------------------------------------
% endregion provide class + declare Options
%===============================================================================

%===============================================================================
% region page setup - landscape and portrait
%-------------------------------------------------------------------------------
% Use the boolean based on the option
\ifPageLandscape
\newcommand{\ifPageLandscapeCmd}{Option landscape was enabled!}
%-------------------------------------------------------------------------------
% region page setup template
%-------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%|<--- \paperwidth \paperheight  --->|%
%|<->| \hoffset                      |%
%|   | \voffset                      |%
%|___|____________________________ __|%
%|   |<->| 1in + \oddsidemargin   |  |%
%|   |<->| 1in + \evensidemargin  |  |%
%|   |   |------------------------|  |%
%|   |   | 1in + \topmargin       |  |%
%|   |   |------------------------|  |%
%|   |   | HEADER \headheight     |  |%
%|   |   |------------------------|  |%
%|   |   | \headsep               |  |%
%|   |   |========================|  |%
%|   |   | TEXT  \topskip         |  |%
%|   |   |       \textheight      |  |%
%|   |   |<---   \textwidth   --->|  |%
%|   |   |                        |  |%
%|<-1->| | \marginparwidth        |  |%
%|   | |2| \marginparsep          |  |%
%|   |   |                        |  |%
%|   |   |========================|  |%
%|   |   | \footskip              |  |%
%|   |   |------------------------|  |%
%|   |   | FOOTER \footheight     |  |%
%|   |   |------------------------|  |%
%|___|____________________________|__|%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Letter Paper = 8.5 x 11'' = 612 x 792 pt
%% A4 Paper     = 8.27 x 11.69'' = 597 x 845 pt = 210 x 297 mm
%% 72pt = 1in = 25.4mm
%-------------------------------------------------------------------------------
% Paper 	    Width x Height (mm)	   Width x Height (in)   Width x Height (in)
% Letter (US)   215.9 x 279.4           8.5 x 11
% Legal (US)    215.9 x 355.6           8.5 x 14
% Ledger (US)   279.4 x 431.8           11 X 17
% A0	          841 x 1189	       33.11 x 46.81          33-1/8 x 46-13/16
% A1	          594 x 841	           23.39 x 33.11          23-3/8 x 33-1/8
% A2	          420 x 594	           16.54 x 23.39          16-1/2 x 23-3/8
% A3	          297 x 420	           11.69 x 16.54          11-3/4 x 16-1/2
% A4	          210 x 297	            8.27 x 11.69           8-1/4 x 11-3/4
% A5	          148 x 210	            5.83 x 8.27            5-7/8 x 8-1/4
% A6	          105 x 148	            4.13 x 5.83            4-1/8 x 5-7/8
% A7	           74 x 105	            2.91 x 4.13          2-15/16 x 4-1/8
% A8	           52 x 74	            2.05 x 2.91           2-1/16 x 2-15/16
% A9	           37 x 52	            1.46 x 2.05
% A10	           26 x 37	            1.02 x 1.46
% A11	           18 x 26	            0.71 x 1.02
% A12	           13 x 18	            0.51 x 0.71
% A13	            9 x 13	            0.35 x 0.51
% 2A0	         1189 x 1682	       46.81 x 66.22
% 4A0	         1682 x 2378	       66.22 x 93.62
% A0+	          914 x 1292	       35.98 x 50.87
% A1+	          609 x 914	           23.98 x 35.98
% A3+	          329 x 483	           12.95 x 19.02
%-------------------------------------------------------------------------------
% endregion page setup template
%-------------------------------------------------------------------------------
% region option landscape enabled
%-------------------------------------------------------------------------------
% 4. Act on option
\ifcase\@paperFormat % case 0
    \typeout{a0paper loaded}\renewcommand{\paperFormatCmd}{a0paper loaded}
    % \RequirePackage{showkeys}
    % A0  = 841 x 1189  = 33.11 x 46.81  =  33-1/8 x 46-13/16
    \textwidth      = 1149mm    %% 432pt = 6in = 152.4mm
    \textheight     = 801mm     %% 10in
    \paperwidth     = 1189mm    %% 597pt     %% = 8.5in
    \paperheight    = 841mm     %% 845pt     %% = 11in
\or % case 1  % A1  =  594 x 841  =  23.39 x 33.11  =  23-3/8 x 33-1/8
    \typeout{a1paper loaded}\renewcommand{\paperFormatCmd}{a1paper loaded}
    \textwidth      = 801mm     %% 432pt = 6in = 152.4mm
    \textheight     = 549mm     %% 10in
    \paperwidth     = 841mm     %% 597pt     %% = 8.5in
    \paperheight    = 599mm     %% 845pt     %% = 11in
\or % case 2  % A2  =  420 x 594  =  16.54 x 23.39  =  16-1/2 x 23-3/8
    \typeout{a2paper loaded}\renewcommand{\paperFormatCmd}{a2paper loaded}
    \textwidth      = 554mm     %% 432pt = 6in = 152.4mm
    \textheight     = 380mm     %% 10in
    \paperwidth     = 594mm     %% 597pt     %% = 8.5in
    \paperheight    = 420mm     %% 845pt     %% = 11in
\or % case 3  % A3  =  297 x 420  =  11.69 x 16.54  =  11-3/4 x 16-1/2
    \typeout{a3paper loaded}\renewcommand{\paperFormatCmd}{a3paper loaded}
    \textwidth      = 380mm     %% 432pt = 6in = 152.4mm
    \textheight     = 257mm     %% 10in
    \paperwidth     = 420mm     %% 597pt     %% = 8.5in
    \paperheight    = 297mm     %% 845pt     %% = 11in
\or % case 4  % A4  =  210 x 297  =   8.27 x 11.69  =   8-1/4 x 11-3/4
    \typeout{a4paper loaded}
    \textwidth      = 257mm     %% 432pt = 6in = 152.4mm
    \textheight     = 175mm     %% 10in
    \paperwidth     = 297mm     %% 597pt     %% = 8.5in
    \paperheight    = 210mm     %% 845pt     %% = 11in
\fi
%-------------------------------------------------------------------------------
\oddsidemargin  = 0mm       %% Real leftmargin = 1.0 in
\evensidemargin = 0mm       %% Real leftmargin = 1.0 in
\topmargin      = 0mm       %% Real topmargin = (140 - 68) / 144 = 0.5in
\hoffset        = -5.4mm    %% offset for printer's left margin
\voffset        = -25.4mm   %% offset for printer's top margin
\headheight     = 15mm      %% Height of the header
\headsep        = 5mm       %% Separation between header and main text
\footskip       = 5mm       %% Separation between footer and main text
% \textwidth      = 257mm     %% 432pt = 6in = 152.4mm
% \textheight     = 175mm     %% 10in
% \paperwidth     = 297mm     %% 597pt     %% = 8.5in
% \paperheight    = 210mm     %% 845pt     %% = 11in
\pdfpagewidth  = \paperwidth  %% Width of the PDF page to create
\pdfpageheight = \paperheight %% Height of the PDF page to create
% endregion option landscape enabled
%-------------------------------------------------------------------------------
\else
\newcommand{\ifPageLandscapeCmd}{Option landscape was not used.}
%-------------------------------------------------------------------------------
% region option portrait enabled
%-------------------------------------------------------------------------------
% 4. Act on option
\ifcase\@paperFormat % case 0
    \typeout{a0paper loaded}\renewcommand{\paperFormatCmd}{a0paper loaded}
    % \RequirePackage{showkeys}
    % A0  = 841 x 1189  = 33.11 x 46.81  =  33-1/8 x 46-13/16
    \textheight     = 1149mm    %% 432pt = 6in = 152.4mm
    \textwidth      = 801mm     %% 10in
    \paperheight    = 1189mm    %% 597pt     %% = 8.5in
    \paperwidth     = 841mm     %% 845pt     %% = 11in
\or % case 1  % A1  =  594 x 841  =  23.39 x 33.11  =  23-3/8 x 33-1/8
    \typeout{a1paper loaded}\renewcommand{\paperFormatCmd}{a1paper loaded}
    \textheight     = 801mm     %% 432pt = 6in = 152.4mm
    \textwidth      = 549mm     %% 10in
    \paperheight    = 841mm     %% 597pt     %% = 8.5in
    \paperwidth     = 599mm     %% 845pt     %% = 11in
\or % case 2  % A2  =  420 x 594  =  16.54 x 23.39  =  16-1/2 x 23-3/8
    \typeout{a2paper loaded}\renewcommand{\paperFormatCmd}{a2paper loaded}
    \textheight     = 554mm     %% 432pt = 6in = 152.4mm
    \textwidth      = 380mm     %% 10in
    \paperheight    = 594mm     %% 597pt     %% = 8.5in
    \paperwidth     = 420mm     %% 845pt     %% = 11in
\or % case 3  % A3  =  297 x 420  =  11.69 x 16.54  =  11-3/4 x 16-1/2
    \typeout{a3paper loaded}\renewcommand{\paperFormatCmd}{a3paper loaded}
    \textheight     = 380mm     %% 432pt = 6in = 152.4mm
    \textwidth      = 257mm     %% 10in
    \paperheight    = 420mm     %% 597pt     %% = 8.5in
    \paperwidth     = 297mm     %% 845pt     %% = 11in
\or % case 4  % A4  =  210 x 297  =   8.27 x 11.69  =   8-1/4 x 11-3/4
    \typeout{a4paper loaded}
    \textheight     = 257mm     %% 432pt = 6in = 152.4mm
    \textwidth      = 175mm     %% 10in
    \paperheight    = 297mm     %% 597pt     %% = 8.5in
    \paperwidth     = 210mm     %% 845pt     %% = 11in
\fi
%-------------------------------------------------------------------------------
\oddsidemargin  = 0mm       %% Real leftmargin = 1.0 in
\evensidemargin = 0mm       %% Real leftmargin = 1.0 in
\topmargin      = 0mm       %% Real topmargin = (140 - 68) / 144 = 0.5in
\hoffset        = -5.4mm    %% offset for printer's left margin
\voffset        = -25.4mm   %% offset for printer's top margin
\headheight     = 15mm      %% Height of the header
\headsep        = 5mm       %% Separation between header and main text
\footskip       = 7mm       %% Separation between footer and main text
% \textwidth      = 170mm     %% 432pt = 6in = 152.4mm
% \textheight     = 262mm     %% 10in
% \paperwidth     = 210mm     %% 597pt     %% = 8.5in
% \paperheight    = 297mm     %% 845pt     %% = 11in
\pdfpagewidth  = \paperwidth  %% Width of the PDF page to create
\pdfpageheight = \paperheight %% Height of the PDF page to create
% endregion option portrait enabled
%-------------------------------------------------------------------------------
\fi
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
% endregion page setup - landscape and portrait
%===============================================================================

%===============================================================================
% region require packages
%-------------------------------------------------------------------------------
\RequirePackage[nomessages]{fp}
%\RequirePackage{xintexpr}
%\RequirePackage{fix-cm}
\RequirePackage{siunitx}
%\RequirePackage[ddmmyyyy]{datetime}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}                           % Header & Footer
%\RequirePackage{lastpage}
\RequirePackage[table,dvipsnames,svgnames]{xcolor}
\RequirePackage{colortbl}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{amsmath,amssymb}% amsfonts
\RequirePackage{mathrsfs,mathtools}
%\RequirePackage{chemfig}
\RequirePackage{pstricks}
\RequirePackage{pst-all} %adds: pst-plot,pst-node,pst-tree,pst-grad,pst-coil,pst-text,pst-3d,pst-eps,pst-fill,pstricks-add,multido

\RequirePackage{pst-blur}
%\RequirePackage{pstricks-add}
%\RequirePackage{pst-all,pst-grad,pst-blur,pst-light3d,pst-3d,pst-math}
\RequirePackage{pst-slpe}
\RequirePackage{pst-hsb}
%\RequirePackage{tikz}
%\RequirePackage{pgfgantt}

\RequirePackage{longtable}
%\RequirePackage{cooltooltips}
%\RequirePackage[compact]{titlesec}
%\RequirePackage{titlesec}
%\RequirePackage{pstricks-add}
%\RequirePackage{pst-arrow}
%\RequirePackage{pst-bezier}
%\RequirePackage[OT4]{fontenc}
%\RequirePackage[T1]{fontenc}
%\RequirePackage{polski}
%\RequirePackage{bbding}
%\RequirePackage{epsfig}                             % for figure
%\RequirePackage{array}
%\RequirePackage{array,multirow}
%\RequirePackage{booktabs}
%\RequirePackage{hhline}
%\RequirePackage{pgfgantt}
%\RequirePackage[ddmmyyyy]{datetime}
%\renewcommand{\dateseparator}{--}
%-------------------------------------------------------------------------------
%\RequirePackage{eurosym}
%\RequirePackage{fontspec}
%\RequirePackage[T1]{fontenc}
%\RequirePackage{cmbright}
%\RequirePackage{wedn}
%\RequirePackage{helvet}
%\RequirePackage{avant}
%\RequirePackage{frcursive}
%\RequirePackage{calligra}
%\RequirePackage{bickham}
%\RequirePackage{dutchcal}
%\RequirePackage{miama}
%\RequirePackage{wela}
%\RequirePackage{cmbright}
%\RequirePackage[varqu,varl]{inconsolata} % sans serif typewriter
%-------------------------------------------------------------------------------
%\RequirePackage{epsfig}                             % for figure
%\RequirePackage{array}
%\RequirePackage{array,multirow}
%\RequirePackage{booktabs}
%\RequirePackage{cmbright}
%\RequirePackage{wedn}
%\RequirePackage{pstricks-add}
%\RequirePackage{pst-arrow}
%\RequirePackage{pst-bezier}%\renewcommand{\dateseparator}{--}
%-------------------------------------------------------------------------------
\RequirePackage[pagebackref,colorlinks=false]{hyperref}
\hypersetup{
colorlinks=true,
linkcolor=black,
citecolor=black,
filecolor=black,
urlcolor=teal!80!blue,
pdfborder={0 0 0}
}
\RequirePackage{bookmark}
%-------------------------------------------------------------------------------
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
\ifcase #1 %
(Not cited). % case: not cited
\or
(Cited on page~#2) % case: cited on exactly one page
\else
(Cited on pages~#2)  % case: cited on multiple pages
\fi}
%-------------------------------------------------------------------------------
% endregion require packages
%===============================================================================

%===============================================================================
% region define month names
%-------------------------------------------------------------------------------
\def\monthName{\ifcase\month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi}%
%-------------------------------------------------------------------------------
\def\monthNameShort{\ifcase\month\or Jan\or Feb\or Mar\or Apr\or May\or Jun\or Jul\or Aug\or Sep\or Oct\or Nov\or Dec\fi}%
%-------------------------------------------------------------------------------
% endregion define month names
%===============================================================================

%===============================================================================
% region newcommand
%-------------------------------------------------------------------------------
\newcommand{\copyRight}[1]{\def\copyRightCmd{#1}}
\copyRight{Manthanwar}
%-------------------------------------------------------------------------------
\newcommand{\keywords}[1]{\par\vspace{\baselineskip}\noindent\small{\textbf{Keywords:} #1}\pdfKeywords{\expandafter #1}}%
%-------------------------------------------------------------------------------
% endregion newcommand
%===============================================================================

%===============================================================================
% region pdf setup
%-------------------------------------------------------------------------------
\newcommand{\pdfAuthor}[1]{\hypersetup{pdfauthor={#1}}}
\newcommand{\pdfTitle}[1]{\hypersetup{pdftitle={#1}}}
\newcommand{\subject}[1]{\hypersetup{pdfsubject={#1}}}
\newcommand{\pdfKeywords}[1]{\hypersetup{pdfkeywords={#1}}}
%-------------------------------------------------------------------------------
\hypersetup{pdfproducer={Amit M. Manthanwar using LaTeX},
pdfcreator={Amit M. Manthanwar using pdflatex}}
%-------------------------------------------------------------------------------
% endregion pdf setup
%===============================================================================

%===============================================================================
% region \tableofcontents
%-------------------------------------------------------------------------------
\makeatletter
\renewcommand{\contentsname}{\textbf{Contents}}
% \setcounter{tocdepth}{3} % Includes subsubsections
% \setcounter{tocdepth}{1} % Only includes main sections
\setcounter{tocdepth}{2} % Includes subsections
\let\old@starttoc\@starttoc
\renewcommand{\@starttoc}[1]{%
  \begingroup
    \setlength{\parskip}{0pt}%
    % \setlength{\baselineskip}{0.8\baselineskip}
    \setlength{\baselineskip}{\baselineskip}%
    \old@starttoc{#1}%
  \endgroup
}
\makeatother
%-------------------------------------------------------------------------------
% endregion \tableofcontents
%===============================================================================



%===============================================================================
% region maketitle
%-------------------------------------------------------------------------------
\makeatletter
\renewcommand*{\maketitle}{%
\begin{center}%
\LARGE{\bfseries{\textsc{\@title}}}\\[8mm]
% \huge{\textsc{\@title}}\\[8mm]
\normalsize{\@author}\\[2mm]
\scriptsize{\number\day\ \monthName\ \number\year}%
\pdfAuthor{\@author}%
\pdfTitle{\@title}%
\thispagestyle{title}
\end{center}}%
\makeatother
%-------------------------------------------------------------------------------
% For Book Use:
% \begin{titlepage}%
% \end{titlepage}%
%-------------------------------------------------------------------------------
% endregion maketitle
%===============================================================================

%===============================================================================
% region define coloirs
%-------------------------------------------------------------------------------
% \definecolor{teal}{rgb}{0.0, 0.5, 0.5}
\definecolor{blueICLight}{rgb}{0.402, 0.603, 0.787}
\definecolor{blueICDark}{rgb}{0, 0.273, 0.498}
%-------------------------------------------------------------------------------
% endregion define colours
%===============================================================================

%===============================================================================
% region set lengths
%-------------------------------------------------------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{5mm}
%\setlength{\parindent}{12pt}
%\renewcommand{\baselinestretch}{1}
%\setlength{\baselineskip}{30pt}
%\setlength{\abovecaptionskip}{0pt}
%\titlespacing{\section}{0pt}{4mm}{0mm}
%\titlespacing{\subsection}{0pt}{4mm}{0mm}
%\titlespacing{\subsubsection}{0mm}{4mm}{0mm}
%\setlength{\textfloatsep}{2mm}
%\setlength{\floatsep}{2mm}
%\setlength{\intextsep}{2mm}
%\renewcommand{\arraystretch}{2}
%\setlength{\extrarowheight}{10mm} % Works only in the tabular
%\newcommand{\rowLineAfter}{6mm}
%\newcommand{\rowsepbefore}{1mm}
%\newcommand{\rowsepafter}{8mm}
%\setlength{\extrarowheight}{\rowsepbefore}
%

% space above and below a figure when using the [h]
% \setlength{\intextsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10mm}

% figure (at the top or bottom of a page) and the surrounding text
\setlength{\textfloatsep}{20pt plus 2pt minus 4pt}

% vertical distance between two consecutive figures on the same page
\setlength{\floatsep}{10pt plus 2pt minus 4pt}

% adjust the vertical spacing above a figure or table caption
\setlength{\abovecaptionskip}{10pt}

% adjust the vertical space below a figure or table caption
\setlength{\belowcaptionskip}{10pt}
%-------------------------------------------------------------------------------
% \raggedbottom
%-------------------------------------------------------------------------------
% endregion set lengths
%===============================================================================

%===============================================================================
% region page style fancy
%-------------------------------------------------------------------------------
\fancypagestyle{plain}{\fancyhf{}
\renewcommand{\headrulewidth}{0pt}\renewcommand{\footrulewidth}{0pt}}
%-------------------------------------------------------------------------------
\fancypagestyle{title}{\fancyhf{}
\renewcommand{\headrulewidth}{0pt}\renewcommand{\footrulewidth}{0pt}
}
%-------------------------------------------------------------------------------
% \makeatletter
% \renewcommand{\sectionmark}[1]{%
%   \markboth{\ifnum \c@secnumdepth>\z@
%       \thesection\hskip 1em\relax
%     \fi #1}{}}
% \makeatother
%-------------------------------------------------------------------------------
% \makeatletter
% \renewcommand{\sectionmark}[1]{%
%   \markboth{#1}{}}
% \makeatother
%-------------------------------------------------------------------------------
\makeatletter
\newcommand{\fancyHeadL}{\leftmark}%
\newcommand{\fancyHeadC}{}%
\newcommand{\fancyHeadR}{\rightmark}%
\newcommand{\fancyFootL}{\textcopyright \the\year\ \copyRightCmd}%
\newcommand{\fancyFootC}{\@title}%
\newcommand{\fancyFootR}{\thepage}%
\makeatother
%-------------------------------------------------------------------------------
\fancypagestyle{fancy}{\fancyhf{}
\renewcommand{\headrulewidth}{0pt}\renewcommand{\footrulewidth}{0pt}
\rhead{\scriptsize{\emph{\leftmark}}}
\lfoot{\scriptsize{\fancyFootL}}
\cfoot{\scriptsize{\fancyFootC}}
\rfoot{\scriptsize{\fancyFootR}}
}
%-------------------------------------------------------------------------------
\fancypagestyle{footer}{\fancyhf{}
\renewcommand{\headrulewidth}{0pt}\renewcommand{\footrulewidth}{0pt}
\lfoot{\scriptsize{\fancyFootL}}
\cfoot{\scriptsize{\fancyFootC}}
\rfoot{\scriptsize{\fancyFootR}}
}
%-------------------------------------------------------------------------------
\pagestyle{fancy}
%-------------------------------------------------------------------------------
% endregion page style fancy
%===============================================================================

%===============================================================================
% region section spacing
% \if{0}
% \@startsection{<type>}{<level>}{<indent>}{<beforeskip>}{<afterskip>}{<style>}
\makeatletter
\renewcommand{\section}[1]{\@startsection{section}{1}{0pt}
{\parskip}{0.5\parskip}{\Large\bfseries}{\vspace*{-0.5\parskip}#1}}
%
% \renewcommand\thesection{\fontPhv{\arabic{section}}}
%
\renewcommand{\subsection}[1]{\@startsection{subsection}{2}{0pt}
{0.5\parskip}{0.4\parskip}{\large\bfseries}{\vspace*{-0.5\parskip}#1}}
%
\renewcommand{\subsubsection}[1]{\@startsection{subsubsection}{3}{0pt}
{0pt}{0.2\parskip}{\normalsize\bfseries}{\vspace*{-0.5\parskip}#1}}
%
\renewcommand{\paragraph}[1]{\@startsection{paragraph}{4}{0pt}
{0pt}{0.1\parskip}{\normalfont}{#1}}
%
\renewcommand{\subparagraph}[1]{\@startsection{subparagraph}{4}{0pt}
{0pt}{0.1\parskip}{\normalfont}{#1}}
%
% \setlength{\parskip}{10mm}%
%
%
\let\oldsection\section % Save the original \section command
% Define your custom starred section command
\newcommand{\mycustomstarredsection}[1]{%
\vspace*{1.4\parskip}%
\Large{{#1}}%
% \Large{#1}
% \fontNunitoL
\par%
\vspace*{0.1\parskip}\normalsize
}
% Redefine \section to check for a star and call the appropriate command
\renewcommand{\section}{\@ifstar{\mycustomstarredsection}{\oldsection}}

%
\makeatother
% \fi
% endregion section spacing
%===============================================================================

%===============================================================================
% region At Begin Document
%-------------------------------------------------------------------------------
\AtBeginDocument{
    \maketitle
    \pagestyle{fancy}
}
%-------------------------------------------------------------------------------
% endregion At Begin Document
%===============================================================================
