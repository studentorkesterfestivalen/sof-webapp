module Areas
  module OrchestraArea
    def create_orchestra(item_params)
      options = {
        body: item_params
      }
      post('/api/v1/orchestra', options.merge(authenticated_options))
    end

    def show_orchestra(id)
      get("/api/v1/orchestra/#{id}", authenticated_options)
    end

    def delete_orchestra(id)
      delete("/api/v1/orchestra/#{id}", authenticated_options)
    end

    def delete_orchestra_signup(id)
      delete("/api/v1/orchestra_signup/#{id}", authenticated_options)
    end

    def update_orchestra(id, item_params)
      options = {
        body: item_params
      }

      put("/api/v1/orchestra/#{id}", options.merge(authenticated_options))
    end

    def create_orchestra_signup(item_params)
      options = {
        body: item_params
      }
      post('/api/v1/orchestra_signup', options.merge(authenticated_options))
    end

    def show_orchestra_signup(id)
      get("/api/v1/orchestra_signup/#{id}", authenticated_options)
    end

    def all_orchestra_signups(id)
      get("/api/v1/orchestra/#{id}/all_signups", authenticated_options)
    end

    def verify_orchestra_code(code)
      options = {
        body: {
          code: code
        }
      }
      get('/api/v1/orchestra_signup/verify', options.merge(authenticated_options))
    end

    def all_orchestras
      get('/api/v1/orchestra', authenticated_options)
    end

    def item_summary
      get('/api/v1/orchestra/item_summary', authenticated_options)
    end

    def extra_performances
      get('/api/v1/orchestra/extra_performances', authenticated_options)
    end

    def anniversary
      get('/api/v1/orchestra/anniversary', authenticated_options)
    end

    def allergies
      get('/api/v1/orchestra/allergies', authenticated_options)
    end

    def lintek_rebate
      get('/api/v1/orchestra/lintek_rebate', authenticated_options)
    end
  end
end