module ShoutHelper

  def shout_form_for(content_class)
    form_for(Shout.new(content_type: content_class)) do |form|
      form.fields_for(:content) do |content_form|
        yield content_form
      end +
        form.hidden_field(:content_type) +
        form.submit('Shout')
    end
  end

  # <div class="form-inputs">
  #      <%= form.label :shout %>
  #      <%= form.fields_for(:content) do |content_form| %>
  #        <%= content_form.file_field :photo %>
  #      <% end %>
  #      <%= form.hidden_field :content_type, value: 'PhotoShout' %>
  #   </div>
  #
  #   <div class="btn-submit">
  #     <%= form.submit "Shout", class: 'btn btn-success' %>
  #   </div>

  def reshout_button(shout)
    if current_user.reshouted?(shout)
      button_to 'Undo Reshout', unreshout_shout_path(shout), method: :delete
    else
      button_to 'Reshout', reshout_shout_path(shout), disabled: reshout_disabled?(shout)
    end
  end

  private

  def reshout_disabled?(shout)
    current_user.owns?(shout)
  end

end
