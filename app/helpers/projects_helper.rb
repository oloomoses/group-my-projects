module ProjectsHelper
  def display_icon(project)
    image_tag(project.group.icon.url, class: 'group-img') if project.group
  end
end
