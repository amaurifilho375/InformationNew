class User < ApplicationRecord
     has_many :reports
     has_many :comments
 

  enum role: [:full_access, :restricted_access]
 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



 
def role_br
    if self.role == ['full_access']   
      'acesso completo'
    else
     'acesso restrito'  
    end 
end
            

end
