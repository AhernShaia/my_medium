# frozen_string_literal: true

module StoriesHelper
  def story_status(status)
    status = if status == 'draft'
               '草稿'
             else
               '已發佈'
             end
  end
end
