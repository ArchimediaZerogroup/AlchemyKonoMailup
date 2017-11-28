module AlchemyKonoMailup
  module Generators
    class SubscriptionFormGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      class_option :form_name, type: :string, default: 'MailupSubscription'

      desc "Create Form"

      def copy_initializer


        form_name = options[:form_name].underscore

        #controllo se già presente un form con lo stesso nome
        elements_path = Rails.root.join('config', 'alchemy', 'elements.yml')
        if File.foreach(elements_path).grep(/#{form_name}/).any?


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
          copy_file "form_model.rb", "app/model/#{file_name}.rb"



          say "Remember to add '#{form_name}' to the elements list of the desidered page layout \n"


        else
          say "Element with same name presente, change the name with --form_name=AnotherElementFormName"
        end


      end


    end
  end
end
