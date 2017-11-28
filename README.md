AlchemyKonoMailup


**Description**<br>
AlcheemyKonoMailup is a Mailup connector to simplify registrations of custom forms
in Mailup lists.


**Installation**

Add To your Gemfile

     gem 'alchemy_kono_mailup', '~> 0.0.1'
     
OR Install directly

     gem install alchemy_kono_mailup
     
Then in your rail application folder  

     bin/rails g alchemy_kono_mailup:install
     bin/rails alchemy_kono_mailup:install:migrations 
     bin/rails db:migrate
     
Remember to configure the file created in the initializers     


** Usage **

Create New Form Elemente

    bin/rails g alchemy_kono_mailup:subscription_form SubFormName
    

options: See documentation with   
    
    bin/rails g alchemy_kono_mailup:subscription_form --help 
    
    