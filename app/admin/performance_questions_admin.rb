Trestle.resource(:performance_questions) do
  menu do
    item :performance_questions, icon: "fa fa-question"
  end

  build_instance do |attrs, params|
    scope = params[:performance_review_id] ? PerformanceReview.find(params[:performance_review_id]).performance_questions : PerformanceQuestion
    scope.new(attrs)
  end
  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  form do |performance_question|
    text_field :question
    select :performance_review_id, PerformanceReview.all.map { |pr| [pr.title, pr.id]}
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:performance_question).permit(:name, ...)
  # end
end
