noinst_DATA = developer-guide.txt

html:
	for x in $(noinst_DATA) ; do \
		rst2html.py $${x} $${x%.*}.html ; \
	done
