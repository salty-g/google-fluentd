name "fluentd"
# fluentd v1.10.4.
default_version '5a2afdccc7fc3766f0728c29b04519784ff7ef3f'

dependency "ruby"
#dependency "bundler"

source :git => 'https://github.com/fluent/fluentd.git'
relative_path "fluentd"

build do
  Dir.glob(File.expand_path(File.join(Omnibus::Config.project_root, 'core_gems', '*.gem'))).sort.each { |gem_path|
    gem "install --no-document #{gem_path}"
  }
  rake "build"
  gem "install --no-document pkg/fluentd-*.gem"
end
