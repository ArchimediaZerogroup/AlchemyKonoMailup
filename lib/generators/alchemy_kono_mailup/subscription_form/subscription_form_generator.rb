module AlchemyKonoMailup
  module Generators
    class SubscriptionFormGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      class_option :form_name, type: :string, default: 'MailupSubscription'

      desc "Create Form"

      def copy_initializer


        form_name = options[:form_name].underscore


        append_to_file 'config/alchemy/elements.yml' do
          <<-YML
        
- name: #{form_name}
  hint: true
  unique: true
  contents:
  - name: newsletter_list
    type: EssenceMailupList
    validate:
      - presence

          YML
        end


        generate 'alchemy:elements --skip'


        say "Remember to add '#{form_name}' to the elements list of the desidered page layout "


      end


    end
  end
end
