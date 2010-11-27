require 'test_helper'
require 'testimonial'

class TestimonialTest < ActiveSupport::TestCase
  
  context "The Testimonial class itself" do
    should_validate_presence_of :name, :quote
    should_have_instance_methods :flash_name
    should_have_class_methods :random

    context "the class method 'random'" do
      should "call find" do
        Testimonial.expects(:find)
        Testimonial.random
      end

      should "return nil when there are no testimonials" do
        assert_nil Testimonial.random
      end

      context "with some Testimonials in the database" do
        setup do
          Testimonial.create(:name => 'Joe Bloggs', :quote => 'Blah')
          Testimonial.create(:name => 'John Doe', :quote => 'Bleh')
        end
        should "return an instance of a testimonal when there is one to find" do
          assert_equal(Testimonial, Testimonial.random.class)
        end
      end
    end
  end

  context "A valid instance of a Testimonial" do
    setup do
      @t = Testimonial.create(:name => 'Joe Bloggs', :quote => 'Blah')
    end

    should "return 'Quote by Joe Bloggs' when calling flash_name" do
      assert_equal('Quote by Joe Bloggs', @t.flash_name)
    end
  end

end
