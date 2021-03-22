name "td-agent-cleanup"
#version '' # git ref

dependency "td-agent"

skip_transitive_dependency_licensing true

build do
  block do
    project_name = project.name
    gem_dir_version = "2.6.0"

    # remove unnecessary files
    FileUtils.rm_f(Dir.glob("/opt/#{project_name}/embedded/lib/ruby/gems/#{gem_dir_version}/cache/*.gem"))
  end
end
