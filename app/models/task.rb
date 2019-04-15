class Task < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :volunteers, :through => :assignments
  has_one :event

  # This allows volunteers to sign up for events without a specific task.
  # We may decide to remove this later, as we can stub tasks once they are done.
  def self.get_none_task(event)
    task = Task.find_by_title_and_event_id("Nothing", event.id)
    if task.nil?
      task = Task.new(title: "Nothing", event_id: event.id)
      task.save!
    end
    task
  end

end