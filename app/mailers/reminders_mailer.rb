class RemindersMailer < ApplicationMailer
  def remind_guest(guest, event)
    @greeting = "Hello"
    @body = "You have the WICI #{event.name}, on #{event.date}, at #{event.location}"
    mail to: guest.email, from: "wiciberkeley@gmail.com", subject: "WICI Event Reminder"
  end

  def confirm_guest(guest, event, qrcode)
    @greeting = "Hello"
    @body = "You are registered for the WICI #{event.name}, on #{event.date}, at #{event.location}"
    File.open("/tmp/qrcode.png", "wb") do |f|
      f.write qrcode
    end

    attachments['ticket.png'] = File.read("/tmp/qrcode.png")
    mail to: guest.email, from: "wiciberkeley@gmail.com", subject: "WICI Event Confirmation"
  end
end
