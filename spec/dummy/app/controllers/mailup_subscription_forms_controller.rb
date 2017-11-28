class MailupSubscriptionFormsController < Alchemy::BaseController

  def create

    @mailup_subscription = MailupSubscriptionForm.new(clear_params)
    @element = Alchemy::Element.find_by(id: @mailup_subscription.element_id)
    if @element.nil?
      raise ActiveRecord::RecordNotFound, "Contact form id not found. Please pass the :contact_form_id in a hidden field. Example: <%= f.hidden_field :contact_form_id, value: element.id %>"
    end
    @page = @element.page
    @root_page = @page.get_language_root

    if @mailup_subscription.valid?

      dati_inviati = {
        Email: @mailup_subscription.email,
        Fields: [
          {
            Value: @mailup_subscription.first_name,
            Id: 1
          },
          {
            Value: @mailup_subscription.last_name,
            Id: 2
          }
        ]
      }

      Rails.logger.debug { dati_inviati.inspect }


      begin
        ris = KonoMailup::API.new(debug: true).console.
          list(@mailup_subscription.newsletter_list).
          import_recipient(dati_inviati)


        Rails.logger.info { "Nuova subscription: #{ris}" }

        if (ris>0)
          @mailup_subscription=nil
          redirect_to root_path, notice: 'Subscription Confirmed'
        else
          problems_with_api
        end
      rescue Exception => e
        problems_with_api(error: e)
      end

    else
      render template: 'alchemy/pages/show'
    end

  end

  private
  def clear_params
    params.require(:mailup_subscription_form).permit(:email,
                                                     :newsletter_list,
                                                     :element_id,
                                                     :first_name,
                                                     :last_name
    )
  end

  def problems_with_api(error: nil)
    Rails.logger.warn { "Mailup API Problems #{error.try(:message)}" }

    @mailup_subscription.errors.add(:base, :problems_with_api)
    render template: 'alchemy/pages/show'
  end

end