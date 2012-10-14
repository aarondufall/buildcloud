class EmailsController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        matches = [new_contact]
        matches += current_account.users.search_for_autocomplete(current_query).map(&:to_autocomplete_hash)
        matches += current_account.contacts.search_for_autocomplete(current_query).map(&:to_autocomplete_hash)
        render json: matches
      end
    end
  end

  private

  def current_query
    params[:q].to_s
  end

  def new_contact
    {
      name: current_query,
      id:   current_query
    }
  end

  def current_account_users
    current_account.memberships.collect { |membership| membership.user}
  end

  

end
