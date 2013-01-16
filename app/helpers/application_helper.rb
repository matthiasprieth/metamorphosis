module ApplicationHelper
	def link_to_user(u)
		html = ""
		html << "#{link_to(image_tag(u.profil_pic_url(:thumb).to_s), user_path(u), :class => 'user-img')}"
		html << "<p>#{link_to(u.nice_username, user_path(u))}</p>"
	end
end
