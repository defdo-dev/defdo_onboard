defmodule Defdo.OnboardWeb.Live.Activate do
  @moduledoc """
  Activate Component

  We should redirect until we have API's
  """

  use Defdo.OnboardWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="flex-1">
      <.form let={f} for={:activate} phx-change="validate" phx-submit="go_to" class="flex flex-col">
        <div>
          <%= text_input f, :msisdn, placeholder: gettext("Your phone number"), maxlength: "10", required: true, autocomplete: "off",
            class: "block w-full px-2 border-2 focus:ring-[#F9BC02] focus:border-[#F9BC02]" %>
          <span class="block py-1 text-xs text-gray-500 first-letter:uppercase"><%= gettext("type the number you want to activate") %></span>
        </div>
        <%= submit gettext("activate my line"),
          phx_disable_with: gettext("redirecting..."),
          disabled: not @is_valid?,
          class: "px-6 py-3 mt-1.5 text-gray-500 bg-gray-50 rounded-none cursor-not-allowed first-letter:uppercase #{if @is_valid?, do: "text-gray-800 bg-gray-100 cursor-pointer"}"
        %>
      </.form>
    </section>
    """
  end

  def mount(_, _session, socket) do
    {:ok, assign(socket, msisdn: nil, is_valid?: false)}
  end

  def handle_event("validate", %{"activate" => %{"msisdn" => msisdn}}, socket) do
    socket =
      if String.length(msisdn) == 10 do
        assign(socket, is_valid?: true)
      else
        assign(socket, is_valid?: false)
      end

    {:noreply, socket}
  end

  def handle_event("go_to", %{"activate" => %{"msisdn" => msisdn}}, socket) do
    {:noreply, redirect(socket, external: "https://captive.abc-telecom.net/?msisdn=#{msisdn}")}
  end
end
