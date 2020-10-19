#NOTE:
The purpose of this template is to act as a starting point for Northumbria Students to produce a Thesis in Latex. For further customisations and additional options please also check Zongyan's fork:

https://github.com/zongyan/nu_thesis_template


# What is this File

This project was created to make it easier to start creating a Thesis for Northumbria University. The university has verbose guidelines on how a PhD document should be setup. This project was created so that you can quickly and easily start a Thesis in LaTeX.

The Northumbria guidelines for PhD Thesis creation are located [here]("https://northumbria-cdn.azureedge.net/-/media/corporate-website/new-sitecore-gallery/services/academic-registry/documents/academic-support/submission-guidance-for-students-and-supervisors.pdf?modified=20181220112907&la=en&hash=8AB2B5471E72E1D719AF0933F0B8C4BCAD552FA9")

# Instructions

The project is split into various directories for organisation.

The FrontMatter folder has all the sections that procede the Main
Matter. 

The MainMatter folder contains a Chapters Directory and a chapters.tex file

The structure included in this example is as follows:

- Chapters
  - ResearchDesign
    - Sections
      - ResearchPosition.tex
      - ...
      - ...
    - ResearchDesign.tex
  - Introduction.tex

This makes organisation of sections and chapters smoother. The main.tex file will have a single link to chapters.tex and chapters.tex will link to each chapter, which in turn will link to each section. 

For complicated chapters (mutliple sub sections), use the directory structure above (or one you feel more comfortable with). For simple chapters (one or two sections) it may be worth just creating a single .tex file.



## Required Files

This project uses the following required files:

- Glossaries (Use this file to define acronyms and glossary items)
- Harvard.bst (This is the bibliography style file same as AGSM, but formats URLS correctly and supresses URLs on all but Misc (webpages) items.)
- Library.bib (This is bib file used to generate bibliography)
- NorthumbriaPhDThesis.cls (This file provides all the overrides to the Book.cls file that makes the project comply with Northumbria's style guide)

## Images

The Images Directory is defined inside of the document class file so it's name cannot be changed. This is an example of how to reference ResearchOnion.png from the images folder:

```latex
\begin{figure}[ht]
    \centering
    \includegraphics[width=0.8\textwidth]{ResearchOnion}
    \caption{The Research Onion}
    \label{fig:research-onion}
\end{figure}
```



## Arguments

### Double Sided Printing

Northumbria Supports double sided book layouts (if paper is sufficiently opaque). To include double sided printing create the document class like this (this is default)

```latex
\documentclass[twoside,openright]{RequiredFiles/NorthumbriaPhdThesis}
```

To create a one sided print create the class declaration without any declaration of sides:

```latex
\documentclass{RequiredFiles/NorthumbriaPhdThesis}
```



### Uncited Bibliography

Adding a full bibliography (uncited and cited) is optional for Northumbria Theses. To include them in your thesis  declare your class with the uncited flag as follows (works with oneside also):

```latex
\documentclass[twoside, openright, uncited]{RequiredFiles/NorthumbriaPhdThesis}
```

Then at the end of your document (before the index is printed) add the following code:

```latex
\addcontentsline{toc}{chapter}{Bibliography}
\bibliographystyleother{RequiredFiles/Harvard} 
\bibliographyother{RequiredFiles/Library}
```

This uses the multibib package which is required and defined in NorthumbriaPhdThesis.cls to make this work it creates a second bibliography flag class {other} and includes the line `\nociteother{*}` to reference all bib items in the 'other' bibliography.

### Font12

The default font size if 11pt. If you would like to use a larger font use the flag `fontlg` when declaring the document class like so:

```latex
\documentclass[twoside, openright, fontlg]{RequiredFiles/NorthumbriaPhdThesis}
```

