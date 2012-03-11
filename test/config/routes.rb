App::Application.routes.draw do
  match ':id' => "application#index"
end
