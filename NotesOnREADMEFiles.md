# Notes on making README:

In our README want to provide a link to get to our Rmd file on Github

Organizing a repository and editing a readme using Markdown

## Links to analysis 

These are the links to the analysis files viewable on Github (.md). The .RMD files and .HTML rendered files are also available.

The analysis file (BlakeRMarkdown.Rmd) has a YAML header and is knitted into markdown files. 
Goal: **provide clickable links** in README file that lead to these markdown files on GitHub.
*This allows others to follow your code and view the generated plots* 

- [BlakeRMarkdown](BlakeRMarkdown.md)
  - This takes you to the file that is GitHub friendly for running a markdown. It does not show the HTML code. 

## File Tree

File trees are created using the fs package in R. The package allows us to print the directory structure, which is **useful for providing ex-plicit instuctions in the README about each file's purpose.*
We can copy file tree text and paste it into a markdown block to make it viewable on GitHub.
*Label file trees and provide descriptions for each file to help user understand project structure!* 

```r
fs::dir_tree()
```bash

├── BlakeRMardown_files
│   ├── CodingChallenge2_IntroDataVis.docx
│   ├── figure-gfm
│   │   ├── Include figures-1.png
│   │   └── pressure-1.png
│   └── figure-html
├── CodingChallenge4
│   ├── CodingChallenge4.md
│   ├── CodingChallenge4.pdf
│   ├── CodingChallenge4.Rmd
│   ├── CodingChallenge4_files
│   │   ├── figure-gfm
│   │   │   ├── unnamed-chunk-2-1.png
│   │   │   ├── unnamed-chunk-3-1.png
│   │   │   ├── unnamed-chunk-4-1.png
│   │   │   └── unnamed-chunk-5-1.png
│   │   └── figure-latex
│   ├── CodingChallenge4_Markdown.docx
│   └── MycotoxinData.csv
├── CodingChallenges
│   ├── BacterialAlpha.csv
│   ├── Bull_richness.csv
│   ├── CodingChalleng3_AdvancedVis.docx
│   ├── CodingChallenge1.docx
│   ├── CodingChallenge1.R
│   ├── CodingChallenge2.R
│   ├── CodingChallenge3.R
│   ├── diff_abund.csv
│   ├── Kylie_Blake_RGithubAssignment.docx
│   └── TipsR.csv
├── HomeworkAssignments
│   ├── BlakeDataVisualization.R
│   ├── BlakeDataVisualization2.R
│   ├── BlakeIntroToR.R
│   ├── BlakeRMarkdown.html
│   ├── BlakeRMarkdown.md
│   ├── BlakeRMarkdown.Rmd
│   ├── RAssignment_1.R
│   └── ScreenshotGitInRStudio.png
├── PLPA6820.Rproj
├── Project
│   └── KylieBlake_ProjectProposal.docx
├── README.html
└── README.md

# Zenodo Link 

The Zenodo gives your a DOI link that cites all your files back to you. 
1. Go to Zenodo and link to GitHub
2. Go to Setting Zonodo > GitHub 
3. Find repository, flip switch onto on for a repository
4. Create a release 
5. Make tag name in Git 
6. Create a release title and describe the release 
- Release should be stable 
7. Refresh page and zenodo padge should pop up oin repository
8. click on badge and gives you a nice markdown file and can copy it and put it into repository 
