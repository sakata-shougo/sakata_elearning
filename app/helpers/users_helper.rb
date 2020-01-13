module UsersHelper
  def user_avatar(user,classess)
   @avatar = user.avatar
   if @avatar.present?
      @avatar_user = image_tag(@avatar.url, class: classess)
   else
       @avatar_user = image_tag("default.png", class: classess)
   end
  end
end
