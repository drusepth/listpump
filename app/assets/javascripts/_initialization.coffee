## This file is prepended with an underscore to ensure it comes alphabetically-first
## when application.js includes all JS files in the directory with require_tree.
## Here be dragons.

window.Listpump ||= {}
Listpump.init = ->
  # Initialize MaterializeCSS stuff
  M.AutoInit()
  $('.sidenav').sidenav()
  $('.quick-reference-sidenav').sidenav {
    closeOnClick: true,
    edge: 'right',
    draggable: false
  }
  $('.slider').slider { height: 200, indicators: false }
  $('.dropdown-trigger').dropdown { coverTrigger: false }
  $('.tooltipped').tooltip { enterDelay: 50 }
  $('.with-character-counter').characterCounter();

$(document).on 'turbolinks:load', ->
  Listpump.init()