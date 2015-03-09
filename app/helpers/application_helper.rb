module ApplicationHelper

  def follow_button(user)
    if current_user.following?(user)
      button_to 'Unfollow', unfollow_user_path(user), method: :delete, class: 'btn', form_class: 'follow-btn'
    elsif current_user.can_follow?(user)
      button_to 'Follow', follow_user_path(user), class: 'btn', wrapper_html: { class: 'follow-btn'}
    end
  end

end
