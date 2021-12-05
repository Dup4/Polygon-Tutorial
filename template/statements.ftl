\documentclass [11pt, a4paper, oneside] {article}

\usepackage [T2A] {fontenc}
\usepackage [utf8] {inputenc}
\usepackage [english, russian] {babel}
\usepackage {amsmath}
\usepackage {amssymb}
\usepackage <#if contest.language?? && contest.language="russian">[russian]<#elseif contest.language?? && contest.language="ukrainian">[ukrainian]</#if>{olymp}
\usepackage {comment}
\usepackage {epigraph}
\usepackage {expdlist}
\usepackage {graphicx}
\usepackage {multirow}
\usepackage {siunitx}
\usepackage {ulem}
\usepackage {import}
\usepackage {ifpdf}
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

\usepackage {CJK}

\setlength{\parskip}{3pt plus1pt minus1pt}              % 段落之间的竖直距离
\renewcommand{\baselinestretch}{1.2}                    % 定义行距
\setlength{\abovedisplayskip}{2pt plus1pt minus1pt}     % 公式前的距离
\setlength{\belowdisplayskip}{6pt plus1pt minus1pt}     % 公式后面的距离
\setlength{\arraycolsep}{2pt}                           % 在一个array中列之间的空白长度, 因为原来的太宽了

\begin {document}
\begin{CJK}{UTF8}{gbsn}

\contest
{${contest.name!}}%
{${contest.location!}}%
{${contest.date!}}%

\binoppenalty=10000
\relpenalty=10000

\renewcommand{\t}{\texttt}

<#if shortProblemTitle?? && shortProblemTitle>
  \def\ShortProblemTitle{}
</#if>

<#list statements as statement>
<#if statement.path??>
\graphicspath{{${statement.path}}}
<#if statement.index??>
  \def\ProblemIndex{${statement.index}}
</#if>
\import{${statement.path}}{./${statement.file}}
<#else>
\input ${statement.file}
</#if>
</#list>

\end{CJK}
\end {document}
