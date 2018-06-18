Trestle.resource(:performance_reviews) do
  menu do
    item :performance_reviews, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :title
    column :user
    column :due_date, align: :center
    column :reviewers_emails
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |performance_review|
    tab :performance_review do
      col(xs: 6) { text_field :title }
      col(xs: 6) { datetime_field :due_date }
      select :user_id, User.all.map { |user| [user.email, user.id]}
      collection_select :user_ids, User.all, :id, :email, { label: "Reviewer(s)" }, { multiple: true }
    end

    tab :performance_questions, badge: performance_review.performance_questions.size do
      table performance_review.performance_questions, admin: :performance_questions do
        column :question, align: :center
        actions
      end

      concat admin_link_to("New Question", admin: :performance_questions, action: :new, params: { performance_review_id: performance_review }, class: "btn btn-success")
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:performance_review).permit(:name, ...)
  # end
end
