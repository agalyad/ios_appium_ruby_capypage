Dir[File.dirname(__FILE__) + '/screens/*_screen.rb'].each { |file| require file }

require 'active_support/all'

module ScreenHelper

  def self.define_screens_for(*page_klasses)
    pages = {}
    page_klasses.each do |page_klass|
      page_name = page_klass.name.underscore
      define_method page_name do
        pages[page_name] ||= page_klass.new
      end
    end
  end

  define_screens_for HomeScreen, CreateContactScreen, ContactsScreen

end