class Movie < ActiveRecord::Base
	validates :title,presence: true, length: { minimum: 2 }, :format => /[A-Z][a-z]+/
	validates :year,presence: true
	validates :rating,presence: true, length: { minimum: 10 }, :format => /[1-10]/
	validates :language,presence: true 
	validates :actors,presence: true 
	validates :director,presence: true 
	validates :producer,presence: true 
	
end
