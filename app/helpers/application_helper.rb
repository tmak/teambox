# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def header
    render :partial => 'shared/header'
  end

  def project_navigation(project)
    render :partial => 'shared/project_navigation',
      :locals => { :project => project }
  end
  
  def navigation(project,recent_projects)
    render :partial => 'shared/navigation',
      :locals => { 
        :project => project, 
        :recent_projects => recent_projects }
  end

  def global_navigation
    render :partial => 'shared/global_navigation'
  end
  
  def footer
    render :partial => 'shared/footer'
  end

  def location_name?(names)
    names.any?{ |name| name == location_name }
  end
    
  def location_name
    "#{action_name}_#{controller.controller_name}"
  end
   
  def ef(e)
    page << "if($('#{e}')){"
  end

  def esf(e)
    page << "}else if($('#{e}')){"
  end

  def els
    page << "}else{"
  end

  def en
    page << "}"
  end

  def loading(action,id=nil)
    if id.nil?
      image_tag('loading.gif', :id => "#{action}_loading", :style => 'display: none')
    else  
      image_tag('loading.gif', :id => "#{action}_loading_#{id}", :style => 'display: none')
    end
  end
  
  def show_loading(action,id=nil)
    update_page do |page|
      if id.nil?
        page["#{action}_loading"].show
        page.ef("#{action}_link")
          page["#{action}_link"].hide
        page.en
      else
        page["#{action}_loading_#{id}"].show
        page.ef("#{action}_#{id}_link")
          page["#{action}_#{id}_link"].hide
        page.en
      end
    end
  end
  
  def hide_loading(action,id=nil)
    update_page do |page|
      if id.nil?
        page["#{action}_loading"].hide
        page.ef("#{action}_link")
          page["#{action}_link"].hide
        page.en
      else
        page["#{action}_loading_#{id}"].hide
        page.ef("#{action}_#{id}_link")
          page["#{action}_#{id}_link"].show
        page.en
      end
    end
  end
  
  def cancel_rename_link
    link_to_function 'cancel', cancel_rename
  end
  
  def cancel_rename
    update_page do |page|
      page['rename'].remove
      page['name'].show
    end
  end
  
  def trash_image(size='24x24')
    image_tag('trash.jpg', :class => 'trash', :size => size)
  end

  def pencil_image
    image_tag('pencil.jpg', :class => 'pencil')
  end

  def reload_javascript_events
      page << "Event.addBehavior.reload()"
  end
    
end