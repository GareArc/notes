\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ainote}[2023/01/02 Note Class for AI courses]
\LoadClass{article}

% -----------------------格式-----------------------------------
\RequirePackage{geometry}
\RequirePackage{lipsum} % 该宏包是通过 \lipsum 命令生成一段本文，正式使用时不需要引用该宏包
\RequirePackage{setspace}
\RequirePackage{titlesec}

\titleclass{\subsubsubsection}{straight}[\subsection]

\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\renewcommand\theparagraph{\thesubsubsubsection.\arabic{paragraph}} % optional; useful if paragraphs are to be numbered

\titleformat{\subsubsubsection}
  {\normalfont\normalsize\bfseries}{\thesubsubsubsection}{1em}{}
\titlespacing*{\subsubsubsection}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@paragraph{6}
\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
\def\l@paragraph{\@dottedtocline{5}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{6}{14em}{6em}}
\makeatother

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

\geometry{a4paper,centering,scale=0.75}
\newcommand{\spskip}[1][0.5]{\\[#1\baselineskip]}
% -----------------------END-----------------------------------

% -----------------------语言设定-----------------------------------
\RequirePackage[UTF8,scheme=plain]{ctex}
% -------------------------END-------------------------------------

% -----------------------图标图像-----------------------------------
\RequirePackage[dvipsnames,svgnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[strict]{changepage} % 提供一个 adjustwidth 环境
\RequirePackage[ % hyperlink color
    colorlinks=true,
    linkcolor=black,
    urlcolor=Thistle
]{hyperref}
\RequirePackage{ccicons}
\RequirePackage[ % License 
    type={CC}, 
    modifier={by-nc-sa}, 
    version={4.0},
]{doclicense}

%%%%%%%%%%%%%%%%%%%%%%%%% 颜色 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{greenshade}{rgb}{0.90,0.99,0.91} % 绿色文本框，竖线颜色设为 Green
\definecolor{redshade}{rgb}{1.00,0.90,0.90}% 红色文本框，竖线颜色设为 LightCoral
\definecolor{brownshade}{rgb}{0.99,0.97,0.93} % 莫兰迪棕色，竖线颜色设为 BurlyWood

\definecolor{green}{rgb}{0, 1, 0}
\definecolor{red}{rgb}{1, 0, 0}
\definecolor{blue}{rgb}{0, 0, 1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%% formal框 %%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{framed} % 实现方框效果

% 注意行末需要把空格注释掉，不然画出来的方框会有空白竖线
\newenvironment{formal}[2]{%
\def\FrameCommand{%
\hspace{1pt}%
{\color{#1}\vrule width 2pt}%
{\color{#2}\vrule width 4pt}%
\colorbox{#2}%
}%
\MakeFramed{\advance\hsize-\width\FrameRestore}%
\noindent\hspace{-4.55pt}% disable indenting first paragraph
\begin{adjustwidth}{}{7pt}%
\vspace{2pt}\vspace{2pt}%
}
{%
\vspace{2pt}\end{adjustwidth}\endMakeFramed%
}

\newenvironment{info}
    {\begin{formal}{Green}{greenshade}}    
    {\end{formal}}

\newenvironment{note}
    {\begin{formal}{LightCoral}{redshade}}
    {\end{formal}}

\newenvironment{supp}
    {\begin{formal}{BurlyWood}{brownshade}}
    {\end{formal}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% highlights %%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\hlred}[1]{\colorbox{pink}{#1}}
\newcommand{\hlyellow}[1]{\colorbox{yellow}{#1}}
\newcommand{\hlgreen}[1]{\colorbox{green}{#1}}
%%%%%%%%%%%%%%%%%%%%%%% todo notes %%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xargs}
\RequirePackage[
    colorinlistoftodos,
    prependcaption,
    textsize=footnotesize
]{todonotes}

\newcommandx{\tdunsure}[2][1=]{\todo[linecolor=Thistle,backgroundcolor=Thistle!25,bordercolor=Thistle,#1]{#2}}

\newcommandx{\tdnote}[2][1=]
{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}

\newcommandx{\tdchange}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}

\newcommandx{\tdinfo}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%% 字体颜色 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\green}[1]{\textcolor{Green}{#1}}
\newcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\brown}[1]{\textcolor{BurlyWood}{#1}}
\newcommand{\blue}[1]{\textcolor{blue}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% 插入图片 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure
\newcommand{\img}[2]{%
    \begin{figure}[H]
    	\center\includegraphics[width=0.6\textwidth]{imgs/#1}
    	\caption{#2}
    	\label{fig:#1}
    \end{figure}
}%
% Figure
\newcommand{\imgc}[3]{%
    \begin{figure}[H]
    	\center\includegraphics[width=#3\textwidth]{imgs/#1}
    	\caption{#2}
    	\label{fig:#1}
    \end{figure}
}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------END-------------------------------------

% -----------------------数学语言-----------------------------------
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage{newtxtext}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage[parfill]{parskip}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{float}

\newcommand{\mc}[1]{\mathcal{#1}}
\newcommand{\imp}{\bigstar}

% Math Bold Font, Vector Notations
\newcommand{\ba}{\mathbf{a}}
\newcommand{\bb}{\mathbf{b}}
\newcommand{\bc}{\mathbf{c}}
\newcommand{\bd}{\mathbf{d}}
\newcommand{\be}{\mathbf{e}}
\renewcommand{\bf}{\mathbf{f}}
\newcommand{\bg}{\mathbf{g}}
\newcommand{\bh}{\mathbf{h}}
\newcommand{\bi}{\mathbf{i}}
\newcommand{\bj}{\mathbf{j}}
\newcommand{\bk}{\mathbf{k}}
\newcommand{\bl}{\mathbf{l}}
\newcommand{\bm}{\mathbf{m}}
\newcommand{\bn}{\mathbf{n}}
\newcommand{\bo}{\mathbf{o}}
\newcommand{\bp}{\mathbf{p}}
\newcommand{\bq}{\mathbf{q}}
\newcommand{\br}{\mathbf{r}}
\newcommand{\bs}{\mathbf{s}}
\newcommand{\bt}{\mathbf{t}}
\newcommand{\bu}{\mathbf{u}}
\newcommand{\bv}{\mathbf{v}}
\newcommand{\bw}{\mathbf{w}}
\newcommand{\bx}{\mathbf{x}}
\newcommand{\by}{\mathbf{y}}
\newcommand{\bz}{\mathbf{z}}
%=====
\newcommand{\bA}{\mathbf{A}}
\newcommand{\bB}{\mathbf{B}}
\newcommand{\bC}{\mathbf{C}}
\newcommand{\bD}{\mathbf{D}}
\newcommand{\bE}{\mathbf{E}}
\newcommand{\bF}{\mathbf{F}}
\newcommand{\bG}{\mathbf{G}}
\newcommand{\bH}{\mathbf{H}}
\newcommand{\bI}{\mathbf{I}}
\newcommand{\bJ}{\mathbf{J}}
\newcommand{\bK}{\mathbf{K}}
\newcommand{\bL}{\mathbf{L}}
\newcommand{\bM}{\mathbf{M}}
\newcommand{\bN}{\mathbf{N}}
\newcommand{\bO}{\mathbf{O}}
\newcommand{\bP}{\mathbf{P}}
\newcommand{\bQ}{\mathbf{Q}}
\newcommand{\bR}{\mathbf{R}}
\newcommand{\bS}{\mathbf{S}}
\newcommand{\bT}{\mathbf{T}}
\newcommand{\bU}{\mathbf{U}}
\newcommand{\bV}{\mathbf{V}}
\newcommand{\bW}{\mathbf{W}}
\newcommand{\bX}{\mathbf{X}}
\newcommand{\bY}{\mathbf{Y}}
\newcommand{\bZ}{\mathbf{Z}}
\newcommand{\bzero}{\mathbf{0}}
\newcommand{\bone}{\mathbf{1}}
\DeclareMathOperator*{\argmax}{argmax}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\maxbl}{max}
\DeclareMathOperator*{\minbl}{min}

% Proofs, Structures
\newcommand{\proof}{\tit{\underline{Proof:}}} % This equivalent to the \begin{proof}\end{proof} block
\newcommand{\proofforward}{\tit{\underline{Proof($\implies$):}}}
\newcommand{\proofback}{\tit{\underline{Proof($\impliedby$):}}}
\newcommand{\proofsuperset}{\tit{\underline{Proof($\supseteq$):}}}
\newcommand{\proofsubset}{\tit{\underline{Proof($\subseteq$):}}}
\newcommand{\contradiction}{$\longrightarrow\!\longleftarrow$}
\newcommand{\qed}{\hfill $\blacksquare$}

% Number Spaces, Vector Space
\newcommand{\R}{\mathbb{R}}
\newcommand{\real}{\mathbb{R}}
\newcommand{\complex}{\mathbb{C}}
\newcommand{\field}{\mathbb{F}}

% customized commands
\newcommand{\settag}[1]{\renewcommand{\theenumi}{#1}}
\newcommand{\tbf}[1]{\textbf{#1}}
\newcommand{\tit}[1]{\textit{#1}}
\newcommand{\overbar}[1]{\mkern 1.5mu\overline{\mkern-1.5mu#1\mkern-1.5mu}\mkern 1.5mu}
\newcommand{\double}[1]{\mathbb{#1}} % Set to behave like that on word
\newcommand{\trans}[3]{$#1:#2\rightarrow{}#3$}
\newcommand{\map}[3]{\text{$\left[#1\right]_{#2}^{#3}$}}
\newcommand{\dime}[1]{\mathrm{dim}(#1)}
\newcommand{\mat}[2]{M_{#1 \times #2}(\R)}
\newcommand{\aug}{\fboxsep=-\fboxrule\!\!\!\fbox{\strut}\!\!\!}
\newcommand{\basecase}{\textsc{\underline{Basis Case:}} }
\newcommand{\inductive}{\textsc{\underline{Inductive Step:}} }
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\independent}{\perp \!\!\! \perp}

% -------------------------END-------------------------------------