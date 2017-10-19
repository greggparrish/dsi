module TimelineHelper
  # format link to timeline with right era and id
  def tl_link(t)
    if (1920..1959).include? t.date.year
      era = '20s_50s'
    elsif (1950..1989).include? t.date.year
      era = '60s_80s'
    else
      era = '90s_present'
    end
    link_to 'Timeline', timeline_path(era: era, anchor: "tl_#{t.id}")
  end
end

