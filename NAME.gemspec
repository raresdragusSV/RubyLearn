# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
	spec.name						= "number_converter"
	spec.version				= "1.0"
	spec.authors				= ["Rares Dragus"]
	spec.email					= ["raresdragus@softvision.ro"]
	spec.summary				= %q{Roman Arabic Numbers Converter}
	spec.description		= %q{Longer description of the project.}
	spec.homepage				= ""
	spec.license				=	"Open Source"

	spec.files					= ['lib/converter.rb']
	spec.executables		= ['bin/number_converter']
	spec.test_files			= ['tests/test_NAME.rb']
	spec.require_paths	= ["lib"]
end
