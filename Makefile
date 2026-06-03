.PHONY: serve sync

serve: sync
	bundle exec jekyll serve --livereload

sync:
	@if [ ! -d _idx ]; then \
		git clone --depth 1 --filter=blob:none --sparse git@github.com:eltu/idx.git _idx; \
	fi
	cd _idx && git sparse-checkout set docs && git pull --ff-only
	cp -r _idx/docs/features features
	cp -r _idx/docs/releases releases
	cp -r _idx/docs/adr      adr
	cp -r _idx/docs/benchmarks benchmarks
