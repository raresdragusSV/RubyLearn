require_relative '../lib/argument_processor'
require_relative '../lib/input_errors'
args = ARGV.dup


InputErrors.errors(args)
argument_processor = ArgumentProcessor.new(args)
argument_processor.run



