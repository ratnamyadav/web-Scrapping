Rails.application.routes.draw do
  post '/scrap_patients' => 'application#scrap_patients'
end
