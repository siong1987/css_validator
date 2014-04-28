Gem::Specification.new do |s|
  s.name          = "css_validator"
  s.version       = "3.0.0"
  s.authors       = ["Teng Siong Ong"]
  s.email         = ["siong1987@gmail.com"]
  s.homepage      = "https://github.com/siong1987/css_validator"
  s.summary       = %q{ActiveModel Validation for CSS}
  s.description   = %q{ActiveModel Validation for CSS}
  s.license       = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "activemodel"
end
