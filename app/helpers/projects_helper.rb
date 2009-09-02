module ProjectsHelper
  def list_projects(projects)
    render :partial => 'projects/project', :collection => projects
  end
  
  def project_link(project)
    link_to h(project.name), project_path(project)
  end
  
  def new_project_link
    link_to 'Create a Project', new_project_path
  end
  
  def project_fields(f,project)
    render :partial => 'fields', 
      :locals => { 
        :f => f,
        :project => project }
  end
  
end