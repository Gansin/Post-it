module ApplicationHelper

# example helper: for view templates
# to display info a certain way.
	def fix_url(str)
		str.starts_with?('http://') ? str : 'http://' + str
		# if the str starts with 'http://' then just return string, else add 'http://' to 
		# the beginning of the str and then return str
	end

end
