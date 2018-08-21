module LitFanAuthorsHelper
    def display_author(lit_fan_work)
        lit_fan_work.lit_fan_author.nil? ? link_to("Add Author", edit_lit_fan_work_path(lit_fan_work)) : link_to(lit_fan_work.lit_fan_author_name, lit_fan_author_path(lit_fan_work.lit_fan_author))
      end
    
    # def lit_fan_author_select(lit_fan_author, lit_fan_work)
    #     if lit_fan_author
    #         lit_fan_author.name
    #     else
    #         select_tag "lit_fan_work[lit_fan_author_id]", options_from_collection_for_select(LitFanAuthor.all, :id, :name)
    #     end
    # end
end