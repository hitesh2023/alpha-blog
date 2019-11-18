require 'digest/md5'

module ApplicationHelper
	def gravator_for(user, options = {size: 100})
		email_address = user.email
		size = options[:size]
		hash = Digest::MD5.hexdigest(email_address)
		image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
		image_tag(image_src, alt: user.username, class: "img-circle")
	end
end
