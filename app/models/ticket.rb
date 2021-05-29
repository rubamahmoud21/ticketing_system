class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :ticket_status, optional: true
  
  validates :title, presence: true

  after_create :set_ticket_status 

  def set_ticket_status
    status = TicketStatus.find_by_name("ToDo")
    self.update(ticket_status_id: status.id)
    
  end
end
