KNOWN_SITES = [ { name: 'github', hypertext_reference: 'https://github.com'  } ]

class Raspberrypuree
	attr_reader :markdown, :username, :uniform_resource_identifier, :nickname

	def initialize(options)
		site_url = options[:site_url]
		text = options[:text]
		@raspberrymark = '@'
    if options[:form_completed]      
      @username = options[:username]
      @nickname = options[:nickname]  
    else
      @username = find_user(text)
      @nickname = nicknames_finder(@username)
    end
		@uniform_resource_identifier = "#{site_url}/#{@username.downcase}" # Quack!
	end

	def nicknames_finder(username)
		possible_nicknames_known = %w{kai}
		nick_names = possible_nicknames_known.select do |nickname|
			nickname if username.include?(nickname)
		end
		nick_names.compact.last
	end

	def markdown
		"[#{@raspberrymark}#{@username}](#{@uniform_resource_identifier})"
	end

	private
	def find_user(text)
		text.split(@raspberrymark)[1].split(' ')[1-1]
	end

	def results
		@markdown
	end		
end
