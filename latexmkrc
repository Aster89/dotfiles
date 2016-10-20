$pdflatex = 'pdflatex --interaction=nonstopmode --shell-escape --synctex=1';
add_cus_dep('tikz', 'pdf', 0, 'maketikz');
