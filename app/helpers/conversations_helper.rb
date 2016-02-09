module ConversationsHelper
  def mailbox_section(title, current_box, icon, opts = {})
    opts[:class] = opts.fetch(:class, '')
    opts[:class] += '-mailbox-active' if title.downcase == current_box
    (content_tag :li, link_to(raw(icon+' '+title.capitalize), conversations_path(box: title.downcase)), opts)
  end
end

