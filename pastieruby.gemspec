Gem::Specification.new do |s|
  s.name = %q{pastieruby}
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["pH (Pedro Henrique Cavallieri Franceschi)"]
  s.date = %q{2009-09-12}
  s.default_executable = %q{pastieruby}
  s.description = %q{Pastie.org implementation in Ruby.}
  s.homepage = %q{http://www.iBlogeek.com}
  s.email = ["pedrohfranceschi@gmail.com"]
  s.files = ["pastieruby.gemspec","lib/pastieruby.rb"]
  s.require_paths = ["lib"]
  s.summary = %q{Pastie.org implementation in Ruby.}
  
  if s.respond_to? :specification_version then
      current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
      s.specification_version = 2

      if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
        s.add_runtime_dependency(%q<mechanize>, [">= 0.9.3"])
        s.add_runtime_dependency(%q<nokogiri>, [">= 1.3.3"])
      else
        s.add_dependency(%q<mechanize>, [">= 0.9.3"])
        s.add_dependency(%q<nokogiri>, [">= 1.3.3"])
      end
    else
      s.add_dependency(%q<mechanize>, [">= 0.9.3"])
      s.add_dependency(%q<nokogiri>, [">= 1.3.3"])
    end
    
end