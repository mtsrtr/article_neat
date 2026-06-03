\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{article_neat}[2025/04/08 Custom Article Class for pdflatex]

% Load base class
\LoadClass[12pt]{article}

% Required packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[tt=false]{libertine} % Linux Libertine -> nicer serif font without typewriter
\RequirePackage{inconsolata} % JetBrains Mono-like monospace
\RequirePackage{lettrine}
\RequirePackage{xstring}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{footmisc}
\RequirePackage{hyperref}
\RequirePackage{lettrine}
\RequirePackage{amsmath}
\RequirePackage{listings}
\RequirePackage{tcolorbox} % For enhanced code boxes

% Colors
\definecolor{darknavy}{RGB}{0,51,102}
%\definecolor{myorange}{RGB}{255,102,0}
\definecolor{myorange}{RGB}{193, 117, 51}
\definecolor{mygrey}{RGB}{128,128,128}

% Listings package configuration
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
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
    tabsize=2
}

\lstset{style=mystyle}

% Define code environment with optional language support using tcolorbox
% Define code environment with optional language support
\lstdefinestyle{codebase}{
    backgroundcolor=\color{backcolour},
    basicstyle=\ttfamily\footnotesize\color{black},
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    stringstyle=\color{codepurple},
    numbers=left,
    numberstyle=\tiny\color{codegray},
    numbersep=5pt,
    breaklines=true,
    frame=single,
    framesep=2pt,
    rulecolor=\color{backcolour},
    xleftmargin=0.5cm
}

% Define language-specific styles
\lstdefinestyle{PythonStyle}{
    style=codebase,
    language=Python,
    keywordstyle=\color{blue},
    commentstyle=\color{codegreen},
    stringstyle=\color{red}
}

\lstdefinestyle{RStyle}{
    style=codebase,
    language=R,
    keywordstyle=\color{blue},
    commentstyle=\color{codegreen},
    stringstyle=\color{red}
}

