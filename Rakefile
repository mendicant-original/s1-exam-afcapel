require 'rake'
require 'spec/rake/spectask'

desc "Run all scenarios"
Spec::Rake::SpecTask.new('test') do |t|
  t.spec_files = FileList['spec/scenarios/*.rb']
end