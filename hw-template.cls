%% CISXXX.cls version 0.2
%% cisXXX  - Latex2e document class for typesetting homework solutions in
%%           CIS-XXX at UPenn, Summer 2016.
%% Copyright (C) 2016, Sanjeev Khanna and Jake Hart.
%%
%% LICENSE:
%%
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3 of this license or (at
%% your option) any later version.
%%
%% The latest version of this license is in:
%% http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%%
%% CHANGELOG
%%
%% Fixed undefined reference to \theHWPartners if no partners exist.

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{hw-template}[2016/07/05 CIS XXX Standard LaTeX document class]
\LoadClass[letterpaper, oneside, 11pt]{article}[2005/09/16]

%% Margins of Text Pages
\RequirePackage[head=1in, bottom=1in, left=1in, right=1in]{geometry}

%% Authors and Partners
% \HWauthor{Name}{e-mail}: your name and school e-mail.
% \HWno:                   which homework is it?
% \HWcourse:               the course you are submitting to (cis-XXX).

\RequirePackage{ifthen}
\makeatletter

\newcommand{\HWauthor}[2]{
  \ifthenelse{\isundefined{\theHWauthors}}{
    \def\theHWauthors{#1\\#2}
  }
  {
    \g@addto@macro\theHWauthors{\and #1\\#2}
  }
  \ifthenelse{\isundefined{\theHWauthorsatheader}}{
    \def\theHWauthorsatheader{#1}
  }
  {
    \g@addto@macro\theHWauthorsatheader{, #1}
  }
}

\newcommand{\HWno}[1]{
  \ifthenelse{\isundefined{\theHWno}}{
    \def\theHWno{#1}
  }
  {
    \let\theHWno{#1}
  }
}

\newcommand{\HWcourse}[1]{
  \ifthenelse{\isundefined{\theHWcourse}}{
    \def\theHWcourse{#1}
  }
  {
    \let\theHWcourse{#1}
  }
}

\newcommand{\HWextension}{
  \def\theHWextension{Yes}
}

\makeatother

% \HWpartner{Name}: Declare somebody you worked with on the homework.
%                   For multiple partners, just use the \partner command
%                   multiple times. Relative ordering is preserved.

\makeatletter

\newcommand{\HWpartner}[1]{
  \ifthenelse{\isundefined{\theHWpartners}}{
    \def\theHWpartners{#1}
  }
  {
    \g@addto@macro\theHWpartners{, #1}
  }
}

\makeatother

%% Problem Numbering and Sectioning
\RequirePackage{titlesec}
\newcounter{theHWproblem}
\setcounter{theHWproblem}{1}
\newcounter{theHWsubproblem}[theHWproblem]

\newcommand{\HWproblem}{
  \subsection*{Question \arabic{theHWproblem}}  % change for problem title
  \addtocounter{theHWproblem}{1}
  \setcounter{theHWsubproblem}{1}
}

\titleformat{\subsubsection}[runin]{\bfseries}{}{}{}[]
\newcommand{\HWsubproblem}{
  \subsubsection*{\roman{theHWsubproblem}}  % change for different numbering
  \addtocounter{theHWsubproblem}{1}
}

%% Headers and Footers of Text Pages
\RequirePackage{fancyhdr}
\pagestyle{plain}
\fancyhead[R]{\theHWauthorsatheader}
\fancyhead[C]{\theHWcourse}
\fancyhead[L]{Homework \theHWno}  % change for different titles
\fancyfoot[R]{}
\fancyfoot[C]{\thepage}
\fancyfoot[L]{}

%% Title
\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{%
  \author{\theHWauthors}
  \title{\theHWcourse{} -- Homework \theHWno}  % change for different titles
  \oldmaketitle
  \begin{center}
    \ifthenelse{\isundefined{\theHWextension}}{}{%
      {\Large Using Extension.}
    }
    \ifthenelse{\isundefined{\theHWpartners}}{}{%
      {Partners: \theHWpartners}
    }
  \end{center}
}
