Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "student_scores/search", to: "student_scores#search"
  post "student_scores/search", to: "student_scores#search_results"
  get "student_scores/report", to: "student_scores#report"
  get "student_scores/group_a_top", to: "student_scores#group_a_top"

  root "student_scores#search"
end
