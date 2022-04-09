// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("turbolinks:load", () => {
    (document.querySelectorAll(".notification .delete") || []).forEach(
        ($delete) => {
            const $notification = $delete.parentNode;

            $delete.addEventListener("click", () => {
                $notification.parentNode.removeChild($notification);
            });
        }
    );
});
