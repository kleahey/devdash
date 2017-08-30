class Scdash < ApplicationRecord
  def self.app_active
    Parature.redis_active_app_tickets
  end

  def self.app_solved
    Parature.redis_solved_app_tickets
  end

  def self.app_chat
    Parature.solved_app_chat
  end

  def self.rec_active
    Parature.redis_active_rec_tickets
  end

  def self.rec_solved
    Parature.redis_solved_rec_tickets
  end

  def self.rec_chat
    Parature.solved_rec_chat
  end

  def self.team_member_ticket_counts
    Parature.solved_tickets_by_team_member
  end

end
