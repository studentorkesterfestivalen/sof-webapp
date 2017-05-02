module Areas
  module FaqArea
    def faq
      get('/api/v1/faq')
    end

    def create_faq_post(params)
      options = {
          body: {
              item: params
          }
      }
      post('/api/v1/faq', options.merge(authenticated_options))
    end

    def destroy_faq_post(id)
      delete("/api/v1/faq/#{id}", authenticated_options)
    end
  end
end