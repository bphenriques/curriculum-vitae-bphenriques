%----------------------------------------------------------------------------------------
%	CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\ProvidesClass{deedy-resume}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry} % Specifies horizontal and vertical page margins
\usepackage{hyperref}

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\usepackage[usenames,dvipsnames]{xcolor} % Required for custom colors

\definecolor{primary}{HTML}{2b2b2b} % The primary document color for content text
\definecolor{headings}{HTML}{6A6A6A} % The color of the large sections
\definecolor{subheadings}{HTML}{333333} % The color of subsections and places worked/studied
\definecolor{date}{HTML}{666666} % The color used for the Last Updated text at the top right


%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX

\setmainfont[Color=primary, Path = fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig} % The primary font for content text; defines bold, italic and bold-italic as well

\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight} % The font used where \sfffamily is called

% font awesome %
% dont forget to install the font (in font folder)

\usepackage{fontawesome}
\newfontfamily{\FA}{FontAwesome}

\def\twitter{{\FA \faTwitter}}
\def\github{{\FA \faGithub}}
\def\githubAlt{{\FA \faGithubAlt}}
\def\linkedIn{{\FA \faLinkedin}}
\def\Phone{{\FA \faPhone}}
\def\Envelope{{\FA \faEnvelope}}
\def\User{{\FA \faUser}}
\def\Star{{\FA \faStarO}}
\def\Globe{{\FA \faGlobe}}
\def\YoutubePlay{{\FA \faYoutubePlay }}
\def\Youtube{{\FA \faYoutube }}
\def\Mobile{{\FA \faMobile}}

\usepackage{graphicx}
\graphicspath{ {.} }


%----------------------------------------------------------------------------------------
%	LAST UPDATED COMMAND
%----------------------------------------------------------------------------------------

\usepackage[absolute]{textpos} % Required for positioning the Last Updated text at the top right of the page
\usepackage[UKenglish]{isodate} % Prints the Last Updated date in UK English format

\setlength{\TPHorizModule}{0.01\paperwidth} % Sets the units for the horizontal position used in the \begin{textblock} argument
\setlength{\TPVertModule}{0.01\paperwidth} % Sets the units for the vertical position used in the \begin{textblock} argument
\newcommand{\lastupdated}[1]{ % Create a new command for printing the Last Updated text
\begin{textblock}{25}(75,2) % The position of the Last Updated text on the page (75% of the page across, 2% down)
\begin{flushright}
\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont % Text styling of the text
#1 \today \,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,
	
\end{flushright}
\end{textblock}}

%----------------------------------------------------------------------------------------
%	MAIN HEADING COMMAND
%----------------------------------------------------------------------------------------
\newcommand{\profilePicture}[4]{\begin{picture}(0,0) \put(#2,#3){\includegraphics[width=#4]{#1}} \end{picture}
}

\newcommand{\namesection}[3]{ % Defines the command for the main heading
\centering{ % Center the name
\fontsize{40pt}{60pt} % Font size
\fontspec[Path = fonts/lato/]{Lato-Hai}\selectfont #1 % First name font
\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #2 % Last name font
} \\[5pt] % Whitespace between the name and contact information
\centering{ % Center the contact information
\color{headings} % Use the headings color
\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont #3} % Contact information font
\noindent\makebox[\linewidth]{\color{headings}\rule{\paperwidth}{0.4pt}} % Horizontal rule
\vspace{-17pt} % Reduce whitespace after the rule slightly WAS -5pth
}

%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------

\usepackage{titlesec} % Required for customizing section/subsection/etc titles

\titlespacing{\section}{0pt}{0pt}{0pt} % Removes the spacing around the main section titles
\titlespacing{\subsection}{0pt}{0pt}{0pt} % Removes the spacing around the subsections
\newcommand{\sectionspace}{\vspace{8pt}} % Defines a command to add a set amount of space after sections and subsections

\titleformat{\section}{ % Customize the large section titles
\color{headings}\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

\titleformat{\subsection}{ % Customize the subsections and places worked/studied titles
\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{ % Used for creating subsections where a description is required on the same line
\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

\newcommand{\descript}[1]{ % Used for describing the subsection either on the same line or underneath
\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

\newcommand{\location}[1]{ % Used for specifying a duration and/or location under a subsection
\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

\newcommand{\skilltype}[1]{ % Used for creating subsections where a description is required on the same line
\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-SemiBold}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------

\newenvironment{tightitemize} % Defines the tightitemize environment which modifies the itemize environment to be more compact
{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}

%----------------------------------------------------------------------------------------
%	DIFERENCE BETWEEN DATES
%----------------------------------------------------------------------------------------

\usepackage{datenumber}
\usepackage{calc}
\usepackage{fp}

\newcounter{datetoday}
\newcounter{dateone}%
\newcounter{diffyears}%
\newcounter{diffmonths}%

\newcounter{temp}

\newcommand{\updateElapsed}[6]{
      \setmydatenumber{datetoday}{#4}{#5}{#6}%
      \setmydatenumber{dateone}{#1}{#2}{#3}%                  
	  % elapsed days
      \FPeval\diffdays{abs (\thedatetoday{} - \thedateone{} + 1)}
      % elapsed years 365.2421897 average days per year
	  \FPeval\elapsedyears{trunc (\diffdays{} / 365.2422897) 0}
	  \setcounter{diffyears}{\elapsedyears}
	  % elapsed months 30.436875 average days per month	 	  
      \FPeval\elapsedmonths{round ((\diffdays{} / 30.436875) - (\elapsedyears{} * 12)) 0}      
	  \setcounter{diffmonths}{\elapsedmonths}
	  \hspace{-7.8mm} % horrendous hack due to FP putting blank space
}

\newcommand{\diffYearsMonth}[6]{
	\updateElapsed{#1}{#2}{#3}{#4}{#5}{6}
		  \ifnum\value{diffyears}=0
      \else
        \ifnum\value{diffyears}>1
            \thediffyears\space years
        \else
            \thediffyears\space year
        \fi
      \fi                           
      \ifnum\value{diffmonths}=0
      \else
      	\ifnum\value{diffyears}>0
      	,\space
      	\fi      
        \ifnum\value{diffmonths}>1
            \thediffmonths\space months
        \else
            \thediffmonths\space month
        \fi
      \fi
}

\newcommand{\difftodayYearsMonths}[3]{
	\diffYearsMonth{#1}{#2}{#3}{\the\year}{\the\month}{\the\day}
}

\newcommand{\age}[3]{
\updateElapsed{#1}{#2}{#3}{\the\year}{\the\month}{\the\day}
	\ifnum\value{diffyears}>1
		\thediffyears\space Years Old
	\else
		\thediffyears\space Year Old
	\fi
}