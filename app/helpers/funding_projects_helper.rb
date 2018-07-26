module FundingProjectsHelper
    def fp_creator_name
        @funding_project.fp_creator do |fpc|
            fpc.name
        end
    end
end
