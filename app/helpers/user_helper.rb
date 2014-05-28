module UserHelper
  def follow_tag user
    if current_user != user
      if current_user.follows? user
        link_to "Following", "#", class: "disabled", disabled: "disabled"
      else
        link_to "Follow", relationships_path(user: user), method: :post
      end
    end
  end
end
