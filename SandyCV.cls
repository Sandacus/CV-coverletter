%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sandy Cover Letter Template
%
% Based on the file `awesome-cv.cls'.
% Awesome CV Class File
% This class can be downloaded from:
% https://github.com/posquit0/Awesome-CV
%
% Author:
% Claud D. Park <posquit0.bj@gmail.com>
% http://www.posquit0.com
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{SandyCV}[2017/11/25 CV class]
\NeedsTeXFormat{LaTeX2e}
%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%----------------------------------------------------------------------------------------
%	 FONTS
%----------------------------------------------------------------------------------------
\RequirePackage{ClearSans}
\RequirePackage{palatino} % \fontfamily{pplj}\selectfont - command for selecting old style number
	\newcommand{\oldnums}[1]{{\fontfamily{pplj}\selectfont #1}}
\RequirePackage{FiraSans} % a sans serif font family "roboto"
\RequirePackage{inconsolata}

% Can set fonts but need to use LuaLaTex or XeLaTex to compile
%\RequirePackage{fontspec}
%\defaultfontfeatures{Mapping=tex-text}
%\setromanfont[Mapping=tex-text]{Palatino} % Main document font
%\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Gill Sans} % Font for your name at the top
%\setmonofont[Scale=MatchLowercase]{Andale Mono}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------
% Needed to define geometry for CV and Cover Letter documents
\RequirePackage{geometry}
% Allows redefining geometry in a document
\RequirePackage{afterpage}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Allows headers and footer customisation
\RequirePackage{fancyhdr}
% Epigraph quotes package for personal statement
\RequirePackage{epigraph}
		\setlength{\epigraphwidth}{1.2\linewidth}
		\setlength{\epigraphrule}{0pt}
		\setlength{\afterepigraphskip}{-6pt}
		\renewcommand{\epigraphflush}{center}
% Allows page# of page##
\RequirePackage{lastpage}
\RequirePackage{pstricks}
\RequirePackage{array}
% Allows line breaks in table cells
\RequirePackage{makecell}
\RequirePackage{fontawesome}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
% Needed for alternative environment headings
\RequirePackage{framed}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage{enumitem}
	\setlist[itemize]{leftmargin=*}
\RequirePackage[hidelinks]{hyperref}
	\hypersetup{
    				pdftitle={},
    				pdfauthor={},
    				pdfsubject={},
    				pdfkeywords={},
    				colorlinks=false,  % no lik border color
    				allbordercolors=white  % white border color for all
				}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------
\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{silver}{rgb}{0.7, 0.7, 0.7}
\definecolor{bronze}{rgb}{0.8, 0.5, 0.2}
\definecolor{sidecolor}{HTML}{EEEEEE}%{F6F6F6}%{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

\definecolor{pblue}{HTML}{0395DE}
\definecolor{maroon}{HTML}{701112} % Dark red colour for headings
\definecolor{darkblue}{HTML}{0000A0} % Dark blue colour for headings "Earth Blue"
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{linkedin}{HTML}{0085AE}
\definecolor{test}{HTML}{0077be}
\definecolor{yt}{HTML}{c71610}
\definecolor{title}{HTML}{7BD5FF}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------
% \renewcommand{\bfseries}{\color{black}} % Make \textbf produce coloured text instead
%\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation
% define new date format
% use: \mydate
\def\mydate{\leavevmode\hbox{\twodigits\day--\twodigits\month--\the\year}}
\def\twodigits#1{\ifnum#1<10 0\fi\the#1}
% classical \today definition
\def\today{\number\day \space\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year}

% --------------------------------------------------------------------------------------
% 	HYPHENATION
%-------------------------------------------------------------------------------------
% no hyphenation
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

%----------------------------------------------------------------------------------------
%	 TOPBAR DEFINITIONS
%----------------------------------------------------------------------------------------
\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newcommand{\profilesection}[2]{\vspace{6pt}{\color{black!80} \bfseries\scshape\LARGE #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvrole}[1]{\renewcommand{\cvrole}{#1}} 
\newcommand{\cvprofession}[1]{\renewcommand{\cvprofession}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\cvskype}[1]{\renewcommand{\cvskype}{#1}}
\newcommand{\cvdriving}[1]{\renewcommand{\cvdriving}{#1}}

% Command for defining Education section
\newcommand{\postgraduni}[1]{\renewcommand{\postgraduni}{#1}}
\newcommand{\postgradsubject}[1]{\renewcommand{\postgradsubject}{#1}}
\newcommand{\postgraddegree}[1]{\renewcommand{\postgraddegree}{#1}}
\newcommand{\postgraddate}[1]{\renewcommand{\postgraddate}{#1}}
\newcommand{\undergraduni}[1]{\renewcommand{\undergraduni}{#1}}
\newcommand{\undergradsubject}[1]{\renewcommand{\undergradsubject}{#1}}
\newcommand{\undergraddegree}[1]{\renewcommand{\undergraddegree}{#1}}
\newcommand{\undergraddate}[1]{\renewcommand{\undergraddate}{#1}}
\newcommand{\school}[1]{\renewcommand{\school}{#1}}
\newcommand{\schoolsubject}[1]{\renewcommand{\schoolsubject}{#1}}
\newcommand{\schooldegree}[1]{\renewcommand{\schooldegree}{#1}}
\newcommand{\schooldate}[1]{\renewcommand{\schooldate}{#1}}

%%=======================================
%% EDUCATION
%%==========================================
%% {\includegraphics[width=1.2cm]{images/nottingham}, {\includegraphics[width=0.7cm]{images/cambridge}}, {\includegraphics[width=0.6cm]{images/madras}}
\newcommand\education[1]{ 
	\renewcommand{\education}{
		\setstretch{1.1}
		\begin{tabular}{>{\centering}p{3cm} @{\hskip 0.3cm} p{5.5cm} @{\hskip 0.3cm} | @{\hskip 0.3cm}l @{\hskip 0.3cm}l}			
            	{\large\oldnums{\postgraddate}}   	& {\bfseries\postgraddegree} & \multirow{ 2}*{\large\itshape\postgraduni} & \\
              	 & {\scshape\postgradsubject} & & \\
        		\end{tabular}
		
		\begin{tabular}{>{\centering}p{3cm} @{\hskip 0.3cm} p{5.5cm} @{\hskip 0.3cm}| @{\hskip 0.3cm}l @{\hskip 0.3cm}l}	
            	{\large\oldnums{\undergraddate}}   & {\bfseries\undergraddegree} & \multirow{ 2}*{\large\itshape\undergraduni} & \\
              						& {\scshape\undergradsubject} & & \\
                  \end{tabular}

		\begin{tabular}{>{\centering}p{3cm} @{\hskip 0.3cm} p{5.5cm} @{\hskip 0.3cm}| @{\hskip 0.3cm}l @{\hskip 0.3cm}l}			
            	{\large\oldnums{\schooldate}} 	& {\bfseries\schooldegree} & \multirow{ 2}*{\large\itshape\school} & \\
              					& {\scshape\schoolsubject} & & \\
         		\end{tabular}

		}
}
%%=======================================
%% SKILLS
%%=======================================
\newcommand\skills[1]{
	\renewcommand{\skills}{
		{#1}
	}
}
%%=======================================
%% PERSONAL
%%=======================================
\newcommand\personal[1]{ 
	\renewcommand{\personal}{
		{#1}
	}
}
%%=======================================
%% REFEREE
%%=======================================
\newcommand\referee[1]{ 
	\renewcommand{\referee}{
		{#1}
	}
}
%%=======================================

%----------------------------------------------------------------------------------------
%  TITLE LAYOUT
%----------------------------------------------------------------------------------------
\newcommand{\makename}{
  
  % Grey background
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=black!75, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (8.5cm,2.5cm){};
      \draw[line width=0.8mm, pblue] (-2,-0.45) -- (\paperwidth, -0.45);
  \end{tikzpicture}
  
 \begin{textblock}{15}(5, 0.4)
   {\huge \bfseries \scshape \color{title} \cvname} 
   \vspace{3mm}  \\
   {\Large\color{sidecolor}\cvjobtitle}
\end{textblock}
}

\newcommand{\makecontact}{
	% Grey background
    	\begin{tikzpicture}[remember picture,overlay]
        	\node [rectangle, fill=black!5, anchor=north, minimum width=\paperwidth, minimum height=1.7cm] (box) at (8.5cm,-0.25cm){};
	\draw[line width=0.8mm, pblue] (-2,-1.95) -- (\paperwidth, -1.95);
    	\end{tikzpicture}      
	
    	\begin{textblock}{18}(1.5, 2.4)  
		\centering
		{\large\sffamily\scshape\color{maroon} 
			\cvrole \hspace{2mm} 
			\textbullet \hspace{2mm} 
			\cvprofession
		} 
		\vspace{3mm}  \\   
        	{\color{black} \large
			\faEnvelopeO~ \texttt{\cvmail}  ~
			~\textbar ~
			~ \faMobile ~\cvnumberphone ~
			~\textbar ~
			~\faLinkedinSquare ~\href{https://www.linkedin.com\cvlinkedin}{\cvlinkedin}
		}        
    	\end{textblock}
}


%----------------------------------------------------------------------------------------
%  CONTACT INFO
%----------------------------------------------------------------------------------------
\newcommand{\makeprofile}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-4.5cm,0.5cm){};
  \end{tikzpicture}

%------------------------------------------------
\begin{textblock}{7}(0.7, 2)
%------------------------------------------------
		
	\ifthenelse{\equal{\profilepic}{}}{}{
		\begin{center}
			\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
%				\clip (600/2, 567/2) circle (567/2);
				\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=0.67\imagewidth]{\profilepic}};
			\end{tikzpicture}
		\end{center}
	}  
    
    \profilesection{Contact}{2.5cm}    
 
    {\renewcommand{\arraystretch}{1.6}
    \begin{tabular}{p{1cm} @{\hskip 0.1cm}>{\raggedright\arraybackslash}p{5cm}}
      \ifthenelse{\equal{\cvaddress}{}}{}{
      		{$
              \begin{array}{l}
              \hspace{2mm} \Large \textnormal{\faHome} 
              \end{array}
              $} 
            & \cvaddress\\}        
      \ifthenelse{\equal{\cvnumberphone}{}}{}{
      		{$
              \begin{array}{l}
              \hspace{3mm} \LARGE \textnormal{\faMobile} 
              \end{array}
              $} 
            & \cvnumberphone\\}         
      \ifthenelse{\equal{\cvsite}{}}{}{
            {$
              \begin{array}{l}
              \hspace{2mm} \Large \textnormal{\textcolor{test}{\faGlobe}}
              \end{array}
              $} 
            & \href{http://\cvsite}{\cvsite} \\}
      \ifthenelse{\equal{\cvmail}{}}{}{
            {$
              \begin{array}{l}
              \hspace{2mm} \large \textnormal{\textcolor{yt}{\faEnvelopeO}}
              \end{array}
              $} 
            & \href{mailto:\cvmail}{\cvmail} \\}     
       \ifthenelse{\equal{\cvlinkedin}{}}{}{
            {$
              \begin{array}{l}
              \hspace{2mm} \Large \textnormal{\textcolor{linkedin}{\faLinkedin}}
              \end{array}
              $} & \href{https://www.linkedin.com\cvlinkedin}{\cvlinkedin} \\}  
        \ifthenelse{\equal{\cvgithub}{}}{}{
            {$
              \begin{array}{l}
              \hspace{2mm} \Large \textnormal{\faGithub}
              \end{array}
              $} & \href{https://www.github.com/\cvgithub}{\cvgithub} \\}   
         \ifthenelse{\equal{\cvskype}{}}{}{
            {$
              \begin{array}{l}
              \hspace{2mm} \Large \textnormal{\textcolor{pblue}\faSkype}
              \end{array}
              $} & {\cvskype} \\}      
            \ifthenelse{\equal{\cvdriving}{}}{}{
            {$
              \begin{array}{l}
              \hspace{2mm} \large \textnormal{\textcolor{maroon}\faCar}
              \end{array}
              $} & {\cvdriving} \\}      
    \end{tabular}
}
%------------------------------------------------
    \vspace{2mm}    
    \profilesection{Education}{1.8cm}    	
    		\education
%------------------------------------------------     
        \vspace{2mm}     
        \profilesection{Skills}{3cm}               
        	\skills
%------------------------------------------------      
      \vspace{2mm}      
        \profilesection{Personal}{1.9cm}        
           	\personal
%------------------------------------------------ 
	\vspace{2mm}
	\profilesection{Referees}{1.9cm}  \vspace{5mm}	
		\referee

\end{textblock}
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------
% Format of the section titles
% Command to create the rounded boxes around the first three letters of section titles
\renewcommand\section[1]{
  \par\vspace{0.4cm}
	{%
		\bfseries\scshape\Large\color{pblue} #1
		\hspace{0pt}\rule[0.4\baselineskip \color{headercolor}]{\linewidth}{0.5pt}
	}
  \par\vspace{-0.7cm}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}
	{%
		\Large\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[6]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#3}% 
		\hfill%
		{\footnotesize#4}%
        }\\%
    #2&\parbox[t]{0.83\textwidth}{%
		\ifblank{#5}{}{#5 \\}
		#6%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	\par\vspace{\parskip}
	#1&\parbox[t]{0.95\textwidth}{%
		#2%
	}\\
}

%----------------------------------------------------------------------------------------
%	 ALTERNATIVE ENVIRONMENT
%----------------------------------------------------------------------------------------
\newlength{\outerbordwidth}
\setlength{\outerbordwidth}{0.2pt}  % Width of border outside of title bars
\definecolor{shadecolor}{HTML}{0395DE}  % Outer background color of title bars (0 = black, 1 = white)
\definecolor{shadecolorB}{rgb}{1 1 1}  % Inner background color of title bars
%Custom commands
\newcommand{\resitem}[1]{\item #1 \vspace{-2pt}}
\newcommand{\resheading}[1]{\vspace{8pt}
  \parbox{\textwidth}{\setlength{\FrameSep}{\outerbordwidth}
    \begin{shaded}
\setlength{\fboxsep}{0pt}\framebox[\textwidth][l]{\setlength{\fboxsep}{4pt}\fcolorbox{shadecolor}{shadecolorB}{\textbf{\scshape{\mbox{~}\makebox[0.972\textwidth][l]{\large #1} \vphantom{p\^{E}}}}}}
    \end{shaded}
  }\vspace{1pt}
}
\newcommand{\ressubheading}[4]{
\begin{tabular*}{6.5in}{l@{\cftdotfill{\cftsecdotsep}\extracolsep{\fill}}r}
        \textbf{#1} & #2 \\
        \textit{#3} & \textit{#4} \\
\end{tabular*}\vspace{-6pt}}
%-----------------------------------------------------------


%----------------------------------------------------------------------------------------
%	  COVER LETTER 
%----------------------------------------------------------------------------------------
% For elements of the cover letter
\newcommand*{\lettersectionstyle}[1]{{\fontsize{14pt}{1em}\sffamily\color{text}\@sectioncolor #1}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9pt}{1em}\sffamily\scshape\color{black!80} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{11pt}{1em}\scshape\sffamily\color{black} #1}}
\newcommand*{\lettertitlestyle}[1]{\fbox{{\fontsize{11pt}{1em}\sffamily\color{black} #1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{10pt}{1em}\sffamily\slshape\color{black!90} #1}}
\newcommand*{\lettertextstyle}{\fontsize{10pt}{1.4em}\sffamily\upshape\color{black!90}}
\newcommand*{\letternamestyle}[1]{{\fontsize{10pt}{1em}\sffamily\color{black} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{10pt}{1em}\ttfamily\color{black!80} #1}}
\newcommand{\myaddress}[1]{\renewcommand{\myaddress}{#1}}
\newcommand{\jobtitle}[1]{\renewcommand{\jobtitle}{#1}}
\newcommand*{\addressstyle}[1]{{\footnotesize\ttfamily\color{black!95} #1}}

% Define the author's name, address and contact 
\newcommand{\makeCoverLetterName}{
	\begin{flushright}
		\begin{spacing}{1}
   			{\ttfamily \scshape \color{black!95} \cvname}  \\  
    			{\ttfamily\footnotesize\color{black!95}\myaddress} \\
      			\ifthenelse{\equal{\cvnumberphone}{}}{}{
      			{$
              		\begin{array}{l}
             		\hspace{4mm} \footnotesize\textnormal{\faMobile} 
             		\end{array}
             		$} 
            		 \href{mailto:\cvmail}{\addressstyle\cvnumberphone} \\}         
       			\ifthenelse{\equal{\cvsite}{}}{}{
            		{$
              		\begin{array}{l}
              		\hspace{3mm} \footnotesize\textnormal{\textcolor{test}{\faGlobe}}
              		\end{array}
              		$} 
            		 \href{http://\cvsite}{\addressstyle\cvsite} \\}
          			\ifthenelse{\equal{\cvmail}{}}{}{
            		{$
              		\begin{array}{l}
              		\hspace{2mm} \scriptsize \textnormal{\textcolor{yt}{\faEnvelopeO}}
              		\end{array}
              		$} 
            		 \href{mailto:\cvmail}\scriptsize{\addressstyle\cvmail} \\}     
   		     		\ifthenelse{\equal{\cvlinkedin}{}}{}{
            		{$
              		\begin{array}{l}
              		\hspace{3mm} \footnotesize\textnormal{\textcolor{linkedin}{\faLinkedin}}
              		\end{array}
              		$}  
				\href{https://www.linkedin.com\cvlinkedin}{\addressstyle\cvlinkedin} \\}  
           		\ifthenelse{\equal{\cvskype}{}}{}{
            		{$
             		\begin{array}{l}
              		\hspace{3mm} \footnotesize{\textcolor{pblue}\faSkype}
              		\end{array}
              		$} 
				\href{mailto:\cvmail}{\addressstyle\cvskype} \\}       
			\end{spacing}
	\end{flushright}
}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}

%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Define a footer for cover letter
\newcommand*{\footerstyle}[1]{{\fontsize{11pt}{1em}\ttfamily\scshape\color{black!90} #1}}
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a header for cover letter
\newcommand*{\headerstyle}[1]{{\fontsize{8pt}{1em}\scshape\color{gray} #1}}
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvheader}[3]{%
  \fancyhead{}
  \fancyhead[L]{\headerstyle{#1}}
  \fancyhead[C]{\headerstyle{#2}}
  \fancyhead[R]{\headerstyle{#3}}
}

% Define a title of the cover letter
% Usage: \makelettertitle
\newcommand*{\makelettertitle}{%
  \vspace{-4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{0.8\textwidth} R{0.2\textwidth}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{singlespace}
    \recipientaddressstyle{\@recipientaddress} \\\\
  \end{singlespace}
  \vspace{-7mm}
  \ifthenelse{\isundefined{\@lettertitle}}
    {}
    {\lettertitlestyle{\@lettertitle} \vspace{0.25cm} \\}
  \lettertextstyle{\@letteropening} \vspace{-0.33cm}
}

% Define a command for the cover letter section
% Usage: \lettersection
\newcommand{\lettersection}[2]{
  \par\vspace{2pt}
	{%
		\scshape\large\color{pblue}{#1}%
		\hspace{6pt}\rule[0.15\baselineskip]{#2}{0.5pt}%
	}
  \par\vspace{-2pt}
}

% Define an environment for the cover letter body text
% Usage: \makeletterclosing
\newenvironment{cvletter}{%
  	\lettertextstyle
	}{%
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\newcommand*{\makeletterclosing}{%
  	\vspace{1mm} \hspace{10mm}
  	\lettertextstyle{\@letterclosing}\vspace{-5mm} \\\\ 
  	\letternamestyle{\hspace{32mm}\cvname} 
  	\ifthenelse{\isundefined{\@letterenclosure}}
    	{\\}
    	{%
     	\vspace{0.5cm} \\\\\\
     	\letterenclosurestyle{\hspace{32mm}\@letterenclname: \@letterenclosure} \\
    	}
}





















