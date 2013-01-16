module ApplicationHelper
	def link_to_user_pic(u)
		link_to(image_tag(u.profil_pic_url(:thumb).to_s), user_path(u), :class => 'user-img')
	end

	def link_to_user_name(u)
		link_to(u.nice_username, user_path(u))
	end
end
