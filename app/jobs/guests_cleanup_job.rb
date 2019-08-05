class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(guest)
    # Do something later
    puts "GuestsCleanupJob #{guest}"
  end
end
