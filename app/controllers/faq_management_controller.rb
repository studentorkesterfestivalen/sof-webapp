class FaqManagementController < NavigationController
  def index
    @faq_groups = database.faq_group
    @faqs = database.faq
    unless @faq_groups.success? && @faqs.success?
      render status: 403
    end
  end

  def create_faq
    if request.post?
      puts item_params
      response = database.create_faq item_params
      if response.success?
        flash[:success] = response['message']
      else
        flash[:error] = response['message']
      end
      redirect_to manage_faqs_url
    else
      @faq_groups = database.faq_group
      unless @faq_groups.success?
        render status: 403
      end

      render :new_faq
    end
  end

  def show_faq

  end

  def delete_faq
    
  end

  def create_faq_group
    if request.post?
      response = database.create_faq_group item_params
      if response.success?
        flash[:success] = response['message']
      else
        flash[:error] = response['message']
      end
      redirect_to manage_faqs_url
    else
      render :new_faq_group
    end
  end

  def show_faq_group

  end

  def delete_faq_group

  end

  private

  def item_params
    # Validation done on api-side
    params.to_unsafe_h
  end
end
