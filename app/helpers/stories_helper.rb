module StoriesHelper

  # sub font awesome icon to show publish status of story
  def pubformat(ps)
    if ps == true
      fa_icon 'check-circle-o', class: 'published'
    else
      fa_icon 'exclamation-circle', class: 'unpublished'
    end
  end
end

