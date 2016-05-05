# -*- coding: utf-8 -*-

Plugin.create(:mikutter_denotify_favorite) do
  command(:denotify_favorite,
          name: "非通知ふぁぼ",
          condition: Plugin::Command[:CanFavoriteAny],
          visible: true,
          icon: Skin.get("unfav.png"),
          role: :timeline) do |opt|
    message = opt.messages.first
    (Service.primary.twitter/'favorites/create').message({:id => message.id})
  end
end
