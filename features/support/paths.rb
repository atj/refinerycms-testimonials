module NavigationHelpers
  module Refinery
    module Testimonials
      def path_to(page_name)
        case page_name
        when /the list of testimonials/
          admin_testimonials_path

         when /the new testimonial form/
          new_admin_testimonial_path
        else
          nil
        end
      end
    end
  end
end
