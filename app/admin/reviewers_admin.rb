Trestle.resource(:reviewers) do
  menu do
    item :reviewers, icon: "fa fa-eye"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :performance_review
    column :user, label: 'Reviewer'
    column :user_to_be_reviewed, label: 'User to be reviewer'
    column :due_date, align: :center
    column :done, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |reviewer|
    row do
      col(xs: 6) { datetime_field :due_date }
      col(xs: 6) { check_box :done }
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
  #   params.require(:reviewer).permit(:name, ...)
  # end
end
