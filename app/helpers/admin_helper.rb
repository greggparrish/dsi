module AdminHelper
  def modelname(c)
    if ['maps','timelines'].include? c
      model = 'histories'
    else
      model = controller.controller_name
    end
  end
end
