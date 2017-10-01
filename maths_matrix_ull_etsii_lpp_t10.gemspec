# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maths_matrix_ull_etsii_lpp_t10/version'

Gem::Specification.new do |spec|
  spec.name          = "maths_matrix_ull_etsii_lpp_t10"
  spec.version       = MathsMatrixUllEtsiiLppT10::VERSION
  spec.authors       = ["Jonathan Trujillo Estevez"]
  spec.email         = ["alu0100536867@ull.edu.es"]
  spec.description   = %q{clase matrices}
  spec.summary       = %q{operaciones entre matrices densas y matrices dispersas}
  spec.homepage      = "https://github.com/alu0100606324/prct09"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
