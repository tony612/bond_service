class PlanMailer < ActionMailer::Base
  default from: "h.bing612@gmail.com"

  def publish(plan, email = "example@example.com")
    @plan = plan

    mail to: email, subject: "A bond plan you subscribed"
  end
end
