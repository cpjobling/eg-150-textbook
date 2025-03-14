.PHONY: help book clean serve

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  install     to install the necessary dependencies for jupyter-book to build"
	@echo "  book        to convert the content/ folder into Jekyll markdown in _build/"
	@echo "  clean       to clean out site build files"
	@echo "  runall      to run all notebooks in-place, capturing outputs with the notebook"
	@echo "  serve       to serve the repository locally with Jekyll"
	@echo "  build       to build the site HTML and store in _site/"
	@echo "  site 		 to build the site HTML, store in _site/, and serve with Jekyll"

runall:
	uv run jupyter-book build . --all --keep-going

realclean:
	uv run jupyter-book clean . --all

linkcheck:
	uv run jupyter-book build . --builder linkcheck

rebuild:
	make clean
	make build

clean:
	find  . -name zbib.ipynb -exec rm {} \;
	find ./setup -name '*.ipynb' -exec rm {} \;
	find ./introduction -name '*.ipynb' -exec rm {} \;
	find ./signals_and_systems -name '*.ipynb' -exec rm {} \;
	find ./lti_systems -name '*.ipynb' -exec rm {} \;
	# find ./labs -name '*.ipynb' -exec rm {} \;
	find ./poles_and_zeros -name '*.ipynb' -exec rm {} \;
	# find ./homework -name '*.ipynb' -exec rm {} \;
	# find ./worksheets -name '*.ipynb' -exec rm {} \;
	find ./laplace_transform -name '*.ipynb' -exec rm {} \;
	find ./homework -name '*.ipynb' -exec rm {} \;
	uv run jupyter-book clean .

build:  
	make assets
	uv run jupyter-book build --keep-going .

site:   
	make clean
	make assets
	uv run jupyter-book build .
	# make portfolio
	touch _build/html/.nojekyll
	uv run ghp-import --no-jekyll -p -f ./_build/html

#portfolio: FORCE
#	rsync -a --delete labs/ portfolio

assets: FORCE
	rsync -av --delete --exclude='*.ipynb' --exclude='*.pptx' --exclude='.*' --delete-excluded \
	signals_and_systems \
	lti_systems \
	poles_and_zeros \
	introduction \
	laplace_transform \
	freq_resp \
	worksheets \
	setup \
	_assets
FORCE:
