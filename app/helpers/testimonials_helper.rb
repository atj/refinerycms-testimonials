module TestimonialsHelper

  def display_page_testimonial_if_setup
    if @page.show_a_testimonial? && (random_testimonial = Testimonial.random)
      content_for :head, stylesheet_link_tag('testimonials')
      render :partial => '/testimonials/testimonial', :locals => {
        :testimonial => random_testimonial
      }
    end
  end

  def citation_line(t)
    [
      content_tag(:b, h(t.name)),
      h(t.job_title),
      website_or_company(t)
    ].reject{|o| o.blank?}.join(', ').sub(/,\s/, ': ')
  end

  def website_or_company(t)
    if t.website.blank?
      h(t.company)
    else
      content_tag(:a, h(t.company.blank? ? t.website : t.company), :href => h(t.website))
    end
  end
end
