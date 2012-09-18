class IssueRecipient < ActiveRecord::Base

  attr_accessible :contact, :user

  belongs_to :issue, inverse_of: :recipients
  belongs_to :user
  belongs_to :contact

  default_scope includes(:user, :contact)

  def email
    user_id.present? ? user.email : contact.try(:email)
  end

  def self.from_emails(emails, parent_scope)
    return [] unless emails.any?

    waiting_emails = emails

    found_users = parent_scope.users.where(email: emails).all.index_by(&:email)
    waiting_emails -= found_users.keys
    found_contacts = parent_scope.contacts.where(email: waiting_emails).all.index_by(&:email) if waiting_emails.any?
    waiting_emails -= found_contacts.keys
    added_contacts = parent_scope.contacts.build(waiting_emails.map { |e| {email: e}}) if waiting_emails.any?

    persisted_users = Array(found_users.values)
    persisted_contacts = Array(found_contacts.values)

    existing_contact_ids = persisted_contacts.map(&:id).to_set
    existing_user_ids    = persisted_users.map(&:id).to_set

    existing_recipients = where("user_id = ? OR contact_id = ?", existing_user_ids, existing_contact_ids).all

    recipient_contact_ids = existing_recipients.map(&:contact_id).uniq.compact.to_set
    recipient_user_ids    = existing_recipients.map(&:user_id).uniq.compact.to_set

    missing_users    = persisted_users.reject    { |u| recipient_user_ids.include? u.id }
    missing_contacts = persisted_contacts.reject { |c| recipient_contact_ids.include? c.id }

    new_user_recipients    = missing_users.map { |u| new user: u }
    new_contact_recipients = (Array(added_contacts) + missing_contacts).map { |c| new contact: c}

    existing_recipients + new_user_recipients + new_contact_recipients
  end

  def to_autocomplete_hash
    if user_id?
      user.to_autocomplete_hash
    else
      contact.try :to_autocomplete_hash
    end
  end

end
