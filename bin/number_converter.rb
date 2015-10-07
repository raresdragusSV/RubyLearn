require_relative '../lib/argumentprocessor'

args = []

until ARGV.empty?
  args << ARGV.shift
end

argumentprocessor = ArgumentProcessor.new(args)
argumentprocessor.run

