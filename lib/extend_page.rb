module Refinery
  module Testimonials
    module ExtendPage
      def show_a_testimonial?
        return false if self.link_url == '/testimonials'
        show_on_pages = RefinerySetting.find_or_set(:show_testimonials_on_pages, 'none')
        show_on_pages =~ /all/i || show_on_pages.split(',').map(&:downcase).include?(self.title.strip.downcase)
      end
    end
  end
end
