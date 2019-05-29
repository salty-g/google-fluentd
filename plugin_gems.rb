dir 'plugin_gems'
# The order of these dependencies matters due to how Ruby pulls dependencies.
download "httpclient", "2.7.2"
download "uuidtools", "2.1.5"
download "aws-sdk", "2.3.14"
download "aws-sdk-v1", "1.66.0"
download "fluent-plugin-s3", "0.8.4"
download "webhdfs", "0.8.0"
download "fluent-plugin-webhdfs", "0.4.2"
download "fluent-plugin-rewrite-tag-filter", "1.5.5"
download "fluent-plugin-google-cloud", "0.7.13"
download "fluent-plugin-detect-exceptions", "0.0.10"
download "prometheus-client", "0.9.0"
download "fluent-plugin-multi-format-parser", "0.1.1"
download "fluent-plugin-prometheus", "1.4.0"
download "fluent-plugin-record-reformer", "0.9.1"
download "fluent-plugin-record-modifier", "2.0.1"
download "fluent-plugin-kubernetes_metadata_filter", "2.1.6"
# Pin systemd-journal to < 1.3.2 until
# https://github.com/ledbettj/systemd-journal/issues/79 is fixed.
download "systemd-journal", "1.3.0"
download "fluent-plugin-systemd", "0.3.0"
