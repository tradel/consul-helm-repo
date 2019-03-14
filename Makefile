
all:: package index

index::
	helm repo index --merge index.yaml --url https://consul-helm-charts.storage.googleapis.com .
	gsutil rsync . gs://consul-helm-charts

package::
	git clone https://github.com/hashicorp/consul-helm.git consul
	{ \
	cd consul; \
	for i in $$(git tag -l); do \
		git checkout -- Chart.yaml; \
		git checkout $$i; \
		sed -i -e "s/version: .*/version: $${i:1}/" Chart.yaml; \
		helm package -d ../ ./; \
	done \
	}

index.yaml: *.tgz
	make index


