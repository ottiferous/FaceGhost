require 'marky_markov'
require_relative 'FaceDriver.rb'

if __FILE__ == $0
	connect = FaceDriver.new
	connect.login(ARGV[0], ARGV[1])
	markov = MarkyMarkov::Dictionary.new('facebook')
	markov.parse_file "wall.txt"
	message = markov.generate_n_sentences 3
	connect.post(message)
	connect.logout
	connect.close
end
