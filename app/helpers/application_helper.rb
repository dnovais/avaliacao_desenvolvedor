module ApplicationHelper
	def flash_message
		messages = ""
		[:notice, :info, :warning, :error].each do |type|
			if flash[type]
				puts "$" * 100
				puts flash[type]
				messages += "<p class=\"alert alert-#{type == :notice ? :info : type}\">#{flash[type]}</p>"
			end
		end
		messages
	end
end