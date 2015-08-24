module ApplicationHelper
    # html title helper
    def title
        base_title = "Mikan"
        if @title.nil?
            base_title
        else
            "#{base_title} | #{@title}"
        end
    end

    # return current locale
    def locale
        params[:locale] || I18n.default_locale
    end

    # test if the given path is the current path
    def current_path?(test_path)
        return true if current_page?(test_path)
    end

    # Navigation helper
    def li_controller_link(title, path, controller)
        if current_path?(path) || controller_name == controller
            return "<li class=\"active\">#{link_to title, path}</li>"
        else
            return "<li>#{ link_to title, path}</li>"
        end
    end
    
    # Navigation helper
    def li_link(title, path)
        if current_path?(path)
            return "<li class=\"active\">#{link_to title, path}</li>"
        else
            return "<li>#{ link_to title, path}</li>"
        end
    end

    #nested attributes
    def link_to_add_fields(name, f, association, partial)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render(partial + "_fields", f: builder)
        end
        link_to(name, '#', class: "add_fields btn btn-default btn-lg btn-block", data: {id: id, fields: fields.gsub("\n", "")})
    end

    # season list
    def item_link(name, url, css_class)
        if url.nil?
            link_to name, url, :class => css_class, :disabled => true
        else
            link_to name, url, :class => css_class
        end

    end
end
