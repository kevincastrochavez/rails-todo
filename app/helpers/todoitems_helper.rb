# app/helpers/todoitems_helper.rb
module TodoitemsHelper
  def toggle_sort_direction(link_text, sort_by)
    sort_direction = toggle_direction(params[:sort_by], sort_by)
    link_to link_text, todoitems_path(sort_by: sort_by, sort_direction: sort_direction), class: 'fw-bold text-decoration-none'
  end

  def toggle_direction(current_sort_by, target_sort_by)
    current_sort_by == target_sort_by && params[:sort_direction] == 'asc' ? 'desc' : 'asc'
  end
end
