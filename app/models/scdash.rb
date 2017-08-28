class Scdash < ApplicationRecord
  def self.app_active
    Parature.active_app_tickets
  end

  def self.app_solved
    Parature.solved_app_tickets
  end

  def self.app_chat
    Parature.solved_app_chat
  end

  def self.rec_active
    Parature.active_rec_tickets
  end

  def self.rec_solved
    Parature.solved_rec_tickets
  end

  def self.rec_chat
    Parature.solved_rec_chat
  end

  def self.app_ticket_counts
    Parature.solved_app_tickets_by_team_member
  end
end
