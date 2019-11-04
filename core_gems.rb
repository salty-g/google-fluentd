dir 'core_gems'
download "json", "2.1.0"
download "msgpack", "1.2.9"
download "cool.io", "1.5.4"
download "http_parser.rb", "0.6.0"
download "yajl-ruby", "1.3.1"
download "sigdump", "0.2.4"
download "thread_safe", "0.3.5"
download "oj", "3.3.10"
download "tzinfo", "1.2.2"
download "tzinfo-data", "1.2016.5"
if windows?
  download "google-protobuf", "3.9.0"
  download "grpc", "1.24.0"
else
  # TODO: verify whether this works as `download` with the Linux installer, and
  # collapse the if.
  fetch "google-protobuf", "3.9.0"
  fetch "grpc", "1.24.0"
end
