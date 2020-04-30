\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rooke-doc}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{memoir}
}
\ProcessOptions\relax

\LoadClass{memoir}

\settrims{0pt}{0pt}
\settypeblocksize{8in}{300pt}{*}
\setlrmargins{1in}{*}{*}
\setulmargins{*}{*}{1.25}
\setmarginnotes{0.25in}{2.5in}{10ex}
\counterwithout{figure}{chapter}
\checkandfixthelayout

\pagestyle{Ruled}
\RequirePackage{rooke}
%{{{ Style Things
  \setlength{\parindent}{0em} %Get rid of indented paragraphs
 \setlength{\parskip}{1em}   %Have a space instead
%}}}

%{{{ Variables
\newtoggle{collabs}

\newcommand{\@name}{name}
\newcommand{\name}[1]{\renewcommand{\@name}{#1}}

\newcommand{\@class}{class}
\newcommand{\class}[1]{\renewcommand{\@class}{#1}}

\newcommand{\@due}{\today}
\newcommand{\due}[1]{\renewcommand{\@due}{#1}}

\newcommand{\@assignment}{assignment}
\newcommand{\assignment}[1]{\renewcommand{\@assignment}{#1}}

\newcommand{\@collab}{}
\newcommand{\collab}[1]{
\toggletrue{collabs}
\renewcommand{\@collab}{#1}
}
%}}}

%{{{ Header
\setlength{\headheight}{15.2pt}
\pagestyle{fancy}
\lhead{\@due}
\chead{\@assignment}
\rhead{\@name}
%}}}

%{{{ Printers
\newcommand{\@collabs}{
\iftoggle{collabs}{
\footnote{With \@collab}
}{}}

\newcommand{\rtitle}{
\thispagestyle{empty}
{\noindent\huge\bfseries \@assignment}\\[2\baselineskip]
{ {\bfseries \fontfamily{cmr}\selectfont \@class} \\
{\fontfamily{cmr}\selectfont     \@due}} \hfill
{\large \textsc{\@name}\@collabs}
\\[1.4\baselineskip]
}
%}}}

%{{{ Enviroments

\newcommand{\term}[1]{\textit{#1}}

\newenvironment{no}{\par{\textit{No.} }}{}
\newenvironment{solution}{\par{\textit{Solution.} }}{}%{\filbreak}
\newenvironment{claim}{\par{\textit{Claim.} }}{}
\newenvironment{lemma}{\par{\textit{Lemma.} }}{}

\newcommand{\question}[1]{\newcommand{\qname}{#1}}
\newcommand{\subquestion}[1]{\noindent{\bfseries{\qname #1:}}}


% This command allows one to format solutions... the first argument defines
% the type of solution. As of now n means numeric and e means equation
% n will format numbers and box the answer while e just boxes
\newcommand{\sol}[2][e]
    {\ifstrequal{#1}{e}{\boxed{#2}}{}
     \ifstrequal{#1}{n}{\boxed{\num[group-separator ={,}]{#2}}
     }{}}


% Run into the margin notes section 
% Currently does not play nice with margin floats
% TODO work that out :3
\newlength{\fullwidthlen}
\setlength{\fullwidthlen}{\marginparwidth}
\addtolength{\fullwidthlen}{\marginparsep}
\newenvironment{fullwidth}{%
  \begin{adjustwidth*}{}{-\fullwidthlen}%
}{%
  \end{adjustwidth*}%
}
%}}}

\endinput

% vim:foldmethod=marker:foldlevel=0
