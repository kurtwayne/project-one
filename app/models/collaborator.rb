class Collaborator < ActiveRecord::Base
   belongs_to :user
   belongs_to :wiki

   def self.update_collaborators(collaborators_string)
     return Collaborator.none if collaborators_string.blank?
  end
 end
