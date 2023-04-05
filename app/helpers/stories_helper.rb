module StoriesHelper

    def story_status(status)
        if status == 'draft'
            status = '草稿'
        else
            status = '已發佈'
        end
    end
end
