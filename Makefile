BOOTSTRAP = ./site/assets/css/bootstrap.css
BOOTSTRAP_LESS = ./less/bootstrap.less
BOOTSTRAP_MIN = ./site/assets/css/bootstrap.min.css
BOOTSTRAP_RESPONSIVE_MIN = ./site/assets/css/bootstrap-responsive.min.css
BOOTSTRAP_RESPONSIVE = ./site/assets/css/bootstrap-responsive.css
BOOTSTRAP_RESPONSIVE_LESS = ./less/responsive.less
BOOTSTRAP_JS_MIN = ./site/assets/js/bootstrap.min.js
BOOTSTRAP_JS =
LESS_COMPRESSOR ?= `which lessc`
WATCHR ?= `which watchr`



bootstrap:
#	mkdir -p bootstrap/img
#	mkdir -p bootstrap/css
	mkdir -p bootstrap/js
#	cp img/* bootstrap/img/
#	lessc ${BOOTSTRAP_LESS} > bootstrap/css/bootstrap.css
	lessc --compress ${BOOTSTRAP_LESS} > ${BOOTSTRAP_MIN}
#	lessc ${BOOTSTRAP_RESPONSIVE_LESS} > bootstrap/css/bootstrap-responsive.css
	lessc --compress ${BOOTSTRAP_RESPONSIVE_LESS} > ${BOOTSTRAP_RESPONSIVE_MIN}
	cat js/bootstrap-transition.js js/bootstrap-alert.js js/bootstrap-button.js js/bootstrap-carousel.js js/bootstrap-collapse.js js/bootstrap-dropdown.js js/bootstrap-modal.js js/bootstrap-tooltip.js js/bootstrap-popover.js js/bootstrap-scrollspy.js js/bootstrap-tab.js js/bootstrap-typeahead.js > bootstrap/js/bootstrap.js
	uglifyjs -nc bootstrap/js/bootstrap.js > bootstrap/js/bootstrap.min.tmp.js
	echo "/**\n* Bootstrap.js by @fat & @mdo\n* Copyright 2012 Twitter, Inc.\n* http://www.apache.org/licenses/LICENSE-2.0.txt\n*/" > bootstrap/js/copyright.js
	cat bootstrap/js/copyright.js bootstrap/js/bootstrap.min.tmp.js > ${BOOTSTRAP_JS_MIN}
	rm bootstrap/js/copyright.js bootstrap/js/bootstrap.min.tmp.js
	rm -rf bootstrap/

watch:
	echo "Watching less files..."; \
	watchr -e "watch('less/.*\.less') { system 'make' }"

clean:
	rm -rf bootstrap/

.PHONY: watch clean
