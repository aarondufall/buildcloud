class IssueMailer < ActionMailer::Base
  default from: "from@example.com"

  def issue_notice(issue)
  	@issue = issue
  	mail(:to => issue.emails, :subject => issue.title)
  end

end
