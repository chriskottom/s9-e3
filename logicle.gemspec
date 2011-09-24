$:.push File.expand_path("../lib", __FILE__)
require "logicle/version"

Gem::Specification.new do |s|
  s.name        = "logicle"
  s.version     = Logicle::VERSION
  s.authors     = ["Chris kottom"]
  s.email       = "chris@chriskottom.com"
  s.homepage    = ""
  s.summary     = %q{A simulator for playing with digital circuit logic}
  s.description = %q{Logicle is a simulator for testing and solving simple circuits composed of basic logical elements. The program reads and writes its inputs and outputs using the GML protocol.}

  s.rubyforge_project = "logicle"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = ["logicle"]
  s.require_paths = ["lib", "vendor"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
