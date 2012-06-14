### SESSIONS
    plan_sessions GET    /plans/:plan_id/sessions(.:format)          sessions#index
                  POST   /plans/:plan_id/sessions(.:format)          sessions#create
 new_plan_session GET    /plans/:plan_id/sessions/new(.:format)      sessions#new
edit_plan_session GET    /plans/:plan_id/sessions/:id/edit(.:format) sessions#edit
     plan_session GET    /plans/:plan_id/sessions/:id(.:format)      sessions#show
                  PUT    /plans/:plan_id/sessions/:id(.:format)      sessions#update
                  DELETE /plans/:plan_id/sessions/:id(.:format)      sessions#destroy
### PLANS
            plans GET    /plans(.:format)                            plans#index
                  POST   /plans(.:format)                            plans#create
         new_plan GET    /plans/new(.:format)                        plans#new
        edit_plan GET    /plans/:id/edit(.:format)                   plans#edit
             plan GET    /plans/:id(.:format)                        plans#show
                  PUT    /plans/:id(.:format)                        plans#update
                  DELETE /plans/:id(.:format)                        plans#destroy
### EXERCISES
        exercises GET    /exercises(.:format)                        exercises#index
                  POST   /exercises(.:format)                        exercises#create
     new_exercise GET    /exercises/new(.:format)                    exercises#new
    edit_exercise GET    /exercises/:id/edit(.:format)               exercises#edit
         exercise GET    /exercises/:id(.:format)                    exercises#show
                  PUT    /exercises/:id(.:format)                    exercises#update
                  DELETE /exercises/:id(.:format)                    exercises#destroy
