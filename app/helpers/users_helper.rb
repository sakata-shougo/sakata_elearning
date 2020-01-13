module UsersHelper  #アバターの追加はhelperページで行った
  def user_avatar(user,classess)
   @avatar = user.avatar
   if @avatar.present?
      @avatar_user = image_tag(@avatar.url, class: classess)
   else
       @avatar_user = image_tag("default.png", class: classess)
   end
  end
end

#①helperページでメゾットの追加
#②if文を使いデフォルトを使う場合と使わない場合とで分ける
#③showページに行き、デフォルトを表示させる。