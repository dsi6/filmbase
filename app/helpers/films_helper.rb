module FilmsHelper
  def show_video(url)
    content_tag(:iframe,nil,:width=>"480",:height=>"390",:src=>"http://www.youtube.com/embed/#{url}",:frameborder=>0,:allow_fullscreen=>true)
  end
  def get_year_hint(film)
  age = 0
  if !film.year.blank? && film.year.to_i<Date.today.year
  age = Date.today.year - film.year.to_i
  end
  hint_text = "Возраст фильма (в годах) "
  raw(hint_text+" "+content_tag(:span, age, :class => "age"))
  end  
end
