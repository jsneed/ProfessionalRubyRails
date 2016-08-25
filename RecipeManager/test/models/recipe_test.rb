require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.create(name: "Tester", email: "test@dispostable.com")

        @recipe = @chef.recipes.build(name: "Chicken Parmesan",
            summary: "My version of chicken parmesan is a little different than what they do in the restaurants, with less sauce and a crispier crust.",
            description: "
                Prep 25 m, Cook 20 m, Ready In 1 h,
                Preheat an oven to 450 degrees F (230 degrees C).
                Place chicken breasts between two sheets of heavy plastic (resealable freezer bags work well) on a solid, level surface. Firmly pound chicken with the smooth side of a meat mallet to a thickness of 1/2-inch. Season chicken thoroughly with salt and pepper.
                Beat eggs in a shallow bowl and set aside.
                Mix bread crumbs and 1/2 cup Parmesan in a separate bowl, set aside.
                Place flour in a sifter or strainer; sprinkle over chicken breasts, evenly coating both sides.
                Dip flour coated chicken breast in beaten eggs. Transfer breast to breadcrumb mixture, pressing the crumbs into both sides. Repeat for each breast. Set aside breaded chicken breasts for about 15 minutes.
                Heat 1 cup olive oil in a large skillet on medium-high heat until it begins to shimmer. Cook chicken until golden, about 2 minutes on each side. The chicken will finish cooking in the oven.
                Place chicken in a baking dish and top each breast with about 1/3 cup of tomato sauce. Layer each chicken breast with equal amounts of mozzarella cheese, fresh basil, and provolone cheese. Sprinkle 1 to 2 tablespoons of Parmesan cheese on top and drizzle with 1 tablespoon olive oil.
                Bake in the preheated oven until cheese is browned and bubbly, and chicken breasts are no longer pink in the center, 15 to 20 minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).
            ")
        @recipeChefTest = Recipe.new(name: "a" * 5, summary: "a" * 10, description: "a" * 20, chef_id: nil)
        @recipeNameTest = Recipe.new(name: "", summary: "a" * 10, description: "a" * 20)
        @recipeSummTest = Recipe.new(name: "a" * 5, summary: "", description: "a" * 20)
        @recipeDescTest = Recipe.new(name: "a" * 5, summary: "a" * 10, description: "")
    end

    test "recipe should be valid" do
        #puts "@recipe.description.length " + @recipe.description.length.to_s
        assert @recipe.valid?
    end

    test "chef_id should be present" do
        assert_not @recipeChefTest.valid?
    end

    test "name should be present" do
        assert_not @recipeNameTest.valid?
    end

    test "name should not be too long" do # 5 to 100 chars
        @recipeNameTest.name = "a" * 101
        assert_not @recipeNameTest.valid?
    end

    test "name should not be too short" do
        @recipeNameTest.name = "aaaa"
        assert_not @recipeNameTest.valid?
    end

    test "summary should be present" do
        assert_not @recipeSummTest.valid?
    end

    test "summary should not be too long" do # 10 to 150
        @recipeSummTest.summary = "a" * 151
        assert_not @recipeSummTest.valid?
    end

    test "summary should not be too short" do
        @recipeSummTest.summary = "a" * 9
        assert_not @recipeSummTest.valid?
    end

    test "description should be present" do
        assert_not @recipeDescTest.valid?
    end

    test "description should not be too long" do # 20 to 1000
        @recipeDescTest.description = "a" * 2001
        assert_not @recipeDescTest.valid?
    end

    test "description should not be too short" do
        @recipeDescTest.description = "a" * 19
        assert_not @recipeDescTest.valid?
    end

end
