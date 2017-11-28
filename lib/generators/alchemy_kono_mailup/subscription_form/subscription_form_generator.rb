module AlchemyKonoMailup
  module Generators
    class SubscriptionFormGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      argument :subscription_model, desc: 'Name of the FormModel', required: true, type: :string
      class_option :form_fields, type: :string, required: false, desc: 'List of fields,columns separated with format  custom_field_name:mailup_field_id,custom_field_name2:mailup_field_id2 '

      desc "Create Form"

      def copy_initializer

        @model_name = subscription_model.classify
        @controller_name = "#{@model_name.pluralize}Controller"

        @custom_fields = options[:form_fields].split(',').
          select { |f| f.match(/^.*:.*$/) }.
          collect { |f| d=f.split(':'); { mailup_id: d[1].to_i, name: d[0] } }


        form_name = subscription_model.underscore

        #controllo se già presente un form con lo stesso nome
        elements_path = Rails.root.join('config', 'alchemy', 'elements.yml')
        puts File.foreach(elements_path).grep(/#{form_name}/).inspect
        if File.foreach(elements_path).grep(/#{form_name}/).empty?


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

          @routes_route = "#{@model_name.underscore}_create"
          route "post '#{subscription_model}',to:'#{@model_name.pluralize.underscore}#create', as: :#{@routes_route}"

          template "form_model.rb.erb", "app/models/#{@model_name.underscore}.rb"
          template "form_controller.rb.erb", "app/controllers/#{@controller_name.underscore}.rb"
          # cancella prima la view creata automaticamente
          FileUtils.rm(Rails.root.join('app','views','alchemy','elements',"_#{form_name}_view.html.erb"))
          template "form_view.html.erb", "app/views/alchemy/elements/_#{form_name}_view.html.erb"


          say "Remember to add '#{form_name}' to the elements list of the desidered page layout \n"


        else
          say "Element with same name presente, change the name with --form_name=AnotherElementFormName"
        end


      end

      def symbolic_field_list
        @custom_fields.collect{|f| ":#{f[:name]}"}
      end



    end
  end
end
