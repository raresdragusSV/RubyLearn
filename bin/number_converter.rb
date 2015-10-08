require_relative '../lib/argument_processor'

args = ARGV.dup

argument_processor = ArgumentProcessor.new(args)
argument_processor.run

