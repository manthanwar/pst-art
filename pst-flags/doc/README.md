# Documentation for the PST-Flags: A Package to Draw Flags of Countries

## How to compile this documentation?

Follow the toolchain: `latex -> dvips -> ps2pdf`

```bash
# Step 1: compile latex normally or with flags
latex pst-flags-doc.tex
# Step 2: using dvips convert dvi to ps
dvips pst-flags-doc.dvi
# Step 3: using ps2pdf convert ps to pdf
ps2pdf -dNOSAFER pst-flags-doc.ps 
# Step 5: view the pdf using pdf
pdf pst-flags-doc.pdf
# Step 6: Repeat if mistakes
# Step 7: remove generated files
rm *.aux *.dvi *.fdb_latexmk *.fls *.log *.out *.ps
# Note: You may want to keep ps file for high-quality printing using printer's ps driver
```

## Suppress messages of fp package

The [nomessages] option in the LaTeX fp package prevents the package from printing status or computation messages to your log file and terminal output during math evaluations.

To suppress these messages, load the package in your document preamble using the following syntax:

```latex
\usepackage[nomessages]{fp}
```