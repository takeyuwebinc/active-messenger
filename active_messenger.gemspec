require_relative "lib/active_messenger/version"

Gem::Specification.new do |spec|
  spec.name        = "active_messenger"
  spec.version     = ActiveMessenger::VERSION
  spec.authors     = ["Yuichi Takeuchi"]
  spec.email       = ["yuichi.takeuchi@takeyuweb.co.jp"]
  spec.homepage    = "https://github.com/takeyuwebinc/active-messenger"
  spec.summary     = "Realtime Messenger Engine for Rails"
  spec.description = "Realtime Messenger Engine for Rails"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/takeyuwebinc/active-messenger"
  spec.metadata["changelog_uri"] = "https://github.com/takeyuwebinc/active-messenger/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "CHANGELOG.md", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.0"
end
