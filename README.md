# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
<%= form.fields_for :social_links, @profile.social_links do |social_link_form| %>
                                                                  <button type="submit" data-edit-target="updateBtn" class="update-button hidden">
                                                                        <i class='fas fa-check text-green-500 text-lg text-center cursor-pointer'></i>
                                                                  </button>
                                                            <% end %>

                                                            <%= form.fields_for :social_links, @profile.social_links do |social_link_form|%>
                                                <%= social_link_form.text_field :link, readonly: true, class: 'text-gray-500 border w-[200px] mr-[2rem] py-1 px-3 focus:outline-none','data-edit-target': 'socialLink' %>
                                          <% end %>