% Define the main code environment - simple version
\lstnewenvironment{codeenv}[1][ ]{
    \lstset{style=codebase, language=#1}
}{
}

% Define convenience environments for specific languages
\lstnewenvironment{PythonCode}{\lstset{style=PythonStyle}}{}
\lstnewenvironment{RCode}{\lstset{style=RStyle}}{}
\lstnewenvironment{GenericCode}{\lstset{style=codebase, language=}}{}

% Title section formatting
\makeatletter
\def\@maketitle{%
    \newpage
    \null
    \vskip 0.5em%
    {\raggedright
        {\Large\itshape\color{darknavy}\@title\par}%
        \vskip 0.2em%
        {\Large\itshape\color{myorange}\@subtitle\par}%
        \vskip 0.2em%
        {\large\itshape\color{mygrey}\@author\par}%
        \vskip 0.1em%
        {\large\itshape\color{mygrey}\@institution\par}%
        \vskip 0.1em%
        {\large\itshape\textit{\@date}\par}%
    \par}
    \vskip 4em
}
\renewcommand{\maketitle}{%
    \@maketitle
    \thispagestyle{empty}
    \firstpartrue
}

% Drop cap and first sentence formatting
\newcommand{\firstparagraph}[1]{%
    \iffirstpar
        \lettrine[nindent=0em]{\color{darknavy}#1}{}
        \firstparfalse
    \else
        #1
    \fi
}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\institution}[1]{\def\@institution{#1}}

% Part headings
\titleformat{\part}[display]
    {\normalfont\Huge\itshape\color{darknavy}}
    {\partname\ \thepart}
    {20pt}
    {\huge\itshape\color{darknavy}}
\titlespacing*{\part}{0pt}{4em}{2em}

% Section headings
\titleformat{\section}
    {\normalfont\Large\itshape}
    {}
    {0pt}
    {}
\titleformat{\subsection}
    {\normalfont\large\itshape}
    {}
    {0pt}
    {}
\titleformat{\subsubsection}
    {\normalfont\normalsize\itshape}
    {}
    {0pt}
    {}
\titleformat{\paragraph}
    {\normalfont\normalsize\itshape}
    {}
    {0pt}
    {}
\titlespacing*{\section}{0pt}{1.5em}{0.3em}
\titlespacing*{\subsection}{0pt}{1em}{0.3em}
\titlespacing*{\subsubsection}{0pt}{0.8em}{0.2em}
\titlespacing*{\paragraph}{0pt}{0.5em}{0.1em}

% Paragraph settings
\setlength{\parindent}{1em}
\setlength{\parskip}{0.3em}
\newif\iffirstpar
\firstpartrue

% Header
\pagestyle{fancy}
\fancyhf{}
%\fancyhead[R]{\small\textsc{\color{darknavy}\@title \space} \ifnum\thepage>1 \hspace{0.5em}\color{black}\itshape\thepage\fi}
\fancyhead[R]{\small\textsc{\color{darknavy}\@title \space | \color{myorange}\@subtitle}\ifnum\thepage>1 \hspace{0.5em}\color{black}\itshape\thepage\fi}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Footnotes
\renewcommand{\thefootnote}{\arabic{footnote}}
\renewcommand{\footnotelayout}{\color{black}\small}
\setlength{\footnotesep}{12pt}
\renewcommand{\footnoterule}{\kern 3pt \hrule width 0.4\columnwidth \kern 2.6pt}

% Lists
\setlist[itemize]{leftmargin=*,label=$\bullet$}
\setlist[enumerate]{leftmargin=*,label=\arabic*.}
%\setlist[itemize,1]{leftmargin=*,label=$\bullet$}
%\setlist[itemize,2]{leftmargin=*,label=\alph*.}
\setlist[enumerate,2]{leftmargin=*,label=\alph*.}

% Hyperlinks
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue,
    citecolor=blue,
    filecolor=blue,
    pdfborder={0 0 0},
    linkcolor=black
}

% Page layout
\geometry{
    a4paper,
    inner=1.5in,
    outer=1in,
    top=1in,
    bottom=1in,
    twoside
}

% PDF metadata
\AtBeginDocument{
    \hypersetup{
        pdftitle={\@title},
        pdfauthor={\@author},
        pdfsubject={\@subtitle},
        pdfcreator={LaTeX with article_neat.cls},
        pdfproducer={pdflatex}
    }
}

% Custom Table of Contents
\renewcommand{\contentsname}{\itshape Contents}
\renewcommand{\tableofcontents}{%
    \section*{\contentsname}
    \@starttoc{toc}%
}

\makeatletter

\renewcommand{\l@section}[2]{%
    \ifnum \c@tocdepth > \z@
        \addpenalty\@secpenalty
        \addvspace{1.0em \@plus\p@}%
        \setlength\@tempdima{1.5em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            {\itshape\large #1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \endgroup
    \fi
}

\renewcommand{\l@subsection}[2]{%
    \ifnum \c@tocdepth > \@ne
        \addpenalty\@secpenalty
        \addvspace{0.5em \@plus\p@}%
        \setlength\@tempdima{3em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            {\itshape #1}\nobreak\leaders\hbox to 1em{\hss\normalsize\textperiodcentered\hss}\hfill\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \endgroup
    \fi
}

\renewcommand{\l@part}[2]{%
    \ifnum \c@tocdepth > -2\relax
        \addpenalty\@secpenalty
        \addvspace{2.25em \@plus\p@}\begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            {\itshape\Large #1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \endgroup
    \fi
}

\renewcommand{\l@subsubsection}[2]{%
    \ifnum \c@tocdepth > \tw@
        \addpenalty\@secpenalty
        \addvspace{0.3em \@plus\p@}%
        \setlength\@tempdima{5em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            {\itshape #1}\nobreak\leaders\hbox to 1em{\hss\normalsize\textperiodcentered\hss}\hfill\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \endgroup
    \fi
}
\makeatother
