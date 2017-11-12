# coding: utf-8


Gem::Specification.new do |spec|
  spec.name          = "top_netflix"
  spec.version       = TopNetflix::VERSION
  spec.date          = "2017-11-12"
  spec.authors       = ["'Kaitlin Kelly'"]
  spec.email         = ["'kk504408@gmail.com'"]

  spec.summary       = "Top Shows to Stream on Netflix"
  spec.description   = "Provides details on the top shows to stream on Netflix via the Huffington Post"
  spec.homepage      = "https://github.com/Kkelly22/top-netflix-cli-app"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #  f.match(%r{^(test|spec|features)/})
  #end
  spec.files         = ["lib/top_netflix.rb", "lib/top_netflix/cli.rb", "lib/top_netflix/shows.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri"
end
